#!/usr/bin/env bash
# Engineering Documentation Framework project analysis tool.
#
# This script inspects an existing project and reports how closely it follows
# the Engineering Documentation Framework.
#
# Safety guarantee:
# - Read-only.
# - Does not create, delete, overwrite, rename, move, or modify files.
#
# Usage:
#   ./scripts/analyze_project_structure.sh "/path/to/project root"

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Error: project root path is required." >&2
    echo "Usage: $(basename "$0") \"/path/to/project root\"" >&2
    exit 1
fi

PROJECT_ROOT="${1%/}"

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

RECOMMENDED_ROOT_FILES=(
    "README.md"
    "PROJECT_INDEX.md"
    "PROJECT_CHARTER.md"
    "ARCHITECTURE_DECISIONS.md"
    "CHANGELOG.md"
    "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
)

AI_HANDBOOK_FILES=(
    "docs/AI/README.md"
    "docs/AI/AI_Philosophy.md"
    "docs/AI/AI_Roles.md"
    "docs/AI/AI_Decision_Matrix.md"
    "docs/AI/Cost_Optimization.md"
    "docs/AI/Prompting_Guide.md"
    "docs/AI/Context_Checklist.md"
    "docs/AI/Verification.md"
    "docs/AI/Security.md"
    "docs/AI/Governance.md"
)

missing_dirs=()
missing_root_files=()
missing_ai_files=()
warnings=()
recommendations=()
markdown_outside_docs=()

for dir in "${REQUIRED_DIRS[@]}"; do
    [[ -d "$PROJECT_ROOT/$dir" ]] || missing_dirs+=("$dir")
done

for file in "${RECOMMENDED_ROOT_FILES[@]}"; do
    [[ -f "$PROJECT_ROOT/$file" ]] || missing_root_files+=("$file")
done

for file in "${AI_HANDBOOK_FILES[@]}"; do
    [[ -f "$PROJECT_ROOT/$file" ]] || missing_ai_files+=("$file")
done

if [[ -f "$PROJECT_ROOT/AI_WORKFLOW.md" ]]; then
    warnings+=("Retired root document AI_WORKFLOW.md still exists. Migrate any unique content to docs/AI/ and remove it after verifying links.")
fi

if [[ -d "$PROJECT_ROOT/documents" ]]; then
    warnings+=("Existing documents/ folder found. Leave it untouched unless you intentionally migrate content into docs/.")
fi

if [[ -f "$PROJECT_ROOT/README.md" && -f "$PROJECT_ROOT/PROJECT_INDEX.md" ]]; then
    if ! grep -qi "PROJECT_INDEX\.md" "$PROJECT_ROOT/README.md"; then
        warnings+=("README.md exists but does not appear to reference PROJECT_INDEX.md.")
    fi
fi

if [[ -f "$PROJECT_ROOT/README.md" ]]; then
    if ! grep -qi "docs/AI" "$PROJECT_ROOT/README.md"; then
        warnings+=("README.md does not appear to reference the modular AI handbook under docs/AI/.")
    fi
fi

while IFS= read -r -d '' md_file; do
    rel_path="${md_file#"$PROJECT_ROOT"/}"
    case "$rel_path" in
        docs/*|archive/*|tasks/*|README.md|PROJECT_INDEX.md|PROJECT_CHARTER.md|ARCHITECTURE_DECISIONS.md|CHANGELOG.md|ENGINEERING_DOCUMENTATION_FRAMEWORK.md)
            ;;
        *)
            markdown_outside_docs+=("$rel_path")
            ;;
    esac
done < <(find "$PROJECT_ROOT" -type f \( -iname "*.md" -o -iname "*.markdown" \) -print0)

if [[ ${#markdown_outside_docs[@]} -gt 0 ]]; then
    warnings+=("${#markdown_outside_docs[@]} Markdown file(s) found outside canonical documentation locations.")
    recommendations+=("Audit Markdown files outside canonical locations and decide whether each should migrate, remain project-specific, or be archived.")
fi

if [[ ${#missing_ai_files[@]} -gt 0 ]]; then
    recommendations+=("Complete the modular AI Engineering Handbook under docs/AI/.")
fi

if [[ ! -d "$PROJECT_ROOT/docs/Architecture/ADRs" ]]; then
    recommendations+=("Create docs/Architecture/ADRs for individual Architecture Decision Records.")
fi

score=100
score=$((score - ${#missing_dirs[@]} * 4))
score=$((score - ${#missing_root_files[@]} * 3))
score=$((score - ${#missing_ai_files[@]} * 2))
score=$((score - ${#warnings[@]} * 2))
(( score < 0 )) && score=0

ai_present=$((${#AI_HANDBOOK_FILES[@]} - ${#missing_ai_files[@]}))
ai_total=${#AI_HANDBOOK_FILES[@]}
ai_percent=$((ai_present * 100 / ai_total))

print_section() {
    local title="$1"
    echo
    echo "$title"
    printf '%*s\n' "${#title}" '' | tr ' ' '-'
}

project_name="$(basename "$PROJECT_ROOT")"

echo "Engineering Documentation Framework Analysis"
echo "============================================"
echo
echo "Project root: $PROJECT_ROOT"
echo "Project name: $project_name"
echo "Estimated compliance score: $score%"
echo "AI handbook completeness: $ai_present/$ai_total files ($ai_percent%)"
echo
echo "This report is read-only."
echo "No files or folders were created, modified, moved, renamed, or deleted."

print_section "Missing required directories"
if [[ ${#missing_dirs[@]} -eq 0 ]]; then
    echo "None."
else
    printf -- '- %s\n' "${missing_dirs[@]}"
fi

print_section "Missing recommended root files"
if [[ ${#missing_root_files[@]} -eq 0 ]]; then
    echo "None."
else
    printf -- '- %s\n' "${missing_root_files[@]}"
fi

print_section "AI handbook completeness"
for file in "${AI_HANDBOOK_FILES[@]}"; do
    if [[ -f "$PROJECT_ROOT/$file" ]]; then
        echo "[OK]      $file"
    else
        echo "[MISSING] $file"
    fi
done

print_section "Warnings"
if [[ ${#warnings[@]} -eq 0 ]]; then
    echo "None."
else
    printf -- '- %s\n' "${warnings[@]}"
fi

print_section "Markdown files outside canonical documentation locations"
if [[ ${#markdown_outside_docs[@]} -eq 0 ]]; then
    echo "None."
else
    printf -- '- %s\n' "${markdown_outside_docs[@]}"
fi

print_section "Recommendations"
if [[ ${#recommendations[@]} -eq 0 ]]; then
    echo "None."
else
    printf -- '- %s\n' "${recommendations[@]}"
fi

echo
