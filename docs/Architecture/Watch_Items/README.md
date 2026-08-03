# Architectural Watch Items

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › Architectural Watch Items

## Purpose

This directory contains **Architectural Watch Items (AWIs)** — deferred architectural initiatives intentionally outside the current roadmap.

Watch items are **non-authoritative for implementation** while Active. They record open questions, longer-horizon evolution, or architectural uncertainty until promoted to ADRs or explicitly closed.

## Watch Item Index

| ID | Initiative | Status |
|---|---|---|
| [AWI-0001](AWI-0001-Domain-Independence.md) | Domain Independence — evolve EDF into a domain-independent methodology | Active |
| [AWI-0002](AWI-0002-Interaction-Layer-Separation.md) | Interaction Layer Separation — distinguish methodology from optional interaction models | Promoted |
| [AWI-0002-Revisit-Assessment](AWI-0002-Revisit-Assessment.md) | Post-promotion assessment for AWI-0002 | — |
| [AWI-0003](AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md) | Repository Semantic Context and Convention Binding — repository-level semantics | Active |

## Lifecycle

| Status | Meaning |
|---|---|
| **Active** | Under observation; non-authoritative for implementation |
| **Promoted** | Elevated to one or more ADRs or implementation plans |

Promotion path: AWI → Proposed ADR(s) → Accepted ADR(s). See [AWI-0002](AWI-0002-Interaction-Layer-Separation.md) for a worked example.

## ASR Context

For Architecture Specification Repositories, watch items live under `docs/Architecture/Watch_Items/` and remain non-authoritative until promoted. See [ASR Guidance](../../Development/Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md).

Adopting projects place project-specific watch items in this directory using the same `AWI-NNNN-Short-Title.md` naming convention.

## Parent

- [Architecture](../README.md)

## Related Documents

- [Architecture README](../README.md)
- [Architecture Decision Records](../ADRs/README.md)
- [Glossary](../../Reference/Glossary.md)
