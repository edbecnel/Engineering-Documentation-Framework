# Governance Header Prompt

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › Governance Header Prompt

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** AI-assisted governance header application for adopting projects
> **Last Reviewed:** 2026-08-05
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document provides a copy-paste AI prompt for adding EDF-standard breadcrumb navigation and governance metadata headers to Markdown files in an **external adopting project**.

Run the prompt from a session that has access to your local **Engineering Documentation Framework (EDF) clone**. The AI edits files in the **target project** only. EDF supplies the standards, templates, and validation scripts.

This complements the per-file header step in [Migration Playbook](Migration_Playbook.md) Phase 3 and the link checklist in that playbook.

## When to Use

- After bootstrap or during migration, when governed documents in the target project lack standard headers
- When moving a batch of documents into canonical `docs/` locations and headers were not applied yet
- When preparing for the **Navigable** or **Governed** tier in [Adopter Conformance Tiers](../Development/Adopter_Conformance_Tiers.md)

Do **not** use this prompt to bulk-modify the EDF reference repository itself.

## Prerequisites

Before running the prompt, confirm:

1. **EDF clone path** — local path to this repository (for reading standards and running validation)
2. **Target project root** — absolute path to the adopting project
3. **Target folder** — folder within the target project (for example `docs/AI/` or `docs/Development/`)
4. Target project has `README.md` and `PROJECT_INDEX.md` at its root (or note their absence so breadcrumbs can be adjusted)
5. Human has reviewed which files should receive governed headers (skip templates, archives, and drafts the team does not want governed yet)

## Authoritative References

The AI must read these from the EDF clone before editing target files:

| Reference | Path (relative to EDF root) |
|-----------|----------------------------|
| Document Metadata Standard | `docs/Governance/Document_Metadata_Standard.md` |
| Documentation Information Architecture | `docs/Architecture/Documentation_Information_Architecture.md` |
| Migration Playbook | `docs/AI/Migration_Playbook.md` |
| Adopter Conformance Tiers | `docs/Development/Adopter_Conformance_Tiers.md` |
| Example governed document | `docs/AI/Migration_Playbook.md` |

Templates (for field values and breadcrumb patterns):

| Template | Path (relative to EDF root) |
|----------|----------------------------|
| Adoption Status | `docs/Templates/ADOPTION_STATUS_Template.md` |
| ASR Bootstrap Report | `docs/Templates/ASR_Bootstrap_Report_Template.md` |
| Architectural Discovery Record | `docs/Templates/Architectural_Discovery_Record_Template.md` |
| First-Time Setup | `docs/Templates/First_Time_Setup_Template.md` |

## Standard Header Format

Each governed document in the target project should receive navigation and metadata **immediately below the document title** (`#` heading), in this order:

```markdown
# Document Title

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Domain](README.md) › Document Title

> **Status:** Maintained
> **Owner:** [Team or role]
> **Applies To:** [Project, subsystem, or audience]
> **Last Reviewed:** YYYY-MM-DD
> **Review Frequency:** On Change
```

### Breadcrumb rules

- Use **relative Markdown links** from each file's location in the target project
- Every breadcrumb must include `[Home](...)` and `[Project Index](...)`
- Include the domain segment (for example `[AI](README.md)` under `docs/AI/`)
- End with the current document title as plain text (not a self-link)
- Depth varies by file location — compute `../` segments from the target file path; do not copy paths from EDF examples blindly

### Metadata rules

- Follow [Document Metadata Standard](../Governance/Document_Metadata_Standard.md) for required fields and valid values
- Default **Status** to `Draft` unless the human specifies otherwise
- Default **Owner** to a stable role (for example `Project Maintainer`, `Architecture Team`) — not a personal name unless the project has no team role
- Set **Last Reviewed** to today's date when applying headers to documents being actively maintained
- Add `> **Authoritative:** Yes` only when the human confirms the document is a canonical source

### Parent link

