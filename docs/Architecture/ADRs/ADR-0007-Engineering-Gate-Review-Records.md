# ADR-0007: Engineering Gate Review Records

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0007 Engineering Gate Review Records

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-09-15 |
| **Decision Makers** | EDF maintainers |
| **Related** | [EGR-0001](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md), [General Engineering Project Model](../General_Engineering_Project_Model.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

Engineering projects use **milestones**, **release gates**, and **human approval checkpoints** (bootstrap confirmation, architecture review, implementation start). EDF already defines:

- Document lifecycle states ([Document Lifecycle](../../Governance/Document_Lifecycle.md))
- ADR approval ([ADR Approval Workflow](ADR_Approval_Workflow.md))
- Bootstrap **validation_gates** G1–G6 in [edf.bootstrap.v1.yaml](../../../interaction/specs/edf.bootstrap.v1.yaml) (structure scores, bootstrap report completeness)

Bootstrap validation gates are **automated conformance checks**, not the same as **program gates** that bundle review of multiple authoritative documents before unblocking work.

There is no canonical artifact for recording “gate satisfied” with per-document review checkboxes.

---

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

## 4. Relationship to other lifecycle actions

- Satisfying an EGR records that the **gate** is approved; it does **not** automatically set ADR **Status** to Accepted or SPEC **Status** to Approved.
- Follow [ADR Approval Workflow](ADR_Approval_Workflow.md) and document lifecycle rules when updating linked artifacts after a gate is satisfied.

## 5. Human authority

Only humans (or explicitly delegated decision makers named in the EGR) may mark an EGR gate decision as satisfied. Automated tools MAY pre-fill checklists but MUST NOT mark gate satisfied without explicit human direction ([Change Management](../../Governance/Change_Management.md)).

---

# Consequences

## Positive

- Traceable gate approval in Git
- Clear separation from bootstrap conformance scores
- Machine-readable target for engineering tools (gate discovery, open gates)

## Negative

- Additional documents to maintain when gate definitions change

## Risks

- Duplicate checklists in bootstrap report and EGR — mitigate by linking one authoritative EGR per program gate

---

# References

- [Gate Review Record Template](../../Templates/Gate_Review_Record_Template.md)
- [Universal Bootstrap Specification](../../AI/Universal_Bootstrap_Specification.md) Phase 4
