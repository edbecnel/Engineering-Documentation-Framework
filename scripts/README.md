# Scripts

[Home](../README.md) › [Project Index](../PROJECT_INDEX.md) › Scripts

## Purpose

This directory contains the Engineering Documentation Framework utility scripts.

## One-Time Shell-Script Setup

After cloning the repository or copying scripts manually, ensure the shell scripts are executable:

```bash
chmod +x scripts/*.sh
```

To preserve executable modes in Git:

```bash
git update-index --chmod=+x scripts/*.sh
```

These are repository setup steps. They are not required before every validation run once the executable modes have been committed.

## Complete Self-Hosting Validation

From the repository root, run one command:

```bash
./scripts/run_self_hosting_validation.sh
```

The wrapper performs all required Bash validation stages:

1. Framework Advisor Stage 1 regression verification
2. Bash 3.2 compatibility and shell-script validation
3. Framework Advisor analysis of the EDF repository
4. Final summary of the report path, compliance scores, and recommended actions

The complete console output and final summary are saved automatically as a timestamped text report under:

```text
reports/self-hosting/
```

A successful run ends with a summary similar to:

```text
Self-hosting validation completed successfully.

Report:
reports/self-hosting/framework-advisor-YYYYMMDD-HHMMSS.txt

Compliance scores:
- Overall: 83%
- Structure: 96%
- AI: 100%
- Navigation: 76%
- Governance: 61%

Next recommended actions:
- Repair broken relative Markdown links.
- Correct governance metadata and lifecycle issues.
```

The wrapper invokes its supporting shell scripts through `/bin/bash`, so those scripts do not need to be called individually.

If the wrapper itself is not executable, it can still be run explicitly:

```bash
bash ./scripts/run_self_hosting_validation.sh
```

## Individual Validation Tools

The supporting tools remain available for focused troubleshooting:

```bash
./scripts/verify_framework_advisor_stage1.sh
./scripts/validate_shell_scripts.sh
./scripts/analyze_project_structure.sh .
```

Normal self-hosting validation should use the wrapper rather than these separate commands.

## Compatibility

EDF shell scripts target Bash 3.2 or newer.

See:

- [Cross-Platform Shell Scripting Guidelines](../docs/Development/Cross_Platform_Shell_Scripting_Guidelines.md)

## Parent

- [Project Index](../PROJECT_INDEX.md)

## Related Documents

- [Project Analysis and Validation Tool](../docs/Development/Project_Analysis_Validation_Tool.md)
- [Framework Self-Hosting](../docs/Governance/Framework_Self_Hosting.md)
