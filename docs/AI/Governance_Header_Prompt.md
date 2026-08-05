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
3. **Target folder** — directory within the target project (for example `docs/AI` or `docs/Development`)
   - Must be a **folder**, not a file path
   - Do **not** append a filename (for example `docs/AI/DeepSeek_R1.md` is wrong — use `docs/AI` instead)
   - Trailing slashes are optional; `.md` at the end means you entered a file by mistake
4. Target project has `README.md` and `PROJECT_INDEX.md` at its root (or note their absence so breadcrumbs can be adjusted)
5. Human has reviewed which files should receive governed headers (skip templates, archives, and drafts the team does not want governed yet)
6. **Target project is in the IDE workspace** — the agent must be able to read and write files under `TARGET_PROJECT_ROOT`. If only the EDF folder is open, add the target project to the workspace first

## Path Inputs (Folder vs File)

`TARGET_FOLDER` must resolve to a **directory**. A common mistake is pasting a full file path (often from an IDE tab or `@` mention) into the folder field.

| Input | Valid? | Result |
|-------|--------|--------|
| `docs/AI` | Yes | Processes all `.md` files under `docs/AI/` recursively |
| `docs/AI/` | Yes | Same as above |
| `docs/AI/DeepSeek_R1.md` | **No** | Agent treats path as a single file — only one file updated |
| `D:\Projects\MyApp\docs\AI\SomeDoc.md` | **No** | Same problem if used as `TARGET_FOLDER` |

**Correct pattern:**

```text
TARGET_PROJECT_ROOT = D:\Projects\MyApp
TARGET_FOLDER       = docs/AI
```

**Wrong pattern (file appended to folder):**

```text
TARGET_PROJECT_ROOT = D:\Projects\MyApp
TARGET_FOLDER       = docs/AI/DeepSeek_R1.md   ← remove the filename
```

To process one file only, set `TARGET_FOLDER` to its parent directory and list the file under **Exclude** for all others, or use a dedicated single-file workflow (not this batch prompt).

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

### Incomplete headers (must be upgraded)

Treat these as **not complete** — update them, do not skip:

- `> **Documentation path:**` only (skeleton-generator style)
- Breadcrumb present but metadata block missing
- Metadata present but breadcrumb missing `[Home]` or `[Project Index]`
- Only one or two metadata fields present

A file is **complete** only when it has **all** of:

1. `[Home](...)` and `[Project Index](...)` in the breadcrumb line
2. `> **Status:**`
3. `> **Owner:**`
4. `> **Applies To:**`
5. `> **Last Reviewed:**` (when Status is Maintained or Approved)
6. `> **Review Frequency:**` (when Status is Maintained or Approved)

## Common Agent Failure Modes

Agents often stop after one file. This prompt is designed to prevent that.

| Failure mode | Required behavior |
|---|---|
| Shows one example and stops | Edit **every** inventory file on disk; examples are not deliverables |
| Asks "should I continue?" after each file | Process the full inventory without pausing between files |
| Skips files with partial headers | Partial = incomplete; upgrade to full breadcrumb + metadata |
| Cannot find target files | Run the inventory command first; fail loudly if zero files found |
| `TARGET_FOLDER` is a file path (ends in `.md`) | STOP before edits; report path error and ask human to remove filename |
| Inventory finds exactly one file | Verify `TARGET_FOLDER` is a directory, not a single file path |
| Edits EDF instead of target | Write only under `[TARGET_PROJECT_ROOT]` |
| Reports done without verification | Re-scan folder and prove 100% complete or list explicit skips |

## Copy-Paste Prompt

Replace the bracketed placeholders, then send the block below to your AI agent.

**Important:** Open the target project in your IDE workspace (or add it to the workspace) so the agent can read and write files there. Running from the EDF folder alone is not sufficient unless the agent has filesystem access to both paths.

