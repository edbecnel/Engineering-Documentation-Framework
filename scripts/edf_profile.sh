#!/usr/bin/env bash
# EDF profile resolution helper — sourced by adoption scripts.
# Compatible with Bash 3.2+.
#
# Usage (after sourcing):
#   resolve_edf_profile "$PROJECT_ROOT" "$CLI_PROFILE"
#   # Sets EDF_PROFILE and populates EDF_REQUIRED_DIRS array

edf_core_dirs=(
  "docs"
  "docs/Architecture"
  "docs/Architecture/ADRs"
  "docs/AI"
  "docs/Development"
  "docs/Governance"
  "docs/Specifications"
  "docs/User_Guides"
  "docs/Reference"
  "docs/Templates"
  "tasks"
  "archive"
  "scripts"
)

edf_software_profile_dirs=(
  "docs/Developer_Handbook"
  "docs/API"
  "docs/Database"
  "docs/Deployment"
)

read_profile_from_yaml() {
  local project_root="$1"
  local config_file="$project_root/edf-adoption.yaml"

  if [[ ! -f "$config_file" ]]; then
    return 1
  fi

  grep -E '^[[:space:]]*profile:[[:space:]]*' "$config_file" 2>/dev/null | head -n 1 \
    | sed -E 's/^[[:space:]]*profile:[[:space:]]*//' \
    | sed -E 's/[[:space:]]+#.*$//' \
    | tr -d '"' \
    | tr -d "'"
}

resolve_edf_profile() {
  local project_root="$1"
  local cli_profile="${2:-}"
  local yaml_profile=""

  EDF_PROFILE=""
  EDF_REQUIRED_DIRS=()

  if [[ -n "$cli_profile" ]]; then
    EDF_PROFILE="$cli_profile"
  else
    yaml_profile="$(read_profile_from_yaml "$project_root" || true)"
    EDF_PROFILE="${yaml_profile:-software-engineering}"
  fi

  case "$EDF_PROFILE" in
    core)
      EDF_REQUIRED_DIRS=("${edf_core_dirs[@]}")
      ;;
    software-engineering|software)
      EDF_PROFILE="software-engineering"
      EDF_REQUIRED_DIRS=("${edf_core_dirs[@]}" "${edf_software_profile_dirs[@]}")
      ;;
    *)
      echo "Error: unsupported profile '$EDF_PROFILE'. Use 'core' or 'software-engineering'." >&2
      return 1
      ;;
  esac
}
