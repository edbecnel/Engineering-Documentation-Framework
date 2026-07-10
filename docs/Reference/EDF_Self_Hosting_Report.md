# EDF Self-Hosting Report

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Reference](README.md) › EDF Self-Hosting Report

> **Status:** In Review
> **Owner:** Engineering Documentation Framework
> **Applies To:** Engineering Documentation Framework repository only
> **Last Reviewed:** 2026-07-10
> **Review Frequency:** Per Release
> **Authoritative:** Yes

## Report Status

**Validation state:** Ready for local execution

This report records the M4 self-hosting implementation and repository-review findings
corrected by this package.

The report does not claim a passed analyzer run. The Framework Advisor must be
executed against the merged local repository and its output reviewed by the maintainer.

## Repository Review Findings

### Corrected by M4

1. The canonical `docs/Reference/` domain was absent from the active repository tree.
2. EDF did not have a repeatable self-hosting runner that retained validation reports.
3. Self-hosting requirements and release pass criteria lacked one authoritative home.
4. Self-hosting was not linked through Governance and `PROJECT_INDEX.md`.

### Validation Capability Added

- PowerShell self-hosting runner
- Bash self-hosting runner
- timestamped report output
- documented pass criteria
- accepted-exception requirements
- M5 release gate

## Required Local Validation

After merging this package, run:

```powershell
.\scripts\run_self_hosting_validation.ps1
```

or:

```bash
./scripts/run_self_hosting_validation.sh
```

Review the report created under `reports/self-hosting/`.

## Review Record

| Field | Value |
|---|---|
| Milestone | M4 – Framework Self-Hosting |
| Repository review | Completed |
| Self-hosting capability | Implemented |
| Local analyzer execution | Pending after merge |
| Critical exceptions | None accepted |
| Release gate | Not approved |
| Maintainer approval | Pending |

## Completion Rule

Change this document to `Maintained` only after the generated Framework Advisor report
has been reviewed and all critical findings are resolved or explicitly accepted.

## Parent

- [Reference](README.md)

## Related Documents

- [Framework Self-Hosting](../Governance/Framework_Self_Hosting.md)
- [EDF Governance](../Governance/EDF_Governance.md)
- [Governance Checklist](../Governance/Governance_Checklist.md)
- [Project Analysis and Validation Tool](../Development/Project_Analysis_Validation_Tool.md)
