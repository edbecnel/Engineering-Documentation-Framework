# Adopter Conformance Tiers

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Adopter Conformance Tiers

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Adopting projects (not EDF self-hosting)
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document defines **adopter conformance tiers** with Framework Advisor score targets. These tiers replace EDF self-hosting scores (~83% overall) as adoption success criteria.

Adopters are not expected to match EDF reference implementation scores on day one.

## Tiers Overview

| Tier | Description | When to target |
|------|-------------|----------------|
| **Bootstrap** | Canonical structure and project identity in place | End of bootstrap (day 1) |
| **Navigable** | Contributors and AI can find authoritative docs | Before team onboarding |
| **Governed** | Key documents have metadata and review ownership | Before external release or audit |
| **Reference Parity** | Full handbook and profile depth comparable to EDF reference | Optional; mature long-lived projects |

## Score Targets

Scores come from `analyze_project_structure.sh` / Framework Advisor output.

| Tier | Overall | Structure | Navigation | AI | Governance |
|------|---------|-----------|------------|-----|------------|
| **Bootstrap** | ≥ 50% | ≥ 80% | ≥ 40% | ≥ 10% | ≥ 20% |
| **Navigable** | ≥ 65% | ≥ 90% | ≥ 70% | ≥ 30% | ≥ 40% |
| **Governed** | ≥ 75% | ≥ 95% | ≥ 80% | ≥ 60% | ≥ 60% |
| **Reference Parity** | ≥ 85% | ≥ 95% | ≥ 85% | ≥ 90% | ≥ 75% |

**Profile note:** Projects using `--profile core` are not scored against missing Software Engineering profile directories. See [Profile-Aware Bootstrap](Profile_Aware_Bootstrap.md).

## Tier Requirements (Checklist)

### Bootstrap

- [ ] All required canonical directories exist
- [ ] `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` at project root
- [ ] `PROJECT_CHARTER.md` and `PROJECT_INDEX.md` exist and identify the project
- [ ] Root `README.md` links to `PROJECT_INDEX.md`
- [ ] No retired `AI_WORKFLOW.md` at repository root (or split plan documented)

### Navigable

- [ ] All Bootstrap requirements
- [ ] Domain READMEs link to active documents in each domain
- [ ] Stray Markdown outside canonical locations resolved or tracked in `MIGRATION_PLAN.md`
- [ ] Breadcrumbs present on migrated governed documents
- [ ] `docs/AI/README.md` describes project AI conventions (stub acceptable)

### Governed

- [ ] All Navigable requirements
- [ ] Governance metadata on charter, index, and architecture documents per [Document Metadata Standard](../Governance/Document_Metadata_Standard.md)
- [ ] Named owners on authoritative documents
- [ ] `docs/Governance/README.md` or project-specific governance overview exists
- [ ] Modular AI handbook started (at minimum: README, Repository_Workflow, Verification)

### Reference Parity

- [ ] All Governed requirements
- [ ] Full modular AI handbook (all standard handbook documents)
- [ ] Developer Handbook covers setup, environment, Git, coding, testing, releases (Software profile)
- [ ] API, Database, Deployment domains populated when applicable
- [ ] Governance domain aligned with EDF baseline or documented project equivalent

## Measuring Conformance

```bash
/path/to/Engineering-Documentation-Framework/scripts/run_conformance_validation.sh "/path/to/your/project"
```

Reports are saved to `<project>/reports/conformance/`. Compare scores to the tier table above.

Track progress in [ADOPTION_STATUS.md](../Templates/ADOPTION_STATUS_Template.md).

## EDF Self-Hosting vs Adopter Tiers

| | EDF self-hosting | Adopter tiers |
|---|------------------|---------------|
| **Audience** | EDF framework repository maintainers | Projects adopting EDF |
| **Target scores** | High (framework must dogfood) | Tiered; incremental |
| **Governance depth** | Full EDF governance domain required | Incremental adoption acceptable |
| **Command** | `run_self_hosting_validation.sh` | `run_conformance_validation.sh` |

## Parent

- [Development](README.md)

## Related Documents

- [Bootstrap Guide](Bootstrap_Guide.md)
- [Migration Guide](Migration_Guide.md)
- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [Governance Checklist](../Governance/Governance_Checklist.md)
