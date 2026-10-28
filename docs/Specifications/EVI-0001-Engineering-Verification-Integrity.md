# EVI-0001: Engineering Verification Integrity

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › EVI-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Proposed |
| **Specification ID** | EVI-0001 |
| **Version** | 1.0 |
| **Date** | 2026-10-28 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |
| **Primary Logical Domain** | AE |
| **Related Logical Domains** | EG, EPI |

## Purpose

Prevent unsupported claims that engineering work is complete or working. Implementation, verification, and formal acceptance are different outcomes. Apply these requirements to **EDF-governed engineering work**, proportionately to its risk and scope, whether performed by a human or an automated agent.

## Normative Requirements

1. **Define success before execution.** The governing authorization MUST state or link observable acceptance criteria and the verification needed to support them. Authorized changes to those criteria MUST be traceable; criteria MUST NOT be retroactively invented to justify a completion claim.
2. **Keep outcomes separate.** Implementation status, verification results, and formal acceptance MUST be reported distinctly. An implementer's statement that work is complete is not acceptance.
3. **Support claims with evidence.** A completion claim MUST identify what changed, which acceptance criteria were checked, the actual results, and evidence sufficient for the claim. A successful build, commit, deployment, or isolated automated test alone MUST NOT establish untested user-facing or end-to-end behavior.
4. **Report what actually happened.** For each required verification method, record **Pass**, **Fail**, **Not executed**, or **Blocked**, with scope, executor, and evidence or reason. A method determined unnecessary before acceptance MAY be marked **Not required**, with brief risk-based justification. Never represent unexecuted work as tested.
5. **Be explicit about gaps.** Completion reporting MUST identify material unverified assumptions, known defects, blockers, and limitations. When end-to-end or manual verification is required, identify its actual scope and result; link the governing [manual verification record](MVR-0001-Manual-Verification-Records.md) where applicable.
6. **Use existing records.** A completion report, [governed maintenance record](GMFP-0001-Governed-Maintenance-Fast-Path.md#governed-maintenance-records-gmr), [gate record](EGR-0001-Engineering-Gate-Review-Records.md), or equivalent existing artifact MAY hold the required information. A separate ECR file, universal directory, duplicate checklist, or duplicate approval record MUST NOT be required solely by EVI. The record MUST be discoverable from the governing authorization.
7. **Require authorized acceptance.** Only the designated acceptance authority MAY formally accept work. Implementers MUST NOT accept their own work solely by declaring it complete. Acceptance MUST be recorded and MUST NOT be asserted while required verification is failed, blocked, or unexecuted unless an applicable authorized waiver is recorded.
8. **Preserve verification truth under waiver.** A waiver MUST identify its governing authority, affected obligation, reason, and residual risk. It MUST NOT convert a failed, blocked, or unexecuted result into a pass. Existing specialized waiver rules continue to apply (for example [MVR-0001](MVR-0001-Manual-Verification-Records.md) and [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md)).
9. **Respond to contradictory evidence.** Credible evidence that accepted or reported work does not function as claimed MUST be investigated and recorded; acceptance MUST be reconsidered or reopened through the applicable existing process when warranted. Passing automated tests MUST NOT override observed failure.
10. **Understand defects before changing code.** Before corrective implementation, a reported defect MUST be reproduced or sufficiently characterized, with the evidence or limitation recorded. Regression verification after a fix MUST be reported proportionately to risk.
11. **Respect authorization boundaries.** Verification MUST NOT imply permission to alter production data, create real accounts, reset credentials, deploy, or perform other consequential operations outside granted **Authorization** scope (including [HND-0001](HND-0001-AI-Session-Handover-Messages.md) binding constraints when a handover governs the work). If required verification exceeds authorization, the engineer or agent MUST **STOP** and seek approval. Filesystem verification subjects MUST follow [DVW-0001](DVW-0001-Disposable-Verification-Workspaces.md) when applicable.
12. **Keep verification proportional.** Verification depth and evidence MUST match the risk and acceptance claim. Trivial editorial changes MUST NOT trigger unrelated testing or ceremonial approval. Existing [MVR-0001](MVR-0001-Manual-Verification-Records.md), [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md), [AAR-0001](AAR-0001-Architectural-Audit-Records.md), [GMFP-0001](GMFP-0001-Governed-Maintenance-Fast-Path.md), [HND-0001](HND-0001-AI-Session-Handover-Messages.md), and [DVW-0001](DVW-0001-Disposable-Verification-Workspaces.md) requirements apply where relevant; EVI does not replace or amend them.

## Minimum completion statement

Use an existing governed record whenever possible. It need only communicate:

- **Work and authorization:** What was requested, what changed, and where acceptance criteria are recorded.
- **Implementation:** Complete, partial, or blocked, with relevant evidence.
- **Verification:** Required methods, actual results, executor, evidence, and anything not tested.
- **Open issues:** Defects, assumptions, limitations, and any waiver reference.
- **Acceptance:** Named authority and decision, or **Pending**.

The level of detail is proportional to risk. Specialized records remain authoritative for their own procedures and decisions.

## Adoption and compatibility

This specification is **Proposed** until approved under [Document Lifecycle](../Governance/Document_Lifecycle.md) and applicable normative approval rules. It applies prospectively to newly governed work after effectiveness; prior closed records are not reopened solely because of adoption. No global lifecycle state machine or mandatory ECR file location is created.

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0015](../Architecture/ADRs/ADR-0015-Engineering-Verification-Integrity.md) (Proposed architectural direction)
- [Engineering_Completion_Report_Template.md](../Templates/Engineering_Completion_Report_Template.md) (optional short form)
- [MVR-0001](MVR-0001-Manual-Verification-Records.md)
- [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md)
- [AAR-0001](AAR-0001-Architectural-Audit-Records.md)
- [GMFP-0001](GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [HND-0001](HND-0001-AI-Session-Handover-Messages.md)
- [DVW-0001](DVW-0001-Disposable-Verification-Workspaces.md)
- [Glossary](../Reference/Glossary.md)
