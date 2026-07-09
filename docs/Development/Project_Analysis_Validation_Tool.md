# Project Analysis and Validation Tool

## Purpose

The Engineering Documentation Framework includes read-only project analysis tools that inspect an existing software project and report how closely it follows the framework.

These tools are intended to help teams adopt the framework incrementally without making automatic changes to existing projects.

## Safety Guarantee

The analysis tools are read-only.

They do not:

- create files
- create folders
- delete files
- overwrite files
- rename files
- move files
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

The analyzer checks for:

- required framework directories
- recommended root-level framework files
- an existing `documents/` folder
- whether `README.md` references `PROJECT_INDEX.md`
- Markdown files outside canonical documentation locations
- missing AI documentation structure
- missing Architecture Decision Record structure

## Output

The tool prints a report with:

- project root
- project name
- estimated compliance score
- missing required directories
- missing recommended files
- warnings
- Markdown files outside canonical documentation locations
- recommendations

## Compliance Score

The compliance score is an approximate project-readiness score.

It is intended as a quick signal, not a formal certification.

A lower score does not mean the project is broken. It means the project has not yet fully adopted the Engineering Documentation Framework.

## Recommended Workflow

Use the analysis tool after running the canonical structure creation script.

Recommended sequence:

1. Clone the Engineering Documentation Framework repository.
2. Run the canonical structure script against the target project.
3. Run the analysis tool against the target project.
4. Review the report.
5. Migrate documentation incrementally.
6. Re-run the analysis tool after major documentation improvements.

## Migration Guidance

The analyzer does not move files automatically.

When Markdown files are found outside canonical documentation locations, review each one and decide whether it should:

- move into the closest `docs/` domain
- remain where it is because it serves a project-specific purpose
- be moved to `archive/`
- be replaced by a link to an authoritative document

## Future Enhancements

Future versions may add:

- optional Markdown report output
- JSON report output for automation
- recommended destination mapping for legacy Markdown files
- duplicate topic detection
- broken link detection
- AI-assisted migration planning
