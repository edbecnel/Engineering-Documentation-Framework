# General Engineering Project Model

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Architecture](README.md) › General Engineering Project Model

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** All EDF adopters regardless of engineering discipline
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document defines the **General Engineering Project Model (GEP)** — discipline-independent engineering concepts that EDF knows how to reason about during bootstrap, adoption, and ongoing governance.

The GEP answers **Q3** from the multi-discipline bootstrap architecture review: what belongs in EDF Core beyond repository structure.

**Critical constraint:** GEP concepts are **not mandatory directories**. EDF must not replace a software-specific folder hierarchy with an equally rigid generic folder hierarchy. Repository structure is derived from actual project needs during bootstrap and adoption.

## Relationship to Other Documents

| Document | Relationship |
|---|---|
| [Documentation Information Architecture](Documentation_Information_Architecture.md) | Defines EDF Core documentation domains and navigation |
| [ADR-0005 — Project Classification and Capabilities](ADRs/ADR-0005-Project-Classification-and-Capabilities.md) | How projects are classified and how capabilities compose |
| [ADR-0006 — Engineering Documentation vs Artifacts](ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md) | Distinction between documentation and engineering artifacts |
| [Universal Bootstrap Specification](../AI/Universal_Bootstrap_Specification.md) | How bootstrap applies GEP concepts |

## Architectural Principles (EDF-GEP-001)

EDF SHALL define a discipline-independent engineering bootstrap model capable of establishing a valid EDF project before any domain-specific capability or project specialization is available.

Domain-specific EDF capabilities refine this universal model rather than replace it.

An unsupported or previously unknown engineering discipline SHALL remain fully bootstrap-capable using EDF Core alone.

## Engineering Concepts

The following concepts apply across disciplines. A given project may use a subset. Not every concept requires a dedicated file or folder.

### Identity and scope

| Concept | Description |
|---|---|
| **Project Identity** | Name, mission, and distinguishing purpose of the engineering effort |
| **Project Scope** | Boundaries of what the project governs and what it explicitly excludes |
| **Stakeholders / Authority** | Who owns decisions, who approves changes, who is accountable |

### Requirements and constraints

| Concept | Description |
|---|---|
| **Requirements** | Intended behavior, performance, or outcomes the project must satisfy |
| **Constraints** | Fixed limits (regulatory, physical, schedule, budget, toolchain) |
| **Assumptions** | Conditions treated as true until invalidated |

### Design and analysis

| Concept | Description |
|---|---|
| **Designs / Models** | Representations of intended or actual system structure |
| **Analyses / Simulations** | Evaluations of design behavior under modeled conditions |
| **Experiments** | Controlled investigations to test hypotheses or validate designs |

### Artifacts and relationships

| Concept | Description |
|---|---|
| **Engineering Artifacts** | Durable outputs of engineering work (see [ADR-0006](ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)) |
| **Artifact Relationships** | Traceability between requirements, decisions, artifacts, tests, and results |
| **Engineering Documentation** | Governed prose describing intent, rationale, procedures, and interpretation |

### Verification and validation

| Concept | Description |
|---|---|
| **Test Procedures** | Repeatable steps to verify or validate behavior |
| **Test Results / Observations** | Recorded outcomes of procedures or experiments |
| **Risks / Issues / Failures** | Known or discovered problems requiring tracking |

### Change and history

| Concept | Description |
|---|---|
| **Decisions / Rationale** | Recorded choices and why they were made (ADRs) |
| **Changes / Revisions** | Controlled evolution of designs, artifacts, and documentation |
| **Milestones / Releases** | Significant completion points or deliverable bundles |
| **Historical Record** | Preserved prior states and discovery documents |
| **Lessons / Discoveries** | Knowledge gained that may inform future work |

### References and open work

| Concept | Description |
|---|---|
| **References / Sources** | External standards, papers, datasheets, prior art |
| **Open Questions / Watch Items** | Unresolved architectural or engineering questions |

## Engineering Documentation vs Engineering Artifacts

EDF distinguishes two categories of engineering project information:

```text
Engineering Project Information
        |
        +-- Engineering Documentation
        |     +-- requirements, rationale, decisions
        |     +-- procedures, reports, interpretation
        |
        +-- Engineering Artifacts
              +-- schematics, PCB layouts, CAD models
              +-- simulation models, firmware, datasets
              +-- measurements, generated outputs
```

A KiCad schematic is an **engineering artifact**, not documentation. EDF governs both, but they have different roles and lifecycles. Structure must not assume all engineering content lives under `docs/`.

See [ADR-0006](ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md) for the full architectural decision.

## Artifact Relationships (Future-Ready)

EDF should eventually express traceability chains such as:

```text
Requirement → Design Decision → Schematic → PCB Layout → Prototype
    → Test Procedure → Test Dataset → Validation Report
```

The storage mechanism for relationships is not defined in this document. Bootstrap and adoption must not make future artifact relationships impossible.

## Engineering Tool and Engine Provider Compatibility

EDF does not implement engineering tools (PCB routers, simulators, thermal analyzers, FPGA synthesizers, etc.) and must not couple to any specific tool.

EDF documents, where applicable:

- inputs provided to an engineering tool or engine;
- tool or engine identity and version;
- configuration used;
- generated artifacts and their locations;
- analysis results;
- provenance;
- engineering interpretation of results;
- decisions derived from results.

See [AWI-0005 — Engineering Tool Provider Compatibility](Watch_Items/AWI-0005-Engineering-Tool-Provider-Compatibility.md) for deferred implementation details.

## What Stays in EDF Core

| Layer | Examples |
|---|---|
| GEP concepts | This document |
| Root identity documents | `README.md`, `PROJECT_INDEX.md`, `PROJECT_CHARTER.md`, `ARCHITECTURE_DECISIONS.md` |
| Core documentation domains | `docs/Architecture/`, `docs/Governance/`, `docs/Specifications/`, etc. |
| Bootstrap and adoption engineering | `docs/Development/`, `docs/AI/` |
| Operational directories | `tasks/`, `archive/`, `scripts/`, `reports/` |

## What Moves to Capabilities

Discipline-specific artifact classes, vocabulary, workflow patterns, and structure hints belong in [EDF Capabilities](../../capabilities/index.yaml), not in Core. See [ADR-0005](ADRs/ADR-0005-Project-Classification-and-Capabilities.md).

## Parent

- [Architecture](README.md)

## Related Documents

- [ADR-0005 — Project Classification and Capabilities](ADRs/ADR-0005-Project-Classification-and-Capabilities.md)
- [ADR-0006 — Engineering Documentation vs Artifacts](ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)
- [CRA, CKES, and EDF Boundaries](CRA_CKES_EDF_Boundaries.md)
- [Universal Bootstrap Specification](../AI/Universal_Bootstrap_Specification.md)
