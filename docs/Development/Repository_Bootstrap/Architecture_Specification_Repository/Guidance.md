# ASR Guidance

[Home](../../../../README.md) › [Project Index](../../../../PROJECT_INDEX.md) › [Development](../../README.md) › [Repository Bootstrap](../README.md) › [Architecture Specification Repository](README.md) › Guidance

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Architecture Specification Repositories
> **Last Reviewed:** 2026-08-03
> **Authoritative:** Yes

## Purpose

This document provides **ASR-specific interpretation** of EDF Core documentation domains. It does not modify [Documentation Information Architecture](../../../Architecture/Documentation_Information_Architecture.md).

## Domain Interpretations

| EDF domain | Default EDF meaning | ASR interpretation |
|---|---|---|
| `docs/Architecture/` | System and documentation architecture | The architecture being **published**; discovery records, ADRs, watch items, principles, models |
| `docs/Specifications/` | Product or software requirements | **Normative architecture specifications** and conformance requirements |
| `docs/Development/` | EDF adoption engineering | ASR evolution, adoption guidance for external repos, validation methodology |
| `docs/Reference/` | Glossary and terminology | **Controlled vocabulary** for the architecture |
| `docs/Governance/` | Document lifecycle and ownership | **Specification evolution policy** — versioning, deprecation, change authority |
| `PROJECT_CHARTER.md` | Product mission | **Architecture program mission** — scope of the specification authority |

## Historical vs Normative Documents

### Architectural discovery records

Historical architectural discovery records are **non-normative**. They capture origin, motivation, and pre-specification exploration.

**v1 convention (document type, not dedicated subdomain):**

- **Location:** `docs/Architecture/` (or preserved original path documented in bootstrap report)
- **Document type:** Architectural Discovery Record
- **Normative:** No
- **Template:** [Architectural Discovery Record Template](../../../Templates/Architectural_Discovery_Record_Template.md)

Whether discovery records eventually warrant a dedicated subdomain remains open under [AWI-0003](../../../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md).

### Normative architecture specifications

Normative specifications define adoptable architecture, methodology, protocol, or standard behavior.

- **Location:** `docs/Specifications/`
- **Document type:** Architecture Specification
- **Normative:** Yes
- **Template:** [Architecture Specification Template](../../../Templates/Architecture_Specification_Template.md)

### Identifier namespaces

Discovery record identifiers (e.g., `CRA-0000`) and specification identifiers (e.g., `CRA-0001`) use **separate series**. A discovery record is never promoted to a normative specification without an explicit architectural decision.

## CRA Document Placement (Example)

| Document | Recommended location | Normative? |
|---|---|---|
| `CRA-0000` (historical foundation) | `docs/Architecture/CRA-0000.md` or preserved path in bootstrap report | No |
| `CRA-0001` and later | `docs/Specifications/` | Yes |
| CRA ADRs | `docs/Architecture/ADRs/` | Decision records |
| CRA watch items | `docs/Architecture/Watch_Items/` | Non-authoritative until promoted |
| CRA glossary | `docs/Reference/Glossary.md` | Terminology |
| CRA adoption guide | `docs/Development/` | Adopter guidance |
| CRA reference implementation | Separate documented area | Non-canonical |

## Reference Implementations

When present:

- Live outside normative specification domains
- Include a README stating they are **not canonical**
- Software reference implementations may use Software Engineering profile domains only for that area
- Linked from adoption or architecture guidance

## Minimum Bootstrap Structure

Uses EDF Core (`profile: core`) only. No ASR-specific script-created subdirectories in v1.

**Required:** Core directories, identity documents, domain READMEs, discovery records correctly typed, bootstrap status report.

**Recommended early:** Glossary, principles in Architecture, adoption and validation notes in Development.

**Optional:** Reference models, conformance sections, reference implementation, full governance policy set.

**Not applicable:** `docs/API/`, `docs/Database/`, `docs/Deployment/`, `docs/Developer_Handbook/` unless optional reference implementation.

## Parent

- [Architecture Specification Repository](README.md)

## Related Documents

- [Reference Model](Reference_Model.md)
- [Bootstrap Procedure](Bootstrap_Procedure.md)
- [AWI-0003](../../../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md)
