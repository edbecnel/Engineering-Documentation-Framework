#!/usr/bin/env bash
# Validates Conversation Specification files under interaction/specs/.
# Optional check — not part of Framework Advisor scoring.
#
# Usage:
#   ./scripts/validate_conversation_specs.sh [path/to/specs/dir]
#
# Compatible with Bash 3.2+.

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "$script_dir/.." && pwd)"
specs_dir="${1:-$repo_root/interaction/specs}"

required_keys=(
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

check_methodology_refs() {
  local file="$1"
  local ref

  while IFS= read -r ref; do
    [[ -n "$ref" ]] || continue
    ref="$(printf '%s' "$ref" | sed 's/^[[:space:]]*-[[:space:]]*//' | sed 's/[[:space:]]*$//')"
    # Strip anchor fragment for file existence check
    local path_part="${ref%%#*}"

    if [[ "$path_part" == scripts/* ]]; then
      if [[ ! -f "$repo_root/$path_part" && ! -f "$repo_root/${path_part%.sh}.sh" ]]; then
        # Allow adopt-edf.sh style references
        if [[ ! -f "$repo_root/scripts/$(basename "$path_part")" ]]; then
          echo "WARN: $file — executes_methodology script may be missing: $path_part" >&2
        fi
      fi
    elif [[ ! -f "$repo_root/$path_part" ]]; then
      echo "FAIL: $file — executes_methodology path does not exist: $path_part" >&2
      errors=$((errors + 1))
    fi
  done < <(awk '/^executes_methodology:/{flag=1;next} /^[a-zA-Z_]+:/{flag=0} flag && /^  - /{print}' "$file")
}

echo "Conversation Specification validation"
echo "===================================="
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

  for key in "${required_keys[@]}"; do
    check_key_present "$spec_file" "$key" || true
  done

  check_non_ai_equivalent_resolves "$spec_file" || true
  check_methodology_refs "$spec_file" || true

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
