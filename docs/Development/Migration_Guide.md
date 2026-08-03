# Migration Guide

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Migration Guide

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Existing repositories adopting EDF incrementally
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This guide is the phased playbook for migrating an existing repository to EDF. It covers assessment, gap identification, planning, incremental migration, and validation — without requiring a big-bang reorganization.

For bootstrap of empty or new repositories, see [Bootstrap Guide](Bootstrap_Guide.md).

## Migration Philosophy

- **Incremental** — migrate documents as they are updated, not all at once.
- **Conservative** — bootstrap and planning tools never delete or overwrite existing files.
- **Human review** — automated recommendations are advisory; filenames alone are not sufficient to migrate content.
- **Preserve history** — archive superseded material; do not delete without verification.

## Prerequisites

1. Clone the [Engineering Documentation Framework](https://github.com/edbecnel/Engineering-Documentation-Framework) repository locally.
2. Run `chmod +x scripts/*.sh` in the EDF clone (Unix / macOS / Linux).
3. Identify your project root path.
4. Optional: copy [edf-adoption.yaml.example](../../scripts/edf-adoption.yaml.example) to your project as `edf-adoption.yaml`.

## Phased Migration Timeline

| Phase | Focus | Typical duration | Target tier |
|-------|-------|------------------|-------------|
| **Phase 1 — Structure** | Bootstrap folders, local adoption guide | Day 1 | Bootstrap |
| **Phase 2 — Navigation** | PROJECT_INDEX, README links, migrate obvious docs | Week 1–2 | Navigable |
| **Phase 3 — Content** | Migrate legacy docs by domain; split AI_WORKFLOW | Weeks 2–6 | Navigable → Governed |
| **Phase 4 — Governance** | Metadata, ownership, review dates on key docs | Ongoing | Governed |
| **Phase 5 — Parity** | Full handbook depth, profile specs (optional) | As needed | Reference Parity |

Phases may overlap. Do not block development waiting for full migration.

## End-to-End Migration Workflow

### Phase 1 — Structure (assess and bootstrap)

```bash
# From your local EDF clone
./scripts/create_canonical_structure.sh "/path/to/existing/project"
./scripts/generate_documentation_skeleton.sh "/path/to/existing/project"
./scripts/analyze_project_structure.sh "/path/to/existing/project"
```

Review output for missing directories, stray Markdown, and retired `AI_WORKFLOW.md`.

### Phase 2 — Plan (identify gaps)

```bash
./scripts/plan_documentation_migration.sh --output "/path/to/existing/project/MIGRATION_PLAN.md" "/path/to/existing/project"
```

Or use the unified wrapper:

```bash
./scripts/adopt-edf.sh migrate "/path/to/existing/project"
```

Review every recommendation in `MIGRATION_PLAN.md`. The planner uses filename heuristics — confirm domain fit before moving files.

### Phase 3 — Migrate incrementally

For each document you approve for migration:

1. Confirm the document is still current.
2. Move or copy to the recommended `docs/` domain (prefer `git mv` to preserve history).
3. Update breadcrumbs and relative links in the moved file.
4. Update inbound links from other documents.
5. Leave a short migration note at the old location, or archive superseded content per [archive/README.md](../../archive/README.md).

Re-run analysis after each batch:

```bash
./scripts/run_conformance_validation.sh "/path/to/existing/project"
```

### Phase 4 — Validate success

Compare Framework Advisor scores against [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md). Migration is **successful for your chosen tier** when scores meet tier targets and navigation works for contributors.

## Migration Readiness Checklist

Complete before starting Phase 3 (content migration):

- [ ] Project owner identified
- [ ] Local EDF clone available for scripts
- [ ] Bootstrap scripts run without errors
- [ ] `MIGRATION_PLAN.md` generated and reviewed
- [ ] Legacy `documents/` strategy decided (see below)
- [ ] `AI_WORKFLOW.md` split plan documented (if applicable)
- [ ] `ADOPTION_STATUS.md` tracking migration phase

## Decision Trees

### Should this document migrate?

```text
Is the document still authoritative and current?
├─ No → Archive to archive/ with header and migration note
└─ Yes
     ├─ Does filename/planner suggest a clear docs/ domain?
     │    ├─ Yes → Migrate; update links
     │    └─ No → Leave in place until purpose is clear; add to tasks/
     └─ Is it a duplicate of existing docs/ content?
          ├─ Yes → Archive duplicate; update links to canonical doc
          └─ No → Migrate to recommended domain
```

### Legacy `documents/` folder

```text
documents/ exists in project?
├─ Bootstrap leaves it untouched (always)
└─ Coexistence strategy:
     ├─ Leave in place — PDF exports, client deliverables, non-Markdown assets
     ├─ Migrate selectively — Markdown notes with clear domain fit move to docs/
     └─ Retire eventually — link from PROJECT_INDEX to any remaining legacy content;
          archive when superseded by docs/ equivalents
```

Framework Advisor reports `documents/` as informational only; it is not an error.

### `AI_WORKFLOW.md` handling

Do **not** move `AI_WORKFLOW.md` unchanged to `docs/AI/`. **Split** content across the modular AI handbook. See section mapping in [Migration Playbook](../AI/Migration_Playbook.md).

Delete the legacy file only after verifying no unique content or references were lost.

### `/doc/` vs `docs/`

Non-canonical paths like `doc/` are flagged by Framework Advisor. Treat as legacy — migrate content into `docs/` domains; do not rename `doc/` to `docs/` in one step without updating all links.

## Link Update Guidance

When moving a document:

1. Search the repository for links to the old path.
2. Update breadcrumb lines at the top of the moved file.
3. Update `PROJECT_INDEX.md` and domain README indexes.
4. Re-run Framework Advisor to catch broken relative links.

## Brownfield Case Study — Pre-EDF Software Repository

**Starting state (fictional "Recipe Vault" project):**

- Root `README.md` with setup notes only
- Scattered `.md` files: `ARCHITECTURE.md`, `API.md`, `DEPLOY.md` at repo root
- `/doc/` folder with older notes
- `documents/` with PDF exports and meeting notes
- Monolithic `AI_WORKFLOW.md`
- No `PROJECT_INDEX.md`, no governance metadata, no ADRs

**Phase 1 — Structure (Day 1):**

```bash
./scripts/adopt-edf.sh bootstrap "/projects/recipe-vault"
```

Result: canonical `docs/` tree, `ENGINEERING_DOCUMENTATION_FRAMEWORK.md`, skeleton `PROJECT_INDEX` and `PROJECT_CHARTER`.

**Phase 2 — Plan (Day 1–2):**

```bash
./scripts/adopt-edf.sh migrate "/projects/recipe-vault"
```

`MIGRATION_PLAN.md` recommends:

| Source | Recommendation |
|--------|----------------|
| `ARCHITECTURE.md` | `docs/Architecture/ARCHITECTURE.md` |
| `API.md` | `docs/API/API.md` |
| `DEPLOY.md` | `docs/Deployment/DEPLOY.md` |
| `AI_WORKFLOW.md` | SPLIT → `docs/AI/` handbook modules |
| `doc/notes.md` | `docs/Reference/notes.md` (human confirms) |
| `documents/` | No action (legacy assets) |

**Phase 3 — Content (Week 1–3):**

- `git mv` root architecture/API/deploy docs into `docs/` domains
- Split `AI_WORKFLOW.md` per [Migration Playbook](../AI/Migration_Playbook.md) mapping table
- Fill `PROJECT_CHARTER` and `PROJECT_INDEX`
- Leave `documents/` in place; add PROJECT_INDEX note linking to it

**Phase 4 — Validate (Week 3):**

Conformance report: Structure 92%, Navigation 78%, AI 45%, Governance 30%. Team targets **Navigable** tier first; governance backfill continues incrementally.

**Outcome:** Structural migration complete in one week. Content and governance mature over subsequent sprints without blocking feature work.

## AI-Assisted Migration

For AI prompts per phase, review gates, and `AI_WORKFLOW.md` section mapping, see [Migration Playbook](../AI/Migration_Playbook.md).

## Unified Orchestration

```bash
./scripts/adopt-edf.sh bootstrap "/path/to/project"   # Phase 1
./scripts/adopt-edf.sh migrate "/path/to/project"     # Phase 2 planning
./scripts/adopt-edf.sh validate "/path/to/project"     # Conformance report
```

## Parent

- [Development](README.md)

## Related Documents

- [Bootstrap Guide](Bootstrap_Guide.md)
- [Migration Playbook](../AI/Migration_Playbook.md)
- [Documentation Migration Assistant](Documentation_Migration_Assistant.md)
- [Adopter Conformance Tiers](Adopter_Conformance_Tiers.md)
- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [archive/README.md](../../archive/README.md)
