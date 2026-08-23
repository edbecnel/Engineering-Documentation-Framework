# Profile-Aware and Capability-Aware Bootstrap

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Profile-Aware Bootstrap

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF adoption with legacy profiles and composable capabilities
> **Last Reviewed:** 2026-08-23
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document describes bootstrap and validation for EDF adopters. It covers:

1. **Legacy profiles** (`core`, `software-engineering`) — operational in bootstrap scripts today
2. **Composable capabilities** — multi-discipline model per [ADR-0005](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md)
3. **Project context** — `edf-project-context.yaml` for repository role, disciplines, and activities

**Canonical AI entry point:** [EDF AI Bootstrap Entry](../AI/EDF_AI_Bootstrap_Entry.md)

## Legacy Profiles (Scripts)

| Profile ID | Display name | Use when |
|------------|--------------|----------|
| `core` | EDF Core only | Default when ambiguous; non-software disciplines; unknown disciplines |
| `software-engineering` | Software Engineering | Software projects |

Default when no config exists: **`core`** (not `software-engineering`).

### Declaring a legacy profile

```bash
./scripts/adopt-edf.sh bootstrap --profile core "/path/to/project"
```

Or in `edf-adoption.yaml`:

```yaml
profile: core
project_name: My Research Project
```

## Composable Capabilities

Capabilities replace monolithic domain profiles. See [capabilities/index.yaml](../../capabilities/index.yaml).

| Type | Examples |
|---|---|
| Discipline | `software-engineering`, `electronics` (community) |
| Activity | `development`, `research` (community) |
| Repository role | `asr` |

Declare capabilities in `edf-project-context.yaml`:

```yaml
repository_role: engineering-project
disciplines: [electronics]
activities: [research, validation]
legacy_profile: core
capabilities:
  - electronics
  - research
```

Scripts merge capability `documentation_dirs` into required structure when manifests are found in the EDF clone `capabilities/` directory.

## EDF Core Directories

```text
docs/Architecture/
docs/Architecture/ADRs/
docs/Architecture/Watch_Items/
docs/AI/
docs/Development/
docs/Governance/
docs/Specifications/
docs/User_Guides/
docs/Reference/
docs/Templates/
tasks/
archive/
scripts/
```

## Software Engineering (Legacy Profile or Capability)

Core directories plus:

```text
docs/Developer_Handbook/
docs/API/
docs/Database/
docs/Deployment/
```

## Framework Advisor Behavior

- `profile: core` — does not require software profile directories
- Reads `edf-project-context.yaml` for capability composition when present
- Recommends project context file for Core adopters
- Warns when extensions lack ADR documentation

## Multi-Discipline Bootstrap

| Step | Document |
|---|---|
| AI entry | [EDF AI Bootstrap Entry](../AI/EDF_AI_Bootstrap_Entry.md) |
| Normative contract | [Universal Bootstrap Specification](../AI/Universal_Bootstrap_Specification.md) |
| Engineering concepts | [General Engineering Project Model](../Architecture/General_Engineering_Project_Model.md) |
| Contribute capabilities | [EDF Capability Contribution Guide](EDF_Capability_Contribution_Guide.md) |

## Parent

- [Development](README.md)

## Related Documents

- [ADR-0005 — Project Classification and Capabilities](../Architecture/ADRs/ADR-0005-Project-Classification-and-Capabilities.md)
- [ADR-0002 — Domain Profile Specification](../Architecture/ADRs/ADR-0002-Domain-Profile-Specification.md) (historical; superseded for new capabilities)
- [Bootstrap Guide](Bootstrap_Guide.md)
- [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md)
