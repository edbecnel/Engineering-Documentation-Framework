# ADR-0007: Engineering Gate Review Records

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0007 Engineering Gate Review Records

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-09-22 |
| **Decision Makers** | EDF maintainers |
| **Related** | [EGR-0001](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md), [AAR-0001](../../Specifications/AAR-0001-Architectural-Audit-Records.md), [General Engineering Project Model](../General_Engineering_Project_Model.md), [ADR Approval Workflow](ADR_Approval_Workflow.md), [Governance Overview](../../Governance/Governance_Overview.md) |

---

# Context

Engineering projects use **milestones**, **release gates**, and **human approval checkpoints** (bootstrap confirmation, architecture review, implementation start). EDF already defines:

- Document lifecycle states ([Document Lifecycle](../../Governance/Document_Lifecycle.md))
- ADR approval ([ADR Approval Workflow](ADR_Approval_Workflow.md))
- Bootstrap **validation_gates** G1–G6 in [edf.bootstrap.v1.yaml](../../../interaction/specs/edf.bootstrap.v1.yaml) (structure scores, bootstrap report completeness)

Bootstrap validation gates are **automated conformance checks**, not the same as **program gates** that bundle review of multiple authoritative documents before unblocking work.

There is no canonical artifact for recording “gate satisfied” with per-document review checkboxes.

Adopting architecture programs also exposed a second gap: after substantive architecture is Accepted, remaining administrative or documentation obligations (indexing, transcription of already-Accepted decisions, reconciliation) can remain useful and required while no longer materially affecting a specifically authorized downstream activity. Treating those remaining obligations as an absolute barrier to implementation planning conflates **gate lifecycle** with **dependency blocking**. Informal skipping is not acceptable. Marking the gate Satisfied merely to proceed is also not acceptable.

# Decision

## 1. Introduce Engineering Gate Review Records (EGR)

An **Engineering Gate Review Record (EGR)** is governed documentation that records human review of a defined **program gate** and the authoritative documents that gate depends on.

Normative requirements: [EGR-0001](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md).

## 2. Location

EGR files live under:

```text
docs/Program/Gate_Reviews/
```

`docs/Program/` holds program-level documentation (milestones, gate reviews). It is part of EDF Core directory expectations after this ADR.

## 3. Identifier namespaces

| Namespace | Purpose | Examples |
|---|---|---|
| **Bootstrap validation gates (BVG)** | Adoption/bootstrap automated checks | BVG-1 … BVG-6 (documentation alias for interaction spec G1–G6) |
| **Engineering Gate Review (EGR)** | Human program gate approval records | `EGR-G0`, `EGR-0001`, project-defined gate IDs |

EGR identifiers MUST NOT reuse bootstrap validation gate IDs (G1–G6) for program gates.

Governed Dependency Overrides are recorded **on the source EGR**. Local override IDs such as `GDO-1` are scoped to that file. EDF MUST NOT introduce a global `GDO-NNNN` identifier namespace.

## 4. Relationship to other lifecycle actions

- Satisfying an EGR records that the **gate** is approved; it does **not** automatically set ADR **Status** to Accepted or SPEC **Status** to Approved.
- Follow [ADR Approval Workflow](ADR_Approval_Workflow.md) and document lifecycle rules when updating linked artifacts after a gate is satisfied.
- A **Governed Dependency Override** does not complete, waive, or supersede the source gate. Gate Status remains `Open` while the remaining obligation is still required.

## 5. Human authority

Only humans (or explicitly delegated decision makers named in the EGR) may mark an EGR gate decision as satisfied, waived, or superseded, or activate a Governed Dependency Override. Automated tools MAY pre-fill checklists but MUST NOT mark those outcomes without explicit human direction ([Change Management](../../Governance/Change_Management.md)).

## 6. Independent dimensions

Gate lifecycle and dependency blocking are independent facts.

**Gate Status** (obligation / review lifecycle): `Open`, `Satisfied`, `Rejected`, `Deferred`, `Waived`, `Superseded`.

