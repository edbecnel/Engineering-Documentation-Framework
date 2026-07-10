# Framework Generation Principles

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Architecture](README.md) › Framework Generation Principles


> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → [Architecture](README.md) → Framework Generation Principles

## Purpose

This document defines the mandatory safety and ownership guarantees for all Engineering Documentation Framework generation tools.

## Core Guarantee

> Framework generation tools create missing content only. They never overwrite user-authored content.

This guarantee applies to every current and future generator.

## Mandatory Rules

### 1. Never Overwrite Existing Files

If a target file already exists, a generator must:

- leave it unchanged
- report it as skipped
- continue processing other missing files

A generator must not overwrite, truncate, merge into, patch, or silently replace an existing file.

### 2. Never Delete Automatically

Generation tools must not delete files or folders.

Obsolete material may be reported for human review, but deletion remains an explicit developer action.

### 3. Never Move or Rename Automatically

Generation tools must not move or rename project content.

Migration and restructuring recommendations belong in read-only reports.

### 4. Create Missing Parent Directories Safely

A generator may create a missing parent directory when required for a new file.

If a path exists but is not the expected type, the generator must skip it and report the conflict.

### 5. Generated Files Become Project-Owned

After creation, generated files belong to the adopting project.

Future generator runs must treat them exactly like any other existing user-managed files.

### 6. Navigation Must Be Prewired

Every generated end-user Markdown document must include working hierarchical navigation links appropriate to its generated location.

The normal hierarchy is:

```text
README.md
    → PROJECT_INDEX.md
        → domain README.md
            → individual document
```

Users should not need to calculate or repair standard framework navigation links.

### 7. Analysis and Generation Are Separate

Analysis tools are read-only.

Generation tools create only missing content.

Framework updates that revise existing files use an explicit update-package workflow and are not performed by bootstrap generators.

### 8. Existing `documents/` Folders Remain Untouched

The canonical framework documentation root is `docs/`.

An existing `documents/` folder is treated as legacy or project-specific content and must not be modified automatically.

## Required Generator Output

A generator should summarize:

```text
Created:
  docs/API/README.md
  docs/Database/README.md

Skipped — already exists:
  PROJECT_INDEX.md
  docs/AI/README.md

Conflicts:
  docs/Reference (exists but is not a directory)

No existing files were modified.
```

## Compliance

A generation tool is non-compliant if it:

- overwrites an existing file
- deletes content
- moves or renames content
- modifies an existing `documents/` folder
- creates user-facing Markdown without framework navigation

## Related Documents

- [Documentation Information Architecture](Documentation_Information_Architecture.md)
- [Documentation Generation Engine](../Development/Documentation_Generation_Engine.md)
- [Project Analysis and Validation Tool](../Development/Project_Analysis_Validation_Tool.md)

## Parent

- [Architecture](README.md)
