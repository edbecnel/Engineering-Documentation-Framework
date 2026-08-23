# Universal Bootstrap Specification

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › Universal Bootstrap Specification

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** All EDF bootstrap operations (human and AI)
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document is the **normative bootstrap contract** for EDF (EDF-GEP-001). It specifies how to bootstrap any engineering project—including disciplines EDF has never encountered—using EDF Core alone.

Entry point for AI systems: [EDF AI Bootstrap Entry](EDF_AI_Bootstrap_Entry.md).

## Principles

1. **Inspect first** — Map existing content before creating structure.
2. **Preserve historical artifacts** — Do not relocate or overwrite without explicit approval and ADR.
3. **Core is universal** — EDF Core bootstrap succeeds without any discipline capability.
4. **Human confirmation** — AI proposes; human confirms before structural changes.
5. **Minimum at bootstrap** — Defer non-essential artifacts; record in bootstrap report.
6. **Documentation ≠ artifacts** — Govern both; do not conflate ([ADR-0006](../Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)).

## Phase 1 — Inspect Repository

Before any EDF structure is created:

| Action | Requirement |
|---|---|
| List top-level files and directories | Required |
| Identify existing documentation | Required |
| Identify engineering artifacts (CAD, schematics, firmware, datasets) | Required |
| Note historical or founding documents at non-standard paths | Required |
| Record preservation constraints | Required |

**Output:** Document mapping table (feeds `EDF_BOOTSTRAP_REPORT.md`).

### Inspect-first rules

- Never delete, overwrite, or relocate existing project-owned files without explicit human approval.
- Founding documents (for example `CRA-0000.md` pattern) may remain at root with navigation links added.
- Engineering artifacts remain in project-appropriate locations unless human approves relocation.

## Phase 2 — Establish Project Engineering Context

Characterize the project using four composable dimensions ([ADR-0005](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md)):

| Dimension | Examples |
|---|---|
| **Repository role** | `engineering-project`, `architecture-specification-repository` |
| **Disciplines** | `electronics`, `software-engineering`, `mechanical-engineering` (zero or more) |
| **Activities** | `research`, `development`, `validation` (zero or more) |
| **Extensions** | Project-specific additions not covered by capabilities |

### Signal sources (priority order)

1. Explicit human declaration
2. Existing `edf-project-context.yaml` or `edf-adoption.yaml`
3. `BOOTSTRAP_CONTEXT.md` at project root ([template](../Templates/Bootstrap_Context_Template.md))
4. Repository evidence (file types, folders, README)
5. Human description when ambiguous

### Unknown discipline path (Q6)

When no discipline capability matches:

1. Set disciplines to human-provided labels or `unknown`.
2. Bootstrap with **EDF Core only** — this is normal, not degraded.
3. Document project extensions in an ADR.
4. Record `edf-project-context.yaml` with `extensions` block.
5. Record `edf-project-context.yaml` with `extensions` block.
6. Point the adopter to [Capability Contribution Playbook](Capability_Contribution_Playbook.md) when extensions may be reusable (generated `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` includes this section for new bootstraps).

## Phase 3 — Resolve Applicable Capabilities

1. Read [capabilities/index.yaml](../../capabilities/index.yaml).
2. Match discipline and activity capabilities where available.
3. Apply repository role capability (for example `asr`) when confirmed.
4. Compose capability set; record in `edf-project-context.yaml`.
5. **Propose full plan to human and wait for confirmation.**

Legacy `profile: core` or `profile: software-engineering` in `edf-adoption.yaml` remains supported. Map to capability composition per [software-engineering capability](../../capabilities/software-engineering/capability.yaml).

## Phase 4 — Human Confirmation Gate

AI MUST obtain human confirmation before:

- Running bootstrap scripts
- Creating directories beyond what scripts generate
- Relocating any existing file
- Declaring ASR repository role

Present: repository role, disciplines, activities, selected capabilities, preservation decisions, and deferred artifacts.

## Phase 5 — Bootstrap Minimum Structure

From EDF clone path:

```bash
./scripts/adopt-edf.sh bootstrap [--profile core|software-engineering] "/path/to/project"
```

Default to `--profile core` when discipline is unknown or non-software.

Scripts are **create-only** — they never overwrite existing project files.

After scripts:

1. Apply capability structure hints (create-if-missing only).
2. Customize `PROJECT_CHARTER.md`, `PROJECT_INDEX.md`, `README.md`.
3. Add domain README stubs for any project extensions.
4. Do not place engineering artifacts under `docs/` by default.

## Phase 6 — Validate

```bash
./scripts/adopt-edf.sh validate "/path/to/project"
```

Compare scores to [Adopter Conformance Tiers](../Development/Adopter_Conformance_Tiers.md) target (Bootstrap tier minimum for day one).

## Phase 7 — Record Bootstrap Report

Copy [EDF Bootstrap Report Template](../Templates/EDF_Bootstrap_Report_Template.md) to project root as `EDF_BOOTSTRAP_REPORT.md`.

Record:

- Document and artifact mappings
- Deferred artifacts with rationale
- Validation summary
- Feedback for EDF
- Capability gaps discovered

## Project Context File

Write `edf-project-context.yaml` at project root (schema: [capabilities/project-context.schema.yaml](../../capabilities/project-context.schema.yaml)):

```yaml
repository_role: engineering-project

disciplines:
  - electronics

activities:
  - research
  - validation

authority:
  governed_scope: "Description of what this repository governs"
  decision_authority: "Role or person"

capabilities:
  - electronics
  - research

extensions: []
```

## Validation Gates

| Gate | Criterion |
|---|---|
| G1 | Bootstrap scripts exit successfully |
| G2 | Structure score ≥ 80% (Bootstrap tier) |
| G3 | CHARTER and INDEX describe actual project |
| G4 | README links to PROJECT_INDEX |
| G5 | `EDF_BOOTSTRAP_REPORT.md` complete |
| G6 | Human confirmed project context before bootstrap |

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [EDF AI Bootstrap Entry](EDF_AI_Bootstrap_Entry.md)
- [Bootstrap Playbook](Bootstrap_Playbook.md)
- [Bootstrap Guide](../Development/Bootstrap_Guide.md)
- [General Engineering Project Model](../Architecture/General_Engineering_Project_Model.md)
