# Interaction Layer

[Home](../README.md) › [Project Index](../PROJECT_INDEX.md) › Interaction Layer

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Optional interaction models for executing EDF methodology
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes (interaction layer only — not canonical methodology)

## Purpose

This directory contains **optional interaction-layer artifacts** that help humans and AI assistants **execute** the Engineering Documentation Framework methodology without redefining it.

Canonical methodology remains in `docs/`. Operational scripts remain in `scripts/`. **Interaction Specifications** live here.

See [ADR-0004 — Interaction Specifications](../docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md).

## Foundational Principle — Reference, Not Replace

Interaction-layer artifacts **execute** canonical methodology. They **do not redefine, duplicate, or replace** it. The engineering methodology in `docs/` remains the sole authoritative source.

## Interaction Models

| Model | Location | Required for adoption? |
|-------|----------|------------------------|
| Document navigation | `docs/`, `PROJECT_INDEX.md` | Yes (methodology) |
| Step-by-step guides | `docs/Development/Bootstrap_Guide.md`, `Migration_Guide.md` | No (but recommended) |
| CLI orchestration | `scripts/adopt-edf.sh` | No |
| AI playbooks | `docs/AI/Bootstrap_Playbook.md`, `Migration_Playbook.md` | No |
| Interaction Specifications | `interaction/specs/` | No |

Implementation channels: [Implementation Bindings](Implementation_Bindings.md) (CLI, conversation, GUI, IDE).

## Interaction Specifications

Versioned, workflow-neutral contracts binding phases to canonical methodology. **Conversation Specifications** (ADR-0003 pilot term) are specs whose primary binding is AI/IDE conversational execution.

| Spec ID | Workflow | Status | Non-AI equivalent |
|---------|----------|--------|-------------------|
| [edf.bootstrap.v1](specs/edf.bootstrap.v1.yaml) | `edf.repository.bootstrap` | Pilot | [Bootstrap Guide](../docs/Development/Bootstrap_Guide.md) |
| [edf.adr.create.v1](specs/edf.adr.create.v1.yaml) | `edf.adr.create` | Pilot | [ADR Template](../docs/Templates/ADR_Template.md) |

Index: [specs/README.md](specs/README.md)

## Validation

```bash
./scripts/validate_interaction_specs.sh
```

Alias: `validate_conversation_specs.sh` (ADR-0003 compatibility).

This check is **not** required for adopter conformance tiers. See [Adopter Conformance Tiers](../docs/Development/Adopter_Conformance_Tiers.md) § Optional Interaction-Layer Conformance.

## Parent

- [Project Index](../PROJECT_INDEX.md)

## Related Documents

- [ADR-0004 — Interaction Specifications](../docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md)
- [ADR-0003 — Conversation Specifications](../docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md) (pilot predecessor)
- [Implementation Bindings](Implementation_Bindings.md)
- [AWI-0002 Revisit Assessment](../docs/Architecture/Watch_Items/AWI-0002-Revisit-Assessment.md)
- [AI Engineering Handbook](../docs/AI/README.md)
