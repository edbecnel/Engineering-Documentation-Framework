# Capability Contribution Playbook

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › Capability Contribution Playbook

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** AI-assisted contribution of reusable EDF capabilities from adopting projects
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This playbook enables AI assistants to help contributors **semi-automate** preparation of EDF capability contributions. AI drafts manifests, registry entries, and PR materials; humans approve classification, validation scope, and the pull request.

**Canonical human guide:** [EDF Capability Contribution Guide](../Development/EDF_Capability_Contribution_Guide.md)

**Machine-readable contract:** [edf.capability-contribute.v1.yaml](../../interaction/specs/edf.capability-contribute.v1.yaml)

## When to Use This Playbook

Use when an adopting project has:

- Completed EDF bootstrap and an adoption exercise
- Documented project extensions in `edf-project-context.yaml` and an ADR
- Recorded capability gaps in `EDF_BOOTSTRAP_REPORT.md`
- Reusable discoveries that may benefit other engineering disciplines

Do **not** use for one-off project customizations labeled `project-customization` — those stay in the adopting repo only.

## AI Responsibilities

- Read [EDF Capability Contribution Guide](../Development/EDF_Capability_Contribution_Guide.md) and [capability-schema.yaml](../../capabilities/capability-schema.yaml) before acting
- Classify each discovery with a contribution label (see below)
- Draft `capability.yaml` from project evidence — never invent artifact classes without source material
- Draft `capabilities/index.yaml` registry entry for `contrib/` tier
- Draft PR body using [.github/PULL_REQUEST_TEMPLATE/capability_contribution.md](../../.github/PULL_REQUEST_TEMPLATE/capability_contribution.md)
- Propose scope-matched validation plan
- **Wait for human approval** before opening a PR or claiming `candidate-capability` status

## Required Inputs

| Input | Location | Required |
|---|---|---|
| Local EDF clone path | User-provided | Yes |
| Adopting project path | User-provided | Yes |
| `edf-project-context.yaml` | Adopting project root | Yes |
| `EDF_BOOTSTRAP_REPORT.md` | Adopting project root | Recommended |
| Project extension ADR | `docs/Architecture/ADRs/` | When extensions exist |
| `BOOTSTRAP_CONTEXT.md` | Adopting project root | Optional |

## Classification Labels

Apply exactly one primary label per proposed reusable unit:

| Label | When to use |
|---|---|
| `candidate-capability` | Reusable discipline, activity, or artifact-class pattern — propose for `capabilities/contrib/` |
| `capability-requirement` | Refinement to an existing capability only |
| `edf-core-requirement` | Change applies to all disciplines — requires GEP or Core ADR (escalate to maintainer) |
| `project-customization` | Single-project only — do not include in EDF PR |

## Workflow

```text
1. Gather inputs from adopting project
2. Classify discoveries (labels)
3. Draft capability.yaml per candidate
4. Draft index.yaml registry entry
5. Draft validation plan (scope-matched)
6. Present package to human for approval
7. Human opens PR to EDF repository
```

## Prompt Templates

### Phase 0 — Confirm contribution scope

```text
I want to contribute reusable EDF capabilities from [PROJECT NAME] at [PATH].

EDF clone: [EDF CLONE PATH]

Read docs/Development/EDF_Capability_Contribution_Guide.md and
docs/AI/Capability_Contribution_Playbook.md.

Inputs:
- edf-project-context.yaml
- EDF_BOOTSTRAP_REPORT.md
- [list ADRs if any]

Classify each discovery. Propose which items are candidate-capability vs project-customization.
Wait for my confirmation before drafting manifests.
```

### Phase 1 — Draft capability manifest

```text
Draft capabilities/contrib/[CAPABILITY_ID]/capability.yaml for [PROJECT NAME].

Follow capability-schema.yaml and software-engineering/capability.yaml as references.

Requirements:
- Use artifact_classes for engineering artifacts (not docs/ paths for tool outputs)
- Include detection_signals from actual project evidence
- Set maturity: pilot
- Include adoption_evidence referencing this project
- Set validation_scope and validation_plan per scope-matched rules

Present the full YAML for my review before writing files.
```

### Phase 2 — Draft registry and PR

```text
Draft:
1. Entry for capabilities/index.yaml (community tier)
2. PR body using .github/PULL_REQUEST_TEMPLATE/capability_contribution.md

Include classification labels, validation plan, and checklist status.
Do not open the PR until I approve.
```

## Human Confirmation Gates

AI must obtain human approval before:

- Assigning `candidate-capability` label
- Finalizing `validation_scope`
- Writing files to the EDF clone
- Opening a pull request to the EDF repository

## Validation Gates

| Gate | Criterion |
|---|---|
| G1 | Each `candidate-capability` has source evidence in bootstrap report or ADR |
| G2 | `artifact_classes` used for tool outputs; no default `docs/Schematics` paths |
| G3 | `validation_plan` matches claimed `validation_scope` |
| G4 | Human approved classification labels and PR package |

## What Not To Do

- Do not promote capabilities to built-in — maintainer decision after scope-matched validation
- Do not silently merge framework changes
- Do not conflate discipline and activity into atomic profile IDs (e.g. `electronics-research`)
- Do not skip ADR documentation for project extensions

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [EDF Capability Contribution Guide](../Development/EDF_Capability_Contribution_Guide.md)
- [Universal Bootstrap Specification](Universal_Bootstrap_Specification.md)
- [edf.capability-contribute.v1.yaml](../../interaction/specs/edf.capability-contribute.v1.yaml)
- [capabilities/index.yaml](../../capabilities/index.yaml)
