# Migration Playbook

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › Migration Playbook

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** AI-assisted EDF repository migration
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This playbook enables AI assistants to help migrate existing repositories to EDF incrementally and safely. It supplements the [Migration Guide](../Development/Migration_Guide.md) with prompts per phase, review gates, link-update checklists, and `AI_WORKFLOW.md` section mapping.

## AI Responsibilities During Migration

- Never auto-move files without human approval of each batch
- Run analysis and planning tools read-only first
- Use `git mv` when moving files to preserve history
- Update breadcrumbs and inbound links in complete files
- Split `AI_WORKFLOW.md` — do not move it unchanged
- Leave `documents/` untouched unless human explicitly requests migration from it
- Re-run Framework Advisor after each migration batch

## Phased Prompt Templates

### Phase 1 — Assess and bootstrap

```text
Migrate [project] at [PATH] to EDF incrementally.

EDF clone: [EDF_PATH]

1. Run: [EDF_PATH]/scripts/adopt-edf.sh bootstrap "[PATH]"
2. Run: [EDF_PATH]/scripts/adopt-edf.sh validate "[PATH]"
3. Summarize Framework Advisor findings: stray Markdown, missing dirs, AI_WORKFLOW.md, documents/

Do not move any legacy files yet. Present assessment to human for review.
```

### Phase 2 — Plan

```text
Generate migration plan for [PATH]:
  [EDF_PATH]/scripts/adopt-edf.sh migrate "[PATH]"

Review MIGRATION_PLAN.md. For each recommendation:
- Confirm domain fit (filename heuristics are not sufficient)
- Flag false positives
- Note documents/ and doc/ handling

Present prioritized migration batches for human approval.
```

### Phase 3 — Migrate batch (repeat per batch)

```text
Approved migration batch:
[List files and target paths]

For each file:
1. git mv to target path (or copy if human prefers)
2. Update breadcrumb header in moved file
3. Search repo for inbound links to old path; update them
4. Update PROJECT_INDEX.md and domain README if needed

Do not delete AI_WORKFLOW.md until split is verified complete.
Produce complete file replacements only.
```

### Phase 4 — Split AI_WORKFLOW.md

```text
Split [PATH]/AI_WORKFLOW.md into modular docs/AI/ handbook per mapping table below.
Preserve unique content in each target file. Cross-link between handbook modules.
After human review, archive or remove legacy file only when no unique content remains.
```

### Phase 5 — Validate

```text
Run: [EDF_PATH]/scripts/adopt-edf.sh validate "[PATH]"
Compare to Adopter Conformance Tiers tier [TIER].
Update ADOPTION_STATUS.md migration phase status.
List remaining gaps and recommended next batch.
```

## AI_WORKFLOW.md Section Mapping

Map legacy monolithic sections to modular handbook files. Section titles vary by project — match by intent:

| Legacy section topic | Target handbook file |
|---------------------|----------------------|
| Overview, principles, when to use AI | `docs/AI/AI_Philosophy.md` |
| Tool roles (Cursor, Copilot, Continue, Ollama) | `docs/AI/AI_Roles.md` |
| Which tool for which task | `docs/AI/AI_Decision_Matrix.md` |
| Cost, model selection, token usage | `docs/AI/Cost_Optimization.md` |
| How to write prompts | `docs/AI/Prompting_Guide.md` |
| What context to provide | `docs/AI/Context_Checklist.md` |
| How to verify AI output | `docs/AI/Verification.md` |
| Secrets, privacy, data handling | `docs/AI/Security.md` |
| Human accountability, approval rules | `docs/AI/Governance.md` |
| Git workflow, file delivery, IDE usage | `docs/AI/Repository_Workflow.md` |
| Index, links to all above | `docs/AI/README.md` |

If a section spans multiple topics, split content across files and add cross-links. Do not duplicate the same guidance in multiple handbook files.

## Link Update Checklist

For a reusable prompt that adds breadcrumb and governance headers to multiple Markdown files in an external adopting project, see [Governance Header Prompt](Governance_Header_Prompt.md).

After moving a document:

- [ ] Breadcrumb line at top of moved file
- [ ] `PROJECT_INDEX.md` links
- [ ] Parent domain `README.md` index
- [ ] Inbound links from other Markdown files (search old path)
- [ ] Root `README.md` if it referenced the old path
- [ ] Re-run Framework Advisor; resolve broken relative links reported

## Review Gates

| Gate | Pass criteria |
|------|---------------|
| **M1 — Structure** | Bootstrap complete; canonical dirs exist |
| **M2 — Plan reviewed** | Human approved `MIGRATION_PLAN.md` priorities |
| **M3 — Batch complete** | Moved files have correct breadcrumbs and inbound links |
| **M4 — AI split** | No unique content remains only in `AI_WORKFLOW.md` |
| **M5 — Tier** | Scores meet target tier in Adopter Conformance Tiers |

## documents/ Coexistence

- **Default:** Leave `documents/` untouched; add PROJECT_INDEX note if needed
- **Migrate:** Only when human confirms Markdown in `documents/` should move to `docs/`
- **Never:** Bulk-delete or auto-migrate PDFs and binary assets

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [Migration Guide](../Development/Migration_Guide.md)
- [Bootstrap Playbook](Bootstrap_Playbook.md)
- [Documentation Migration Assistant](../Development/Documentation_Migration_Assistant.md)
- [Repository_Workflow.md](Repository_Workflow.md)
- [Adopter Conformance Tiers](../Development/Adopter_Conformance_Tiers.md)
