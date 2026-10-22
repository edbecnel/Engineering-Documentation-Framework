# Document Metadata Standard

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Governance](README.md) › Document Metadata Standard

> **Status:** Canonical
> **Owner:** Engineering Documentation Framework
> **Applies To:** Governed Markdown documents
> **Last Reviewed:** 2026-07-10

## Purpose

This standard defines the minimum metadata required to govern engineering
documentation consistently.

## Initial Representation

Until EDF adopts a machine-readable front-matter format, metadata should be written
as a Markdown block immediately below the document title.

```markdown
> **Status:** Draft
> **Owner:** Team or role
> **Applies To:** Project, subsystem, or audience
> **Last Reviewed:** YYYY-MM-DD
> **Review Frequency:** Annual
> **Authoritative:** Yes

## Applicability

This document defines baseline governance that applies to:

- the Engineering Documentation Framework repository
- projects that adopt the Engineering Documentation Framework

EDF itself follows this baseline governance and also follows the additional
framework-specific requirements in [EDF Governance](EDF_Governance.md).

```

## Required Fields

| Field | Required | Purpose |
|---|---:|---|
| Status | Yes | Identifies the lifecycle state |
| Owner | Yes | Identifies the accountable role or group |
| Applies To | Yes | Defines scope |
| Last Reviewed | Yes for approved or maintained documents | Records the most recent substantive review |
| Review Frequency | Yes for governed documents | Defines the expected review interval |
| Authoritative | Yes for canonical candidates | Distinguishes source documents from supporting material |

## Optional Fields

| Field | Purpose |
|---|---|
| Version | Document-specific version when needed |
| Approver | Required approval authority |
| Approved On | Date approval was granted |
| Supersedes | Document replaced by this one |
| Superseded By | Replacement document |
| Related ADRs | Links to applicable decisions |
| Primary Logical Domain | One of `DA`, `EG`, `AE`, `EPI` when classification is required for this document class |
| Related Logical Domains | Comma-separated registry IDs; optional cross-cutting domains |
| Security Classification | Handling requirements |
| Review Notes | Context for the next review |

## Valid Status Values

- Draft
- In Review
- Approved
- Maintained
- Deprecated
- Archived

## Owner Values

The owner should normally be a stable role or team, not an individual person.

Preferred:

```text
Architecture Team
Project Maintainer
Security Owner
Documentation Owner
Engineering Documentation Framework
```

Avoid using a named individual unless the project is intentionally maintained by
one person and no stable role exists.

## Authoritative Values

Use:

- `Yes` for the canonical source of a concept
- `No` for supporting, derived, or informational content

A concept should normally have only one authoritative document.

## Review Frequency Values

Recommended values:

- Monthly
- Quarterly
- Semiannual
- Annual
- Per Release
- On Change
- Not Scheduled

`Not Scheduled` should be limited to drafts, archives, or low-risk reference material.

## Logical domain classification

Logical architectural domains classify **subject-matter ownership** within EDF. Registry definitions: [Documentation Information Architecture — Logical Architectural Domains](../Architecture/Documentation_Information_Architecture.md#logical-architectural-domains). Central index during migration: [Logical Domain Classification Index](../Architecture/Logical_Domain_Classification_Index.md).

Valid identifiers: `DA`, `EG`, `AE`, `EPI`.

### Representation

Governed metadata block:

```markdown
> **Primary Logical Domain:** EPI
> **Related Logical Domains:** EG, AE
```

Framework specification metadata table:

```markdown
| **Primary Logical Domain** | EPI |
| **Related Logical Domains** | EG, AE |
```

Do not introduce YAML front matter for domain classification.

### Requirements by document class

| Class | Primary logical domain |
|---|---|
| New normative framework specifications | Required at creation |
| New canonical governance policies and new `Authoritative: Yes` handbook documents | Required at creation |
| Existing documents in those classes | Add on next governed revision; until then, index governs |
| ADRs | Recommended at creation or next revision |
| Templates | Optional unless the template encodes a cross-domain contract |
| Instance records (EGR, MVR, GMR, AAR files) | Optional; exempt from bulk migration |

### Synchronization and conflicts

When document metadata includes logical domain fields, it MUST agree with the [Logical Domain Classification Index](../Architecture/Logical_Domain_Classification_Index.md). Resolve conflicts per the index reconciliation rules; update both representations in one governed change.

### Non-effects

Logical domain fields do **not** confer approval, normative effectiveness, specification maturity, adoption, or lifecycle state. They do not replace physical placement rules in the Information Architecture.

## Machine-Readable Future

A later EDF version may introduce YAML front matter or a repository governance
manifest. The semantic meaning defined here should remain stable even if the
serialization format changes.

## Parent

- [Governance](README.md)

## Related Documents

- [Governance Overview](Governance_Overview.md)
- [Document Lifecycle](Document_Lifecycle.md)
- [Ownership and Review](Ownership_and_Review.md)
- [Governance Analyzer Compliance](Analyzer_Compliance.md)
