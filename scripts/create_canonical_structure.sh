#!/usr/bin/env bash
# This script only creates missing directories. It does not delete, overwrite, move, rename, or modify existing files.
#
# Creates the canonical Engineering Documentation Framework folder layout.
# Safe to run repeatedly — existing directories are left unchanged.
#
# Usage:
#   ./scripts/create_canonical_structure.sh
#   ./scripts/create_canonical_structure.sh /path/to/target/repo

set -euo pipefail

# Resolve repository root: optional first argument, otherwise parent of scripts/
if [[ $# -gt 0 ]]; then
  ROOT="$1"
else
  ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
fi

if [[ ! -d "$ROOT" ]]; then
  echo "Error: target path does not exist: $ROOT" >&2
  exit 1
fi

# Canonical folder structure (relative to repository root)
DIRS=(
  "docs/Architecture"
  "docs/Architecture/ADRs"
  "docs/AI"
  "docs/Development"
  "docs/Specifications"
  "docs/API"
  "docs/Database"
  "docs/Deployment"
  "docs/User_Guides"
  "docs/Reference"
  "docs/Templates"
  "tasks"
  "archive"
  "scripts"
)

create_dir_if_missing() {
  local relative_path="$1"
  local full_path="${ROOT}/${relative_path}"

  if [[ -d "$full_path" ]]; then
    echo "Exists:  ${relative_path}"
  elif [[ -e "$full_path" ]]; then
    echo "Skipped: ${relative_path} (path exists but is not a directory)" >&2
    return 1
  else
    mkdir -p "$full_path"
    echo "Created: ${relative_path}"
  fi
}

echo "Ensuring canonical folder structure under: ${ROOT}"
echo

errors=0
for dir in "${DIRS[@]}"; do
  if ! create_dir_if_missing "$dir"; then
    errors=$((errors + 1))
  fi
done

echo
if [[ $errors -gt 0 ]]; then
  echo "Finished with ${errors} skipped path(s)." >&2
  exit 1
fi

echo "Done."
