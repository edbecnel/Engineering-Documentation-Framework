# EDF Capability Contribution Guide

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › EDF Capability Contribution Guide

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Contributing reusable EDF capabilities from adoption exercises
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This guide defines how discoveries from EDF adoption exercises mature into reusable **EDF Capabilities** — answering **Q7** and **Q8** from the multi-discipline bootstrap architecture review.

Capabilities replace monolithic domain profiles ([ADR-0005](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md)).

## Capability Types

| Type | Examples | Provides |
|---|---|---|
| `discipline` | `electronics`, `software-engineering` | Artifact classes, vocabulary, governance patterns |
| `activity` | `research`, `development`, `manufacturing` | Workflow and lifecycle patterns |
| `repository-role` | `asr` | Procedure overlays |

## Maturation Lifecycle

```text
Project extension (ADR + edf-project-context.yaml)
      → Adoption exercise
      → Community capability (capabilities/contrib/)
      → Scope-matched validation
      → Built-in capability (capabilities/)
```

| Tier | Location | Promotion criteria |
|---|---|---|
| Project extension | Adopting repo | Bootstrap complete; documented in ADR |
| Community | `capabilities/contrib/<id>/` | Adoption exercise; ≥1 real adopter |
| Built-in | `capabilities/<id>/` | Scope-matched validation; maintainer review |

## Classification Labels

Use these labels in PRs and bootstrap reports (CKES-inspired):

| Label | Meaning |
|---|---|
| `edf-core-requirement` | Applies to all disciplines — requires GEP or Core change |
| `capability-requirement` | Applies only to a specific capability |
| `project-customization` | Single adopter only — must not become framework requirement |
| `candidate-capability` | Proposed for community/built-in promotion |

## Scope-Matched Validation

A candidate capability must be validated **outside the project from which it was extracted**. The validation target matches the claimed scope:

| `validation_scope` | Validation target |
|---|---|
| `discipline` | Second project in the same discipline |
| `activity` | Different discipline, same activity |
| `cross-cutting` | Different discipline AND different activity |
| `multidisciplinary` | Multidisciplinary adopter |

Record validation evidence in the capability manifest `adoption_evidence` field.

## Contribution Checklist

1. Complete an adoption exercise in a real project.
2. Write `EDF_BOOTSTRAP_REPORT.md` with capability gaps section.
3. Extract capability manifest to `capabilities/contrib/<id>/capability.yaml`.
4. Include `artifact_classes` for engineering artifacts — not `docs/` paths for tool outputs ([ADR-0006](../Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)).
5. Add detection signals and `ai_bootstrap_hints`.
6. Open PR with classification labels and validation plan.
7. Maintainer reviews and promotes to built-in after scope-matched validation.

## AI-assisted workflow

Contributors may use an AI assistant to **draft** capability manifests, registry entries, and PR bodies. Follow [Capability Contribution Playbook](../AI/Capability_Contribution_Playbook.md):

- AI classifies discoveries and drafts `capability.yaml`
- Human approves labels, validation scope, and the pull request
- Automation assists drafting; promotion remains a maintainer decision

Machine-readable contract: [edf.capability-contribute.v1.yaml](../../interaction/specs/edf.capability-contribute.v1.yaml)

## Capability Manifest

See [capability-schema.yaml](../../capabilities/capability-schema.yaml) and [software-engineering/capability.yaml](../../capabilities/software-engineering/capability.yaml) as reference.

Required fields: `capability_id`, `capability_type`, `display_name`, `version`, `maturity`.

## Feedback Loop

```text
Bootstrap report → Watch Item / Finding → ADR → Capability PR → Built-in registry
```

## Parent

- [Development](README.md)

## Related Documents

- [ADR-0005 — Project Classification and Capabilities](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md)
- [Universal Bootstrap Specification](../AI/Universal_Bootstrap_Specification.md)
- [Capability Contribution Playbook](../AI/Capability_Contribution_Playbook.md)
- [capabilities/index.yaml](../../capabilities/index.yaml)
