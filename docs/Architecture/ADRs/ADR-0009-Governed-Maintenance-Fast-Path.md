# ADR-0009: Governed Maintenance Fast Path

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0009 Governed Maintenance Fast Path

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-09-26 |
| **Decision Makers** | EDF maintainers |
| **Related** | [GMFP-0001](../../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md), [EGR-0001](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md), [AAR-0001](../../Specifications/AAR-0001-Architectural-Audit-Records.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

EDF defines documentation-first development, program gates ([EGR](ADR-0007-Engineering-Gate-Review-Records.md)), proportionality via [Governed Dependency Overrides](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md), and implementation conformance audits ([AAR](ADR-0008-Architectural-Audit-Records.md)).

Operational practice in governed projects often applies many human synchronization gates to small corrective maintenance (plan, implement, commit, document, document commit, publish) even when risk is bounded (for example isolated test-harness defects with no product or architecture change).

[Change Management](../../Governance/Change_Management.md) allows emergency implement-first corrections but does not define a structured maintenance path with eligibility, scope, evidence, and publication control.

There is no canonical EDF artifact or workflow for **bounded corrective maintenance** that reduces gate overhead without reducing traceability.

---

# Decision

## 1. Introduce Governed Maintenance Fast Path (GMFP)

GMFP is an **optional governed capability** for qualifying corrective maintenance. Normative requirements: [GMFP-0001](../../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md).

GMFP is governance, not an escape hatch. When eligibility is unclear, normal governance applies.

## 2. Two human gates, three workflow stages

GMFP uses three stages (GMFP-1, GMFP-2, GMFP-3) but only **two human governance gates**:

| Gate | Stage | Role |
|---|---|---|
| Authorization | GMFP-1 | Diagnose, classify, bound, authorize |
| Acceptance and publication | GMFP-3 | Accept evidence; authorize push in one decision when appropriate |

**GMFP-2** is the **authorized maintenance execution interval** — not an approval gate.

## 3. Governed Maintenance Records (GMR)

Maintenance items under GMFP are tracked in lightweight **Governed Maintenance Records** under:

```text
docs/Program/Maintenance_Records/
```

Filename pattern: `GMR-NNNN-<short-title>.md`.

Template: [Governed_Maintenance_Record_Template.md](../../Templates/Governed_Maintenance_Record_Template.md).

## 4. Relationship to EGR, GDO, and AAR

- GMFP does not replace or satisfy program gates (EGR).
- GMFP is not a substitute for GDO unless maintenance is explicitly tied to an Open gate obligation.
- Typical GMFP items (no production or architecture change) do not require a new AAR; violations discovered during maintenance escalate to normal remediation.

## 5. Interaction layer deferred

Machine-readable Interaction Specifications for GMFP are **out of scope** for this decision. Encode in tooling only after GMFP is exercised operationally in real projects.

## 6. Human authority

The **declared architecture authority** authorizes and accepts GMFP. Project templates MAY map that role (for example Project Architect). Automated tools MUST NOT authorize, accept, or publish without explicit human direction.

---

# Consequences

## Positive

- Proportional governance for bounded maintenance
- Two architecture-authority touchpoints with full traceability in GMR and Git
- Clear escalation when scope or risk exceeds maintenance bounds

## Negative

- Additional specification and template when projects adopt GMFP
- Discipline required to avoid using GMFP for ineligible work

## Risks

- GMFP misapplied to architectural change — mitigate with objective eligibility checklist and mandatory escalation

---

# References

- [GMFP implementation plan](../../../tasks/GMFP-implementation-plan.md)
- [Program Maintenance Records](../../Program/Maintenance_Records/README.md)