For files under `docs/<domain>/` (except domain `README.md`), ensure a **Parent** section links back to the domain `README.md` if one is not already present. See [Migration Playbook — Link Update Checklist](Migration_Playbook.md#link-update-checklist).

## Copy-Paste Prompt

Replace the bracketed placeholders, then send the block below to your AI agent.

```text
Add EDF-standard breadcrumb navigation and governance metadata headers to Markdown files in an external adopting project.

## Paths

- EDF clone (read standards and run validation only): [EDF_PATH]
- Target project root (edit files here): [TARGET_PROJECT_ROOT]
- Target folder within target project: [TARGET_FOLDER]
  Example: docs/AI/

## Read first (from EDF clone — do not edit EDF files)

1. [EDF_PATH]/docs/Governance/Document_Metadata_Standard.md
2. [EDF_PATH]/docs/Architecture/Documentation_Information_Architecture.md
3. [EDF_PATH]/docs/AI/Migration_Playbook.md
4. [EDF_PATH]/docs/Development/Adopter_Conformance_Tiers.md
5. Relevant templates under [EDF_PATH]/docs/Templates/ for the target domain

## Task

For each .md file under [TARGET_PROJECT_ROOT]/[TARGET_FOLDER] (recursive):

1. Skip files that already have valid breadcrumb navigation ([Home] and [Project Index]) AND a complete governance metadata block (Status, Owner, Applies To).
2. For files missing headers:
   a. Keep the existing # title unchanged.
   b. Insert breadcrumb line immediately after the title (blank line before and after).
   c. Insert governance metadata block immediately after the breadcrumb.
   d. Compute all relative link paths from the file's actual location in [TARGET_PROJECT_ROOT].
   e. Add a ## Parent section linking to the domain README.md if missing and the file is not itself a domain README.
3. Do not change document body content except for header/navigation additions.
4. Do not move, rename, or delete files.
5. Use complete file content when presenting changes.

## Default metadata values (unless I specify overrides)

- Status: Draft
- Owner: [OWNER_ROLE]
- Applies To: [APPLIES_TO_SCOPE]
- Last Reviewed: [YYYY-MM-DD]
- Review Frequency: On Change

## Files to process

[List specific files, or "all .md files recursively under [TARGET_FOLDER]"]

## After editing

Run Framework Advisor against the target project (read-only):

  [EDF_PATH]/scripts/analyze_project_structure.sh "[TARGET_PROJECT_ROOT]"

Or on Windows:

  [EDF_PATH]/scripts/analyze_project_structure.ps1 -ProjectRoot "[TARGET_PROJECT_ROOT]"

Summarize:
- Files updated
- Files skipped (and why)
- Framework Advisor navigation and governance findings for the target folder
- Any files needing human decisions (Status, Owner, Authoritative)
```

## Example

**Inputs:**

- `EDF_PATH` = `D:\Dev\Engineering-Documentation-Framework`
- `TARGET_PROJECT_ROOT` = `D:\Projects\MyApp`
- `TARGET_FOLDER` = `docs/AI`
- `OWNER_ROLE` = `Architecture Team`
- `APPLIES_TO_SCOPE` = `AI-assisted engineering for MyApp`

**Result for** `docs/AI/Prompting_Guide.md` **in the target project:**

```markdown
# Prompting Guide

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › Prompting Guide

> **Status:** Draft
> **Owner:** Architecture Team
> **Applies To:** AI-assisted engineering for MyApp
> **Last Reviewed:** 2026-08-05
> **Review Frequency:** On Change

## Purpose
...
```

## Validation

After the AI completes edits, validate the target project:

```bash
[EDF_PATH]/scripts/analyze_project_structure.sh "[TARGET_PROJECT_ROOT]"
```

PowerShell:

```powershell
[EDF_PATH]/scripts/analyze_project_structure.ps1 -ProjectRoot "[TARGET_PROJECT_ROOT]"
```

For a saved conformance report:

```bash
[EDF_PATH]/scripts/run_conformance_validation.sh "[TARGET_PROJECT_ROOT]"
```

Review navigation and governance sections in the output. Resolve any missing breadcrumb, parent README link, or metadata findings before marking the **Navigable** or **Governed** tier complete.

## AI Responsibilities

- Read EDF standards from the EDF clone; edit only the target project
- Never invent project facts for Owner or Applies To — use human-provided values or mark for review
- Preserve existing document content; add headers and parent links only
- Follow [Migration Playbook](Migration_Playbook.md) link-update principles when headers are applied as part of a migration batch
- Report files skipped because headers were already present or the file is excluded

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [Migration Playbook](Migration_Playbook.md)
- [Migration Guide](../Development/Migration_Guide.md)
- [Document Metadata Standard](../Governance/Document_Metadata_Standard.md)
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [Adopter Conformance Tiers](../Development/Adopter_Conformance_Tiers.md)
- [Project Analysis and Validation Tool](../Development/Project_Analysis_Validation_Tool.md)
- [Templates](../Templates/README.md)
