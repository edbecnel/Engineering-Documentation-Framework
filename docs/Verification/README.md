# Verification

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Verification

## Purpose

This domain holds **Manual Verification Records (MVR)** — canonical executable human manual verification procedures and factual execution records when EDF-governed work requires human-executed manual verification.

**Engineering verification integrity** for governed work is defined by [EVI-0001](../Specifications/EVI-0001-Engineering-Verification-Integrity.md). Completion facts MAY live in an existing governed record (MVR, EGR, GMR, or equivalent); EVI does not require a separate ECR file. Optional short form: [Engineering_Completion_Report_Template.md](../Templates/Engineering_Completion_Report_Template.md).

Planning artifacts (specifications, architecture, implementation plans) declare **what** must be verified and link here. They do not replace MVRs as the operator checklist.

**MVR** = governed verification **procedure and execution record**. **Disposable Verification Workspace (DVW)** = disposable **filesystem subject** used when verification requires directories on disk (default outside the adopting project root). DVW paths may appear on an MVR as execution metadata; they are not a substitute for MVR structure or execution truth. See [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md).

## What belongs here

| Artifact | Location |
|---|---|
| Manual Verification Record (MVR) | [Records/](Records/README.md) as `MVR-NNNN-<short-title>.md` |

## What does not belong here

- Architecture design and rationale → [docs/Architecture/](../Architecture/)
- Program gates and maintenance → [docs/Program/](../Program/)
- Ordinary non-governed PR manual checks → [Developer Handbook](../Developer_Handbook/05_Testing.md) (PR test plan)
- Normative framework rules → [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md) in Specifications

## Framework specification

- [EVI-0001 — Engineering Verification Integrity](../Specifications/EVI-0001-Engineering-Verification-Integrity.md)
- [MVR-0001 — Manual Verification Records](../Specifications/MVR-0001-Manual-Verification-Records.md)
- [Engineering Completion Report Template](../Templates/Engineering_Completion_Report_Template.md)
- [DVW-0001 — Disposable Verification Workspaces](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md)
- [ADR-0010 — Manual Verification Records](../Architecture/ADRs/ADR-0010-Manual-Verification-Records.md)
- [Manual Verification Record Template](../Templates/Manual_Verification_Record_Template.md)

## Parent

- [Project Index](../../PROJECT_INDEX.md)

## Related Documents

- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [General Engineering Project Model](../Architecture/General_Engineering_Project_Model.md)
