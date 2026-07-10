# Documentation Generation Engine

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → [Development](README.md) → Documentation Generation Engine

## Purpose

The documentation generation engine creates a safe, cross-linked starter documentation system inside a new or existing software project.

It complements the folder-only bootstrap scripts.

## Scripts

### macOS / Linux

```bash
./scripts/generate_documentation_skeleton.sh "/path/to/project root"
```

### Windows PowerShell

```powershell
.\scripts\generate_documentation_skeleton.ps1 -ProjectRoot "D:\Projects\Existing Project"
```

## Safety Behavior

The generator:

- creates missing parent directories when safe
- creates only missing files
- skips every existing file
- never edits or overwrites existing content
- never deletes, renames, or moves content
- leaves `documents/` untouched
- prints a created/skipped/conflict summary

## Generated Navigation Model

Generated documents are linked hierarchically:

```text
README.md
    → PROJECT_INDEX.md
        → docs/<Domain>/README.md
            → domain documents
```

Domain indexes link back to `PROJECT_INDEX.md` and to their relevant child locations.

## Files the Generator May Create

At the project root, when missing:

- `PROJECT_INDEX.md`
- `PROJECT_CHARTER.md`
- `ARCHITECTURE_DECISIONS.md`

Under `docs/`, when missing:

- `Architecture/README.md`
- `Architecture/ADRs/README.md`
- `AI/README.md`
- `Development/README.md`
- `Specifications/README.md`
- `API/README.md`
- `Database/README.md`
- `Deployment/README.md`
- `User_Guides/README.md`
- `Reference/README.md`
- `Templates/README.md`

The generator intentionally does not create or overwrite a project root `README.md`, because most existing software projects already have one.

## Existing Projects

If a project already contains documentation, run the generator first to add only missing indexes, then run:

- the project analysis tool
- the documentation migration assistant

Use their reports to migrate legacy Markdown incrementally.

## Related Documents

- [Framework Generation Principles](../Architecture/Framework_Generation_Principles.md)
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [Project Analysis and Validation Tool](Project_Analysis_Validation_Tool.md)
- [Documentation Migration Assistant](Documentation_Migration_Assistant.md)
