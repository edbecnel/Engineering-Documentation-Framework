# Conversation Specifications

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Interaction Layer](../README.md) › Conversation Specifications

## Purpose

Index of AI-executable Conversation Specifications. Each spec references canonical methodology; it does not replace it.

Schema: [ADR-0003](../../docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md)

## Specifications

| ID | File | Status | Non-AI equivalent |
|----|------|--------|-------------------|
| `edf.bootstrap.v1` | [edf.bootstrap.v1.yaml](edf.bootstrap.v1.yaml) | Pilot | [Bootstrap Guide](../../docs/Development/Bootstrap_Guide.md) |

## Adding a Specification

1. Copy schema from an existing spec or ADR-0003.
2. Set `non_ai_equivalent` to a documented human/CLI path.
3. List all `executes_methodology` references — no embedded methodology rules.
4. Run `./scripts/validate_conversation_specs.sh`.
5. Link from the relevant AI playbook; do not duplicate prompt prose in the YAML file.

## Parent

- [Interaction Layer](../README.md)
