# ADR-0015: Engineering Verification Integrity

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0015 Engineering Verification Integrity

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-10-28 |
| **Decision Makers** | Project Owner (pending) |
| **Related** | [EVI-0001](../../Specifications/EVI-0001-Engineering-Verification-Integrity.md), [ADR-0010](ADR-0010-Manual-Verification-Records.md), [ADR-0007](ADR-0007-Engineering-Gate-Review-Records.md), [ADR-0008](ADR-0008-Architectural-Audit-Records.md), [ADR-0009](ADR-0009-Governed-Maintenance-Fast-Path.md), [ADR-0014](ADR-0014-AI-Session-Handover-Messages.md), [ADR-0012](ADR-0012-Logical-Architectural-Domains.md), [ADR Approval Workflow](ADR_Approval_Workflow.md), [Document Lifecycle](../../Governance/Document_Lifecycle.md) |

---

# Context

EDF already provides specialized verification and governance records ([MVR-0001](../../Specifications/MVR-0001-Manual-Verification-Records.md), [EGR-0001](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md), [AAR-0001](../../Specifications/AAR-0001-Architectural-Audit-Records.md), [GMFP-0001](../../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md), [HND-0001](../../Specifications/HND-0001-AI-Session-Handover-Messages.md), [DVW-0001](../../Specifications/DVW-0001-Disposable-Verification-Workspaces.md)), but a general requirement is needed to prevent engineering completion claims from outrunning actual functional verification.

---

# Decision

## Proposed decision

Adopt [EVI-0001 — Engineering Verification Integrity](../../Specifications/EVI-0001-Engineering-Verification-Integrity.md) as a short, tool-independent **EDF Core** specification. It distinguishes implementation, verification, and acceptance; requires observable criteria and truthful evidence; preserves independent acceptance and authorization boundaries; and scales verification to risk.

Existing governed completion records MAY satisfy EVI. The optional [Engineering Completion Report template](../../Templates/Engineering_Completion_Report_Template.md) is a convenience, not a new mandatory artifact. EVI does not create a new lifecycle state machine, universal directory, or waiver authority, and does not modify existing MVR, EGR, AAR, GMFP, HND, or DVW specifications.

## Approval and effectiveness

[EVI-0001](../../Specifications/EVI-0001-Engineering-Verification-Integrity.md) and this ADR remain **Proposed** until accepted and approved under the applicable EDF governance process ([ADR Approval Workflow](ADR_Approval_Workflow.md), [Document Lifecycle — Framework normative specifications](../../Governance/Document_Lifecycle.md#framework-normative-specifications)). Adopting projects and agents **MUST NOT** treat EVI-0001 as normatively effective before required approval and effective-scope records are complete. [ADR-0013](ADR-0013-Framework-Normative-Specification-Effectiveness.md) / P2 effectiveness is a separate governance decision.

---

# Consequences

## Positive

- Fewer false completion claims and clearer evidence-based acceptance.

## Negative

- Additional reporting only where existing records do not already capture the required facts.

## Risks

- Completion reporting conflated with formal acceptance — mitigate via EVI-0001 requirements 2 and 7 and the optional ECR short form.

---

# Related Documents

- [EVI-0001](../../Specifications/EVI-0001-Engineering-Verification-Integrity.md)
- [Engineering_Completion_Report_Template.md](../../Templates/Engineering_Completion_Report_Template.md)
- [Glossary](../../Reference/Glossary.md)
