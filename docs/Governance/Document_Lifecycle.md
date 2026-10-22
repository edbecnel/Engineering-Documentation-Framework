# Document Lifecycle

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Document Lifecycle

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** Governed documentation
> **Last Reviewed:** 2026-10-22

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

## Framework normative specifications

Normative framework specifications live under `docs/Specifications/` and are identified by a **Specification ID** (for example `EGR-0001`) and canonical repository path. This section is the **canonical** EDF policy for how their requirements become **normatively effective** (P2 — explicit, traceable normative approval). Logical domain: primarily Engineering Governance (EG). See [Logical Domain Classification Index](../Architecture/Logical_Domain_Classification_Index.md).

Architectural direction and decision record: [ADR-0013](../Architecture/ADRs/ADR-0013-Framework-Normative-Specification-Effectiveness.md) (Project Owner decisions DEC-NEP-01 through DEC-NEP-08).

### Policy formal effectiveness

The requirements in this section bind **new normative approvals** from the **policy effective date** established when [ADR-0013](../Architecture/ADRs/ADR-0013-Framework-Normative-Specification-Effectiveness.md) is **Accepted** and records that date in its Decision.

Until ADR-0013 is **Accepted**, this section is authoritative policy text **pending formal effectiveness**. Publication of this policy wording does not by itself establish that the P2 rules are already in force. A [CHANGELOG.md](../../CHANGELOG.md) entry may record the change but does not independently authorize effectiveness.

### Normative intent

When specification metadata declares **Normative: Yes**, the document **contains adoptable requirements** intended to govern behavior. **Normative: Yes** does not mean the requirements are already approved or normatively effective.

**Authoritative: Yes** means this file is the canonical source for those requirements within EDF. It does not alone establish normative effectiveness.

### Specification identity

Each framework specification MUST declare:

- **Specification ID** — stable identifier (`EGR-0001`, `MVR-0001`, …).
- **Version** — revision label for the specification family (for example `1.1`).
- **Canonical path** — repository path to this file (update on governed rename; approval records MUST use Specification ID and Version as primary keys).

**Immutable approved revision:** Normative effectiveness applies to an exact approved content revision, recorded as **Approved Git Revision** — a full Git commit SHA (40-character hex) together with Specification ID, Version, and canonical path. The commit MUST be retrievable through preserved repository history and MUST contain the approved specification content at that path.

Specification ID and Version alone are insufficient if normative content has changed without a matching new approval.

Content-digest approval is **not** an operational mechanism in this policy tranche.

### Specification status

The specification metadata table **Status** field records disposition using **existing EDF values** (currently `Proposed` and `Accepted`). Status indicates governance disposition of the specification artifact. It is **not** the sole proof of normative effectiveness.

**Status: Accepted** MUST NOT be interpreted as normative effectiveness without a valid normative approval record for the approved revision identity.

EDF does not expand specification Status vocabulary in this policy tranche. Withdrawal, supersession, or additional disposition values require separate governed action.

### Independent dimensions

The following MUST NOT be conflated:

1. **Specification identity and revision** — Specification ID, Version, canonical path, Approved Git Revision.
2. **Specification status** — metadata-table `Proposed` / `Accepted` (distinct from governed document lifecycle Status in [Document Metadata Standard](Document_Metadata_Standard.md)).
3. **Normative intent** — `Normative: Yes`.
4. **Governed approval evidence** — normative approval record (see below).
5. **Effective scope and activation** — where and when approved requirements apply.
6. **Publication** — presence in version control (including the default branch).
7. **Adopter applicability** — whether an adopting project has activated an optional capability, profile, or local policy.

Clarifications:

- Publication to the default branch does not independently establish normative approval or effectiveness.
- Navigation references and operational use do not independently establish approval.
- Specification metadata **Status** and ADR **Status** use different vocabularies.
- An **Accepted** ADR that establishes architectural direction does not automatically approve every linked specification revision without explicit normative specification approval per [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md).

### Normative approval record and authority

A specification revision is **normatively effective** for a declared **effective scope** only when a **normative approval record** exists that includes all of the following (or references them in a canonical record without ambiguity):

| Element | Requirement |
|---------|-------------|
| Approved specification | Specification ID, Version, and canonical path |
| Approved revision identity | Approved Git Revision (full commit SHA) |
| Approving authority | Project Owner or explicitly delegated role **named in the record** |
| Approval decision | Explicit acceptance of the identified revision for the stated scope |
| Approval date | ISO date |
| Effective scope | For example `EDF framework self-hosting`, `EDF optional capability GMFP`, or scope defined in the specification |
| Effective date or activation | Date or documented condition when effectiveness begins |
| Limitations | Optional; conditions or exclusions |

Approval authority MUST NOT be inferred from document authorship, repository permissions, AI agent roles, or engineering tool identities.

