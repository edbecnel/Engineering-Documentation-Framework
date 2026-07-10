# Cross-Platform Shell Scripting Guidelines

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Cross-Platform Shell Scripting Guidelines

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF and adopting projects that use EDF shell scripts
> **Last Reviewed:** 2026-07-10
> **Review Frequency:** Per Release
> **Authoritative:** Yes

## Purpose

This document defines the compatibility, permission, and validation requirements for
shell scripts distributed with the Engineering Documentation Framework.

## Compatibility Target

EDF `.sh` files must support **Bash 3.2 or newer**.

Bash 3.2 is the baseline because it is the default Bash version included with macOS.
Scripts that meet this baseline also run on common newer Bash versions used by Linux,
WSL, Git Bash, and other Unix-like environments.

## Required Shebang

Every EDF Bash script must begin with:

```bash
#!/usr/bin/env bash
```

## Prohibited Bash 4+ Features

Do not use the following without an approved compatibility change:

- associative arrays such as `declare -A`
- nameref variables such as `local -n`
- `mapfile`
- `readarray`
- `coproc`
- Bash 4+ parameter expansions or conditionals

Prefer Bash 3.2-compatible arrays, files, loops, `case` statements, and standard Unix
utilities.

## Executable Permissions

Shell scripts must be executable.

After copying or extracting EDF files, restore permissions with:

```bash
chmod +x scripts/*.sh
```

EDF also provides:

```bash
./scripts/set_shell_script_permissions.sh
```

If that helper itself is not executable, run:

```bash
chmod +x scripts/set_shell_script_permissions.sh
./scripts/set_shell_script_permissions.sh
```

## Preserve Permissions in Git

Git should track shell scripts with mode `100755`.

Check the current modes:

```bash
git ls-files --stage 'scripts/*.sh'
```

Persist executable permissions:

```bash
git update-index --chmod=+x scripts/*.sh
```

Then commit the mode changes.

A ZIP archive may not reliably preserve executable permissions across every extraction
tool or operating system. Git remains the authoritative source for file modes.

## Validation

Run the shell-script validator:

```bash
./scripts/validate_shell_scripts.sh
```

It checks:

- Bash syntax using `/bin/bash -n`
- prohibited Bash 4+ constructs
- executable permissions

The self-hosting runner executes this validator automatically before running the
Framework Advisor:

```bash
./scripts/run_self_hosting_validation.sh
```

## Line Endings

Shell scripts must use LF line endings.

Projects may enforce this with `.gitattributes`:

```gitattributes
*.sh text eol=lf
```

## Script Header

New EDF shell scripts should identify the compatibility target near the beginning:

```bash
#!/usr/bin/env bash
# Required shell compatibility: Bash 3.2 or newer.
```

## Review Requirements

A shell-script change is not complete until:

- `/bin/bash -n` succeeds
- `validate_shell_scripts.sh` succeeds
- the script retains executable mode
- the script is tested on macOS or another Bash 3.2 environment when practical
- the corresponding PowerShell behavior remains aligned when a PowerShell equivalent exists

## Parent

- [Development](README.md)

## Related Documents

- [EDF Development Workflow](EDF_Development_Workflow.md)
- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [Framework Self-Hosting](../Governance/Framework_Self_Hosting.md)
- [EDF Self-Hosting Report](../Reference/EDF_Self_Hosting_Report.md)
