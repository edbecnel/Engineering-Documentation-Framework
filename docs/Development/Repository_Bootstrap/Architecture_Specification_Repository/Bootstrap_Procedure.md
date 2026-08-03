# Architecture Specification Repository Bootstrap Procedure

[Home](../../../../README.md) › [Project Index](../../../../PROJECT_INDEX.md) › [Development](../../README.md) › [Repository Bootstrap](../README.md) › [Architecture Specification Repository](README.md) › Bootstrap Procedure

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** New and existing Architecture Specification Repositories
> **Last Reviewed:** 2026-08-03
> **Authoritative:** Yes

## Purpose

EDF provides an **Architecture Specification Repository bootstrap procedure** for repositories whose primary engineering artifact is an adoptable architecture, methodology, protocol, framework, specification, standard, or engineering discipline.

This procedure is **invoked intentionally**. There is no machine-readable repository classification field. Engineers or AI assistants select this procedure when bootstrapping an ASR.

## Prerequisites

1. Clone the [Engineering Documentation Framework](https://github.com/edbecnel/Engineering-Documentation-Framework) locally.
2. Make shell scripts executable: `chmod +x /path/to/Engineering-Documentation-Framework/scripts/*.sh`
3. Read [Guidance](Guidance.md) for domain interpretations and historical vs normative rules.

## When to Use This Procedure

Use this procedure when bootstrapping repositories such as CRA, SIP, or similar architecture-specification efforts.

For general product or system repositories, use the [Bootstrap Guide](../../Bootstrap_Guide.md) instead.

## Profile Selection

Use **`profile: core`** in `edf-adoption.yaml`:

```yaml
profile: core
project_name: Canonical Representation Architecture
```

Do not require software-specific domains unless an optional non-canonical reference implementation warrants them.

## Procedure — Existing Repository

For repositories with git history, remotes, foundational documents, or committed historical records:

| Step | Action |
|---|---|
| 1 | **Inspect** — inventory repository: git history, remotes, existing documents, naming conventions |
| 2 | **Preserve** — never delete, overwrite, or rewrite historical artifacts |
| 3 | **Confirm ASR intent** — team is bootstrapping an Architecture Specification Repository (procedural; no config field) |
| 4 | **Apply EDF Core** — `./scripts/create_canonical_structure.sh --profile core "/path/to/repo"` |
| 5 | **Apply ASR guidance** — create missing Core READMEs per [Guidance](Guidance.md); do not mandate new permanent subdomains |
| 6 | **Map existing documents** — discovery records → `docs/Architecture/` with document type metadata; normative specs → `docs/Specifications/`; record mappings in bootstrap report |
| 7 | **Create missing bootstrap artifacts** — create-only; see [Validation Checklist](Validation_Checklist.md) |
| 8 | **Record deferred items** — in `ASR_BOOTSTRAP_REPORT.md`; do not generate empty placeholder bureaucracy |
| 9 | **Validate** — [Validation Checklist](Validation_Checklist.md) + Framework Advisor (`profile: core`) |
| 10 | **Report gaps** — document items requiring human decision or EDF feedback |

### Relocating historical documents

If moving a discovery record (e.g., `CRA-0000`):

- Use `git mv` to preserve history when appropriate
- Add redirect or mapping note if needed
- Record the decision in `ASR_BOOTSTRAP_REPORT.md`
- **Never rewrite content**

Preserving the original path with documented mapping is acceptable when relocation risk outweighs benefit.

## Procedure — New Repository

Same sequence. Step 6 (mapping) is minimal.

## Safety Guarantees

Per [Framework Generation Principles](../../../Architecture/Framework_Generation_Principles.md):

- Create missing content only
- Never overwrite user-authored or historical content
- Never delete automatically

## Scripts

v1 uses existing scripts with `--profile core` only. No ASR-specific script flags. ASR structure is applied per this documented procedure.

Optional unified orchestration:

```bash
./scripts/adopt-edf.sh bootstrap --profile core "/path/to/repo"
```

Then complete ASR-specific steps manually or via [ASR Bootstrap Playbook](../../../AI/ASR_Bootstrap_Playbook.md).

## AI-Assisted Bootstrap

See [ASR Bootstrap Playbook](../../../AI/ASR_Bootstrap_Playbook.md).

## Parent

- [Architecture Specification Repository](README.md)

## Related Documents

- [Guidance](Guidance.md)
- [Validation Checklist](Validation_Checklist.md)
- [Bootstrap Guide](../../Bootstrap_Guide.md)
- [Profile-Aware Bootstrap](../../Profile_Aware_Bootstrap.md)