For normative approvals governed by this policy (on or after the policy effective date), the specification MUST contain a resolvable **Normative Approval Reference** (relative link) to the canonical approval record. The approval record remains the source of approval authority; specification metadata is a traceable pointer, not a substitute for approval.

Historical specifications without this field remain subject to non-retroactive transition (see below).

**Publication**, navigation, operational use, or **Status: Accepted** without a valid normative approval record for the current normative content **does not** establish normative effectiveness.

### Permitted approval instruments

**Primary instrument:** An **Accepted** Architecture Decision Record ([ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md)) whose Decision (or a named subsection, for example `## Normative specification approval`) identifies the items in the table above.

**Other instruments:** No approval record type other than an Accepted ADR is valid for **EDF framework normative specifications** unless this section is amended by an **Accepted ADR** or canonical governance policy update that **expressly names** the additional instrument and its conditions.

An **Engineering Gate Review Record (EGR)** under [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) is **not** a framework normative approval instrument unless EDF governance has **expressly authorized** that EGR for that purpose and the EGR record shows per-document approval of the identified specification revision and scope. Routine project-level EGR instances do not automatically approve framework specifications.

No emergency or provisional normative-approval mechanism is introduced in this policy tranche. Existing [Documentation Change Management](Change_Management.md) emergency documentation rules remain in force for urgent corrections; they do not substitute for framework normative specification approval.

### Effective authority and applicability

| Layer | Meaning |
|-------|---------|
| **Framework approval** | Normative approval record exists for the revision and effective scope |
| **EDF Core and profiles** | Whether requirements apply to a repository or project is determined by [ADR-0001](../Architecture/ADRs/ADR-0001-Domain-Profiles.md), [ADR-0005](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md), Domain Profiles, capability adoption, and each specification's **Scope** — not by framework publication alone |
| **Optional capability** | Framework approval may exist while project **activation** is separate (for example [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)) |
| **Adopter applicability** | Adopting projects document activation or local policy before optional conformance obligations apply |
| **Project governance** | Project charters, gates, and policies may add obligations; they do not replace framework normative approval |

Framework normative approval and project adoption remain distinct.

### Immutable revision approval sequence

To approve a specification revision without circular commit references:

1. Prepare the specification's final normative content.
2. Commit that content to a **candidate freeze revision** (branch or commit; need not be on `main` before approval).
3. Capture **Approved Git Revision** = full SHA of the freeze commit; confirm Specification ID, Version, and canonical path.
4. Review and approve through an authorized normative approval record (typically an Accepted ADR).
5. Publish approval metadata and governance records per [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md) (for example specification **Normative Approval Reference**, **Approved Git Revision**, effective scope and date).
6. Verify that normative content at the approved path matches the content at **Approved Git Revision**.

The approval record MUST cite the freeze commit SHA, not a later commit that first introduces the approval record, unless a later commit changes **only** non-normative metadata and the approved SHA still identifies the normative content.

### Material and editorial revisions

**Material revision** — any change with substantive effect on approved requirements, including requirement meaning, conformance obligations, mandatory procedures, or normative references. Requires new **Approved Git Revision** and new normative approval record.

**Editorial revision** — a change that does **not** substantively alter approved requirements (for example clarifying non-normative examples, fixing typos that do not change obligation, navigation or index updates). Does not require new normative approval when **Approved Git Revision** for normative content is unchanged.

Classification MUST NOT rely solely on document section headings. An editorial change MUST NOT silently expand or alter approved requirements.

### Non-retroactive transition

From the **policy effective date** (when ADR-0013 is Accepted):

- **Prospective:** Normative approvals and material revisions MUST comply with this section.
- **Existing specifications:** Subject to **evidence review**; legitimately established approvals remain valid; missing metadata MUST NOT alone invalidate them.
- **Prohibited:** Manufacturing, backdating, or silently inferring historical approval records. Historical ambiguity remains unresolved until evidence review or prospective approval.

For example, [ADR-0010](../Architecture/ADRs/ADR-0010-Manual-Verification-Records.md) Accepted status provides architectural approval evidence for Manual Verification Records; it does not automatically prove approval of the exact [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md) version 1.1 normative text without a normative approval record that pins that revision.

### Evidence preservation

Approval evidence remains traceable through:

- **Approved Git Revision** and **Normative Approval Reference** in specification metadata and the approval record.
- ADR indexes and release-significant [CHANGELOG.md](../../CHANGELOG.md) entries when applicable.
- Git history.

Repository maintenance (moves, renames) MUST update canonical paths and links in the same governed change; approval records remain valid when Specification ID, Version, and **Approved Git Revision** are unchanged. ADR amendment does not retroactively alter prior approval without a new approval decision.

This tranche does not introduce a full withdrawal or supersession workflow for specifications.

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
