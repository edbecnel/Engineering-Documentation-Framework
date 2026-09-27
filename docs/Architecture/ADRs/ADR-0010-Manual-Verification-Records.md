# ADR-0010: Manual Verification Records

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0010 Manual Verification Records

| | |
|---|---|
| **Status** | Accepted |
| **Date** | 2026-09-28 |
| **Decision Makers** | EDF maintainers |
| **Related** | [MVR-0001](../../Specifications/MVR-0001-Manual-Verification-Records.md), [ADR-0006](ADR-0006-Engineering-Documentation-vs-Artifacts.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

The [General Engineering Project Model](../General_Engineering_Project_Model.md) names **Test Procedures**, **Test Results / Observations**, and **Validation Reports** as discipline-independent verification concepts. [ADR-0006](ADR-0006-Engineering-Documentation-vs-Artifacts.md) classifies test procedures and validation reports as **engineering documentation**.

EDF already defines governed human lifecycle artifacts for related but different questions:

- [Engineering Gate Review Records (EGR)](ADR-0007-Engineering-Gate-Review-Records.md) — program gate approval over authoritative documents
- [Architectural Audit Records (AAR)](ADR-0008-Architectural-Audit-Records.md) — implementation conformance reviews
- [Governed Maintenance Records (GMR)](ADR-0009-Governed-Maintenance-Fast-Path.md) — bounded maintenance under GMFP

There is no canonical location, structure, or identifier namespace for **human-executed manual verification** when a governed work item, gate, tranche, review, or acceptance decision requires it. Adopters often embed operator checklists in architecture documents, implementation plans, or PR prose — which hides operational QA from testers and downstream tooling.

---

# Decision

## 1. Introduce Manual Verification Records (MVR)

A **Manual Verification Record (MVR)** is governed documentation that contains the **executable human manual verification procedure** and the **factual execution record** for one governed human-manual-verification obligation.

Normative requirements: [MVR-0001](../../Specifications/MVR-0001-Manual-Verification-Records.md).

One MVR per obligation. Distinct governed **sections** within the file preserve GEP concepts (procedure vs results) without splitting into multiple operator documents.

## 2. Mandatory use boundary

When an EDF-governed work item, gate, tranche, review, or acceptance decision **requires human-executed manual verification**, an MVR **MUST** be the canonical executable and execution record.

Ordinary, non-governed developer manual checks (for example PR test plans) remain permitted without an MVR.

## 3. Location

MVR instance files live under:

```text
docs/Verification/Records/
```

This **Verification** subdomain is part of EDF **Core** directory expectations after this ADR. Manual verification is **not** canonically placed under `docs/Architecture/`, `docs/Program/`, or `docs/Developer_Handbook/` merely because those artifacts reference it.

## 4. Identifier namespaces

| Namespace | Purpose | Examples |
|---|---|---|
| **Manual Verification Record (MVR)** | Governed human manual verification | `MVR-0001`, `MVR-0002` |
| **Manual Verification Test (MVT)** | Local test IDs within one MVR | `MVT-1`, `MVT-2` |
| **Compound reference** | Global traceability | `MVR-0001 / MVT-1` |

MVR identifiers MUST remain separate from AAR, GMR, EGR gate IDs, and BVG aliases. EDF MUST NOT introduce a global `MVT-NNNN` sequence unless a future architectural decision demonstrates need.

## 5. Anti-embedding

Architecture, specifications, implementation plans, and similar planning artifacts **MUST** declare governed manual-QA obligations and **MUST** link the canonical MVR. They **MUST NOT** be the canonical container for detailed operator checklists when an MVR is required.

## 6. Waiver vs execution truth

The MVR records **what actually happened during human verification**. **Waived** is not an MVT result. Acceptance via waiver is recorded on the **governing record** (for example an EGR). The MVR MAY include optional **Notes** pointing to a governing waiver for traceability only.

## 7. Relationship to other lifecycle actions

- Satisfying an EGR, completing an AAR, or accepting GMFP-3 **MUST NOT** be represented as fully satisfied while a **linked required MVR** has unresolved required manual verification, except through explicit waiver on the governing record per applicable EDF governance.
- A [Governed Dependency Override](ADR-0007-Engineering-Gate-Review-Records.md) does **not** substitute for human manual test execution.
- GMFP validation success does **not** imply governed human manual QA was executed.

## 8. Human and AI authority

Authorized humans record MVT results and human execution status. Automated tools and AI assistants MAY draft or maintain MVR structure but **MUST NOT** mark required MVT **Pass** or **Human execution status** **Complete** based solely on implementation completion, automated tests, inspection, inference, or expected behavior ([Change Management](../../Governance/Change_Management.md), [AI Verification](../../AI/Verification.md)).

---

# Consequences

## Positive

- Discoverable operator checklists with stable IDs and deterministic structure for tooling
- Clear separation: planning artifacts (what/why) vs MVR (how + factual execution)
- Aligns GEP verification concepts with adoptable Core practice

## Negative

- Additional documents when governed tranches require human manual QA

## Risks

- Checkboxes mistaken for authoritative results — mitigate via normative execution record in MVR-0001
- Waivers confused with Pass — mitigate by keeping waiver on governing records only

---

# References

- [Manual Verification Record Template](../../Templates/Manual_Verification_Record_Template.md)
- [Verification README](../../Verification/README.md)
- [MVR-0001](../../Specifications/MVR-0001-Manual-Verification-Records.md)
