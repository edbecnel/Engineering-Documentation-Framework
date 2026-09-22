# EGR-0001: Engineering Gate Review Records

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › EGR-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Proposed |
| **Specification ID** | EGR-0001 |
| **Version** | 1.1 |
| **Date** | 2026-09-22 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |

## Purpose

Define adoptable requirements for **Engineering Gate Review Records (EGR)** — checkbox-based human approval artifacts for program gates, milestone transitions, and bundled review of authoritative documentation — including **Governed Dependency Overrides** that leave a gate Open while authorizing a precisely bounded downstream activity.

## Scope

### In scope

- EGR artifact structure, location, identifiers, and gate states
- Separation of Gate Status from Dependency Disposition
- Governed Dependency Override evidence, authority, eligibility, scope, reactivation, and closeout
- Separation from bootstrap validation gates (BVG)
- Relationship to ADR and document lifecycle workflows

### Out of scope

- Tool-specific UI for gates
- Agile sprint mechanics
- Automatic status mutation of ADRs or SPECs without separate workflow steps
- A separate GDO record type, specification ID, or identifier namespace
- Analyzer/parser implementation and ProjectConcord workflow

## Normative Requirements

1. Projects that define **program gates** (for example in an implementation roadmap, charter phases, or release plan) SHOULD maintain **one EGR Markdown file per program gate** under `docs/Program/Gate_Reviews/`.
2. Each EGR MUST include a **Gate ID** (for example `G0`, `G1`, or `EGR-0001`) unique among EGR files in the repository.
3. Each EGR MUST declare **Gate status**: `Open`, `Satisfied`, `Rejected`, `Deferred`, `Waived`, or `Superseded`.
4. Each EGR MUST include a **Gate decision** section with Markdown checkboxes for the final outcome (for example gate satisfied, gate rejected, gate deferred, gate waived, gate superseded). Exactly one outcome MUST be checked when the gate is closed.
5. Each EGR MUST include an **Documents under review** section with, for every authoritative document required by that gate, a relative link and checkboxes for **Reviewed** and **Approved** (or equivalent labels defined in the project template).
6. When a gate requires ADR disposition, the EGR MUST include per-ADR checkboxes or fields for **Accept**, **Reject**, or **Revise** (only one disposition per ADR). Changing ADR **Status** MUST follow [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md) after the EGR is satisfied.
7. An EGR MUST record **Decision maker** (name or role) and **Decision date** when the gate is closed.
8. Implicit approval (chat, email only) MUST NOT substitute for an updated EGR when the project declares that gate in the roadmap or charter.
9. Satisfying an EGR MUST NOT by itself change linked document lifecycle or ADR **Status** fields; post-gate actions MUST be tracked explicitly (checklist or separate commits).
10. Bootstrap **validation_gates** labeled G1–G6 in [edf.bootstrap.v1.yaml](../../interaction/specs/edf.bootstrap.v1.yaml) are **Bootstrap Validation Gates (BVG)**. They MUST NOT be used as program gate IDs in EGR filenames. Documentation MAY refer to BVG-1 … BVG-6 as aliases for bootstrap G1–G6. A Governed Dependency Override MUST NOT relax BVG checks.
11. Projects SHOULD use [Gate_Review_Record_Template.md](../Templates/Gate_Review_Record_Template.md) or a project copy derived from it.
12. **Gate Status** and **Dependency Disposition** are independent dimensions. Gate Status records the lifecycle of the obligation. Dependency Disposition records whether a declared prerequisite remains Blocking for a stated downstream activity. A project MUST NOT represent Blocking versus Non-Blocking solely by changing Gate Status.
13. While Gate Status is `Open`, Dependency Disposition defaults to **Blocking** for every declared downstream activity that lists the gate as a prerequisite. Downstream activity covered only by that default MUST NOT start. `Deferred` means the gate *decision* is postponed; it is not Non-Blocking authorization. `Waived` means the obligation is no longer required. `Superseded` means another accepted gate, artifact, or decision has replaced the obligation and MUST link forward to the replacement.
14. A **Governed Dependency Override (GDO)** is the only mechanism that may set Dependency Disposition to **Non-Blocking** while the source gate remains `Open`. The GDO MUST be recorded on the source EGR as a Markdown table with a local identifier (for example `GDO-1`). EDF MUST NOT introduce a global `GDO-NNNN` namespace. A GDO MUST NOT be treated as completion, waiver, supersession, or a postponed gate decision.
15. Each GDO MUST identify: source gate and remaining obligation; **Authorized Downstream Scope**; dependency disposition `Non-Blocking`; authority (role or name); date; rationale; safety basis (why proceeding is considered safe); conditions or constraints; reactivation conditions; affected declared dependencies; and override status `Active`, `Reactivated`, or `Closed`.
16. **Authorized Downstream Scope** MUST be an explicitly identified governed activity and MUST be sufficiently precise to determine what is and is not authorized. Scope is **not** limited to another EGR or gate. A GDO MAY authorize a clearly bounded downstream gate, implementation tranche, milestone, release activity, named work package, or other explicitly identified governed activity. Work outside that explicit scope remains subject to the original Blocking dependency. A GDO whose Authorized Downstream Scope is missing, vague, or unbounded is invalid.
17. The actor authorizing a GDO MUST have authority over the affected governance dependency (typically the EGR Owner, named Decision maker, or the project’s declared architecture authority). If the unfinished obligation includes another domain’s binding requirements (safety, security, privacy, compliance, or destructive-operation controls), that domain owner MUST also approve, or the override is ineligible. Automated tools MUST NOT activate a GDO without explicit human direction.
18. A GDO is eligible only when the approving authority has determined that the unfinished work does **not** contain an unresolved matter that materially affects the specifically authorized downstream activity. Expediency alone is not sufficient justification. Process cost and engineering value MAY be cited only after the safety basis is stated. Unresolved architecture decisions, safety, security, privacy, data-integrity or migration constraints, destructive-operation controls, regulatory requirements, and acceptance criteria necessary for implementation correctness SHOULD remain Blocking when they are relevant to the authorized activity. Administrative remainder after substantive decisions are already Accepted MAY be a candidate, subject to the actual dependency.
19. A gate MUST NOT be marked `Satisfied` merely to allow downstream work to begin. An Open remaining obligation MUST remain visible on the source EGR and in the Gate Reviews index while a GDO is Active.
20. If remaining work reveals a material contradiction or risk affecting the authorized downstream activity, the GDO MUST be set to `Reactivated`, Dependency Disposition MUST return to Blocking for the affected scope, and downstream work that depends on the unresolved matter MUST pause pending the same class of authority that granted the GDO. Silent return to Non-Blocking is forbidden.
21. When a project declares program or release closeout, every Open EGR with an Active GDO MUST be `Satisfied`, `Waived`, `Superseded`, or explicitly carried into the next declared program increment with a still-valid Active GDO. Outstanding Open gates with Active GDOs are governance debt tracked on those EGRs and in the index; they are not a separate record type.
22. If the authorized downstream activity has its own EGR, that EGR SHOULD reference the source GDO. A downstream EGR is **not** required merely because a GDO exists.
23. A GDO MUST NOT automatically create an [Architectural Watch Item](../Architecture/Watch_Items/README.md). An AWI MAY be added only when the remaining work is new architectural uncertainty rather than unfinished on-roadmap obligation. Primary tracking remains the source EGR.
24. A `Waived` closed outcome MUST identify the affected gate, rationale, owner, approval, review date, and whether the waiver is permanent or has a resolution plan (same evidence pattern as accepted exceptions). A `Superseded` closed outcome MUST link to the replacing accepted gate, artifact, or decision.

