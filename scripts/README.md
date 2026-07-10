# Scripts

[Home](../README.md) › [Project Index](../PROJECT_INDEX.md) › Scripts

## Purpose

This directory contains the Engineering Documentation Framework utility scripts.

## Shell-Script Setup

After extracting an update package or copying scripts manually, ensure all shell
scripts are executable:

```bash
chmod +x scripts/*.sh
```

To preserve executable modes in Git:

```bash
git update-index --chmod=+x scripts/*.sh
```

## Validation

Validate Bash 3.2 compatibility and executable permissions:

```bash
./scripts/validate_shell_scripts.sh
```

Run EDF self-hosting validation:

```bash
./scripts/run_self_hosting_validation.sh
```

## Compatibility

EDF shell scripts target Bash 3.2 or newer. See:

- [Cross-Platform Shell Scripting Guidelines](../docs/Development/Cross_Platform_Shell_Scripting_Guidelines.md)

## Parent

- [Project Index](../PROJECT_INDEX.md)

## Related Documents

- [Project Analysis and Validation Tool](../docs/Development/Project_Analysis_Validation_Tool.md)
- [Framework Self-Hosting](../docs/Governance/Framework_Self_Hosting.md)
