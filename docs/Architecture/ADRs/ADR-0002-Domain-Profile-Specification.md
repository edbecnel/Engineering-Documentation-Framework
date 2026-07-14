# ADR-0002-Domain-Profile-Specification

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0002 Domain Profile Specification

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-07-15 |
| **Decision Makers** | Ed Becnel |
| **Supersedes** | None |
| **Superseded By** | None |
| **Related** | [ADR-0001 — Domain Profiles](ADR-0001-Domain-Profiles.md) |

---

# Context

[ADR-0001](ADR-0001-Domain-Profiles.md) accepts a layered architecture: **EDF Core** + optional **Domain Profiles** + project customizations.

This ADR defines the **specification outline** for Domain Profiles. It is documentation only. Analyzer, bootstrap, and profile packaging changes are deferred until after EDF v1.0.

---

# Extraction Principle (Core Requirement)

**Anything software engineering-specific in the current EDF specification must move to the Software Engineering profile.**

Non-software domains must not be forced to satisfy requirements that do not apply to them. The fix is **extraction**, not **exceptions**:

- A music education project must not be scored against missing `docs/API`, `docs/Database`, or `docs/Deployment`.
- Bootstrap must not create software-only folders for every adopting project once profiles are implemented.
- Core prose must describe engineering documentation generically; software detail belongs in the Software Engineering profile.

**Rule:** If a requirement only makes sense for software projects, it does not belong in Core.

---

# Problem

Today, EDF treats software-specific directories and guidance as universal Core requirements. Adopters in other disciplines (for example, Philippine Marching Fusion for music education) receive warnings or must force-fit content into software folders.

The Framework Advisor, bootstrap scripts, information architecture, and README positioning all assume a software project unless the adopter ignores irrelevant checks.

---

# Decision (Outline Only)

Domain Profiles shall be **optional**, **declarative**, and **validated additively**:

1. **Core validation** applies to all projects regardless of profile.
2. **Profile validation** applies only when a project declares a profile.
3. **Default for v1.0 adopters** remains the Software Engineering reference implementation in this repository.
4. **Post-v1.0** removes software-specific paths from Core `required_dirs`; only the Software Engineering profile manifest requires them.

This ADR does **not** implement profiles. It records the intended specification so v1.0 documentation can describe the boundary correctly.

---

# Proposed Profile Manifest (Outline)

Future implementation will use a machine-readable manifest (exact format TBD). Conceptual fields:

| Field | Purpose |
|---|---|
| `profile_id` | Stable identifier (for example `software-engineering`, `music-education`) |
| `profile_version` | Semver for profile spec changes |
| `display_name` | Human-readable profile name |
| `required_dirs` | Directories this profile requires beyond Core |
| `recommended_dirs` | Optional but encouraged profile directories |
| `required_files` | Profile-specific files (templates, handbook entries) |
| `validation_rules` | Profile-specific Framework Advisor checks |
| `extends` | Optional parent profile (deferred — single profile per project initially) |

Example (illustrative, not yet implemented):

```yaml
profile_id: software-engineering
display_name: Software Engineering
required_dirs:
  - docs/API
  - docs/Database
  - docs/Deployment
  - docs/Developer_Handbook
```

```yaml
profile_id: music-education
display_name: Music Education
required_dirs:
  - scores
  - audio
  - references
```

Projects declare their profile in `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` (field name TBD, for example `profile: software-engineering`).

---

# Proposed Validation Model (Outline)

```text
Framework Advisor
    │
    ├── Core checks (all projects)
    │       governance, navigation, AI handbook, generic domains
    │
    └── Profile checks (declared profile only)
            Software Engineering → API, Database, Deployment, Developer Handbook
            Music Education → scores, audio, curriculum paths
```

A music project with `profile: music-education` passes Core checks without software directories. A software project with `profile: software-engineering` runs Core + software profile checks.

---

# Inventory: Software-Specific Items Currently in Core

The following items are **incorrectly treated as universal Core requirements** today. Post-v1.0, they move to the **Software Engineering profile** manifest and documentation.

## Framework Advisor `required_dirs`

Source: [scripts/analyze_project_structure.sh](../../../scripts/analyze_project_structure.sh), [scripts/analyze_project_structure.ps1](../../../scripts/analyze_project_structure.ps1)

| Path | Current role | Future home |
|---|---|---|
| `docs/API` | Required for all projects | Software Engineering profile |
| `docs/Database` | Required for all projects | Software Engineering profile |
| `docs/Deployment` | Required for all projects | Software Engineering profile |
| `docs/Developer_Handbook` | Required for all projects | Software Engineering profile |

## Bootstrap `DIRS`

Source: [scripts/create_canonical_structure.sh](../../../scripts/create_canonical_structure.sh), [scripts/create_canonical_structure.ps1](../../../scripts/create_canonical_structure.ps1)

