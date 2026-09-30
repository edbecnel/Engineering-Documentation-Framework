# Governance Overview

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Governance Overview

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF and adopting projects
> **Last Reviewed:** 2026-09-22

## Applicability

This document defines baseline governance that applies to:

- the Engineering Documentation Framework repository
- projects that adopt the Engineering Documentation Framework

EDF itself follows this baseline governance and also follows the additional
framework-specific requirements in [EDF Governance](EDF_Governance.md).

## Purpose

Governance ensures that documentation remains authoritative, discoverable,
reviewable, current, and aligned with the project it describes.

Governance complements the documentation information architecture by defining how
documents are managed throughout their lifecycle.

## Governance Layers

EDF uses two governance layers.

### Baseline Governance

Baseline governance applies to both the Engineering Documentation Framework and
projects that adopt it. It covers document metadata, lifecycle, ownership, review,
change management, analyzer expectations, and governance checks.

### EDF-Specific Governance

EDF-specific governance applies only to development and maintenance of the
Engineering Documentation Framework repository. It extends the baseline with rules
for templates, generators, the Framework Advisor, framework governance documents,
self-hosting, versioning, and releases.

See [EDF Governance](EDF_Governance.md) for the framework-specific extension.

## Governance Principles

1. Every authoritative document has a clearly identified owner.
2. Every governed document has an explicit lifecycle state.
3. Review frequency is proportional to the document's risk and rate of change.
4. Governance rigor should be proportional to unresolved engineering risk. After substantive decisions are Accepted, remaining administrative or documentation work MUST NOT automatically stay on the critical path unless that work is necessary to protect correctness, traceability, safety, compliance, or another declared requirement. A [Governed Dependency Override](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) is the controlled mechanism for that proportionality on Open program gates — not informal gate skipping. Projects that adopt the optional [Governed Maintenance Fast Path](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) apply the same proportionality idea to bounded corrective maintenance via two declared-architecture-authority gates and a lightweight Governed Maintenance Record.
5. Project facts must not be invented or inferred without evidence.
6. Significant documentation changes require traceable review.
7. Deprecated documents remain discoverable until they are archived.
8. Archived documents are preserved but removed from normal navigation.
9. Automation may analyze and recommend, but must not silently alter project-owned content.
10. Governance rules should be configurable where project needs differ.
11. Human approval remains the final authority.

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

## Parent

- [Governance](README.md)

## Child Documents

- [EDF Governance](EDF_Governance.md)
- [Document Metadata Standard](Document_Metadata_Standard.md)
- [Document Lifecycle](Document_Lifecycle.md)
- [Ownership and Review](Ownership_and_Review.md)
- [Documentation Change Management](Change_Management.md)
- [Governance Analyzer Compliance](Analyzer_Compliance.md)
- [Governance Checklist](Governance_Checklist.md)

## Related Documents

- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md)
- [Engineering Development Policy](../Development/Engineering_Development_Policy.md)
