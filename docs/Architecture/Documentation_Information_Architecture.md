# Documentation Information Architecture

## Purpose

This document defines the information architecture for the Engineering Documentation Framework.

The framework is not a random collection of Markdown files. It is a reusable documentation system for long-lived software engineering projects.

Its purpose is to define:

* where information belongs
* which documents are authoritative
* how documents relate to each other
* when content should be split, merged, moved, or archived
* how humans and AI assistants should navigate the repository

## Core Principle

The repository is the single source of truth.

Documentation should be treated like software architecture:

* modular
* version controlled
* reviewed
* refactored
* maintained
* intentionally organized

## Primary Entry Points

### README.md

The public-facing overview of the framework.

Use it to explain:

* what the framework is
* why it exists
* who should use it
* how to adopt it

### PROJECT_INDEX.md

The primary navigation document for humans and AI assistants.

Use it to summarize:

* project purpose
* current status
* major documents
* documentation map
* active priorities
* authoritative sources

### PROJECT_CHARTER.md

The project definition document.

Use it to define:

* mission
* scope
* stakeholders
* goals
* non-goals
* assumptions
* constraints

## Documentation Domains

All documents should belong to one of the following domains.

### Core

Core project identity, navigation, and governance.

Examples:

* README.md
* PROJECT_INDEX.md
* PROJECT_CHARTER.md
* CHANGELOG.md

### Architecture

System structure, technical direction, diagrams, and architecture decisions.

Examples:

* architecture overviews
* ADRs
* system diagrams
* technology stack rationale
* documentation architecture

### AI

Guidance for using AI tools throughout the software development lifecycle.

Examples:

* AI philosophy
* AI roles
* decision matrix
* prompting guide
* cost optimization
* verification practices
* security considerations

### Development

Day-to-day engineering practices.

Examples:

* coding standards
* Git workflow
* local setup
* testing workflow
* debugging practices
* contributor guidance

### Specifications

Requirements and intended behavior.

Examples:

* feature specifications
* functional requirements
* non-functional requirements
* user stories
* acceptance criteria

### API

External and internal API contracts.

Examples:

* REST APIs
* GraphQL APIs
* service interfaces
* request/response schemas
* authentication behavior

### Database

Data model and persistence design.

Examples:

* schema
* migrations
* seed data
* backup and restore
* data ownership
* retention rules

### Deployment

Operational and release documentation.

Examples:

* environments
* CI/CD
* release process
* deployment runbooks
* rollback procedures
* monitoring

### User Guides

End-user documentation.

Examples:

* user manuals
* walkthroughs
* tutorials
* troubleshooting guides

### Reference

Supporting reference material.

Examples:

* glossary
* external links
* standards
* terminology
* conventions

### Templates

Reusable document templates.

Examples:

* ADR template
* feature specification template
* API template
* project charter template
* handover template

### Archive

Retired, obsolete, or superseded material.

Archived documents are preserved for historical context but are not authoritative.

## Document Responsibility Rules

Each document should have one primary responsibility.

Avoid documents that try to cover too many unrelated topics.

If a document becomes too large or covers multiple concerns, split it into smaller documents.

If multiple documents explain the same thing, choose one authoritative location and replace the others with links.

## Single Source of Truth Rules

Information should exist in one authoritative place.

Acceptable duplication:

* short summaries
* navigation descriptions
* links to authoritative documents

Unacceptable duplication:

* repeating the same technical decision in multiple places
* maintaining parallel versions of setup instructions
* copying full explanations across documents
* allowing two documents to disagree

## Cross-Reference Rules

Use cross-references instead of duplication.

A document may summarize another document briefly, but detailed information should live in the authoritative source.

When referencing another document, include:

* document name
* relative path
* reason the reader should go there

Example:

See `docs/AI/AI_Decision_Matrix.md` for guidance on choosing between local AI, cloud AI, Cursor, Continue, and reasoning models.

## AI Navigation Rules

AI assistants should begin with `PROJECT_INDEX.md` unless instructed otherwise.

AI assistants should use the repository documents as authoritative context.

AI assistants should:

* identify duplication
* recommend restructuring
* preserve document intent
* maintain consistent terminology
* avoid inventing project facts
* propose edits that fit the framework structure

Humans remain responsible for:

* final engineering decisions
* security approval
* production approval
* architectural ownership
* accepting or rejecting AI-generated changes

## When to Create a New Document

Create a new document when:

* the topic has a distinct responsibility
* the content is likely to grow
* the document will be reused across projects
* the topic has its own lifecycle
* the topic is frequently referenced
* splitting improves readability

Do not create a new document for very small fragments unless it improves navigation or reuse.

## When to Split a Document

Split a document when:

* it becomes hard to scan
* multiple audiences need different parts
* sections are evolving at different rates
* sections belong to different documentation domains
* the document duplicates information elsewhere
* the document becomes too large for practical AI context

## When to Merge Documents

Merge documents when:

* two documents serve the same purpose
* one document is only a small extension of another
* separation makes navigation harder
* the distinction between documents is unclear

## When to Archive Documents

Archive documents when:

* they are obsolete
* they describe an abandoned approach
* they have been replaced by newer documentation
* they are retained only for historical context

Archived documents should not be treated as authoritative.

If practical, add a short note at the top of archived documents explaining:

* why the document was archived
* what replaced it
* the date it was archived

## Naming Conventions

Use clear, descriptive filenames.

Preferred style:

```text
Title_Case_With_Underscores.md
```

Examples:

```text
AI_Decision_Matrix.md
Cost_Optimization.md
Documentation_Information_Architecture.md
Prompting_Guide.md
```

Directory names should describe documentation domains.

Examples:

```text
docs/Architecture/
docs/AI/
docs/Development/
docs/Specifications/
docs/Templates/
```

## Recommended Future Structure

The framework may evolve toward this structure:

```text
README.md
PROJECT_INDEX.md
PROJECT_CHARTER.md
CHANGELOG.md

docs/
    Architecture/
        Documentation_Information_Architecture.md
        Architecture_Overview.md
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
        Developer_Handbook.md
        Git_Workflow.md
        Coding_Standards.md
        Testing_Strategy.md

    Specifications/
        Feature_Specifications.md
        Requirements.md

    API/
    Database/
    Deployment/
    User_Guides/
    Reference/
    Templates/

tasks/
archive/
```

## AI_WORKFLOW.md Refactoring Direction

`AI_WORKFLOW.md` should be treated as the seed of a broader AI documentation domain.

It should eventually be split into focused documents under:

```text
docs/AI/
```

The final structure should avoid one large AI document and instead provide a navigable AI Engineering Handbook.

Likely documents include:

* `docs/AI/README.md`
* `docs/AI/AI_Philosophy.md`
* `docs/AI/AI_Roles.md`
* `docs/AI/AI_Decision_Matrix.md`
* `docs/AI/Cost_Optimization.md`
* `docs/AI/Prompting_Guide.md`
* `docs/AI/Context_Checklist.md`
* `docs/AI/Verification.md`
* `docs/AI/Security.md`
* `docs/AI/Governance.md`

## Maintenance Principle

Documentation should be refactored continuously.

When the framework grows, the correct response is not to keep appending content.

The correct response is to improve the structure.

Good documentation architecture should make future documentation easier, not harder.
