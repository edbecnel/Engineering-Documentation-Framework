# Framework Self-Hosting

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Framework Self-Hosting

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Engineering Documentation Framework repository only
> **Last Reviewed:** 2026-07-10
> **Review Frequency:** Per Release
> **Authoritative:** Yes

## Applicability

This document applies only to the Engineering Documentation Framework repository.

Projects adopting EDF may use the same validation approach, but they are not required
to satisfy EDF-specific template, generator, analyzer, self-hosting, or release rules.

## Purpose

Self-hosting requires EDF to apply its own documentation architecture, governance,
navigation, analyzer, and non-destructive tooling standards to the EDF repository.

## Requirements

EDF must validate:

- canonical repository structure
- required root documents
- AI handbook completeness
- Governance-domain completeness
- hierarchical Markdown navigation
- relative Markdown links
- orphan documents
- metadata and lifecycle validity
- ownership and review metadata
- overdue reviews
- analyzer read-only behavior
- PowerShell and Bash analyzer behavior
- accepted exceptions
- release readiness

## Validation Commands

PowerShell:

```powershell
.\scripts\run_self_hosting_validation.ps1
```

Bash:

```bash
./scripts/run_self_hosting_validation.sh
```

Each runner executes the Framework Advisor against the repository root and writes a
timestamped report under:

```text
reports/self-hosting/
```

## Pass Criteria

A stable EDF release requires:

- no unresolved critical findings
- no broken internal links
- no unexplained orphan canonical documents
- no invalid canonical lifecycle states
- no missing ownership on governed canonical documents
- no hidden accepted exceptions
- successful analyzer execution
- human review of the generated report

A numeric score is not a substitute for reviewing findings.

## Accepted Exceptions

Every accepted exception must identify:

- affected rule
- rationale
- owner
- approval
- review date
- resolution plan or permanent-exception status

## Release Gate

M5 release preparation must reference the latest reviewed self-hosting report.

EDF must not claim self-hosting compliance until the local report has been generated
and reviewed by the maintainer.

## Parent

- [Governance](README.md)

## Related Documents

- [EDF Governance](EDF_Governance.md)
- [Governance Analyzer Compliance](Analyzer_Compliance.md)
- [Governance Checklist](Governance_Checklist.md)
- [EDF Self-Hosting Report](../Reference/EDF_Self_Hosting_Report.md)
- [Project Analysis and Validation Tool](../Development/Project_Analysis_Validation_Tool.md)
- [EDF Development Workflow](../Development/EDF_Development_Workflow.md)
