#!/usr/bin/env bash
# Runs the EDF Framework Advisor against the EDF repository itself.
# Writes only a timestamped report under reports/self-hosting/.

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(cd "$script_dir/.." && pwd)"
analyzer="$script_dir/analyze_project_structure.sh"
report_dir="$project_root/reports/self-hosting"

if [[ ! -f "$analyzer" ]]; then
  echo "Framework Advisor not found: $analyzer" >&2
  exit 1
fi

mkdir -p "$report_dir"

timestamp="$(date '+%Y%m%d-%H%M%S')"
report_path="$report_dir/framework-advisor-$timestamp.txt"

bash "$analyzer" "$project_root" 2>&1 | tee "$report_path"

echo
echo "Self-hosting report written to:"
echo "$report_path"