## Conformance

An adopting project conforms when:

- Every program gate referenced as blocking work in the authoritative roadmap (or equivalent) has a corresponding EGR file in `docs/Program/Gate_Reviews/`, and
- Open gates have incomplete gate decision checkboxes, and
- Closed gates have decision maker, decision date, and completed required review checklists, and
- Downstream activity that lists an Open prerequisite does not start unless an Active GDO on the source EGR explicitly includes that activity in Authorized Downstream Scope, and
- Each Active GDO has the required authority, date, safety basis, and precise Authorized Downstream Scope, and
- Work outside that explicit scope remains treated as Blocking, and
- A GDO is not represented as Gate Status `Satisfied`, `Waived`, `Superseded`, or `Deferred`, and
- A Reactivated override is not still treated as Non-Blocking, and
- Declared program or release closeout does not leave Active GDOs unreconciled unless they are explicitly carried forward, and
- Absence of a downstream EGR is not treated as nonconformance merely because a GDO exists.

## Rationale

Program gates bundle human review across multiple documents. A single traceable artifact supports auditability, AI-assisted tooling, and alignment with the General Engineering Project Model (milestones / releases).

Governance rigor should be proportional to unresolved engineering risk. After substantive decisions are Accepted, remaining administrative or documentation work should not automatically stay on the critical path unless that work is necessary to protect correctness, traceability, safety, compliance, or another declared requirement. A Governed Dependency Override is the controlled mechanism for that proportionality. It is not informal gate skipping.

## Worked example (non-normative)

After an architecture specification is Accepted, remaining gates may still require documentation indexing, transcription of already-Accepted decisions into standalone ADRs, and documentation reconciliation. Those obligations remain `Open` and required.

If the approving authority determines that this remaining work does not contain unresolved architecture that materially affects a **named first implementation tranche** (and, if declared, implementation-planning gate `G7`), a GDO on each still-Open source EGR may set Dependency Disposition to Non-Blocking **only** for that explicitly identified scope.

The authorized tranche may proceed. Other unnamed implementation, later gates, or a later release activity remain Blocking. If the tranche has its own EGR, that EGR SHOULD cite the source GDO. If it does not have an EGR, the GDO on the source gate is still sufficient provided the Authorized Downstream Scope is precise. If later indexing or reconciliation exposes a conflicting requirement that affects the tranche, the GDO is Reactivated and the affected work pauses for authority review.

## Relationship to Discovery Records

Discovery records (for example PCON-0000) are non-normative context. An EGR MAY list them as **Acknowledged** but MUST NOT treat them as approval blockers unless explicitly declared in the gate definition.

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0007](../Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md)
- [AAR-0001](AAR-0001-Architectural-Audit-Records.md)
- [Program](../Program/README.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
- [Governance Overview](../Governance/Governance_Overview.md)
- [Glossary](../Reference/Glossary.md)
