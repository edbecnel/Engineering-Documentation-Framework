# Document Lifecycle

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Document Lifecycle

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** Governed documentation
> **Last Reviewed:** 2026-07-10

## Applicability

This document defines baseline governance that applies to:

- the Engineering Documentation Framework repository
- projects that adopt the Engineering Documentation Framework

EDF itself follows this baseline governance and also follows the additional
framework-specific requirements in [EDF Governance](EDF_Governance.md).

## Purpose

This document defines the lifecycle states used to manage engineering documentation.

## Lifecycle States

### Draft

The document is incomplete, provisional, or actively being authored.

Draft documents:

- may contain unresolved questions
- are not authoritative
- should not be relied upon for production decisions

### In Review

The document is ready for substantive review.

Review should confirm:

- factual accuracy
- architectural consistency
- link integrity
- ownership
- scope
- approval requirements

### Approved

The document has received the required approval and may be treated as authoritative.

Approval does not mean the document is permanently complete.

### Maintained

The document is approved, actively used, and subject to ongoing review.

Canonical documents should normally be in the Maintained state.

### Deprecated

The document should no longer guide new work but remains available for transition,
history, or compatibility.

Deprecated documents must identify:

- the reason for deprecation
- the replacement document, when one exists
- the effective date

### Archived

The document is retained for historical or compliance purposes and is removed from
normal project navigation.

Archived documents must not be treated as current guidance.

## Allowed Transitions

```text
Draft → In Review
In Review → Draft
In Review → Approved
Approved → Maintained
Maintained → In Review
Maintained → Deprecated
Deprecated → Maintained
Deprecated → Archived
```

Direct transitions may be used for low-risk documentation when governance policy permits.

## Canonical Document Rule

A document must not be marked authoritative while its status is Draft or Archived.

## Framework specification metadata

Normative framework specifications under `docs/Specifications/` (for example EGR-0001, MVR-0001) often use a **specification metadata** table that may include:

- **Normative** — whether the document contains adoptable requirements.
- **Authoritative** — whether this document is the canonical source for those requirements within EDF.
- **Status** — values such as `Proposed` or `Accepted` in the specification metadata table.

Existing EDF framework specifications use metadata-table **Status** values such as `Proposed` and `Accepted`. These values appear to describe specification maturity or acceptance, but their precise governance semantics and relationship to governed document lifecycle **Status** (`Draft`, `Approved`, `Maintained`, and so on) in [Document Metadata Standard](Document_Metadata_Standard.md) and to [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md) are **not yet comprehensively defined** by EDF policy. Until that relationship is formally established, these values must **not** independently be treated as proof of normative effectiveness.

The following dimensions are **independent** and must not be conflated:

1. **Normative intent** — the document states requirements intended to govern behavior.
2. **Specification maturity** — the specification metadata table **Status** field, where present (observed convention; formal semantics pending).
3. **Approval authority** — human or governance decisions recorded per applicable workflow (for example ADR acceptance, program gates per [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)).
4. **Publication** — the document revision is present in the version-controlled repository.
5. **Adoption** — an adopting project has selected an optional capability or specification where applicability is optional (for example [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)).
6. **Effective authority** — whether requirements are binding in context under applicable governance.

Clarifications:

- A normative designation identifies requirement **intent**; it does not by itself prove effectiveness.
- Publication to the default branch does not independently establish approval.
- Navigation references do not independently establish approval.
- Specification metadata and ADR **Status** use different vocabularies.
- An **Accepted** ADR does not automatically approve every linked specification revision without explicit governed action on that specification.

When dimensions appear inconsistent, resolve through explicit governance action. Do not infer approval from repository presence alone.

## Deprecation Rule

A deprecated authoritative document should identify a replacement or explicitly state
that no replacement exists.

## Archive Rule

Archiving must not delete project history. Moving files may be performed only through
an explicit human-approved change.

## Parent

- [Governance](README.md)

## Related Documents

- [Governance Overview](Governance_Overview.md)
- [Document Metadata Standard](Document_Metadata_Standard.md)
- [Ownership and Review](Ownership_and_Review.md)
- [Documentation Change Management](Change_Management.md)
