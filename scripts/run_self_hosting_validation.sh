#!/usr/bin/env bash
# Required shell compatibility: Bash 3.2 or newer.
# Keep this script compatible with the default Bash shipped by macOS.
#
# Runs the complete EDF self-hosting validation workflow:
#   1. Framework Advisor Stage 1 regression verification
#   2. Shell compatibility validation
#   3. Framework Advisor analysis against EDF itself
#   4. Concise result summary
#
# The complete console output and final summary are written to a timestamped
# report under reports/self-hosting/.

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(cd "$script_dir/.." && pwd)"

stage1_verifier="$script_dir/verify_framework_advisor_stage1.sh"
compatibility_validator="$script_dir/validate_shell_scripts.sh"
analyzer="$script_dir/analyze_project_structure.sh"
report_dir="$project_root/reports/self-hosting"

require_file() {
    required_file="$1"
    description="$2"

    if [[ ! -f "$required_file" ]]; then
        echo "Required $description not found: $required_file" >&2
        exit 1
    fi
}

extract_score() {
    label="$1"
    report="$2"

    sed -n "s/^${label}: \\([0-9][0-9]*%\\)$/\\1/p" "$report" | tail -n 1
}

print_recommendations() {
    report="$1"
    recommendations="$(
        awk '
            /^Recommendations$/ {
                in_recommendations = 1
                next
            }
            in_recommendations && /^- / {
                print
                found = 1
                next
            }
            in_recommendations && found && $0 !~ /^- / {
                exit
            }
        ' "$report"
    )"

    if [[ -n "$recommendations" ]]; then
        printf '%s\n' "$recommendations"
    else
        echo "- No recommendations reported."
    fi
}

print_summary() {
    report="$1"
    overall="$(extract_score "Overall compliance" "$report")"
    structure="$(extract_score "Structure score" "$report")"
    ai="$(extract_score "AI score" "$report")"
    navigation="$(extract_score "Navigation score" "$report")"
    governance="$(extract_score "Governance score" "$report")"

    echo
    echo "============================================================"
    echo "Self-hosting validation completed successfully."
    echo
    echo "Report:"
    echo "${report#$project_root/}"
    echo
    echo "Compliance scores:"
    echo "- Overall: ${overall:-Not reported}"
    echo "- Structure: ${structure:-Not reported}"
    echo "- AI: ${ai:-Not reported}"
    echo "- Navigation: ${navigation:-Not reported}"
    echo "- Governance: ${governance:-Not reported}"
    echo
    echo "Next recommended actions:"
    print_recommendations "$report"
    echo "============================================================"
}

require_file "$stage1_verifier" "Stage 1 verification script"
require_file "$compatibility_validator" "shell compatibility validator"
require_file "$analyzer" "Framework Advisor"

mkdir -p "$report_dir"

timestamp="$(date '+%Y%m%d-%H%M%S')"
report_path="$report_dir/framework-advisor-$timestamp.txt"

run_self_hosting_validation() {
    echo "Engineering Documentation Framework Self-Hosting Validation"
    echo "=========================================================="
    echo
    echo "Project root: $project_root"
    echo "Started: $(date '+%Y-%m-%d %H:%M:%S %z')"

    echo
    echo "Stage 1 regression verification"
    echo "-------------------------------"
    /bin/bash "$stage1_verifier"

    echo
    echo "Shell compatibility validation"
    echo "------------------------------"
    /bin/bash "$compatibility_validator" "$project_root"

    echo
    echo "Framework Advisor self-hosting analysis"
    echo "---------------------------------------"
    /bin/bash "$analyzer" "$project_root"

    echo
    echo "Validation completed: $(date '+%Y-%m-%d %H:%M:%S %z')"
}

if run_self_hosting_validation 2>&1 | tee "$report_path"; then
    print_summary "$report_path" | tee -a "$report_path"
else
    validation_status=$?
    echo
    echo "Self-hosting validation failed." | tee -a "$report_path" >&2
    echo "Review the captured report:" | tee -a "$report_path" >&2
    echo "$report_path" | tee -a "$report_path" >&2
    exit "$validation_status"
fi