- `Deferred` retains its original meaning: the **gate decision** is postponed. It is not Non-Blocking authorization.
- `Waived` means the obligation is no longer required.
- `Superseded` means another accepted gate, artifact, or decision has replaced the obligation.

**Dependency Disposition** (per Authorized Downstream Scope; meaningful while Gate Status is `Open`): `Blocking` (default) or `Non-Blocking` (only via an Active Governed Dependency Override).

A gate MUST NOT be marked `Satisfied` merely to allow downstream work to begin.

## 7. Governed Dependency Override (GDO)

A **Governed Dependency Override** is an explicit, authorized, auditable change that leaves the source gate `Open` while setting Dependency Disposition to `Non-Blocking` for a stated **Authorized Downstream Scope**.

Authorized Downstream Scope is **not** limited to another EGR or gate. A GDO MAY authorize a clearly bounded downstream gate, implementation tranche, milestone, release activity, named work package, or other explicitly identified governed activity. The scope MUST be precise enough to determine what is and is not authorized. Work outside that explicit scope remains subject to the original Blocking dependency.

If the authorized downstream activity has its own EGR, that EGR SHOULD reference the source GDO. A downstream EGR is **not** required merely because a GDO exists.

Override status is `Active`, `Reactivated`, or `Closed`. Reactivation returns the affected dependency to Blocking when the safety assumption is invalidated.

## 8. Authority to override

The actor authorizing a GDO MUST possess authority over the affected governance dependency — typically the EGR Owner, named Decision maker, or the project’s declared architecture authority. Do not hard-code Project Architect as the only possible authority.

If the unfinished obligation includes another domain’s binding requirements (safety, security, privacy, compliance, destructive operations), that domain owner MUST also approve, or the override is ineligible.

## 9. Eligibility

A GDO is allowed only when the approving authority determines that the unfinished work does **not** contain an unresolved matter that materially affects the specifically authorized downstream activity.

Expediency alone is not sufficient justification. Process cost and engineering value MAY be considered only after that safety basis is stated.

This capability does not relax Bootstrap Validation Gates.

## 10. Closeout and governance debt

Outstanding Open gates with Active GDOs are **governance debt**. They remain visible on the source EGR and in the Gate Reviews index. They are not Watch Items by default and are not a separate record type.

When a project declares program or release closeout, every such gate MUST be Satisfied, Waived, Superseded, or explicitly carried into the next declared program increment with a still-valid Active GDO.

# Alternatives considered

- **Reuse Gate Status `Deferred` for non-blocking progress.** Rejected: `Deferred` already means the gate decision is postponed.
- **New GDO specification or record type.** Rejected: the source EGR already records the remaining obligation; a parallel register would duplicate tracking.
- **Automatic Watch Item for every override.** Rejected: AWIs are deferred architectural initiatives outside the current roadmap, not on-roadmap Open gate obligations.
- **Limit Authorized Downstream Scope to another EGR.** Rejected: the authorized activity may be a tranche, milestone, release activity, or named work package that does not have (and need not have) its own EGR.

# Consequences

## Positive

- Traceable gate approval in Git
- Clear separation from bootstrap conformance scores
- Machine-readable target for engineering tools (gate discovery, open gates, incomplete-but-non-blocking dependencies)
- Controlled authorization of bounded downstream work without falsely closing remaining obligations

## Negative

- Additional documents to maintain when gate definitions change
- Additional GDO evidence to maintain while an Open gate is Non-Blocking for a stated scope

## Risks

- Duplicate checklists in bootstrap report and EGR — mitigate by linking one authoritative EGR per program gate
- Informal use of GDO as a ceremonial loophole — mitigate by requiring safety basis, precise scope, named authority, and reactivation

---

# References

- [Gate Review Record Template](../../Templates/Gate_Review_Record_Template.md)
- [Universal Bootstrap Specification](../../AI/Universal_Bootstrap_Specification.md) Phase 4
- [Architectural Watch Items](../Watch_Items/README.md)
- [Architectural Audit Records](../Audits/README.md)
