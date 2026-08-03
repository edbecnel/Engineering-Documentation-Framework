# Interaction Specifications

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Interaction Layer](../README.md) › Interaction Specifications

## Purpose

Index of **Interaction Specifications** — versioned, workflow-neutral contracts that execute canonical methodology without replacing it.

Schema: [ADR-0004](../../docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md) (v2) · [ADR-0003](../../docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md) (v1 pilot)

Bindings: [Implementation Bindings](../Implementation_Bindings.md)

## Specifications

| ID | Workflow | File | Status | Non-AI equivalent |
|----|----------|------|--------|-------------------|
| `edf.bootstrap.v1` | `edf.repository.bootstrap` | [edf.bootstrap.v1.yaml](edf.bootstrap.v1.yaml) | Pilot | [Bootstrap Guide](../../docs/Development/Bootstrap_Guide.md) |
| `edf.adr.create.v1` | `edf.adr.create` | [edf.adr.create.v1.yaml](edf.adr.create.v1.yaml) | Pilot | [ADR Template](../../docs/Templates/ADR_Template.md) |

## Adding a Specification

1. Copy schema from an existing v2 spec or [ADR-0004](../../docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md).
2. Set `workflow_id`, `authoritative_sources`, `executes_methodology`, and `non_ai_equivalent`.
3. Declare `implementation_bindings` (cli, conversation, gui, ide).
4. Run `./scripts/validate_interaction_specs.sh`.
5. Link from relevant playbooks; do not duplicate methodology prose in YAML.

## Parent

- [Interaction Layer](../README.md)
