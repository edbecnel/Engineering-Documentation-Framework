#!/usr/bin/env bash
# Validates Interaction Specification files under interaction/specs/.
# Supports schema v1 (conversation_spec_id) and v2 (interaction_spec_id, workflow_id,
# authoritative_sources). Optional check — not part of Framework Advisor scoring.
#
# Usage:
#   ./scripts/validate_interaction_specs.sh [path/to/specs/dir]
#
# Compatible with Bash 3.2+.

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
specs_dir="${1:-$repo_root/interaction/specs}"

v2_required_keys=(
  interaction_spec_id
  workflow_id
  display_name
  spec_version
  schema_version
  authoritative_sources
  executes_methodology
  non_ai_equivalent
  inputs
  phases
  outputs
)

v1_required_keys=(
  conversation_spec_id
  display_name
  spec_version
  executes_methodology
  non_ai_equivalent
  inputs
  phases
  outputs
)

errors=0
checked=0

if [[ ! -d "$specs_dir" ]]; then
  echo "Error: specs directory not found: $specs_dir" >&2
  exit 1
fi

check_key_present() {
  local file="$1"
  local key="$2"

  if ! grep -E "^${key}:" "$file" >/dev/null 2>&1; then
    echo "FAIL: $file — missing required key: $key" >&2
    errors=$((errors + 1))
    return 1
  fi
  return 0
}

is_v2_spec() {
  local file="$1"
  grep -E '^schema_version:[[:space:]]*"?2' "$file" >/dev/null 2>&1
}

check_path_list_resolves() {
  local file="$1"
  local list_name="$2"
  local ref

  while IFS= read -r ref; do
    [[ -n "$ref" ]] || continue
    ref="$(printf '%s' "$ref" | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/[[:space:]]*$//')"
    local path_part="${ref%%#*}"

    if [[ "$path_part" == scripts/* ]]; then
      if [[ ! -f "$repo_root/$path_part" ]]; then
        echo "WARN: $file — $list_name script may be missing: $path_part" >&2
      fi
    elif [[ "$path_part" == docs/Architecture/ADRs/ ]]; then
      if [[ ! -d "$repo_root/$path_part" ]]; then
        echo "FAIL: $file — $list_name directory does not exist: $path_part" >&2
        errors=$((errors + 1))
      fi
    elif [[ ! -f "$repo_root/$path_part" && ! -d "$repo_root/$path_part" ]]; then
      echo "FAIL: $file — $list_name path does not exist: $path_part" >&2
      errors=$((errors + 1))
    fi
  done < <(awk -v list="$list_name" '
    $0 ~ "^" list ":" { flag = 1; next }
    /^[a-zA-Z_]+:/ { if (flag) exit }
    flag && /^  - / { print }
  ' "$file")
}

check_non_ai_equivalent_resolves() {
  local file="$1"
  local equivalent
  equivalent="$(grep -E '^non_ai_equivalent:' "$file" | head -n 1 | sed 's/^non_ai_equivalent:[[:space:]]*//')"

  if [[ -z "$equivalent" ]]; then
    echo "FAIL: $file — non_ai_equivalent is empty" >&2
    errors=$((errors + 1))
    return 1
  fi

  if [[ ! -f "$repo_root/$equivalent" ]]; then
    echo "FAIL: $file — non_ai_equivalent path does not exist: $equivalent" >&2
    errors=$((errors + 1))
    return 1
  fi

  return 0
}

echo "Interaction Specification validation"
echo "=================================="
echo "Specs directory: $specs_dir"
echo

shopt -s nullglob
spec_files=("$specs_dir"/*.yaml "$specs_dir"/*.yml)

if [[ ${#spec_files[@]} -eq 0 ]]; then
  echo "No specification files found."
  exit 0
fi

for spec_file in "${spec_files[@]}"; do
  base="$(basename "$spec_file")"
  [[ "$base" == "README.md" ]] && continue

  echo "Checking: $base"
  checked=$((checked + 1))

  if is_v2_spec "$spec_file"; then
    echo "  Schema: v2"
    for key in "${v2_required_keys[@]}"; do
      check_key_present "$spec_file" "$key" || true
    done
    check_path_list_resolves "$spec_file" "authoritative_sources" || true
  else
    echo "  Schema: v1"
    for key in "${v1_required_keys[@]}"; do
      check_key_present "$spec_file" "$key" || true
    done
  fi

  check_path_list_resolves "$spec_file" "executes_methodology" || true
  check_non_ai_equivalent_resolves "$spec_file" || true

  if grep -q '^status:[[:space:]]*pilot' "$spec_file" 2>/dev/null; then
    echo "  Status: pilot"
  fi

  echo
done

echo "Checked $checked specification file(s)."

if [[ $errors -gt 0 ]]; then
  echo "Validation failed with $errors error(s)." >&2
  exit 1
fi

echo "Validation passed."
exit 0
