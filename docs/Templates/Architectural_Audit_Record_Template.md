# AAR-[NNNN]: [Audit Title]

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Architecture](../Architecture/README.md) › [Audits](../Architecture/Audits/) › AAR-[NNNN]

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architectural Audit Record |
| **Normative** | No (findings are assessments; requirements remain in ADRs and specifications) |
| **Audit ID** | AAR-[NNNN] |
| **Audit Status** | Open / Complete / Superseded |
| **Scope** | [Brief scope statement] |
| **Audit Date** | YYYY-MM-DD (or period) |
| **Owner** | [Role or name] |
| **Superseded By** | [Link to replacement AAR if Superseded] |
| **Active GDOs in implementation scope** | None / [source EGR and Override ID] |

## Purpose

Describe why this audit was conducted and what implementation areas or release it supports.

If in-scope implementation proceeded under an Active Governed Dependency Override, record the source EGR and Override ID in metadata. A GDO does not complete this audit or hide Gaps or Violations.

## Requirements Basis

| Requirement | Link | Status (if ADR) | In scope |
|---|---|---|---|
| [Title] | [relative/path.md](relative/path.md) | Accepted / Proposed / … | Yes / No |

List every ADR, normative specification, or other authoritative requirement referenced by this audit.

## Implementation Scope

| Anchor | Value |
|---|---|
| Repository paths | `src/...`, `interaction/...` |
| Branch / tag / commit | |
| Modules or components | |
| Out of scope (explicit) | |

Record enough detail that another engineer can reproduce the audit.

## Findings

Repeat the following block for each finding.

### Finding [N]: [Short title]

| Field | Value |
|---|---|
| **Classification** | Conformant / Gap / Violation / Deferred / Out of scope |
| **Requirement** | Link or ID from Requirements basis |
| **Expected** | What the requirement calls for |
| **Observed** | What the implementation does |
| **Evidence** | Paths, symbols, commits |
| **Remediation** | None / PR / task / Proposed ADR / AWI / … |

## Summary (optional)

| Classification | Count |
|---|---|
| Conformant | |
| Gap | |
| Violation | |
| Deferred | |
| Out of scope | |

## Remediation Tracker

After audit **Complete**, track follow-up:

- [ ] [Remediation item — link to PR, task, or ADR]
- [ ] Update this AAR when superseded by a re-run

| Field | Value |
|---|---|
| **Completed by** | |
| **Completion date** | |

## Parent

- [Architecture Audits](../Architecture/Audits/README.md)

## Related Documents

- [AAR-0001](../Specifications/AAR-0001-Architectural-Audit-Records.md)
- [ADR-0008](../Architecture/ADRs/ADR-0008-Architectural-Audit-Records.md)
- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md)
