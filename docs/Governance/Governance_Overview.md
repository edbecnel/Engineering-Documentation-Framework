# Governance Overview

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF and adopting projects
> **Last Reviewed:** 2026-07-10

## Purpose

Governance ensures that documentation remains authoritative, discoverable,
reviewable, current, and aligned with the project it describes.

Governance complements the documentation information architecture by defining how
documents are managed throughout their lifecycle.

## Governance Principles

1. Every authoritative document has a clearly identified owner.
2. Every governed document has an explicit lifecycle state.
3. Review frequency is proportional to the document's risk and rate of change.
4. Project facts must not be invented or inferred without evidence.
5. Significant documentation changes require traceable review.
6. Deprecated documents remain discoverable until they are archived.
7. Archived documents are preserved but removed from normal navigation.
8. Automation may analyze and recommend, but must not silently alter project-owned content.
9. Governance rules should be configurable where project needs differ.
10. Human approval remains the final authority.

## Scope

Governance applies to:

- canonical documentation
- policies
- architecture documents
- specifications
- operational guides
- developer documentation
- user documentation
- templates when they define project-facing standards

Governance may be lighter for:

- temporary notes
- working drafts
- generated reports
- disposable migration artifacts
- update-package files under `.update/`

## Governance Model

```text
Create
  ↓
Draft
  ↓
Review
  ↓
Approved
  ↓
Maintained
  ↓
Deprecated
  ↓
Archived
```

Not every document must pass through every state, but authoritative documents
must reach an approved or maintained state before being treated as canonical.

## Enforcement Model

Governance begins as advisory.

The Framework Advisor should:

- identify missing metadata
- identify overdue reviews
- identify documents without owners
- identify invalid lifecycle states
- identify canonical documents with unresolved review status
- recommend corrective action

Projects may later choose stricter enforcement in CI or release workflows.

## Parent Navigation

- [Governance](README.md)

## Related Documents

- [Document Metadata Standard](Document_Metadata_Standard.md)
- [Document Lifecycle](Document_Lifecycle.md)
- [Ownership and Review](Ownership_and_Review.md)
- [Analyzer Compliance](Analyzer_Compliance.md)
