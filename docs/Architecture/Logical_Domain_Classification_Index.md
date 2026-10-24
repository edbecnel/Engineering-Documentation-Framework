# Logical Domain Classification Index

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Architecture](README.md) › Logical Domain Classification Index

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF self-hosting logical domain classification
> **Last Reviewed:** 2026-10-22
> **Review Frequency:** On Change
> **Authoritative:** Yes (classification only — not normative requirements)

## Purpose

This index records the **primary** and **related** logical architectural domains for authoritative EDF documents during migration and ongoing maintenance.

Logical domain classification identifies subject-matter ownership per [Documentation Information Architecture — Logical Architectural Domains](Documentation_Information_Architecture.md#logical-architectural-domains). It does **not** establish normative authority, approval status, specification maturity, adoption, or document lifecycle state.

Registry identifiers: **DA**, **EG**, **AE**, **EPI**.

## Relationship to the DIA registry

Definitions, exclusions, and dependencies are normatively described in [Documentation Information Architecture](Documentation_Information_Architecture.md). This index applies those definitions to concrete document paths.

## Classification conventions

| Column | Meaning |
|---|---|
| **Primary** | Exactly one logical domain ID — primary architectural responsibility |
| **Related** | Optional cross-cutting domains (comma-separated IDs) |

When a document later adds **Primary Logical Domain** / **Related Logical Domains** metadata per [Document Metadata Standard](../Governance/Document_Metadata_Standard.md), that metadata and this index **must agree**.

## Reconciliation rules

### During migration

When a document does **not** yet contain domain metadata, this index provides its authoritative logical classification for EDF self-hosting.

### After metadata adoption

Document metadata and this index **must agree**.

### When a discrepancy exists

1. Treat the situation as an explicit **classification conflict** — do not silently prefer one source.
2. Require a **governed correction** by the responsible document owner or declared architecture authority.
3. Preserve the last **approved** classification in both places until resolution, where it can be established.
4. If no reliable approved classification exists, report the classification as **unresolved**.
5. Record the resolution and update **both** the document metadata and this index in the same governed change.

Automated tooling MUST NOT silently overwrite the index or document metadata. A future Framework Advisor MAY report discrepancies; it MUST NOT resolve architectural ownership.

### New authoritative documents

Applicable new authoritative documents MUST declare primary logical domain metadata and receive an index row in the **same** governed change.

## Maintenance responsibilities

The Engineering Documentation Framework maintainers update this index when:

- new authoritative documents are added to the scoped classes below;
- governed revisions change a document's logical domain classification;
- document metadata is added or corrected.

## Normative framework specifications

| Document path | Primary | Related |
|---|---|---|
| `docs/Specifications/EGR-0001-Engineering-Gate-Review-Records.md` | EG | AE |
| `docs/Specifications/MVR-0001-Manual-Verification-Records.md` | AE | EG, EPI |
| `docs/Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md` | EG | EPI, AE |
| `docs/Specifications/AAR-0001-Architectural-Audit-Records.md` | AE | EG |
| `docs/Specifications/TGR-0001-Terminology-Governance.md` | EG | DA |
| `docs/Specifications/DVW-0001-Disposable-Verification-Workspaces.md` | AE | EPI |
| `docs/Specifications/HND-0001-AI-Session-Handover-Messages.md` | EPI | DA, EG |
| `docs/Specifications/README.md` | DA | EG |

## Canonical governance policies

| Document path | Primary | Related |
|---|---|---|
| `docs/Governance/Governance_Overview.md` | EG | DA |
| `docs/Governance/Change_Management.md` | EG | DA |
| `docs/Governance/Document_Metadata_Standard.md` | DA | EG |
| `docs/Governance/Document_Lifecycle.md` | DA | EG |
| `docs/Governance/Ownership_and_Review.md` | DA | EG |
| `docs/Governance/Analyzer_Compliance.md` | DA | EG |
| `docs/Governance/EDF_Governance.md` | EG | DA |
| `docs/Governance/Framework_Self_Hosting.md` | DA | EG |
| `docs/Governance/Governance_Checklist.md` | EG | DA |
| `docs/Governance/README.md` | DA | EG |

## Architecture and authoritative practice policies

| Document path | Primary | Related |
|---|---|---|
| `docs/Architecture/Documentation_Information_Architecture.md` | DA | EG |
| `docs/Architecture/General_Engineering_Project_Model.md` | DA | EPI |
| `docs/Architecture/Framework_Generation_Principles.md` | DA | EG |
| `docs/Architecture/CRA_CKES_EDF_Boundaries.md` | DA | EG |
| `docs/Architecture/README.md` | DA | EG |
| `docs/Architecture/ADRs/ADR_Approval_Workflow.md` | EG | DA |
| `docs/Development/Engineering_Development_Policy.md` | EPI | EG, DA |
| `docs/Development/Documentation_First_Development_Policy.md` | EPI | EG |
| `docs/Development/EDF_Development_Workflow.md` | DA | EG |

## Authoritative AI handbook documents

| Document path | Primary | Related |
|---|---|---|
| `docs/AI/Repository_Workflow.md` | EPI | DA, EG |
| `docs/AI/EDF_AI_Bootstrap_Entry.md` | EPI | DA |
| `docs/AI/Universal_Bootstrap_Specification.md` | EPI | DA, EG |
| `docs/AI/Bootstrap_Playbook.md` | EPI | DA |
| `docs/AI/Migration_Playbook.md` | EPI | DA |
| `docs/AI/ASR_Bootstrap_Playbook.md` | EPI | DA |
| `docs/AI/Capability_Contribution_Playbook.md` | EPI | DA |
| `docs/AI/Governance_Header_Prompt.md` | DA | EPI |

## Templates (authoritative structure)

| Document path | Primary | Related |
|---|---|---|
| `docs/Templates/Handover_Template.md` | EPI | DA |
| `docs/Templates/AI_Handover_Message_Template.md` | EPI | DA |

## Interaction execution layer (non-normative methodology)

| Document path | Primary | Related | Notes |
|---|---|---|---|
| `interaction/README.md` | — | EPI | Execution binding only; not a normative authority over methodology |

## Architecture Decision Records

| Document path | Primary | Related |
|---|---|---|
| `docs/Architecture/ADRs/ADR-0001-Domain-Profiles.md` | DA | EG |
| `docs/Architecture/ADRs/ADR-0002-Domain-Profile-Specification.md` | DA | EG |
| `docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md` | DA | EPI |
| `docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md` | DA | EPI |
| `docs/Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md` | DA | EG |
| `docs/Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md` | DA | AE |
| `docs/Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md` | EG | AE |
| `docs/Architecture/ADRs/ADR-0008-Architectural-Audit-Records.md` | AE | EG |
| `docs/Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md` | EG | EPI, AE |
| `docs/Architecture/ADRs/ADR-0010-Manual-Verification-Records.md` | AE | EG |
| `docs/Architecture/ADRs/ADR-0011-Terminology-Governance.md` | EG | DA |
| `docs/Architecture/ADRs/ADR-0012-Logical-Architectural-Domains.md` | DA | EG, EPI |
| `docs/Architecture/ADRs/ADR-0014-AI-Session-Handover-Messages.md` | EPI | DA, EG |

## Exempt classes (no index row required)

- Instance records under `docs/Program/Gate_Reviews/`, `docs/Program/Maintenance_Records/`, `docs/Verification/Records/`, `docs/Architecture/Audits/`
- `tasks/`, `reports/`, generated artifacts, routine CHANGELOG entries
- Non-authoritative handbook and development guides unless added by governed decision

## Parent

- [Architecture](README.md)

## Related Documents

- [Documentation Information Architecture](Documentation_Information_Architecture.md)
- [Document Metadata Standard](../Governance/Document_Metadata_Standard.md)
- [ADR-0012 — Logical Architectural Domains](ADRs/ADR-0012-Logical-Architectural-Domains.md)
