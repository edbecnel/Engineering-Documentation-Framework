# Documentation Migration Assistant

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › Documentation Migration Assistant

## Purpose

The Documentation Migration Assistant scans an existing project for Markdown files outside canonical documentation locations and recommends where each file may belong.

It is advisory and read-only. It never moves documents automatically.

## Safety Guarantee

The migration assistant does not:

- create files or folders
- delete or overwrite files
- rename or move files
- modify documentation
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

## Canonical Markdown Locations

Canonical locations include:

- `docs/`
- `archive/`
- `tasks/`
- `README.md`
- `PROJECT_INDEX.md`
- `PROJECT_CHARTER.md`
- `ARCHITECTURE_DECISIONS.md`
- `CHANGELOG.md`
- `ENGINEERING_DOCUMENTATION_FRAMEWORK.md`

A root-level `AI_WORKFLOW.md` is no longer canonical.

## AI Documentation Migration

AI engineering documentation belongs under `docs/AI/`.

A legacy `AI_WORKFLOW.md` should normally be **split**, not simply moved unchanged.

Review its sections and distribute unique content across the modular AI handbook, beginning with:

- `docs/AI/README.md`
- `docs/AI/AI_Philosophy.md`
- `docs/AI/AI_Roles.md`
- `docs/AI/AI_Decision_Matrix.md`
- `docs/AI/Cost_Optimization.md`
- `docs/AI/Prompting_Guide.md`
- `docs/AI/Context_Checklist.md`
- `docs/AI/Verification.md`
- `docs/AI/Security.md`
- `docs/AI/Governance.md`

Delete the legacy file only after verifying that no unique information or references were lost.

## Recommendation Domains

The assistant may recommend:

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

## Human Review Required

Recommendations are based primarily on filenames.

Before migrating a document, confirm:

- the document is still current
- the recommended domain is correct
- the filename is appropriate
- all links will be updated
- duplicate information is not being preserved
- the document should not be archived instead

## Recommended Workflow

1. Run the canonical structure script.
2. Run the project analyzer.
3. Run the migration assistant.
4. Review every recommendation.
5. Migrate only documents whose purpose is clear.
6. Update `README.md` and `PROJECT_INDEX.md`.
7. Archive obsolete or superseded material with a migration note.
8. Re-run both tools after each cleanup pass.

## Parent

- [Development](README.md)

## Related Documents

- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [Documentation Generation Engine](Documentation_Generation_Engine.md)
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [AI Engineering Handbook](../AI/README.md)
- [Governance](../Governance/README.md)
