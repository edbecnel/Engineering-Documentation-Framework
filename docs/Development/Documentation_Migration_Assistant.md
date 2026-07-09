# Documentation Migration Assistant

## Purpose

The Documentation Migration Assistant helps teams adopt the Engineering Documentation Framework in existing projects.

It scans an existing project for Markdown files outside the canonical documentation locations and recommends where each file may belong in the framework.

The assistant is intentionally advisory. It does not move, rename, modify, delete, or overwrite files.

## Safety Guarantee

The migration assistant is read-only.

It does not:

- create files
- create folders
- delete files
- overwrite files
- rename files
- move files
- modify existing documentation
- modify an existing `documents/` folder

It only prints a migration plan for human review.

## Scripts

PowerShell:

```powershell
.\scripts\plan_documentation_migration.ps1 -ProjectRoot "D:\Projects\Existing Project"
```

Bash:

```bash
./scripts/plan_documentation_migration.sh "/Users/ed/Projects/Existing Project"
```

## What the Tool Does

The migration assistant searches for Markdown files outside canonical documentation locations and recommends likely destinations based on filename patterns.

Canonical locations include:

- `docs/`
- `archive/`
- `README.md`
- `PROJECT_INDEX.md`
- `PROJECT_CHARTER.md`
- `CHANGELOG.md`
- `AI_WORKFLOW.md`
- `ARCHITECTURE_DECISIONS.md`
- `ENGINEERING_DOCUMENTATION_FRAMEWORK.md`

Files outside those locations are treated as migration candidates.

## Recommendation Domains

The assistant may recommend destinations under:

- `docs/Architecture/`
- `docs/Architecture/ADRs/`
- `docs/AI/`
- `docs/Development/`
- `docs/Specifications/`
- `docs/API/`
- `docs/Database/`
- `docs/Deployment/`
- `docs/User_Guides/`
- `docs/Reference/`
- `docs/Templates/`
- `tasks/`

## Example Output

```text
Engineering Documentation Framework Migration Plan
==================================================

Project root: /Users/ed/Projects/Existing Project
Project name: Existing Project

This report is read-only. No files or folders were created, modified, moved, renamed, or deleted.

Migration candidates found: 3

1. documents/api-notes.md
   Recommended destination: docs/API/api-notes.md
   Reason: Filename suggests API contract or interface documentation.
   Action: Review manually before migrating. Do not move automatically.

2. design_notes.md
   Recommended destination: docs/Architecture/design_notes.md
   Reason: Filename suggests architecture or system design content.
   Action: Review manually before migrating. Do not move automatically.

3. TODO.md
   Recommended destination: tasks/TODO.md
   Reason: Filename suggests task planning or roadmap content.
   Action: Review manually before migrating. Do not move automatically.
```

## Recommended Workflow

Use the migration assistant after running the canonical structure script and project analysis tool.

Recommended sequence:

1. Clone the Engineering Documentation Framework repository.
2. Run the canonical structure script against the target project.
3. Run the project analysis tool against the target project.
4. Run the documentation migration assistant against the target project.
5. Review the migration plan manually.
6. Move only documents whose purpose and destination are clear.
7. Add or update cross-references from `README.md` and `PROJECT_INDEX.md`.
8. Archive obsolete or superseded documents with a short migration note.
9. Re-run the analysis and migration scripts after each cleanup pass.

## Human Review Required

The migration assistant uses conservative filename-based heuristics.

Its recommendations are useful starting points, not final decisions.

Before moving a document, confirm:

- the document is still current
- the recommended domain is correct
- the filename should remain the same
- links to and from the document are updated
- duplicate content is not being preserved unnecessarily
- the document should not be archived instead

## Relationship to the Project Analysis Tool

The Project Analysis and Validation Tool reports structural adoption status.

The Documentation Migration Assistant provides a candidate migration plan for existing Markdown files.

Together, these tools support incremental adoption:

- the analyzer answers: "How closely does this project follow the framework?"
- the migration assistant answers: "Where might existing Markdown files belong?"

## Future Enhancements

Future versions may add:

- optional Markdown report output
- optional JSON report output
- content-based classification
- confidence scores
- duplicate topic detection
- broken link detection
- migration note generation
- AI-assisted migration plans
