# ADR-0012: Logical Architectural Domains

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0012 Logical Architectural Domains

| | |
|---|---|
| **Status** | Accepted |
| **Date** | 2026-10-22 |
| **Decision Makers** | Project Owner (explicit authorization, 2026-10-22) |
| **Related** | [Documentation Information Architecture](../Documentation_Information_Architecture.md), [Logical Domain Classification Index](../Logical_Domain_Classification_Index.md), [Document Metadata Standard](../../Governance/Document_Metadata_Standard.md), [ADR-0001](ADR-0001-Domain-Profiles.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

The Engineering Documentation Framework (EDF) governs documented, governed engineering practices across documentation structure, engineering governance, assurance and evidence, and governed engineering practice and interaction. EDF already defines physical **documentation domains** in [Documentation Information Architecture](../Documentation_Information_Architecture.md) (folder placement and navigation), **EDF Core** versus optional **Domain Profiles** and capabilities ([ADR-0001](ADR-0001-Domain-Profiles.md), [ADR-0005](ADR-0005-Project-Classification-and-Capabilities.md)), and multiple normative artifact families (for example EGR, MVR, GMFP).

There was no single registry of **logical architectural responsibility** — which subject matter owns requirements for documentation architecture, governance, assurance, and engineering practice — distinct from physical placement and distinct from discipline-specific profiles.

The Project Owner approved a four-domain logical model and a domain-classification approach (DEC-A-DOMAIN-CLASSIFICATION) on 2026-10-22, with explicit authorization to implement scope clarification, the registry, a central classification index, metadata conventions, and safe authority vocabulary clarification without directory reorganization.

---

# Decision

## 1. Adopt four logical architectural domains

EDF maintains four logical architectural domains for **responsibility and subject-matter ownership** within the framework:

| ID | Name |
|---|---|
| **DA** | Documentation Architecture |
| **EG** | Engineering Governance |
| **AE** | Assurance and Evidence |
| **EPI** | Engineering Practice and Interaction |

These identifiers are not engineering disciplines, Domain Profiles, capability IDs, repository folders, or separate normative authorities.

## 2. Authoritative registry

The canonical registry of definitions, exclusions, and relationships lives in [Documentation Information Architecture](../Documentation_Information_Architecture.md) under **Logical Architectural Domains**.

## 3. DEC-A-DOMAIN-CLASSIFICATION

EDF shall maintain the logical domain registry in the Information Architecture. Applicable normative and authoritative documents shall support explicit **Primary Logical Domain** classification with optional **Related Logical Domains**, per [Document Metadata Standard](../../Governance/Document_Metadata_Standard.md).

Physical placement remains governed by **Documentation Domains** in the same document. During migration, authoritative classification for documents without domain metadata is recorded in the [Logical Domain Classification Index](../Logical_Domain_Classification_Index.md).

**Logical domain classification does not establish normative authority, approval status, specification maturity, adoption, or document lifecycle state.**

## 4. Identifier disambiguation

Logical domain **EG** (Engineering Governance) is not the same artifact type as an **Engineering Gate Review Record (EGR)**.

---

# Alternatives Considered

### Separate normative specification for domains

- **Advantages:** Standalone spec ID.
- **Disadvantages:** Duplicates Information Architecture; confuses physical and logical domains.
- **Reason not selected:** Registry belongs in DIA; future EPI requirements remain in `docs/Specifications/` when authorized.

### Six or more logical domains

- **Advantages:** Finer separation (for example interaction vs process).
- **Disadvantages:** Higher maintenance; overlap with existing artifact types.
- **Reason not selected:** Project Owner approved four domains.

### Directory per logical domain

- **Advantages:** Visible folder alignment.
- **Disadvantages:** Breaks existing DIA; conflates placement with responsibility.
- **Reason not selected:** Explicitly prohibited by approved architecture.

---

# Consequences

## Positive

- Clear separation of logical responsibility, physical placement, Core/Profile extensions, and normative authority.
- Central classification index supports migration without bulk metadata edits.
- Foundation for Phase B Domain 4 (EPI) normative specifications.

## Negative

- Authors must learn logical domain IDs alongside documentation domains.
- Index and metadata must be kept consistent under reconciliation rules.

## Risks

- **Conflation with approval** — Mitigated by metadata standard and Document Lifecycle clarification.
- **EG vs EGR confusion** — Mitigated by registry note and glossary follow-up when authorized.

---

# Implementation Notes

- Phase A1 implementation: DIA section, classification index, metadata standard, navigation, [ADR-0012](ADR-0012-Logical-Architectural-Domains.md) (this record).
- No bulk metadata migration; no specification status promotions in this tranche.
- Framework Advisor logical-domain checks remain future work per [Analyzer Compliance](../../Governance/Analyzer_Compliance.md).
