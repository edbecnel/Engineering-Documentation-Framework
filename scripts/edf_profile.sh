#!/usr/bin/env bash
# EDF profile and capability resolution helper — sourced by adoption scripts.
# Compatible with Bash 3.2+.
#
# Usage (after sourcing):
#   init_edf_capabilities_root "$script_dir"
#   resolve_edf_profile "$PROJECT_ROOT" "$CLI_PROFILE"
#   # Sets EDF_PROFILE, EDF_CAPABILITY_IDS array, and EDF_REQUIRED_DIRS array

edf_core_dirs=(
  "docs"
  "docs/Architecture"
  "docs/Architecture/ADRs"
  "docs/Architecture/Watch_Items"
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

EDF_CAPABILITIES_ROOT=""
EDF_CAPABILITY_IDS=()
CONTEXT_CAPABILITY_IDS=()

init_edf_capabilities_root() {
  local script_dir="$1"
  EDF_CAPABILITIES_ROOT="$(cd "$script_dir/../capabilities" 2>/dev/null && pwd)" || EDF_CAPABILITIES_ROOT=""
}

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

read_legacy_profile_from_context() {
  local project_root="$1"
  local context_file="$project_root/edf-project-context.yaml"

  if [[ ! -f "$context_file" ]]; then
    return 1
  fi

  grep -E '^[[:space:]]*legacy_profile:[[:space:]]*' "$context_file" 2>/dev/null | head -n 1 \
    | sed -E 's/^[[:space:]]*legacy_profile:[[:space:]]*//' \
    | sed -E 's/[[:space:]]+#.*$//' \
    | tr -d '"' \
    | tr -d "'"
}

read_capability_ids_from_context() {
  local project_root="$1"
  local context_file="$project_root/edf-project-context.yaml"
  local in_capabilities=0
  local line=""
  local id=""

  CONTEXT_CAPABILITY_IDS=()

  if [[ ! -f "$context_file" ]]; then
    return 1
  fi

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" =~ ^capabilities:[[:space:]]*$ ]]; then
      in_capabilities=1
      continue
    fi
    if [[ $in_capabilities -eq 1 ]]; then
      if [[ "$line" =~ ^[[:space:]]+-[[:space:]]+(.+)$ ]]; then
        id="${BASH_REMATCH[1]}"
        id="${id%%#*}"
        id="$(echo "$id" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g' | tr -d '"' | tr -d "'")"
        if [[ -n "$id" ]]; then
          CONTEXT_CAPABILITY_IDS+=("$id")
        fi
        continue
      fi
      if [[ "$line" =~ ^[a-zA-Z_] ]]; then
        break
      fi
    fi
  done < "$context_file"

  if [[ ${#CONTEXT_CAPABILITY_IDS[@]} -gt 0 ]]; then
    return 0
  fi
  return 1
}

find_capability_manifest() {
  local capability_id="$1"
  local candidates=(
    "$EDF_CAPABILITIES_ROOT/$capability_id/capability.yaml"
    "$EDF_CAPABILITIES_ROOT/contrib/$capability_id/capability.yaml"
  )
  local candidate=""

  for candidate in "${candidates[@]}"; do
    if [[ -n "$candidate" && -f "$candidate" ]]; then
      echo "$candidate"
      return 0
    fi
  done
  return 1
}

read_documentation_dirs_from_capability() {
  local manifest="$1"
  local in_section=0
  local line=""
  local dir=""

  if [[ ! -f "$manifest" ]]; then
    return 1
  fi

  while IFS= read -r line || [[ -n "$line" ]]; do
    if [[ "$line" =~ ^documentation_dirs:[[:space:]]*$ ]]; then
      in_section=1
      continue
    fi
    if [[ $in_section -eq 1 ]]; then
      if [[ "$line" =~ ^[[:space:]]+-[[:space:]]+(.+)$ ]]; then
        dir="${BASH_REMATCH[1]}"
        dir="${dir%%#*}"
        dir="$(echo "$dir" | sed -E 's/^[[:space:]]+|[[:space:]]+$//g' | tr -d '"' | tr -d "'")"
        if [[ -n "$dir" ]]; then
          echo "$dir"
        fi
        continue
      fi
      if [[ "$line" =~ ^[a-zA-Z_] ]]; then
        break
      fi
    fi
  done < "$manifest"
}

append_unique_dir() {
  local dir="$1"
  local existing=""

  for existing in "${EDF_REQUIRED_DIRS[@]}"; do
    if [[ "$existing" == "$dir" ]]; then
      return 0
    fi
  done
  EDF_REQUIRED_DIRS+=("$dir")
}

apply_capability_documentation_dirs() {
  local capability_id="$1"
  local manifest=""
  local dir=""

  manifest="$(find_capability_manifest "$capability_id" || true)"
  if [[ -z "$manifest" ]]; then
    echo "Warning: capability manifest not found for '$capability_id'" >&2
    return 0
  fi

  while IFS= read -r dir; do
    if [[ -n "$dir" ]]; then
      append_unique_dir "$dir"
    fi
  done < <(read_documentation_dirs_from_capability "$manifest")
}

resolve_edf_profile() {
  local project_root="$1"
  local cli_profile="${2:-}"
  local yaml_profile=""
  local context_profile=""
  local capability_id=""

  EDF_PROFILE=""
  EDF_REQUIRED_DIRS=()
  EDF_CAPABILITY_IDS=()
  CONTEXT_CAPABILITY_IDS=()

  if [[ -n "$cli_profile" ]]; then
    EDF_PROFILE="$cli_profile"
  else
    context_profile="$(read_legacy_profile_from_context "$project_root" || true)"
    yaml_profile="$(read_profile_from_yaml "$project_root" || true)"
    EDF_PROFILE="${context_profile:-${yaml_profile:-core}}"
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
      echo "Error: unsupported legacy profile '$EDF_PROFILE'. Use 'core' or 'software-engineering'." >&2
      echo "       For multi-discipline projects, use edf-project-context.yaml with capabilities." >&2
      return 1
      ;;
  esac

  if read_capability_ids_from_context "$project_root"; then
    EDF_CAPABILITY_IDS=("${CONTEXT_CAPABILITY_IDS[@]}")
  elif [[ "$EDF_PROFILE" == "software-engineering" ]]; then
    EDF_CAPABILITY_IDS=("software-engineering" "development")
  fi

  if [[ ${#EDF_CAPABILITY_IDS[@]} -gt 0 ]]; then
    for capability_id in "${EDF_CAPABILITY_IDS[@]}"; do
      if [[ "$capability_id" == "software-engineering" ]]; then
        for dir in "${edf_software_profile_dirs[@]}"; do
          append_unique_dir "$dir"
        done
      else
        apply_capability_documentation_dirs "$capability_id"
      fi
    done
  fi
}
