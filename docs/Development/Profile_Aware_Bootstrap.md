# Profile-Aware Bootstrap

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Profile-Aware Bootstrap

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF adoption with domain profile selection
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document describes profile-aware bootstrap and validation introduced post-v1.0 planning per [ADR-0002](../Architecture/ADRs/ADR-0002-Domain-Profile-Specification.md). It allows adopters to select **EDF Core** structure without Software Engineering profile folders when those paths do not apply.

## Supported Profiles

| Profile ID | Display name | Use when |
|------------|--------------|----------|
| `software-engineering` | Software Engineering | Software projects (default) |
| `core` | EDF Core only | Non-software disciplines, or Core-only adoption |

Additional profiles (for example music education) will ship with their own manifests in future releases.

## Declaring a Profile

### Option 1 — Command-line flag

```bash
./scripts/create_canonical_structure.sh --profile core "/path/to/project"
./scripts/adopt-edf.sh bootstrap --profile core "/path/to/project"
```

### Option 2 — `edf-adoption.yaml` in project root

Copy [edf-adoption.yaml.example](../../scripts/edf-adoption.yaml.example) to your project:

```yaml
profile: core
project_name: My Research Project
```

Scripts read `profile:` from this file when no `--profile` flag is passed.

## Directory Sets by Profile

### EDF Core (`core`)

```text
docs/Architecture/
docs/Architecture/ADRs/
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

### Software Engineering (`software-engineering`)

Core directories plus:

```text
docs/Developer_Handbook/
docs/API/
docs/Database/
docs/Deployment/
```

## Framework Advisor Behavior

When `edf-adoption.yaml` declares `profile: core`, Framework Advisor:

- Does **not** penalize missing Software Engineering profile directories
- Does **not** require `docs/Developer_Handbook/`, `docs/API/`, `docs/Database/`, or `docs/Deployment/`
- Still validates Core structure, navigation, and governance expectations appropriate to adopters

When `profile: software-engineering` (default), all profile directories are required as today.

## Adoption Guides by Profile

| Profile | Bootstrap | Migration |
|---------|-----------|-----------|
| Software Engineering | [Bootstrap Guide](Bootstrap_Guide.md) | [Migration Guide](Migration_Guide.md) |
| EDF Core | [Bootstrap Guide](Bootstrap_Guide.md) — use `--profile core` | [Migration Guide](Migration_Guide.md) — ignore software-specific planner suggestions if not applicable |

## Future Profiles

Profile manifests will define `required_dirs`, `recommended_dirs`, and profile-specific validation per ADR-0002. Until additional profiles ship, use `core` and add project-specific domains under `docs/` with documented rationale in an ADR.

## Parent

- [Development](README.md)

## Related Documents

- [ADR-0002 — Domain Profile Specification](../Architecture/ADRs/ADR-0002-Domain-Profile-Specification.md)
- [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md)
- [Bootstrap Guide](Bootstrap_Guide.md)
