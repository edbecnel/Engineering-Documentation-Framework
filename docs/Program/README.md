[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Program

# Program

## Purpose

Program-level engineering documentation: milestones, releases, **Engineering Gate Review Records (EGR)**, and optional **Governed Maintenance Records (GMR)** under the Governed Maintenance Fast Path (GMFP).

Normative specification: [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md). Gate Status and Dependency Disposition are independent. An Open gate may carry an Active **Governed Dependency Override** that authorizes a precise downstream activity without completing the gate.

Optional bounded-maintenance governance: [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) ([ADR-0009](../Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md)).

## Governance concepts (clarification)

This section summarizes existing EDF semantics for readers navigating `docs/Program/`. Normative rules remain in [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) and [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md).

### Program gates and Engineering Gate Review Records (EGR)

- A **program gate** is a declared governance obligation or checkpoint (roadmap, charter, or release plan) requiring human review before defined work is unblocked.
- A **gate review** is the human review activity against that gate’s criteria.
- An **Engineering Gate Review Record (EGR)** is the governed **artifact** under [Gate_Reviews/](Gate_Reviews/README.md) that records the gate review outcome.

When Gate Status is **Satisfied** and the gate’s **Unblocks** field names applicable work, that work may proceed as declared in the project roadmap. EDF does **not** prescribe how often implementers must pause for human approval during that work unless another governing requirement applies (for example a linked MVR, GMFP scope, or significant change under [Change Management](../Governance/Change_Management.md)). Satisfying an EGR does not by itself change ADR or specification **Status** fields — follow [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md) and document lifecycle rules.

### Governed Dependency Override (GDO)

A **Governed Dependency Override** is recorded on a source EGR while Gate Status remains **Open**. It sets **Dependency Disposition** to **Non-Blocking** only for a precise **Authorized Downstream Scope**. It does **not** satisfy, waive, or supersede the source gate obligation. A GDO is **not** a general execution-envelope or permitted-operations artifact for tools or agents. If remaining work later materially contradicts the safety basis for the authorized scope, the override must be **Reactivated** and affected downstream work pauses for authority review ([EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) §20).

### GMFP and Governed Maintenance Records (GMR)

[GMFP](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) is **optional** and **maintenance-specific**. A **Governed Maintenance Record (GMR)** consolidates evidence for one GMFP item. **GMFP-2** is the authorized maintenance execution interval; it is **not** a human approval gate. GMFP is not the default governance model for ordinary feature or product implementation.

## Gate Reviews

Authoritative gate approval artifacts live under [Gate_Reviews/](Gate_Reviews/README.md). Index **Active overrides** for Open gates that still have a Governed Dependency Override (governance debt). Do not add a separate debt register.

| Gate ID | Record | Status | Active overrides |
|---|---|---|---|
| _Add rows when EGR files exist_ | | Open / Satisfied / Rejected / Deferred / Waived / Superseded | none / [link] |

Use [Gate_Review_Record_Template.md](../Templates/Gate_Review_Record_Template.md) when creating new EGR files.

## Maintenance Records

Optional **Governed Maintenance Records** for GMFP live under [Maintenance_Records/](Maintenance_Records/README.md). Use [Governed_Maintenance_Record_Template.md](../Templates/Governed_Maintenance_Record_Template.md). GMFP uses two human governance gates (authorization; acceptance and publication); GMFP-2 is execution only.

## Bootstrap vs Program Gates

| Type | IDs | Meaning |
|---|---|---|
| Bootstrap validation gates (BVG) | BVG-1 … BVG-6 (aliases for bootstrap interaction spec **G1 … G6**) | Automated adoption checks — not program gates |
| Engineering Gate Review Record (EGR) | G0, G1, EGR-0001, … (project-defined gate IDs) | Human program-gate approval artifacts in `Gate_Reviews/` |

Do not use bootstrap **G1–G6** (or **BVG-1 … BVG-6**) as program gate IDs in EGR filenames ([EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) §10).

## Parent

- [Project Index](../../PROJECT_INDEX.md)

## Related Documents

- [ADR-0007](../Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md)
- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [ADR-0009](../Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
- [Glossary](../Reference/Glossary.md)
