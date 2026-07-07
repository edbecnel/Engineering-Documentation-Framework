# Architecture Documentation

## Purpose

This directory contains **system design documentation** — how the software is structured, how components interact, and how the architecture evolves over time. It answers *what we built* and *how it fits together*, while [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md) answers *why we chose it*.

## Audience

- Software architects and senior engineers
- Developers implementing features across service boundaries
- New team members building a mental model of the system
- AI tools needing structural context for refactors or integrations

## What belongs here

| Document type | Examples |
|---------------|----------|
| System overview | High-level context diagrams, component inventory |
| Service design | Per-service responsibilities, dependencies, SLAs |
| Sequence / flow diagrams | Request flows, event pipelines, batch jobs |
| Integration patterns | Messaging, sync vs async, idempotency |
| Security architecture | Trust boundaries, auth flows (not secret values) |
| ADR files (optional) | `decisions/ADR-NNN-title.md` individual records |

## What does not belong here

- API request/response schemas → [docs/API/](../API/)
- Table definitions and migrations → [docs/Database/](../Database/)
- Runbooks and infra config → [docs/Deployment/](../Deployment/)
- Product requirements → [docs/Specifications/](../Specifications/)

## Suggested document structure

When adding architecture documents, use this outline:

```markdown
# [Component or System Name]

## Summary
One paragraph describing scope.

## Context
How this fits in the larger system (link to diagram).

## Components
### [Component A]
Responsibilities, interfaces, dependencies.

## Data flows
Describe or diagram primary flows.

## Failure modes
What breaks, how the system degrades.

## Related
- ADRs, API docs, deployment notes
```

## Recommended files (as project grows)

| File | Description |
|------|-------------|
| `System_Overview.md` | C4 context and container diagrams |
| `Component_Catalog.md` | Index of services/modules with owners |
| `decisions/` | Individual ADR markdown files |
| `diagrams/` | Source files for architecture diagrams (Mermaid, PlantUML, etc.) |

## Diagram conventions

- Prefer **version-controlled** diagram sources (Mermaid in Markdown, `.puml` files) over binary-only images.
- Export PNG/SVG for presentations if needed; keep source canonical.
- Date and label diagrams when they represent a point-in-time snapshot.

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | _[Architect / tech lead]_ |
| **Review cadence** | Each major release or significant structural change |
| **Index** | Link new docs from [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Related documents

- [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md)
- [docs/API/](../API/)
- [docs/Database/](../Database/)
- [docs/Developer_Handbook/04_Coding_Standards.md](../Developer_Handbook/04_Coding_Standards.md)
