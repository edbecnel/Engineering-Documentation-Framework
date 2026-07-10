# AI Repository Workflow

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › AI Repository Workflow

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** AI-assisted repository analysis, documentation, and implementation work
> **Last Reviewed:** 2026-07-10
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

This document defines the standard workflow for an AI assistant working with a Git-hosted engineering project.

The workflow is designed to keep the repository authoritative, minimize manual editing, reduce merge errors, and produce small, reviewable implementation packages.

## Guiding Principle

The Git repository is the single source of truth.

AI assistants should retrieve and modify the current repository version of each file rather than relying on stale conversation copies, reconstructed content, or uploaded repository snapshots when the authoritative repository is accessible.

## Responsibility Model

### AI Assistant Responsibilities

The AI assistant is responsible for:

- reading the current repository structure and relevant files
- identifying the smallest focused set of required changes
- modifying complete files rather than supplying partial replacement fragments
- preserving repository paths and file names unless a change has been explicitly approved
- delivering only new or modified files
- packaging the changes in a ready-to-merge ZIP archive
- including deployment instructions and review metadata
- running available validation when practical
- reporting limitations, validation failures, and unresolved findings honestly

### Developer Responsibilities

The developer is responsible for:

- downloading and extracting the update package
- merging it into the local repository
- reviewing the Git diff
- running project-specific validation when needed
- accepting, revising, or rejecting the proposed changes
- committing the approved changes
- deleting temporary update metadata
- pushing the completed work to the remote repository

The human developer remains the final authority.

## Standard Workflow

1. Identify the authoritative repository and branch.
2. Read the current repository structure and all files relevant to the requested change.
3. Confirm the scope of the implementation package.
4. Modify complete files.
5. Add only files that are new or changed to the package.
6. Preserve the repository's directory structure inside the package.
7. Add the required `.update/` metadata folder.
8. Run the Framework Advisor or other applicable validation whenever practical.
9. Create a downloadable ZIP archive.
10. The developer extracts and merges the package into the local repository.
11. The developer reviews the Git diff and validation results.
12. The developer commits approved changes, removes `.update/`, and pushes to GitHub.

## Complete File Delivery

When a file changes, the update package must contain the complete replacement file at its normal repository path.

The AI assistant should not require the developer to:

- copy and paste Markdown sections manually
- splice partial code fragments into existing files
- reconstruct a document from multiple response blocks
- guess where a proposed change belongs
- reformat generated content before it can be reviewed

Complete-file delivery makes the proposed repository state explicit and allows Git to show the exact diff.

## Small Implementation Packages

Each package should address one focused implementation stage.

A package should not combine unrelated work merely because several changes are available. Smaller packages provide:

- clearer Git diffs
- easier validation
- simpler rollback
- more meaningful commit history
- lower risk of accidental scope expansion
- better traceability between findings and corrections

## ZIP Package Structure

The ZIP archive must contain only new or modified files and the temporary `.update/` directory.

Example:

```text
Engineering-Documentation-Framework-Update.zip
├── docs/
│   └── AI/
│       ├── README.md
│       └── Repository_Workflow.md
└── .update/
    ├── README_UPDATE_INSTRUCTIONS.md
    ├── CHANGE_SUMMARY.md
    ├── AFFECTED_DOCUMENTS.md
    ├── COMMIT_MESSAGE.txt
    └── DELETE_FILES.txt
```

The archive must preserve the files' normal repository-relative paths so the extracted package can be merged directly into the repository root.

## Required `.update/` Files

### `README_UPDATE_INSTRUCTIONS.md`

Provides step-by-step instructions for applying and validating the package. It should normally include:

- where to extract the ZIP
- how to merge it into the repository
- whether executable permissions must be restored
- required validation commands
- Git diff review steps
- commit guidance
- cleanup instructions

### `CHANGE_SUMMARY.md`

Explains:

- what changed
- why it changed
- the implementation scope
- important design or compatibility notes
- validation performed

### `AFFECTED_DOCUMENTS.md`

