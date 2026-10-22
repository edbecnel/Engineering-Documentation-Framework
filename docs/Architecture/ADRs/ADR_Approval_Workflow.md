# ADR Approval Workflow

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR Approval Workflow

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** Architecture Decision Records in EDF and adopting projects
> **Last Reviewed:** 2026-10-22
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document describes how to **propose**, **review**, and **approve** Architecture Decision Records (ADRs) in repositories that follow the Engineering Documentation Framework.

EDF does not use a separate “Architectural Design Proposal” artifact. Exploration may begin as an [Architectural Watch Item (AWI)](../Watch_Items/README.md) or as an ADR in **Proposed** status. Approval is recorded by updating the ADR and keeping decision indexes consistent.

## Audience

- Framework maintainers and architecture owners
- Contributors drafting or reviewing ADRs
- AI-assisted workflows executing [edf.adr.create.v1.yaml](../../../interaction/specs/edf.adr.create.v1.yaml)

## ADR status model

Individual ADRs use the **Status** field defined in [ADR_Template.md](../../Templates/ADR_Template.md):

| Status | Meaning |
|---|---|
| **Proposed** | Decision is documented for review; not yet authoritative for implementation |
| **Accepted** | Decision is approved and authoritative |
| **Superseded** | Replaced by a newer ADR; retained for history |
| **Deprecated** | No longer recommended; retained for transition |
| **Rejected** | Alternative was chosen; record kept for context |

**Proposed** and **Accepted** are the normal path for new decisions.

Governed documents may also use lifecycle states in [Document Lifecycle](../../Governance/Document_Lifecycle.md) (Draft, In Review, Approved, and so on). Numbered ADRs primarily use the ADR **Status** field in their metadata table; you do not need a duplicate lifecycle block unless project policy requires it.

## Roles and authority

| Role | Responsibility |
|---|---|
| **Decision Makers** | Named in the ADR metadata; accountable for approving or rejecting the decision |
| **Document owner / maintainer** | Ensures indexes, cross-references, and related AWIs stay accurate after status changes |
| **Contributors** | Draft Proposed ADRs; do not set **Accepted** without decision-maker approval |

Human approval is final. Automated tools may draft ADRs or recommend status changes but must not mark an ADR **Accepted** without explicit human direction. See [Change Management](../../Governance/Change_Management.md) and [EDF Governance](../../Governance/EDF_Governance.md).

## Paths into a Proposed ADR

### Direct ADR

