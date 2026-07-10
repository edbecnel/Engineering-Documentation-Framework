\
#!/usr/bin/env bash
# Required shell compatibility: Bash 3.2 or newer.
# Restores executable permissions for EDF shell scripts.

set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
project_root="$(cd "$script_dir/.." && pwd)"

find "$project_root/scripts" -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \;

echo "Executable permissions applied to scripts/*.sh"
echo
echo "To preserve these permissions in Git, run:"
echo '  git update-index --chmod=+x scripts/*.sh'
