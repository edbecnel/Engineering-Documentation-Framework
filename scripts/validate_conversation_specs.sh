#!/usr/bin/env bash
# Backward-compatible alias for validate_interaction_specs.sh.
# Deprecated name retained for ADR-0003 pilot documentation.
#
# Usage:
#   ./scripts/validate_conversation_specs.sh [path/to/specs/dir]

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec /bin/bash "$script_dir/validate_interaction_specs.sh" "$@"
