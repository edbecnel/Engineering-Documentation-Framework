# Repository Bootstrap

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Development](../README.md) › Repository Bootstrap

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF adoption for specialized repository engineering contexts
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This directory contains **bootstrap procedures** for repositories that adopt EDF Core structure but require specialized documentation guidance beyond the general [Bootstrap Guide](../Bootstrap_Guide.md).

Each procedure describes how to initialize and evolve a particular class of engineering repository. Procedures are **invoked intentionally** by engineers or AI assistants — they are not auto-detected configuration profiles.

## Conservative Design Principle

> The Architecture Specification Repository capability is intentionally conservative.
>
> It provides only the minimum repository structure, documentation guidance, and engineering practices necessary to bootstrap and evolve an architecture specification repository.
>
> It does not attempt to predict or constrain the eventual evolution of EDF's broader repository taxonomy.
>
> Consequently, the ASR capability should be regarded as a **practical engineering capability** rather than the final architectural model.

This principle governs all bootstrap procedures in this directory.

## Relationship to AWI-0003

[AWI-0003 — Repository Semantic Context and Convention Binding](../../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md) records an unresolved architectural question about how EDF should model repository-level semantic interpretation.

Bootstrap procedures here provide **practical guidance today** without resolving that question. No canonical `repository_class` or machine-readable taxonomy field is introduced.

## Available Bootstrap Procedures

| Procedure | Repository type | Entry point |
|---|---|---|
| [Architecture Specification Repository](Architecture_Specification_Repository/README.md) | Repositories whose primary engineering artifact is an adoptable architecture, methodology, protocol, framework, specification, standard, or engineering discipline | [Bootstrap Procedure](Architecture_Specification_Repository/Bootstrap_Procedure.md) |

Additional procedures may be added as sibling directories when validated need arises.

## General EDF adoption

For standard engineering repositories (products, systems, knowledge bases), use the general [Bootstrap Guide](../Bootstrap_Guide.md) with the appropriate Domain Profile (`core` or `software-engineering`).

## Parent

- [Development](../README.md)

## Related Documents

- [Bootstrap Guide](../Bootstrap_Guide.md)
- [Profile-Aware Bootstrap](../Profile_Aware_Bootstrap.md)
- [AWI-0003 — Repository Semantic Context and Convention Binding](../../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md)
- [ASR Bootstrap Playbook](../../AI/ASR_Bootstrap_Playbook.md)
