# Bootstrap Guide

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Bootstrap Guide

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** New repositories and greenfield EDF adoption
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This guide is the single ordered checklist for bootstrapping a new EDF-compliant repository. It consolidates bootstrap steps that were previously spread across the root README, scripts, and Development domain docs.

**This guide is for framework adoption** — adding EDF structure to a repository. For **contributor environment setup** after adoption, see [First-Time Setup](../Developer_Handbook/00_First_Time_Setup.md).

## Prerequisites

Before running bootstrap scripts:

1. **Clone the EDF repository locally** and keep the path available for conformance validation wrappers.
2. **Make shell scripts executable** (Unix / macOS / Linux):

   ```bash
   chmod +x /path/to/Engineering-Documentation-Framework/scripts/*.sh
   ```

3. **Choose your greenfield pattern** (see [Greenfield Pattern Decision Tree](#greenfield-pattern-decision-tree)).
4. **Optional:** Copy [edf-adoption.yaml.example](../../scripts/edf-adoption.yaml.example) to your project root as `edf-adoption.yaml` to declare profile and project metadata.

## Greenfield Pattern Decision Tree

```text
Starting a new project?
│
├─ Use EDF as the starting template (fork/copy this repo, rename, customize)
│     → Fork or copy Engineering-Documentation-Framework
│     → Rename repository; replace PROJECT_CHARTER, PROJECT_INDEX, handbook content
│     → Skip create_canonical_structure (structure already exists)
│
└─ Adopt EDF into a separate empty or existing repository
      → Create or open your project repository
      → Run bootstrap scripts from your local EDF clone (steps below)
      → Customize generated stubs and copy reference content as needed
```

**Do not conflate these paths.** Forking EDF gives you the full reference implementation. Running bootstrap scripts against another repo creates structure and minimal stubs only.

## Bootstrap Sequence

Run these commands from your **local EDF clone**, passing your **target project root** explicitly.

### Step 1 — Create canonical structure

```bash
./scripts/create_canonical_structure.sh "/path/to/your/project"
```

With profile selection (see [Profile-Aware Bootstrap](Profile_Aware_Bootstrap.md)):

```bash
./scripts/create_canonical_structure.sh --profile software-engineering "/path/to/your/project"
```

**Creates:** `docs/` domain folders, `tasks/`, `archive/`, `scripts/`, and `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` (if missing).

**Safety:** Create-only. Never deletes, overwrites, moves, or modifies existing files. Existing `documents/` folders are left untouched.

### Step 2 — Generate documentation skeleton (recommended)

```bash
./scripts/generate_documentation_skeleton.sh "/path/to/your/project"
```

**Creates:** `PROJECT_INDEX.md`, `PROJECT_CHARTER.md`, `ARCHITECTURE_DECISIONS.md`, domain README stubs, and minimal Developer Handbook entries — only when files do not already exist.

### Step 3 — Establish adoption tracking (recommended)

Copy [ADOPTION_STATUS.md](../Templates/ADOPTION_STATUS_Template.md) to your project root and mark completed phases.

### Step 4 — Baseline conformance analysis

```bash
./scripts/analyze_project_structure.sh "/path/to/your/project"
```

Or save a timestamped report:

```bash
./scripts/run_conformance_validation.sh "/path/to/your/project"
```

Reports are written to `<project>/reports/conformance/`.

### Step 5 — Customize project identity

1. Fill in `PROJECT_CHARTER.md` — mission, scope, stakeholders, constraints.
2. Update `PROJECT_INDEX.md` — status, owners, links to live documents.
3. Update root `README.md` to link to `PROJECT_INDEX.md`.
4. Record your first ADR in `ARCHITECTURE_DECISIONS.md` when you make a significant technical choice.

### Step 6 — Customize profile content (Software Engineering)

The skeleton generator creates **minimal stubs**, not the full reference implementation. Customize or copy:

| Area | Skeleton provides | Full reference parity requires |
|------|-------------------|-------------------------------|
| AI handbook | `docs/AI/README.md` stub | Copy modular handbook from EDF or write project-specific AI docs |
| Developer Handbook | `00_First_Time_Setup`, `01_Development_Environment` stubs | Add Git, coding, testing, release chapters |
| Governance | Not generated | Copy governance docs from EDF templates or adopt incrementally |
| API / Database / Deployment | Domain README stubs | Add project-specific specs as the system grows |

See [Minimum Viable Adoption vs Reference Parity](#minimum-viable-adoption-vs-reference-parity).

### Step 7 — Validate and iterate

Re-run conformance validation after each customization pass. Target the **Bootstrap** tier in [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md) before inviting contributors.

## Unified Orchestration (Optional)

Instead of running individual scripts:

```bash
./scripts/adopt-edf.sh bootstrap "/path/to/your/project"
```

See [scripts/README.md](../../scripts/README.md) for `migrate` and `validate` subcommands.

## Minimum Viable Adoption vs Reference Parity

| Level | What you have | Suitable when |
|-------|---------------|---------------|
| **Minimum viable** | Canonical folders, `ENGINEERING_DOCUMENTATION_FRAMEWORK.md`, `PROJECT_INDEX`, `PROJECT_CHARTER`, domain README stubs | Early greenfield; team will grow docs with the project |
| **Navigable** | Above + working cross-links, README points to PROJECT_INDEX, stray Markdown resolved | Team onboarding begins |
| **Governed** | Above + governance metadata on key documents | Long-lived project with review expectations |
| **Reference parity** | Full AI handbook, Developer Handbook, governance domain, profile specs | You want EDF reference-equivalent documentation depth |

Adopters are **not** expected to reach reference parity on day one. See [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md) for score targets.

## Bootstrap Complete — Done Criteria

Bootstrap is **complete** when:

- [ ] Canonical structure exists (`docs/`, `tasks/`, `archive/`, `scripts/`)
- [ ] `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` exists at project root
- [ ] `PROJECT_CHARTER.md` and `PROJECT_INDEX.md` are filled in for your project
- [ ] Root `README.md` links to `PROJECT_INDEX.md`
- [ ] Framework Advisor reports no missing canonical directories
- [ ] `ADOPTION_STATUS.md` (if used) marks Bootstrap phase complete

## AI-Assisted Bootstrap

For AI-specific decision trees, file copy rules, and prompt templates, see [Bootstrap Playbook](../AI/Bootstrap_Playbook.md).

## v1.0 Profile Note

Bootstrap currently defaults to the **Software Engineering** profile (all profile folders created). Use `--profile core` for Core-only structure, or see [Profile-Aware Bootstrap](Profile_Aware_Bootstrap.md).

## Parent

- [Development](README.md)

## Related Documents

- [Migration Guide](Migration_Guide.md)
- [Bootstrap Playbook](../AI/Bootstrap_Playbook.md)
- [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md)
- [Documentation Generation Engine](Documentation_Generation_Engine.md)
- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [scripts/README.md](../../scripts/README.md)
