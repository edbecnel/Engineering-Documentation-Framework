# ADR-0013: Framework Normative Specification Effectiveness

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0013 Framework Normative Specification Effectiveness

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-10-22 |
| **Decision Makers** | Project Owner |
| **Related** | [Document Lifecycle](../../Governance/Document_Lifecycle.md), [Document Metadata Standard](../../Governance/Document_Metadata_Standard.md), [ADR Approval Workflow](ADR_Approval_Workflow.md), [ADR-0001](ADR-0001-Domain-Profiles.md), [ADR-0005](ADR-0005-Project-Classification-and-Capabilities.md), [ADR-0010](ADR-0010-Manual-Verification-Records.md), [ADR-0012](ADR-0012-Logical-Architectural-Domains.md), [EGR-0001](../../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) |

---

# Context

The Engineering Documentation Framework publishes normative specifications under `docs/Specifications/`. Before this decision, EDF distinguished normative intent, publication, specification metadata **Status**, and ADR acceptance, but did not comprehensively define when specification **requirements** are normatively **effective** as binding framework obligations for a defined scope.

The Project Owner approved policy direction **P2 — Explicit, Traceable Normative Approval** and decisions **DEC-NEP-01** through **DEC-NEP-08** on 2026-10-22. Phase A2 clarified independent authority dimensions in [Document Lifecycle](../../Governance/Document_Lifecycle.md) without establishing a full effectiveness model.

P2 must remain independent of any specific engineering agent, AI tool, or adopting product (for example ProjectConcord).

---

# Decision

## 1. Adopt P2 (DEC-NEP-01)

EDF adopts **P2**: a normative framework specification revision becomes **normatively effective** only through an authorized, traceable **normative approval record** for the **exact** specification revision (immutable **Approved Git Revision**) and **effective scope**, subject to applicable activation conditions.

Seven dimensions MUST remain independent: specification identity and revision; specification status; normative intent; governed approval evidence; effective scope and activation; publication; adopter applicability.

## 2. Approval authority (DEC-NEP-02)

Normative approval authority belongs to the **Project Owner** or an authority **explicitly delegated** and named in the approval record. Authority MUST NOT be inferred from authorship, repository permissions, or engineering agent roles.

## 3. Approval instruments (DEC-NEP-03)

An **Accepted ADR** is the preferred normative approval instrument for framework specifications. Another instrument may qualify only when EDF governance **expressly authorizes** it. Ordinary project **EGR** records are not automatic framework normative approval instruments (DEC-NEP-06).

## 4. Immutable revision identity (PA-COR-01)

The initial supported immutable revision identifier is **Approved Git Revision** — a full Git commit SHA together with Specification ID, Version, and canonical specification path. Content-digest approval is **not** operational in this tranche.

## 5. Approval sequence (PA-COR-02)

Use the freeze-commit sequence documented in [Document Lifecycle — Framework normative specifications](../../Governance/Document_Lifecycle.md#immutable-revision-approval-sequence): candidate freeze commit → capture SHA → normative approval record → publish traceability metadata → verify content matches freeze revision.

## 6. Specification metadata pointer (PA-COR-03)

For new normative approvals governed by P2, the specification MUST contain a resolvable **Normative Approval Reference** to the canonical approval record.

## 7. Transition (DEC-NEP-04, DEC-NEP-05, DEC-NEP-08)

Apply P2 **prospectively** from the **policy effective date** recorded below when this ADR is **Accepted**. Preserve legitimate historical approvals; do not invent or backdate evidence. Preserve existing specification **Status** values; do not bulk-promote specifications. **ADR-0010** does not automatically prove approval of exact **MVR-0001** v1.1 normative text without a revision-specific normative approval record.

## 8. No emergency normative-approval mechanism (DEC-NEP-07)

This decision does not introduce a new emergency or provisional framework normative-approval mechanism.

## 9. Canonical normative policy location

The normative policy text lives in [Document Lifecycle — Framework normative specifications](../../Governance/Document_Lifecycle.md#framework-normative-specifications). Supporting documents link to that section; they do not duplicate the full policy.

## 10. Policy effective date

**Pending acceptance.** When this ADR is **Accepted**, the **policy effective date** is the **Date** field on this ADR at acceptance (ISO date), unless the Decision explicitly states a later effective date. Until this ADR is **Accepted**, P2 requirements in Document Lifecycle are policy text **pending formal effectiveness**; repository publication alone does not activate P2.

This ADR does **not** approve any framework specification revision by itself. Acceptance establishes the **policy** only.

---

# Alternatives Considered

### P1 — Publication on default branch as effectiveness

- **Advantages:** Simple; matches informal practice.
- **Disadvantages:** Conflates publication with approval; weak audit trail.
- **Reason not selected:** Rejected by Project Owner (DEC-NEP-01).

### P3 — Specification Status alone (for example Accepted) as effectiveness

- **Advantages:** Single metadata field.
- **Disadvantages:** Conflates disposition with approval; cannot pin exact content revision.
- **Reason not selected:** Rejected; DEC-NEP-08 preserves Status without making it sole proof.

### P4 — Implicit approval through operational use

- **Advantages:** No migration burden.
- **Disadvantages:** Untraceable; incompatible with governed engineering evidence.
- **Reason not selected:** Rejected by Project Owner.

### Content-digest (SHA-256) as primary revision identity

- **Advantages:** Avoids some Git sequencing concerns.
- **Disadvantages:** Requires governed canonicalization and verification tooling not yet defined.
- **Reason not selected:** Deferred (PA-COR-01); Git SHA is initial mechanism.

---

# Consequences

### Positive

- Clear, auditable normative effectiveness model for framework specifications.
- Aligns ADR acceptance with explicit specification revision pins.
- Supports future EPI normative workflow specifications without coupling to a specific tool.

### Negative / costs

- Additional metadata and freeze-commit discipline for new normative approvals.
- Evidence review tranches required for historical specifications (separate authorized work).
- Policy remains **pending** until this ADR is **Accepted**.

### Follow-up (not in this ADR acceptance)

- Per-specification evidence review and prospective approvals (EGR, MVR, GMFP, AAR, TGR families).
- Optional future content-digest mechanism after governed procedures exist.
- Framework Advisor checks documented in [Analyzer Compliance](../../Governance/Analyzer_Compliance.md) remain future work.

---

# Parent

- [Architecture Decision Records](README.md)

## Related Documents

- [ARCHITECTURE_DECISIONS.md](../../../ARCHITECTURE_DECISIONS.md)
- [Specifications README](../../Specifications/README.md)
