\
#!/usr/bin/env bash
# Required shell compatibility: Bash 3.2 or newer.
# Validates EDF shell scripts without modifying them.

set -euo pipefail

if [[ $# -gt 1 ]]; then
  echo "Usage: $(basename "$0") [project-root]" >&2
  exit 1
fi

if [[ $# -eq 1 ]]; then
  project_root="${1%/}"
else
  script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  project_root="$(cd "$script_dir/.." && pwd)"
fi

scripts_dir="$project_root/scripts"

if [[ ! -d "$scripts_dir" ]]; then
  echo "Scripts directory not found: $scripts_dir" >&2
  exit 1
fi

errors=0
checked=0
script_list="$(mktemp "${TMPDIR:-/tmp}/edf-shell-scripts.XXXXXX")"
trap 'rm -f "$script_list"' EXIT

find "$scripts_dir" -maxdepth 1 -type f -name '*.sh' -print | sort > "$script_list"

while IFS= read -r script; do
  [[ -n "$script" ]] || continue

  checked=$((checked + 1))
  relative="${script#"$project_root"/}"

  if ! /bin/bash -n "$script"; then
    echo "Syntax failure: $relative" >&2
    errors=$((errors + 1))
  fi

  if grep -nE '(^|[[:space:]])declare[[:space:]]+-A([[:space:]]|$)' "$script" >/dev/null 2>&1; then
    echo "Bash 4-only associative array found: $relative" >&2
    errors=$((errors + 1))
  fi

  if grep -nE '(^|[[:space:]])local[[:space:]]+-n([[:space:]]|$)' "$script" >/dev/null 2>&1; then
    echo "Bash 4.3-only nameref found: $relative" >&2
    errors=$((errors + 1))
  fi

  if grep -nE '(^|[[:space:]])(mapfile|readarray)([[:space:]]|$)' "$script" >/dev/null 2>&1; then
    echo "Bash 4-only mapfile/readarray found: $relative" >&2
    errors=$((errors + 1))
  fi

  if [[ ! -x "$script" ]]; then
    echo "Not executable: $relative" >&2
    echo "  Fix with: chmod +x \"$relative\"" >&2
    errors=$((errors + 1))
  fi
done < "$script_list"

if [[ $checked -eq 0 ]]; then
  echo "No shell scripts found under: $scripts_dir" >&2
  exit 1
fi

if [[ $errors -gt 0 ]]; then
  echo
  echo "Shell validation failed with $errors issue(s)." >&2
  exit 1
fi

echo "Shell validation passed for $checked script(s)."
echo "Compatibility target: Bash 3.2 or newer."
