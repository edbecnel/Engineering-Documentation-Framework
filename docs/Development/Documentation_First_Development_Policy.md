# Documentation-First Development Policy

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Documentation-First Development Policy

> **Status:** Canonical Policy
>
> **Owner:** Engineering Documentation Framework

## Purpose

Documentation defines the intended architecture before implementation. The repository is the single source of truth.

## Required Workflow

1. Update the architecture.
2. Update the documentation.
3. Update templates.
4. Update generators.
5. Update analyzers.
6. Implement the feature.
7. Validate the implementation.
8. Update the changelog.

## Principles

- Documentation leads implementation.
- AI follows documented architecture.
- Existing project content is never overwritten automatically.
- Human approval remains the final authority.

## Exceptions

Minor editorial corrections, formatting improvements, and broken-link fixes may be performed without following the full workflow.

## Future Analyzer Checks

The Framework Advisor should eventually verify:

- Architecture exists for new capabilities.
- Templates remain synchronized.
- Generator behavior matches documentation.
- Analyzer behavior matches governance.

## Parent

- [Development](README.md)

## Related Documents

- [Engineering Development Policy](Engineering_Development_Policy.md)
- [EDF Development Workflow](EDF_Development_Workflow.md)
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [Governance](../Governance/README.md)