1. Copy [ADR_Template.md](../../Templates/ADR_Template.md).
2. Create `docs/Architecture/ADRs/ADR-NNNN-Short-Title.md`.
3. Set **Status** to **Proposed** and complete required sections.
4. Add index entries (see [Creating and indexing](#creating-and-indexing-a-proposed-adr)).

### From an Architectural Watch Item

When an [AWI](../Watch_Items/README.md) is ready for a binding decision:

1. Satisfy the watch item’s promotion criteria (maintainer approval).
2. Draft one or more **Proposed** ADRs capturing the decision.
3. Update the AWI **Status** to **Promoted** and link **Related ADRs**.
4. Follow the approval checklist when accepting the new ADR(s).

Promotion path: **AWI → Proposed ADR(s) → Accepted ADR(s)**.

## Creating and indexing a Proposed ADR

When introducing a new numbered ADR:

1. **Draft the ADR** using the template (Context, Decision, Alternatives Considered, Consequences, and other required sections).
2. **Metadata table** at the top of the ADR: **Status** = Proposed, **Date**, **Decision Makers**, **Related** links.
3. **Update indexes** so status is discoverable:
   - [docs/Architecture/ADRs/README.md](README.md)
   - [ARCHITECTURE_DECISIONS.md](../../../ARCHITECTURE_DECISIONS.md)
   - [docs/Architecture/README.md](../README.md) (summary table)
4. **Commit** the ADR and index updates together when practical.

For AI-assisted creation, follow phases in [edf.adr.create.v1.yaml](../../../interaction/specs/edf.adr.create.v1.yaml) through **update_index**; approval is the separate **review_and_accept** phase below.

## Review before approval

Before accepting an ADR, reviewers should confirm:

- Required template sections are complete and accurate.
- The **Decision** is stated clearly; **Alternatives Considered** and **Consequences** are substantive.
- The decision does not conflict with **Accepted** ADRs unless **Supersedes** is documented.
- Cross-references from specifications, playbooks, and architecture docs are identified for follow-up after acceptance.
- Navigation and links resolve (including the three ADR indexes).

Record substantive review in project practice (PR discussion, issue, or review notes). Optional metadata fields **Approver** and **Approved On** from [Document Metadata Standard](../../Governance/Document_Metadata_Standard.md) may be used when helpful.

## Approval checklist (Proposed → Accepted)

When review is complete and decision makers approve:

1. **ADR file** — Set **Status** to **Accepted**. Update **Date** to the acceptance date if that date represents the decision. Confirm **Decision Makers** and **Related** / **Supersedes** fields.
2. **Superseded ADRs** — If this ADR replaces another, set **Supersedes** on the new ADR and **Superseded By** / **Status** = Superseded on the old ADR.
3. **Indexes** — Change **Status** to Accepted in:
   - [docs/Architecture/ADRs/README.md](README.md)
   - [ARCHITECTURE_DECISIONS.md](../../../ARCHITECTURE_DECISIONS.md)
   - [docs/Architecture/README.md](../README.md)
4. **Downstream docs** — Update specifications, bootstrap playbooks, and other references that treated the decision as pending.
5. **Watch items** — Mark related AWIs **Promoted** when applicable.
6. **Changelog** — Add an entry to [CHANGELOG.md](../../../CHANGELOG.md) when acceptance is release-significant for the framework.
7. **Version control** — Commit ADR, index, and related updates in one logical change when practical.

EDF does not require a specific pull-request template for ADR approval. Projects may use PR review as the approval record.

## Normative specification approval (framework)

When an **Accepted** ADR approves normative content of an EDF framework specification under [Document Lifecycle — Framework normative specifications](../../Governance/Document_Lifecycle.md#framework-normative-specifications), the approval MUST be explicit and MUST distinguish **architectural direction** from **approval of a particular specification revision**.

Include a named subsection (for example `## Normative specification approval`) in the ADR **Decision** when the ADR is the normative approval instrument. That subsection MUST identify:

1. Specification ID
2. Specification Version
3. Canonical specification path (repository path to the specification file)
4. **Approved Git Revision** — full commit SHA of the candidate freeze revision containing the approved content (not a later commit unless only non-normative metadata changed and the SHA still pins normative content)
5. Approving authority (Project Owner or explicitly delegated role named in the record)
6. Explicit approval decision for the stated scope
7. Approval date (ISO date)
8. Effective scope
9. Effective date or activation condition

Follow the immutable revision sequence in Document Lifecycle: freeze commit → capture SHA → accept ADR citing that SHA → publish specification metadata (**Normative Approval Reference**, **Approved Git Revision**, effective scope and date) without changing approved normative requirement text.

An **Accepted** ADR does **not** automatically approve subsequent edits to a linked specification. Material changes require a new freeze SHA and new normative approval.

Accepting an ADR that approves a specification does not by itself update the specification metadata table; update the specification in the same governed change set when practical per the approval checklist below.

When accepting such an ADR, extend the approval checklist with:

- Verify **Approved Git Revision** exists in repository history and matches approved content at the canonical path.
- Verify the specification contains a resolvable **Normative Approval Reference** to this ADR (or follow-up commit scheduled in the same PR).
- Do not treat specification **Status: Accepted** as a substitute for normative approval metadata.

## Other status transitions

| Transition | When | Actions |
|---|---|---|
| **Proposed → Rejected** | Decision not adopted | Set ADR **Status** to Rejected; update indexes; note outcome in **Consequences** or a short closing note if needed |
| **Accepted → Superseded** | New ADR replaces this one | New ADR **Accepted** with **Supersedes**; old ADR **Superseded**; update all indexes |
| **Accepted → Deprecated** | Direction abandoned without a single replacement | Set **Deprecated**; document replacement guidance or migration in the ADR |

## What acceptance implies

An **Accepted** ADR is **authoritative** for architectural direction in scope. Implementation, bootstrap behavior, and conformance guidance should align with Accepted ADRs unless a documented exception applies ([Analyzer Compliance](../../Governance/Analyzer_Compliance.md)).

A **Proposed** ADR is useful for discussion and planning but must not be treated as settled architecture.

## Adopting projects

Projects that adopt EDF should place ADRs under `docs/Architecture/ADRs/` and follow this workflow unless project charter or governance defines stricter rules. Project-specific decision indexes may mirror `ARCHITECTURE_DECISIONS.md` at the repository root.

## Parent

- [Architecture Decision Records](README.md)

## Related Documents

- [ADR Template](../../Templates/ADR_Template.md)
- [Architecture Decision Records index](README.md)
- [ARCHITECTURE_DECISIONS.md](../../../ARCHITECTURE_DECISIONS.md)
- [Architectural Watch Items](../Watch_Items/README.md)
- [Documentation Change Management](../../Governance/Change_Management.md)
- [Document Lifecycle](../../Governance/Document_Lifecycle.md)
- [edf.adr.create.v1.yaml](../../../interaction/specs/edf.adr.create.v1.yaml)
