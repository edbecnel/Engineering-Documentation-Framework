# EDF Bootstrap Report

[Home](README.md) › EDF Bootstrap Report

> **Status:** Draft
> **Owner:** [Project owner]
> **Applies To:** EDF bootstrap outcome tracking for any engineering project
> **Last Reviewed:** [YYYY-MM-DD]

## Purpose

Record the outcome of an EDF bootstrap for any engineering project. Copy from [docs/Templates/EDF_Bootstrap_Report_Template.md](docs/Templates/EDF_Bootstrap_Report_Template.md).

Universal successor to the ASR-specific bootstrap report template — use this for all repository roles.

## Bootstrap Summary

| Field | Value |
|---|---|
| **Repository** | [Name] |
| **Repository role** | [engineering-project | architecture-specification-repository | …] |
| **EDF profile (legacy)** | `core` or `software-engineering` |
| **Disciplines** | [list] |
| **Activities** | [list] |
| **Capabilities applied** | [list from capabilities/index.yaml, or none] |
| **Bootstrap specification** | [Universal Bootstrap Specification](docs/AI/Universal_Bootstrap_Specification.md) |
| **Started** | [YYYY-MM-DD] |
| **Completed** | [YYYY-MM-DD] |
| **Performed by** | [Human / AI / both] |

## Steps Completed

| Step | Status | Notes |
|---|---|---|
| Inspect repository | | Map docs and engineering artifacts |
| Preserve historical artifacts | | |
| Establish project engineering context | | `edf-project-context.yaml` |
| Human confirmation | | Optional: record in an [Engineering Gate Review Record](../Program/Gate_Reviews/) per [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) when the project defines program gates |
| Apply EDF Core | | `adopt-edf.sh bootstrap` |
| Apply capability extensions | | create-if-missing only |
| Apply repository role overlay (ASR, etc.) | | if applicable |
| Map existing documents and artifacts | | |
| Create missing bootstrap artifacts | | |
| Record deferred items | | |
| Validate | | |
| Report gaps | | |

## Document and Artifact Mappings

| Original path | Category | New path (if any) | Normative? | Preserved? | Notes |
|---|---|---|---|---|---|
| | documentation / artifact | | | | |

## Project Context

Link or embed: `edf-project-context.yaml`

## Deferred Artifacts

| Artifact | Reason deferred | Target date |
|---|---|---|
| | | |

## Gaps Requiring Human Decision

- [ ] _[Gap]_

## Validation Summary

### Policy

Framework Advisor output under `reports/conformance/` is transient engineering evidence, reproducible from repository state and EDF tooling, and intentionally excluded from version control.

### Outcomes

| Metric | Score | Bootstrap tier target | Status |
|---|---|---|---|
| Overall | | ≥ 50% | |
| Structure | | ≥ 80% | |
| Navigation | | ≥ 40% | |
| AI | | ≥ 10% | |
| Governance | | ≥ 20% | |

**Overall validation status:** [Met / Not met]

## Capability Gaps Discovered

Reusable capabilities that could be contributed back to EDF:

| Candidate capability | Type | Classification label |
|---|---|---|
| | discipline / activity / artifact-class | candidate-capability |

## Feedback for EDF

_[Improvements to EDF bootstrap guidance discovered during this bootstrap.]_

## Related Documents

- [Universal Bootstrap Specification](docs/AI/Universal_Bootstrap_Specification.md)
- [EDF Capability Contribution Guide](docs/Development/EDF_Capability_Contribution_Guide.md)
- [Adopter Conformance Tiers](docs/Development/Adopter_Conformance_Tiers.md)
