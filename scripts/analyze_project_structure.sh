#!/usr/bin/env bash
# Engineering Documentation Framework project analysis tool.
#
# This script inspects an existing project and reports how closely it follows
# the Engineering Documentation Framework. It does not delete, overwrite, move,
# rename, or modify existing files.
#
# Usage:
#   ./scripts/analyze_project_structure.sh "/path/to/project root"

set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Error: project root path is required." >&2
  echo "Usage: $(basename "$0") \"/path/to/project root\"" >&2
  exit 1
fi

PROJECT_ROOT="$1"

if [[ ! -d "$PROJECT_ROOT" ]]; then
  echo "Error: project root does not exist or is not a directory: $PROJECT_ROOT" >&2
  exit 1
fi

REQUIRED_DIRS=(
  "docs"
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

RECOMMENDED_FILES=(
  "README.md"
  "PROJECT_INDEX.md"
  "PROJECT_CHARTER.md"
  "CHANGELOG.md"
  "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
)

missing_dirs=()
missing_files=()
warnings=()
recommendations=()

for dir in "${REQUIRED_DIRS[@]}"; do
  if [[ ! -d "${PROJECT_ROOT}/${dir}" ]]; then
    missing_dirs+=("$dir")
  fi
done

for file in "${RECOMMENDED_FILES[@]}"; do
  if [[ ! -f "${PROJECT_ROOT}/${file}" ]]; then
    missing_files+=("$file")
  fi
done

if [[ -d "${PROJECT_ROOT}/documents" ]]; then
  warnings+=("Existing documents/ folder found. Leave it untouched unless you intentionally migrate content into docs/.")
fi

if [[ -f "${PROJECT_ROOT}/README.md" ]] && [[ -f "${PROJECT_ROOT}/PROJECT_INDEX.md" ]]; then
  if ! grep -qi "PROJECT_INDEX.md" "${PROJECT_ROOT}/README.md"; then
    warnings+=("README.md exists but does not appear to reference PROJECT_INDEX.md.")
  fi
fi

markdown_outside_docs=()
while IFS= read -r -d '' md_file; do
  rel_path="${md_file#${PROJECT_ROOT}/}"
  case "$rel_path" in
    docs/*|archive/*|README.md|PROJECT_INDEX.md|PROJECT_CHARTER.md|CHANGELOG.md|ENGINEERING_DOCUMENTATION_FRAMEWORK.md)
      ;;
    *)
      markdown_outside_docs+=("$rel_path")
      ;;
  esac
done < <(find "$PROJECT_ROOT" -type f \( -iname "*.md" -o -iname "*.markdown" \) -print0)

if [[ ${#markdown_outside_docs[@]} -gt 0 ]]; then
  warnings+=("${#markdown_outside_docs[@]} Markdown file(s) found outside the canonical documentation locations.")
  recommendations+=("Audit Markdown files outside docs/ and decide whether each should move into a framework domain, remain project-specific, or be archived.")
fi

if [[ ! -d "${PROJECT_ROOT}/docs/AI" ]]; then
  recommendations+=("Create docs/AI for AI workflow, AI roles, prompting, cost optimization, verification, and governance guidance.")
fi

if [[ ! -d "${PROJECT_ROOT}/docs/Architecture/ADRs" ]]; then
  recommendations+=("Create docs/Architecture/ADRs for individual Architecture Decision Records.")
fi

score=100
score=$((score - (${#missing_dirs[@]} * 4)))
score=$((score - (${#missing_files[@]} * 3)))
score=$((score - (${#warnings[@]} * 2)))
if (( score < 0 )); then
  score=0
fi

print_section() {
  local title="$1"
  echo
  echo "$title"
  printf '%*s\n' "${#title}" '' | tr ' ' '-'
}

project_name="$(basename "$PROJECT_ROOT")"

cat <<REPORT
Engineering Documentation Framework Analysis
============================================

Project root: $PROJECT_ROOT
Project name: $project_name
Estimated compliance score: ${score}%

This report is read-only. No files or folders were created, modified, moved, renamed, or deleted.
REPORT

print_section "Missing required directories"
if [[ ${#missing_dirs[@]} -eq 0 ]]; then
  echo "None."
else
  for item in "${missing_dirs[@]}"; do
    echo "- $item"
  done
fi

print_section "Missing recommended files"
if [[ ${#missing_files[@]} -eq 0 ]]; then
  echo "None."
else
  for item in "${missing_files[@]}"; do
    echo "- $item"
  done
fi

print_section "Warnings"
if [[ ${#warnings[@]} -eq 0 ]]; then
  echo "None."
else
  for item in "${warnings[@]}"; do
    echo "- $item"
  done
fi

print_section "Markdown files outside canonical documentation locations"
if [[ ${#markdown_outside_docs[@]} -eq 0 ]]; then
  echo "None."
else
  for item in "${markdown_outside_docs[@]}"; do
    echo "- $item"
  done
fi

print_section "Recommendations"
if [[ ${#recommendations[@]} -eq 0 ]]; then
  echo "None."
else
  for item in "${recommendations[@]}"; do
    echo "- $item"
  done
fi

echo
