# Project Analysis and Validation Tool

## Purpose

The Engineering Documentation Framework includes read-only project analysis tools that inspect an existing software project and report how closely it follows the framework.

The analyzer helps teams adopt and maintain the framework without automatically changing project files.

## Safety Guarantee

The analysis tools are read-only. They do not:

- create files or folders
- delete or overwrite files
- rename or move files
- modify existing documentation
- modify an existing `documents/` folder

They only inspect the target project and print a report.

## Scripts

PowerShell:

```powershell
.\scripts\analyze_project_structure.ps1 -ProjectRoot "D:\Projects\Existing Project"
```

Bash:

```bash
./scripts/analyze_project_structure.sh "/Users/ed/Projects/Existing Project"
```

## What the Tool Checks

The analyzer checks:

- required framework directories
- recommended root-level framework files
- whether `README.md` references `PROJECT_INDEX.md`
- whether `README.md` references the AI handbook under `docs/AI/`
- Markdown files outside canonical documentation locations
- the presence of a legacy root-level `AI_WORKFLOW.md`
- Architecture Decision Record folder structure
- modular AI handbook completeness

## AI Handbook Completeness

The analyzer reports the presence of:

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

It reports both a file count and a percentage. This is a completeness indicator, not a judgment of document quality.

## Output

The tool prints:

- project root and name
- estimated compliance score
- AI handbook completeness
- missing required directories
- missing recommended root files
- missing AI handbook files
- warnings
- Markdown files outside canonical locations
- recommendations

## Compliance Score

The compliance score is an approximate project-readiness signal, not formal certification.

A lower score means that the project has not yet fully adopted the framework. It does not mean that the software project is broken.

## Recommended Workflow

1. Run the canonical structure script.
2. Run the analysis tool.
3. Review structural findings.
4. Run the documentation migration assistant.
5. Migrate documentation incrementally.
6. Re-run both tools after major documentation changes.

## Important Limitation

The analyzer checks structure and selected references. It does not prove that documentation is accurate, current, non-duplicative, or complete in substance.

Those concerns require human review and, later, framework governance and link-validation tools.