```text
Add EDF-standard breadcrumb navigation and governance metadata headers to EVERY Markdown file in a target folder within an external adopting project.

This is a batch operation. You are NOT done until every file in the inventory is either updated on disk or explicitly listed as skipped with a reason.

## Paths

- EDF clone (read standards and run validation only): [EDF_PATH]
- Target project root (edit files here ONLY): [TARGET_PROJECT_ROOT]
- Target folder (directory only — no filename): [TARGET_FOLDER]
  Correct example: docs/AI
  Wrong example: docs/AI/SomeFile.md

## Phase 0 — Validate paths (mandatory before anything else)

Resolve the full scan path:

  [TARGET_PROJECT_ROOT]/[TARGET_FOLDER]

Hard stops — do NOT proceed if any of these are true:

1. [TARGET_FOLDER] ends with `.md` or `.markdown` → report: "TARGET_FOLDER must be a directory, not a file. Remove the filename (e.g. use docs/AI not docs/AI/DeepSeek_R1.md)."
2. The resolved path is a file, not a directory.
3. The resolved path does not exist.

Verify the path is a directory:

Windows PowerShell:

  $scanPath = Join-Path "[TARGET_PROJECT_ROOT]" "[TARGET_FOLDER]"
  if (-not (Test-Path -LiteralPath $scanPath -PathType Container)) {
    throw "TARGET_FOLDER must be an existing directory: $scanPath"
  }
  if ($scanPath -match '\.(md|markdown)$') {
    throw "TARGET_FOLDER looks like a file path, not a folder: $scanPath"
  }

Bash:

  scan_path="[TARGET_PROJECT_ROOT]/[TARGET_FOLDER]"
  if [[ "$scan_path" =~ \.(md|markdown)$ ]]; then
    echo "ERROR: TARGET_FOLDER must be a directory, not a file: $scan_path" >&2; exit 1
  fi
  if [[ ! -d "$scan_path" ]]; then
    echo "ERROR: TARGET_FOLDER must be an existing directory: $scan_path" >&2; exit 1
  fi

Only continue to Phase 1 after path validation passes.

## Read first (from EDF clone — do not edit EDF files)

1. [EDF_PATH]/docs/Governance/Document_Metadata_Standard.md
2. [EDF_PATH]/docs/Architecture/Documentation_Information_Architecture.md
3. [EDF_PATH]/docs/AI/Migration_Playbook.md
4. [EDF_PATH]/docs/AI/Governance_Header_Prompt.md
5. [EDF_PATH]/docs/Development/Adopter_Conformance_Tiers.md
6. Relevant templates under [EDF_PATH]/docs/Templates/ for the target domain

## Phase 1 — Inventory (mandatory before any edits)

Discover ALL Markdown files recursively. Do not guess the file list.

Windows PowerShell:

  Get-ChildItem -Path "[TARGET_PROJECT_ROOT]\[TARGET_FOLDER]" -Filter *.md -Recurse -File |
    Sort-Object FullName |
    ForEach-Object { $_.FullName.Replace("[TARGET_PROJECT_ROOT]\", "").Replace("\", "/") }

Bash:

  find "[TARGET_PROJECT_ROOT]/[TARGET_FOLDER]" -name '*.md' -type f | sort

For EACH file found, read the first 30 lines and classify header status:

- COMPLETE — has [Home], [Project Index], Status, Owner, Applies To (and Last Reviewed + Review Frequency if Status is Maintained or Approved)
- PARTIAL — anything else (including "> **Documentation path:**" only)
- MISSING — no breadcrumb and no governance metadata block

Print a numbered inventory table BEFORE editing:

| # | Relative path | Status | Action |
|---|---------------|--------|--------|
| 1 | docs/AI/README.md | PARTIAL | UPDATE |
| 2 | docs/AI/Prompting_Guide.md | MISSING | UPDATE |
| ... | ... | ... | ... |

If the inventory has zero files, STOP and report the path error. Do not proceed.

If the inventory has exactly one file AND [TARGET_FOLDER] ends with .md, STOP — you likely used a file path as TARGET_FOLDER. Ask the human to correct it to the parent directory.

Count files to update: all rows where Action = UPDATE.

## Phase 2 — Edit every file (mandatory)

Hard rules:

1. Edit EVERY file marked UPDATE in the inventory. Do not stop after the first file.
2. Write changes directly to disk at [TARGET_PROJECT_ROOT]/<relative-path>. Do not paste one example and ask me to apply the rest.
3. Do not ask for confirmation between files. Process the full inventory in this session.
4. If there are more than 15 files, work in alphabetical batches of 10, but finish ALL batches before Phase 3.
5. Keep each file's existing # title unchanged.
6. Insert breadcrumb immediately after the title (blank line before and after).
7. Insert governance metadata block immediately after the breadcrumb.
8. Compute relative links from each file's actual path — never copy breadcrumb depth from another file.
9. Add ## Parent linking to domain README.md when missing (skip for domain README.md files).
10. Do not change body content except header/navigation additions.
11. Do not move, rename, or delete files.

Skip ONLY when:

- File is explicitly listed in "Exclude" below, OR
- File is already COMPLETE per the rules above

## Default metadata values (unless I specify overrides)

- Status: Draft
- Owner: [OWNER_ROLE]
- Applies To: [APPLIES_TO_SCOPE]
- Last Reviewed: [YYYY-MM-DD]
- Review Frequency: On Change

## Scope

- Include: all .md files recursively under [TARGET_FOLDER]
- Exclude: [LIST FILES TO SKIP, or "none"]

## Phase 3 — Verify (mandatory before reporting done)

Re-run the inventory command. Re-read the first 30 lines of every file.

Confirm:

- Every non-excluded file is COMPLETE, OR listed in the skip table with reason
- Zero files remain PARTIAL or MISSING

If any file is still PARTIAL or MISSING, return to Phase 2 and fix it. Do not report success until verification passes.

## Phase 4 — Validate and summarize

Run Framework Advisor against the target project (read-only):

  [EDF_PATH]/scripts/analyze_project_structure.sh "[TARGET_PROJECT_ROOT]"

Or on Windows:

  [EDF_PATH]/scripts/analyze_project_structure.ps1 -ProjectRoot "[TARGET_PROJECT_ROOT]"

Deliver:

1. Completion table — every inventoried file:

| Relative path | Result | Notes |
|---------------|--------|-------|
| docs/AI/README.md | UPDATED | Added breadcrumb + metadata |
| docs/AI/Prompting_Guide.md | SKIPPED | Already complete |

2. Counts: total found / updated / skipped / failed
3. Framework Advisor navigation and governance findings for files under [TARGET_FOLDER]
4. Any files needing human decisions (Status, Owner, Authoritative)

You have NOT completed this task if the completion table has fewer rows than the Phase 1 inventory (excluding explicit excludes).
```

