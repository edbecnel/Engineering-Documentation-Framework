#!/usr/bin/env bash
# This script only creates missing directories. It does not delete, overwrite, move, rename, or modify existing files.
#
# Creates the canonical Engineering Documentation Framework folder layout inside an
# existing software project's root directory.
# Safe to run repeatedly — existing directories are left unchanged.
#
# Usage:
#   ./scripts/create_canonical_structure.sh "/path/to/project root"
#
# Example:
#   ./scripts/create_canonical_structure.sh "/Users/ed/Projects/The Recipe Vault"

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Error: project root path is required." >&2
  echo "Usage: $(basename "$0") <project-root>" >&2
  echo "Example: $(basename "$0") \"/Users/ed/Projects/The Recipe Vault\"" >&2
  exit 1
fi

PROJECT_ROOT="$1"

if [[ ! -d "$PROJECT_ROOT" ]]; then
  echo "Error: project root does not exist or is not a directory: $PROJECT_ROOT" >&2
  exit 1
fi

# Canonical folder structure (relative to project root)
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
  local full_path="${PROJECT_ROOT}/${relative_path}"

  if [[ -d "$full_path" ]]; then
    echo "Exists:  ${relative_path}"
  elif [[ -e "$full_path" ]]; then
    echo "Skipped: ${relative_path} (path exists but is not a directory)" >&2
    return 1
  else
    mkdir -p -- "$full_path"
    echo "Created: ${relative_path}"
  fi
}

echo "Ensuring canonical folder structure under: ${PROJECT_ROOT}"
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
