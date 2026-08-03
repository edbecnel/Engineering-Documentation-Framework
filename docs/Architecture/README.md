# Architecture

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Architecture

## Purpose

This domain contains the authoritative architectural description of the project and the framework's documentation information architecture.

## Canonical Documents

- [Documentation Information Architecture](Documentation_Information_Architecture.md)
- [Framework Generation Principles](Framework_Generation_Principles.md)
- [Architecture Decisions](../../ARCHITECTURE_DECISIONS.md)

## Architectural Discovery Records

Historical architectural discovery records capture origin, motivation, and pre-specification exploration. They are **non-normative** and distinct from normative architecture specifications.

| Aspect | Convention |
|---|---|
| **Location** | `docs/Architecture/` (document type; dedicated subdomain remains open under AWI-0003) |
| **Normative** | No |
| **Template** | [Architectural Discovery Record Template](../Templates/Architectural_Discovery_Record_Template.md) |
| **Guidance** | [ASR Guidance](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md) |

Discovery record identifiers (for example, `CRA-0000`) use a **separate series** from normative specification identifiers (for example, `CRA-0001`). A discovery record is never promoted to a normative specification without an explicit architectural decision.

## Architecture Decision Records

Framework ADRs are indexed in [ADRs/README.md](ADRs/README.md) and summarized in [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md).

| ID | Decision | Status |
|---|---|---|
| [ADR-0001](ADRs/ADR-0001-Domain-Profiles.md) | Domain Profiles — layered Core + profile architecture | Accepted |
| [ADR-0002](ADRs/ADR-0002-Domain-Profile-Specification.md) | Domain Profile specification outline | Proposed |
| [ADR-0003](ADRs/ADR-0003-Conversation-Specifications.md) | Conversation Specifications pilot | Proposed |
| [ADR-0004](ADRs/ADR-0004-Interaction-Specifications.md) | Interaction Specifications — umbrella layer, schema v2 | Proposed |

## Interaction Layer

Optional interaction models — not canonical methodology:

- [Interaction Layer](../../interaction/README.md)
- [Implementation Bindings](../../interaction/Implementation_Bindings.md)
- [Interaction Specifications](../../interaction/specs/README.md)

## Architectural Watch Items

Deferred architectural initiatives that are intentionally outside the current roadmap. Watch items are non-authoritative for implementation until promoted.

Indexed in [Watch_Items/README.md](Watch_Items/README.md).

| ID | Initiative | Status |
|---|---|---|
| [AWI-0001](Watch_Items/AWI-0001-Domain-Independence.md) | Domain Independence — evolve EDF into a domain-independent methodology | Active |
| [AWI-0002](Watch_Items/AWI-0002-Interaction-Layer-Separation.md) | Interaction Layer Separation — distinguish methodology from optional interaction models | Promoted |
| [AWI-0003](Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md) | Repository Semantic Context and Convention Binding — open question on repository-level semantics | Active |

Adopting projects place project-specific ADRs under `docs/Architecture/ADRs/` using the same conventions.

## Parent

- [Project Index](../../PROJECT_INDEX.md)

## Related Documents

- [Specifications](../Specifications/README.md)
- [Development](../Development/README.md)
- [Governance](../Governance/README.md)
- [Templates](../Templates/README.md)
- [Watch Items](Watch_Items/README.md)
