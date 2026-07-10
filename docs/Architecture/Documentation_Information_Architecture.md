# Documentation Information Architecture

## Purpose

This document defines the information architecture for the Engineering Documentation Framework.

The framework is a reusable documentation system for long-lived software engineering projects. It defines:

- where information belongs
- which documents are authoritative
- how documents relate to each other
- when content should be split, merged, moved, or archived
- how humans and AI assistants should navigate the repository

## Core Principle

The repository is the single source of truth.

Documentation should be:

- modular
- version controlled
- reviewed
- refactored
- maintained
- intentionally organized

## Primary Entry Points

### `README.md`

The public-facing overview. It explains what the project or framework is, why it exists, and how to begin.

### `PROJECT_INDEX.md`

The primary documentation hub for humans and AI assistants. It maps readers to authoritative documents, active priorities, and current project status.

### `PROJECT_CHARTER.md`

Defines mission, scope, goals, non-goals, stakeholders, assumptions, and constraints.

### `ENGINEERING_DOCUMENTATION_FRAMEWORK.md`

The local adoption guide created by the canonical bootstrap scripts in an adopting project. It identifies `docs/` as the canonical documentation root and explains the documentation domains.

## Documentation Domains

### Core

Project identity, navigation, and framework-wide governance.

Examples:

- `README.md`
- `PROJECT_INDEX.md`
- `PROJECT_CHARTER.md`
- `ARCHITECTURE_DECISIONS.md`
- `CHANGELOG.md`

### Architecture

System structure, technical direction, diagrams, ADRs, and documentation architecture.

### AI

The modular AI Engineering Handbook under `docs/AI/`.

Its authoritative entry point is:

`docs/AI/README.md`

Expected handbook documents include:

- `AI_Philosophy.md`
- `AI_Roles.md`
- `AI_Decision_Matrix.md`
- `Cost_Optimization.md`
- `Prompting_Guide.md`
- `Context_Checklist.md`
- `Verification.md`
- `Security.md`
- `Governance.md`

A root-level `AI_WORKFLOW.md` is retired. If found in an existing project, migrate its unique content into the modular handbook and remove it only after verifying links and content preservation.

### Development

Day-to-day engineering practices, coding standards, Git workflow, testing, debugging, setup, and development tooling.

### Specifications

Requirements, intended behavior, user stories, acceptance criteria, and non-functional requirements.

### API

External and internal API contracts, authentication behavior, schemas, and interface documentation.

### Database

Data models, schemas, migrations, backup and restore, data ownership, and retention rules.

### Deployment

Environments, CI/CD, release processes, runbooks, rollback, monitoring, and operations.

### User Guides

End-user manuals, walkthroughs, tutorials, and troubleshooting material.

### Reference

Glossaries, standards, terminology, conventions, and external references.

### Templates

Reusable document templates.

### Archive

Retired, obsolete, or superseded material. Archived documents are historical and not authoritative.

## Document Responsibility

Each document should have one primary responsibility.

Split documents when:

- they are hard to scan
- they serve multiple unrelated audiences
- sections evolve independently
- content belongs to different documentation domains
- they become too large for practical AI context

Merge documents when:

- they serve the same purpose
- separation makes navigation harder
- the distinction is unclear

## Single Source of Truth

Detailed information should exist in one authoritative place.

Acceptable duplication:

- short summaries
- navigation descriptions
- links

Unacceptable duplication:

- parallel technical explanations
- conflicting setup instructions
- copied full sections maintained independently
- competing authoritative documents

## Cross-References

Use relative links instead of duplicating content.

Whenever a document is created, moved, renamed, retired, or replaced, update:

- `PROJECT_INDEX.md`
- relevant `README.md` files
- links from related documents
- any ADR or specification that cites it

## AI Navigation Rules

AI assistants should begin with `PROJECT_INDEX.md` unless instructed otherwise.

They should:

- use repository documents as authoritative context
- identify duplication
- recommend restructuring
- preserve document intent
- maintain terminology
- update cross-references
- avoid inventing project facts

Humans retain responsibility for engineering judgment, security, testing, production approval, and final acceptance.

## Naming Conventions

Use clear, descriptive filenames in Title Case with underscores:

```text
Documentation_Information_Architecture.md
AI_Decision_Matrix.md
Prompting_Guide.md
```

Use domain-oriented directory names:

```text
docs/Architecture/
docs/AI/
docs/Development/
docs/Specifications/
docs/Templates/
```

## Canonical Structure

```text
README.md
PROJECT_INDEX.md
PROJECT_CHARTER.md
ARCHITECTURE_DECISIONS.md
CHANGELOG.md

docs/
    Architecture/
        Documentation_Information_Architecture.md
        ADRs/

    AI/
        README.md
        AI_Philosophy.md
        AI_Roles.md
        AI_Decision_Matrix.md
        Cost_Optimization.md
        Prompting_Guide.md
        Context_Checklist.md
        Verification.md
        Security.md
        Governance.md

    Development/
    Specifications/
    API/
    Database/
    Deployment/
    User_Guides/
    Reference/
    Templates/

tasks/
archive/
scripts/
```

## Maintenance Principle

Documentation should be continuously refactored.

When the framework grows, do not merely append content. Improve the architecture by splitting, merging, renaming, moving, cross-linking, or retiring documents as needed.
