\
#!/usr/bin/env bash
# Required shell compatibility: Bash 3.2 or newer.
# Keep this script compatible with the default Bash shipped by macOS.
#
# Runs shell compatibility validation, then executes the EDF Framework Advisor
# against the EDF repository itself. Writes only timestamped reports.

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(cd "$script_dir/.." && pwd)"
compatibility_validator="$script_dir/validate_shell_scripts.sh"
analyzer="$script_dir/analyze_project_structure.sh"
report_dir="$project_root/reports/self-hosting"

if [[ ! -x "$compatibility_validator" ]]; then
  echo "Shell compatibility validator is not executable: $compatibility_validator" >&2
  echo "Run: chmod +x scripts/*.sh" >&2
  exit 1
fi

if [[ ! -x "$analyzer" ]]; then
  echo "Framework Advisor is not executable: $analyzer" >&2
  echo "Run: chmod +x scripts/*.sh" >&2
  exit 1
fi

"$compatibility_validator" "$project_root"

mkdir -p "$report_dir"

timestamp="$(date '+%Y%m%d-%H%M%S')"
report_path="$report_dir/framework-advisor-$timestamp.txt"

"$analyzer" "$project_root" 2>&1 | tee "$report_path"

echo
echo "Self-hosting report written to:"
echo "$report_path"
