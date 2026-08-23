# CRA, CKES, and EDF Boundaries

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Architecture](README.md) › CRA, CKES, and EDF Boundaries

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF adopters evaluating CRA and CKES relationships
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document answers **Q10** from the multi-discipline bootstrap architecture review: where do the Canonical Representation Architecture (CRA) and Canonical Knowledge Engineering System (CKES) stop, and where does EDF begin?

EDF adopters should understand what they gain from CRA principles and what they are **not** required to implement.

## Relationship Diagram

```text
             CRA Principles
               /       \
              v         v
            CKES       EDF
                         |
                         v
                 EDF-enabled projects
                         |
                         +-- optional canonical knowledge services --> CKES
```

## CRA — Architectural Principles

[CRA](https://github.com/edbecnel/Canonical-Representation-Architecture) is a technology-independent architecture specification program. CRA informs EDF where applicable:

| CRA concern | EDF application |
|---|---|
| Canonical identity | Project and document identity in charter, index, ADRs |
| Representation vs canonical knowledge | Engineering documentation vs engineering artifacts ([ADR-0006](ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)) |
| Relationships | Future artifact traceability; ADR and specification linking today |
| Provenance | Document metadata, change history, bootstrap reports |
| Authority and scope | `edf-project-context.yaml` authority block; scope declarations |
| Preservation | Inspect-first bootstrap; historical artifact preservation |
| Evolution | ADRs, changelog, capability maturation lifecycle |

**EDF may conform to applicable CRA principles without becoming operationally dependent on a CRA implementation.**

EDF does not require adopters to implement CRA identity registries, discovery indexes, or canonicalization pipelines unless they independently adopt CRA.

## CKES — Optional Reference Implementation

[CKES](https://github.com/edbecnel/Canonical-Knowledge-Engineering-System) experiments with canonical-knowledge engineering mechanisms that may inform CRA. CKES patterns relevant to EDF bootstrap:

| CKES pattern | EDF adoption |
|---|---|
| Three-layer model (core / domain / source) | EDF Core / capabilities / project extensions |
| Domain Package concept | EDF Capability manifests |
| Classification labels for findings | Capability contribution labels |
| Adoption exercise before normative specs | Capability extraction from real projects |
| Scope IDs for multi-domain separation | `edf-project-context.yaml` composition |

**EDF must not require CKES for ordinary bootstrap or operation.**

An EDF-enabled project MAY optionally integrate CKES or similar canonical-knowledge services in the future. That integration is a project-level decision, not an EDF Core requirement.

## What EDF Owns

| Responsibility | Owner |
|---|---|
| Repository documentation structure and governance | EDF |
| Bootstrap and adoption methodology | EDF |
| General Engineering Project Model | EDF |
| Capability registry and maturation | EDF |
| Framework Advisor conformance | EDF |
| Canonical AI bootstrap entry point | EDF |

## What EDF Does Not Own

| Responsibility | Owner |
|---|---|
| Canonical knowledge architecture specification | CRA |
| Canonical knowledge engineering runtime | CKES (experimental) |
| Engineering tool execution (simulation, routing, synthesis) | External tool providers |
| Discipline-specific artifact authoring tools | External tools (KiCad, CAD, etc.) |

## Bootstrap Implications

1. Bootstrap an EDF project with EDF tooling and playbooks only.
2. Do not require CRA or CKES repositories as bootstrap prerequisites.
3. Record CRA/CKES alignment opportunities in `EDF_BOOTSTRAP_REPORT.md` when relevant.
4. Use CRA inspect-first and deferred-artifact patterns; use CKES classification labels for capability contributions.

## Parent

- [Architecture](README.md)

## Related Documents

- [General Engineering Project Model](General_Engineering_Project_Model.md)
- [ADR-0005 — Project Classification and Capabilities](ADRs/ADR-0005-Project-Classification-and-Capabilities.md)
- [Universal Bootstrap Specification](../AI/Universal_Bootstrap_Specification.md)
