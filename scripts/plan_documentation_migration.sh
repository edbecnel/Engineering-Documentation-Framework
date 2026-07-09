#!/usr/bin/env bash
# Engineering Documentation Framework documentation migration planner.
#
# This script inspects Markdown files in an existing project and recommends
# likely Engineering Documentation Framework destinations.
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

PROJECT_ROOT="$1"

if [[ ! -d "$PROJECT_ROOT" ]]; then
  echo "Error: project root does not exist or is not a directory: $PROJECT_ROOT" >&2
  exit 1
fi

normalize_path() {
  local path="$1"
  path="${path#${PROJECT_ROOT}/}"
  printf '%s' "$path"
}

is_canonical_markdown_location() {
  local rel_path="$1"
  case "$rel_path" in
    docs/*|archive/*|README.md|PROJECT_INDEX.md|PROJECT_CHARTER.md|CHANGELOG.md|AI_WORKFLOW.md|ARCHITECTURE_DECISIONS.md|ENGINEERING_DOCUMENTATION_FRAMEWORK.md)
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

recommend_destination() {
  local rel_path="$1"
  local file_name
  local lower
  file_name="$(basename "$rel_path")"
  lower="$(printf '%s' "$rel_path" | tr '[:upper:]' '[:lower:]')"

  case "$lower" in
    *adr*|*architecture-decision*|*architecture_decision*)
      printf 'docs/Architecture/ADRs/%s' "$file_name"
      return
      ;;
    *architecture*|*design*|*system*|*stack*|*technical*)
      printf 'docs/Architecture/%s' "$file_name"
      return
      ;;
    *api*|*endpoint*|*rest*|*graphql*|*contract*)
      printf 'docs/API/%s' "$file_name"
      return
      ;;
    *database*|*schema*|*migration*|*data-model*|*data_model*|*sql*|*postgres*)
      printf 'docs/Database/%s' "$file_name"
      return
      ;;
    *deploy*|*release*|*environment*|*cicd*|*ci-cd*|*ops*|*runbook*)
      printf 'docs/Deployment/%s' "$file_name"
      return
      ;;
    *spec*|*requirement*|*feature*|*story*|*acceptance*)
      printf 'docs/Specifications/%s' "$file_name"
      return
      ;;
    *developer*|*development*|*coding*|*git*|*test*|*debug*|*setup*|*contributor*)
      printf 'docs/Development/%s' "$file_name"
      return
      ;;
    *ai*|*prompt*|*cursor*|*continue*|*ollama*|*claude*|*gpt*|*copilot*)
      printf 'docs/AI/%s' "$file_name"
      return
      ;;
    *user*|*guide*|*manual*|*tutorial*|*walkthrough*|*troubleshoot*)
      printf 'docs/User_Guides/%s' "$file_name"
      return
      ;;
    *glossary*|*reference*|*terminology*|*standard*|*links*)
      printf 'docs/Reference/%s' "$file_name"
      return
      ;;
    *template*)
      printf 'docs/Templates/%s' "$file_name"
      return
      ;;
    *task*|*todo*|*roadmap*|*backlog*)
      printf 'tasks/%s' "$file_name"
      return
      ;;
    *)
      printf 'docs/Reference/%s' "$file_name"
      return
      ;;
  esac
}

recommend_reason() {
  local rel_path="$1"
  local lower
  lower="$(printf '%s' "$rel_path" | tr '[:upper:]' '[:lower:]')"

  case "$lower" in
    *adr*|*architecture-decision*|*architecture_decision*) echo "Filename suggests an Architecture Decision Record." ;;
    *architecture*|*design*|*system*|*stack*|*technical*) echo "Filename suggests architecture or system design content." ;;
    *api*|*endpoint*|*rest*|*graphql*|*contract*) echo "Filename suggests API contract or interface documentation." ;;
    *database*|*schema*|*migration*|*data-model*|*data_model*|*sql*|*postgres*) echo "Filename suggests database, schema, migration, or persistence content." ;;
    *deploy*|*release*|*environment*|*cicd*|*ci-cd*|*ops*|*runbook*) echo "Filename suggests deployment, operations, release, or runbook content." ;;
    *spec*|*requirement*|*feature*|*story*|*acceptance*) echo "Filename suggests requirements, feature, or specification content." ;;
    *developer*|*development*|*coding*|*git*|*test*|*debug*|*setup*|*contributor*) echo "Filename suggests developer workflow, setup, coding, testing, or contributor guidance." ;;
    *ai*|*prompt*|*cursor*|*continue*|*ollama*|*claude*|*gpt*|*copilot*) echo "Filename suggests AI workflow or AI engineering guidance." ;;
    *user*|*guide*|*manual*|*tutorial*|*walkthrough*|*troubleshoot*) echo "Filename suggests end-user guide or tutorial content." ;;
    *glossary*|*reference*|*terminology*|*standard*|*links*) echo "Filename suggests reference material." ;;
    *template*) echo "Filename suggests reusable template content." ;;
    *task*|*todo*|*roadmap*|*backlog*) echo "Filename suggests task planning or roadmap content." ;;
    *) echo "No strong filename match found; review manually. Reference is the safest default recommendation." ;;
  esac
}

project_name="$(basename "$PROJECT_ROOT")"

printf 'Engineering Documentation Framework Migration Plan\n'
printf '==================================================\n\n'
printf 'Project root: %s\n' "$PROJECT_ROOT"
printf 'Project name: %s\n\n' "$project_name"
printf 'This report is read-only. No files or folders were created, modified, moved, renamed, or deleted.\n\n'

candidates=()
while IFS= read -r -d '' md_file; do
  rel_path="$(normalize_path "$md_file")"
  if ! is_canonical_markdown_location "$rel_path"; then
    candidates+=("$rel_path")
  fi
done < <(find "$PROJECT_ROOT" -type f \( -iname "*.md" -o -iname "*.markdown" \) -print0 | sort -z)

if [[ ${#candidates[@]} -eq 0 ]]; then
  printf 'No Markdown migration candidates found outside canonical documentation locations.\n'
  exit 0
fi

printf 'Migration candidates found: %s\n\n' "${#candidates[@]}"

index=1
for rel_path in "${candidates[@]}"; do
  destination="$(recommend_destination "$rel_path")"
  reason="$(recommend_reason "$rel_path")"

  printf '%s. %s\n' "$index" "$rel_path"
  printf '   Recommended destination: %s\n' "$destination"
  printf '   Reason: %s\n' "$reason"
  printf '   Action: Review manually before migrating. Do not move automatically.\n\n'
  index=$((index + 1))
done

printf 'Recommended next steps:\n'
printf '1. Review each recommendation.\n'
printf '2. Move only documents whose purpose is clear.\n'
printf '3. Add links from README.md and PROJECT_INDEX.md where appropriate.\n'
printf '4. Archive obsolete or superseded documents with a short migration note.\n'
printf '5. Re-run the analysis and migration scripts after each documentation cleanup pass.\n'