Lists every file in the package under clear categories:

- added
- modified
- deleted

It serves as the developer's review checklist.

### `COMMIT_MESSAGE.txt`

Contains a ready-to-use Git commit message appropriate to the package scope.

### `DELETE_FILES.txt`

Lists temporary files and folders to remove after the update is merged and reviewed.

At minimum, it normally contains:

```text
.update/
```

## Package Exclusions

The ZIP archive must not contain:

- the complete repository
- unchanged files
- `.git/` metadata
- build artifacts
- dependency caches
- IDE configuration files unless intentionally changed
- operating-system metadata
- temporary analysis files
- downloaded repository archives
- generated reports that are not part of the implementation

## Merge Procedure

The package should be extracted into a temporary directory adjacent to or inside the local repository as appropriate for the developer's workflow.

On macOS, the established merge command is:

```bash
ditto "./extracted-update/" "./"
```

The developer should then review the proposed changes:

```bash
git status
git diff
```

Any project validation required by `README_UPDATE_INSTRUCTIONS.md` should be run before committing.

After approval:

```bash
git add <changed-files>
git commit
git push
```

The `.update/` folder is temporary and must be deleted rather than committed unless a package explicitly states otherwise.

## Repository Safety Rules

Unless explicitly approved for a particular implementation, the AI assistant must not automatically:

- overwrite unrelated user content
- rename user files
- delete user files
- move user files
- merge documents with uncertain ownership
- include unrelated cleanup
- change generated-file permissions without documenting the change
- treat an analyzer recommendation as authorization to modify the repository

Existing files become project-owned. Generators create only missing files. Analyzers remain read-only.

## Repository Access Expectations

The AI assistant should work directly from the accessible Git repository whenever possible.

It should not request an uploaded ZIP copy of the repository as the normal workflow.

An offline repository snapshot may be requested only when:

- the remote repository is unavailable
- the repository is private and inaccessible to the assistant
- the developer explicitly chooses an offline snapshot
- the required repository contents cannot otherwise be retrieved

When an offline snapshot is used, the assistant must identify that snapshot as the working source and avoid implying that it represents a newer remote state.

## Verification

Whenever practical, the AI assistant should:

1. run or extend the Framework Advisor or other project analyzer
2. capture the relevant pre-change findings
3. implement the focused corrections
4. rerun validation
5. report measurable improvements and remaining issues
6. include a report only when it is part of the intended repository change

A successful command does not replace human review. The Git diff remains the definitive view of the proposed change.

## Executable Permissions

ZIP extraction or cross-platform file handling may not preserve executable permissions reliably.

When shell scripts are added or modified, the package instructions should identify any required permission restoration, such as:

```bash
chmod +x scripts/*.sh
git update-index --chmod=+x scripts/*.sh
```

These commands should be limited to the affected scripts whenever possible.

## Commit Quality

Each package should include a commit message that describes the implementation outcome rather than the packaging mechanics.

Preferred:

```text
docs(ai): define repository update package workflow
```

Avoid:

```text
update files
```

## Exceptions and Escalation

When the requested change cannot be completed safely from available repository information, the AI assistant should:

- complete all well-supported work that remains possible
- clearly identify what could not be completed
- avoid inventing repository contents
- avoid silently broadening the package scope
- request an offline snapshot only when repository access is genuinely unavailable

## Future Automation

This workflow may later be supported by tooling that:

- retrieves a selected repository revision
- builds update packages automatically
- validates package contents against repository state
- rejects unchanged or prohibited files
- generates `.update/` metadata
- runs the Framework Advisor before and after changes
- produces checksums or manifests for review

Automation must preserve the same human-approval and repository-safety principles defined here.

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [AI Philosophy](AI_Philosophy.md)
- [AI Roles](AI_Roles.md)
- [Context Checklist](Context_Checklist.md)
- [Verification](Verification.md)
- [AI Governance](Governance.md)
- [Documentation Change Management](../Governance/Change_Management.md)
- [Document Metadata Standard](../Governance/Document_Metadata_Standard.md)
