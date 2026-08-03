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

Canonical methodology remains in `docs/`. Operational scripts remain in `scripts/`. Conversation Specifications live here.

See [ADR-0003 — Conversation Specifications](../docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md).

## Interaction Models

| Model | Location | Required for adoption? |
|-------|----------|------------------------|
| Document navigation | `docs/`, `PROJECT_INDEX.md` | Yes (methodology) |
| Step-by-step guides | `docs/Development/Bootstrap_Guide.md`, `Migration_Guide.md` | No (but recommended) |
| CLI orchestration | `scripts/adopt-edf.sh` | No |
| AI playbooks | `docs/AI/Bootstrap_Playbook.md`, `Migration_Playbook.md` | No |
| Conversation Specifications | `interaction/specs/` | No |

## Conversation Specifications

Versioned, machine-readable contracts binding conversational workflows to canonical methodology.

| Spec ID | Status | Non-AI equivalent |
|---------|--------|-------------------|
| [edf.bootstrap.v1](specs/edf.bootstrap.v1.yaml) | Pilot | [Bootstrap Guide](../docs/Development/Bootstrap_Guide.md) |

Index: [specs/README.md](specs/README.md)

## Validation

Optional validation of Conversation Specification schema and non-AI parity:

```bash
./scripts/validate_conversation_specs.sh
```

This check is **not** required for adopter conformance tiers. See [Adopter Conformance Tiers](../docs/Development/Adopter_Conformance_Tiers.md) § Optional Interaction-Layer Conformance.

## Parent

- [Project Index](../PROJECT_INDEX.md)

## Related Documents

- [ADR-0003 — Conversation Specifications](../docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md)
- [AWI-0002 Revisit Assessment](../docs/Architecture/Watch_Items/AWI-0002-Revisit-Assessment.md)
- [AI Engineering Handbook](../docs/AI/README.md)
- [Bootstrap Guide](../docs/Development/Bootstrap_Guide.md)
