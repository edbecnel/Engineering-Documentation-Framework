# Architecture Specification Repository

[Home](../../../../README.md) › [Project Index](../../../../PROJECT_INDEX.md) › [Development](../../README.md) › [Repository Bootstrap](../README.md) › Architecture Specification Repository

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Architecture Specification Repositories adopting EDF
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

EDF provides bootstrap guidance for **Architecture Specification Repositories** — repositories whose primary engineering artifact is an adoptable definition rather than an external implementation.

This directory defines what an ASR is, how EDF Core domains apply, and how to bootstrap an ASR using the [Bootstrap Procedure](Bootstrap_Procedure.md).

## Definition

An **Architecture Specification Repository (ASR)** is a repository whose **primary engineering artifact** is an architecture, methodology, protocol, framework, specification, standard, or engineering discipline intended for independent adoption, implementation, conformance, or extension.

### Examples

| Repository | Primary artifact form |
|---|---|
| Canonical Representation Architecture (CRA) | Architecture |
| Semantic Identity Protocol (SIP) | Protocol |
| Engineering Documentation Framework (EDF) | Engineering discipline and documentation methodology |

## Characteristics

- Documentation is **constitutive** of the deliverable — not merely descriptive of an external system.
- Independent adoption by other repositories or projects is a **primary success criterion**.
- Normative specifications, governance, and architectural decisions are first-class artifacts.
- **Reference implementations** are optional and never canonical.
- **Architectural discovery records** are non-normative and distinct from normative specifications.

## What EDF Provides

| Provided | Not provided |
|---|---|
| Bootstrap procedure for ASRs | Canonical `repository_class` configuration field |
| Domain interpretation guidance | Domain Profile or ADR-accepted repository taxonomy |
| Validation checklist | Auto-detection of repository type |
| Templates for discovery records and architecture specifications | Mandatory reference implementations |

Engineers **intentionally invoke** the [Bootstrap Procedure](Bootstrap_Procedure.md). No machine-readable declaration encodes ASR status in `edf-adoption.yaml`.

## EDF Profile

ASR repositories should use **`profile: core`** when running existing bootstrap scripts. Do not require software-specific domains (`docs/API/`, `docs/Database/`, `docs/Deployment/`, `docs/Developer_Handbook/`) unless an optional non-canonical reference implementation warrants them.

## Scope

Applies to repositories such as EDF, CRA, SIP, and future architectural frameworks and standards.

## Exclusions

- Not a CRA-specific bootstrap process.
- Not a software product repository (unless it also ships an optional non-canonical reference implementation).
- Not the final form of EDF's future repository taxonomy ([AWI-0003](../../../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md)).

## Conservative Design Principle

See [Repository Bootstrap README](../README.md#conservative-design-principle).

## Documents in This Directory

| Document | Purpose |
|---|---|
| [Reference Model](Reference_Model.md) | Conceptual artifact areas ASRs commonly evolve — not requirements |
| [Guidance](Guidance.md) | Domain interpretations, discovery records, historical vs normative rules |
| [Bootstrap Procedure](Bootstrap_Procedure.md) | Step-by-step bootstrap for new and existing repositories |
| [Validation Checklist](Validation_Checklist.md) | Bootstrap validation and gap reporting |

## Parent

- [Repository Bootstrap](../README.md)

## Related Documents

- [Bootstrap Guide](../../Bootstrap_Guide.md)
- [Profile-Aware Bootstrap](../../Profile_Aware_Bootstrap.md)
- [AWI-0003 — Repository Semantic Context and Convention Binding](../../../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md)
- [ASR Bootstrap Playbook](../../../AI/ASR_Bootstrap_Playbook.md)
