# Documentation Change Management

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Documentation Change Management

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** Significant documentation changes
> **Last Reviewed:** 2026-07-10

## Purpose

This policy defines how significant documentation changes are proposed, reviewed,
recorded, and accepted.

## Significant Changes

A documentation change is significant when it affects:

- architecture
- public behavior
- interfaces
- governance
- security
- operational procedures
- ownership
- lifecycle state
- canonical navigation
- authoritative status

## Required Change Sequence

1. Identify the authoritative document.
2. Update architecture or policy before implementation when applicable.
3. Update affected cross-references.
4. Review the change.
5. Validate links and navigation.
6. Record the decision when architectural.
7. Update the changelog when release-significant.
8. Commit the change atomically when practical.

## Architectural Decisions

Changes that establish or reverse architectural direction should be recorded in
`ARCHITECTURE_DECISIONS.md` or in the project's ADR system.

## Update Packages

EDF update packages may include:

```text
.update/
    README_UPDATE_INSTRUCTIONS.md
    CHANGE_SUMMARY.md
    ARCHITECTURAL_DECISIONS.md
    AFFECTED_DOCUMENTS.md
    COMMIT_MESSAGE.txt
    DELETE_FILES.txt
```

The `.update/` directory is temporary and should not remain in the repository after
the change is reviewed and merged.

## Non-Destructive Rule

Automated tools must not:

- overwrite existing project-owned files
- delete files
- rename files
- move files
- merge competing documents automatically

They may generate recommendations or new files with explicit user approval.

## Emergency Changes

Urgent operational or security corrections may be implemented before full documentation
review when delay would create greater risk.

The documentation and decision record should be corrected as soon as practical afterward.

## Parent

- [Governance](README.md)

## Related Documents

- [Governance Overview](Governance_Overview.md)
- [Document Lifecycle](Document_Lifecycle.md)
- [Engineering Development Policy](../Development/Engineering_Development_Policy.md)
- [EDF Development Workflow](../Development/EDF_Development_Workflow.md)
