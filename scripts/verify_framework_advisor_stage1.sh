#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
analyzer="$script_dir/analyze_project_structure.sh"
failures=0

require_text() {
  pattern="$1"
  description="$2"
  if grep -Fq "$pattern" "$analyzer"; then
    echo "PASS: $description"
  else
    echo "FAIL: $description" >&2
    failures=$((failures + 1))
  fi
}

require_text 'STAGE1_RULESET_VERSION="2026-07-10-stage1"' "ruleset marker"
require_text 'is_edf_repository=false' "EDF repository detection"
require_text 'recommended_root_files+=(ENGINEERING_DOCUMENTATION_FRAMEWORK.md)' "conditional adoption guide"
require_text 'scripts/README.md|README.md' "scripts README canonical handling"
require_text 'url|URL|path|PATH|example|EXAMPLE|placeholder|PLACEHOLDER' "placeholder exclusions"
require_text 'is_template_source=true' "template-source detection"
require_text 'docs/Templates/*.md|docs/Templates/*.markdown' "template orphan exclusions"

if ! /bin/bash -n "$analyzer"; then
  echo "FAIL: Bash syntax" >&2
  failures=$((failures + 1))
else
  echo "PASS: Bash syntax"
fi

if [[ $failures -gt 0 ]]; then
  echo "Stage 1 verification failed." >&2
  exit 1
fi

echo "Stage 1 verification passed."