## Continuation Prompt

If the agent stops early or updates only some files, send:

```text
Continue the governance header batch from [Governance_Header_Prompt.md](Governance_Header_Prompt.md).

- EDF_PATH: [EDF_PATH]
- TARGET_PROJECT_ROOT: [TARGET_PROJECT_ROOT]
- TARGET_FOLDER: [TARGET_FOLDER]

Re-run Phase 1 inventory. Process ONLY files still PARTIAL or MISSING.
Do not re-edit COMPLETE files.
Finish Phase 2, Phase 3, and Phase 4 for all remaining files.
```

## Example

**Inputs:**

- `EDF_PATH` = `D:\Dev\Engineering-Documentation-Framework`
- `TARGET_PROJECT_ROOT` = `D:\Projects\MyApp`
- `TARGET_FOLDER` = `docs/AI` ← folder only; not `docs/AI/DeepSeek_R1.md`
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
- Run Phase 0 path validation before any edits; refuse file paths masquerading as folders
- Run Phase 1 inventory before any edits; never assume the file list
- Update **every** file marked UPDATE — stopping after one file is a failure
- Treat partial headers (including `Documentation path:` style) as incomplete
- Write edits to disk under `TARGET_PROJECT_ROOT`; do not deliver a single example file
- Re-scan and verify before reporting success (Phase 3)
- Never invent project facts for Owner or Applies To — use human-provided values or mark for review
- Preserve existing document content; add headers and parent links only
- Follow [Migration Playbook](Migration_Playbook.md) link-update principles when headers are applied as part of a migration batch
- Report a completion table covering every inventoried file

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
