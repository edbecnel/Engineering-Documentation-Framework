# Architecture

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Architecture

## Purpose

This domain contains the authoritative architectural description of the project and the framework's documentation information architecture.

## Canonical Documents

- [Documentation Information Architecture](Documentation_Information_Architecture.md)
- [Framework Generation Principles](Framework_Generation_Principles.md)
- [Architecture Decisions](../../ARCHITECTURE_DECISIONS.md)

## Architecture Decision Records

Framework ADRs are indexed in [ADRs/README.md](ADRs/README.md) and summarized in [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md).

| ID | Decision | Status |
|---|---|---|
| [ADR-0001](ADRs/ADR-0001-Domain-Profiles.md) | Domain Profiles — layered Core + profile architecture | Accepted |
| [ADR-0002](ADRs/ADR-0002-Domain-Profile-Specification.md) | Domain Profile specification outline | Proposed |
| [ADR-0003](ADRs/ADR-0003-Conversation-Specifications.md) | Conversation Specifications as optional interaction layer | Proposed |

## Interaction Layer

Optional interaction models (Conversation Specifications, CLI) — not canonical methodology:

- [Interaction Layer](../../interaction/README.md)
## Architectural Watch Items

Deferred architectural initiatives that are intentionally outside the current roadmap. Watch items are non-authoritative for implementation until promoted.

| ID | Initiative | Status |
|---|---|---|
| [AWI-0001](Watch_Items/AWI-0001-Domain-Independence.md) | Domain Independence — evolve EDF into a domain-independent methodology | Active |
| [AWI-0002](Watch_Items/AWI-0002-Interaction-Layer-Separation.md) | Interaction Layer Separation — distinguish methodology from optional interaction models | Promoted |

Adopting projects place project-specific ADRs under `docs/Architecture/ADRs/` using the same conventions.

## Parent

- [Project Index](../../PROJECT_INDEX.md)

## Related Documents

- [Specifications](../Specifications/README.md)
- [Development](../Development/README.md)
- [Governance](../Governance/README.md)
- [Templates](../Templates/README.md)
