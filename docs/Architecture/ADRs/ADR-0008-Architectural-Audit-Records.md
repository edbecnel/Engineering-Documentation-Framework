# ADR-0008: Architectural Audit Records

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0008 Architectural Audit Records

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-09-17 |
| **Decision Makers** | EDF maintainers |
| **Related** | [AAR-0001](../../Specifications/AAR-0001-Architectural-Audit-Records.md), [ADR-0006](ADR-0006-Engineering-Documentation-vs-Artifacts.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

EDF defines authoritative architecture through ADRs and normative specifications. Projects also maintain **implementations** (source code, reference implementations, firmware, or similar) that must conform to those requirements.

Existing artifacts address related but different questions:

- [ASR Self-Conformance Review](../../Development/Repository_Bootstrap/Architecture_Specification_Repository/Self_Conformance_Review.md) — whether **documentation structure** aligns with ASR bootstrap guidance
- Framework Advisor reports under `reports/conformance/` — automated **documentation** tier scoring
- [Engineering Gate Review Records (EGR)](ADR-0007-Engineering-Gate-Review-Records.md) — human **program gate** approval over authoritative documents

There is no canonical location or structure for recording **implementation conformance reviews** (gaps, violations, and conformant areas) against architectural requirements.

---

# Decision

## 1. Introduce Architectural Audit Records (AAR)

An **Architectural Audit Record (AAR)** is governed documentation that records a structured review of implementation against declared architectural requirements.

Normative requirements: [AAR-0001](../../Specifications/AAR-0001-Architectural-Audit-Records.md).

Individual AAR files are **non-normative assessments**; they do not replace ADRs or specifications.

## 2. Location

AAR files live under:

```text
docs/Architecture/Audits/
```

This subdomain is part of EDF **Core** directory expectations after this ADR.

## 3. Identifier namespaces

| Namespace | Purpose | Examples |
|---|---|---|
| **Architectural Audit Record (AAR)** | Implementation conformance audits | `AAR-0001`, `AAR-0002` |
| **Architectural discovery records** | Historical pre-spec context | `CRA-0000` (separate series) |
| **Engineering Gate Review (EGR)** | Program gate approval | `EGR-G0`, gate IDs in `Gate_Reviews/` |
| **Bootstrap validation gates (BVG)** | Adoption automated checks | BVG-1 … BVG-6 |

AAR identifiers MUST NOT be reused for EGR gate IDs or BVG aliases.

## 4. Relationship to other lifecycle actions

- Completing an AAR records audit findings and remediation plans; it does **not** automatically set ADR **Status** to Accepted or change normative specification **Status**.
- Follow [ADR Approval Workflow](ADR_Approval_Workflow.md) when findings require new or updated decisions.
- An EGR MAY require a **Complete** AAR before gate satisfaction; satisfying the EGR does not auto-close open findings in the AAR.

## 5. Human authority

Findings and **Complete** audit status require human judgment. Automated tools MAY draft or pre-fill AAR sections but MUST NOT mark an audit **Complete** or alter authoritative ADR/spec **Status** without explicit human direction ([Change Management](../../Governance/Change_Management.md)).

---

# Consequences

## Positive

- Traceable implementation-vs-requirements analysis in Git
- Clear separation from documentation self-conformance and program gates
- Repeatable audits with **Superseded** lineage when re-run

## Negative

- Additional documents when architecture or code changes frequently

## Risks

- Findings mistaken for normative requirements — mitigate by keeping AAR out of `docs/Specifications/` and linking requirements basis explicitly

---

# References

- [Architectural Audit Record Template](../../Templates/Architectural_Audit_Record_Template.md)
- [Architecture Audits README](../Audits/README.md)
