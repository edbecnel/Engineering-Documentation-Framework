#!/usr/bin/env bash
# Engineering Documentation Framework documentation migration planner.
#
# Safety guarantee:
# - Read-only.
# - Does not create, delete, overwrite, rename, move, or modify files.
# - Does not modify an existing documents/ folder.
#
# Usage:
#   ./scripts/plan_documentation_migration.sh "/path/to/project root"

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

normalize_path() {
    local path="$1"
    printf '%s' "${path#"$PROJECT_ROOT"/}"
}

is_canonical_markdown_location() {
    local rel_path="$1"
    case "$rel_path" in
        docs/*|archive/*|tasks/*|README.md|PROJECT_INDEX.md|PROJECT_CHARTER.md|ARCHITECTURE_DECISIONS.md|CHANGELOG.md|ENGINEERING_DOCUMENTATION_FRAMEWORK.md)
            return 0
            ;;
        *)
            return 1
            ;;
    esac
}

recommend_destination() {
    local rel_path="$1"
    local file_name lower
    file_name="$(basename "$rel_path")"
    lower="$(printf '%s' "$rel_path" | tr '[:upper:]' '[:lower:]')"

    case "$lower" in
        *ai_workflow.md|*ai-workflow.md)
            printf 'SPLIT: docs/AI/ (begin with docs/AI/README.md)'
            ;;
        *adr*|*architecture-decision*|*architecture_decision*)
            printf 'docs/Architecture/ADRs/%s' "$file_name"
            ;;
        *architecture*|*design*|*system*|*stack*|*technical*)
            printf 'docs/Architecture/%s' "$file_name"
            ;;
        *api*|*endpoint*|*rest*|*graphql*|*contract*)
            printf 'docs/API/%s' "$file_name"
            ;;
        *database*|*schema*|*migration*|*data-model*|*data_model*|*sql*|*postgres*)
            printf 'docs/Database/%s' "$file_name"
            ;;
        *deploy*|*release*|*environment*|*cicd*|*ci-cd*|*ops*|*runbook*)
            printf 'docs/Deployment/%s' "$file_name"
            ;;
        *spec*|*requirement*|*feature*|*story*|*acceptance*)
            printf 'docs/Specifications/%s' "$file_name"
            ;;
        *handbook*|*first-time*|*first_time*|*onboarding*|*contributor*)
            printf 'docs/Developer_Handbook/%s' "$file_name"
            ;;
        *developer*|*development*|*coding*|*git*|*test*|*debug*|*setup*|*environment*)
            printf 'docs/Developer_Handbook/%s' "$file_name"
            ;;
        *ai*|*prompt*|*cursor*|*continue*|*ollama*|*claude*|*gpt*|*copilot*|*model*)
            printf 'docs/AI/%s' "$file_name"
            ;;
        *user*|*guide*|*manual*|*tutorial*|*walkthrough*|*troubleshoot*)
            printf 'docs/User_Guides/%s' "$file_name"
            ;;
        *glossary*|*reference*|*terminology*|*standard*|*links*)
            printf 'docs/Reference/%s' "$file_name"
            ;;
        *template*)
            printf 'docs/Templates/%s' "$file_name"
            ;;
        *task*|*todo*|*roadmap*|*backlog*)
            printf 'tasks/%s' "$file_name"
            ;;
        *)
            printf 'docs/Reference/%s' "$file_name"
            ;;
    esac
}

recommend_reason() {
    local rel_path="$1"
    local lower
    lower="$(printf '%s' "$rel_path" | tr '[:upper:]' '[:lower:]')"

    case "$lower" in
        *ai_workflow.md|*ai-workflow.md)
            echo "Legacy monolithic AI workflow document; review and split content across the modular AI handbook rather than moving it unchanged."
            ;;
        *adr*|*architecture-decision*|*architecture_decision*)
            echo "Filename suggests an Architecture Decision Record."
            ;;
        *architecture*|*design*|*system*|*stack*|*technical*)
            echo "Filename suggests architecture or system design content."
            ;;
        *api*|*endpoint*|*rest*|*graphql*|*contract*)
            echo "Filename suggests API contract or interface documentation."
            ;;
        *database*|*schema*|*migration*|*data-model*|*data_model*|*sql*|*postgres*)
            echo "Filename suggests database, schema, migration, or persistence content."
            ;;
        *deploy*|*release*|*environment*|*cicd*|*ci-cd*|*ops*|*runbook*)
            echo "Filename suggests deployment, operations, release, or runbook content."
            ;;
        *spec*|*requirement*|*feature*|*story*|*acceptance*)
            echo "Filename suggests requirements, feature, or specification content."
            ;;
        *developer*|*development*|*coding*|*git*|*test*|*debug*|*setup*|*contributor*)
            echo "Filename suggests developer workflow, setup, coding, testing, or contributor guidance."
            ;;
        *ai*|*prompt*|*cursor*|*continue*|*ollama*|*claude*|*gpt*|*copilot*|*model*)
            echo "Filename suggests AI workflow or AI engineering guidance."
            ;;
        *user*|*guide*|*manual*|*tutorial*|*walkthrough*|*troubleshoot*)
            echo "Filename suggests end-user guide or tutorial content."
            ;;
        *glossary*|*reference*|*terminology*|*standard*|*links*)
            echo "Filename suggests reference material."
            ;;
        *template*)
            echo "Filename suggests reusable template content."
            ;;
        *task*|*todo*|*roadmap*|*backlog*)
            echo "Filename suggests task planning or roadmap content."
            ;;
        *)
            echo "No strong filename match found; review manually. Reference is the safest default recommendation."
            ;;
    esac
}

project_name="$(basename "$PROJECT_ROOT")"

echo "Engineering Documentation Framework Migration Plan"
echo "=================================================="
echo
echo "Project root: $PROJECT_ROOT"
echo "Project name: $project_name"
echo
echo "This report is read-only."
echo "No files or folders were created, modified, moved, renamed, or deleted."
echo

candidates=()
while IFS= read -r -d '' md_file; do
    rel_path="$(normalize_path "$md_file")"
    if ! is_canonical_markdown_location "$rel_path"; then
        candidates+=("$rel_path")
    fi
done < <(find "$PROJECT_ROOT" -type f \( -iname "*.md" -o -iname "*.markdown" \) -print0 | sort -z)

if [[ ${#candidates[@]} -eq 0 ]]; then
    echo "No Markdown migration candidates found outside canonical documentation locations."
    exit 0
fi

echo "Migration candidates found: ${#candidates[@]}"
echo

index=1
for rel_path in "${candidates[@]}"; do
    destination="$(recommend_destination "$rel_path")"
    reason="$(recommend_reason "$rel_path")"

    echo "$index. $rel_path"
    echo "   Recommended destination: $destination"
    echo "   Reason: $reason"
    echo "   Action: Review manually before migrating. Do not move automatically."
    echo
    index=$((index + 1))
done

echo "Recommended next steps:"
echo "1. Review each recommendation."
echo "2. Split legacy AI_WORKFLOW.md content across docs/AI/ when encountered."
echo "3. Move only documents whose purpose is clear."
echo "4. Add or update links from README.md and PROJECT_INDEX.md."
echo "5. Archive obsolete or superseded documents with a short migration note."
echo "6. Re-run the analysis and migration scripts after each cleanup pass."