Creates `docs/API`, `docs/Database`, `docs/Deployment`, and `docs/Developer_Handbook` for every adopting project regardless of discipline.

## Documentation skeleton generator

Source: [scripts/generate_documentation_skeleton.sh](../../../scripts/generate_documentation_skeleton.sh), [scripts/generate_documentation_skeleton.ps1](../../../scripts/generate_documentation_skeleton.ps1)

Generates domain README files and starter content for API, Database, Deployment, and Developer Handbook as if universal.

## Information architecture

Source: [Documentation_Information_Architecture.md](../Documentation_Information_Architecture.md)

Describes API, Database, Deployment, and Developer Handbook as standard documentation domains without distinguishing Core from Software Engineering profile.

## Templates (software-specific)

Source: [docs/Templates/](../../Templates/)

| Template | Future home |
|---|---|
| `API_Specification_Template.md` | Software Engineering profile |
| `Database_Design_Template.md` | Software Engineering profile |
| `Development_Environment_Template.md` | Software Engineering profile |
| `First_Time_Setup_Template.md` | Software Engineering profile (or Core contributor handbook + profile supplement) |
| `Developer_Guide_Template.md` | Software Engineering profile |

Generic templates (ADR, charter, feature spec, user guide, project index, handover, release notes, architecture document) remain in Core.

## README and positioning prose

Source: [README.md](../../../README.md)

- Describes framework as for "software projects" and "software engineering teams"
- Repository structure diagram lists API, Database, Deployment, Developer Handbook as universal
- Bootstrap instructions assume "existing software project"
- Benefits table references Developer Handbook and Deployment as universal deliverables

## Migration assistant routing

Source: [scripts/plan_documentation_migration.sh](../../../scripts/plan_documentation_migration.sh), [scripts/plan_documentation_migration.ps1](../../../scripts/plan_documentation_migration.ps1)

Routes API-, database-, deployment-, and developer-handbook-like filenames to software domains by default.

## Domain README cross-links

Multiple domain README files under `docs/API/`, `docs/Database/`, `docs/Deployment/`, `docs/Developer_Handbook/`, `docs/Specifications/`, and `docs/User_Guides/` assume software workflows (CI/CD, API contracts, coding standards).

## What stays in Core

| Layer | Examples |
|---|---|
| Root documents | `README.md`, `PROJECT_INDEX.md`, `PROJECT_CHARTER.md`, `ARCHITECTURE_DECISIONS.md`, `CHANGELOG.md` |
| Governance | `docs/Governance/` |
| Architecture | `docs/Architecture/`, ADRs, documentation information architecture |
| Specifications | `docs/Specifications/` (requirements apply across disciplines) |
| AI handbook | `docs/AI/` (cross-domain; software-specific tool detail may move to profile later) |
| Reference | `docs/Reference/` |
| Generic templates | `docs/Templates/` (non-software templates) |
| User guides | `docs/User_Guides/` (end-user docs apply across disciplines) |
| Framework adoption engineering | `docs/Development/` |
| Operational dirs | `tasks/`, `archive/`, `scripts/`, `reports/` |

---

# v1.0 Interim Position

EDF v1.0 ships as the **Software Engineering reference implementation**. This repository may still contain `docs/API`, `docs/Database`, `docs/Deployment`, and `docs/Developer_Handbook` while self-hosting.

The **specification** must document that these are profile requirements, not Core requirements. Framework Advisor behavior is unchanged until post-v1.0 profile implementation.

---

# Implementation Deferral

The following are explicitly **out of scope until after EDF v1.0**:

- Profile manifest file format and parser
- `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` profile declaration field
- Removing software paths from Core `required_dirs`
- Profile-aware Framework Advisor
- Bootstrap `--profile` flag
- Profile packaging (folders or separate repos)
- Music Education profile pilot implementation

Document the boundary now; implement profiles in a post-v1.0 phase per [ADR-0001](ADR-0001-Domain-Profiles.md).

---

# Consequences

**Positive:**

- Clear path for non-software adopters without forking the framework
- Inventory identifies exactly what must move before profile-aware validation
- v1.0 roadmap unchanged

**Risks:**

- Until implementation, Framework Advisor still requires software dirs for all projects
- Profile manifest format may change before implementation

---

# Future Work

- Finalize manifest schema and validation rules
- Implement Software Engineering profile (extract current structure from Core)
- Implement Music Education profile pilot from PH Marching Fusion learnings
- Profile discovery and registration (future ADR)

---

# Parent

- [Architecture Decision Records](README.md)

## Related Documents

- [ADR-0001 — Domain Profiles](ADR-0001-Domain-Profiles.md)
- [Documentation Information Architecture](../Documentation_Information_Architecture.md)
- [Architecture Decisions](../../../ARCHITECTURE_DECISIONS.md)
