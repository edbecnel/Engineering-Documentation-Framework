[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Program

# Program

## Purpose

Program-level engineering documentation: milestones, releases, and **Engineering Gate Review Records (EGR)** that record human approval before unblocking defined work.

Normative specification: [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md). Gate Status and Dependency Disposition are independent. An Open gate may carry an Active **Governed Dependency Override** that authorizes a precise downstream activity without completing the gate.

## Gate Reviews

Authoritative gate approval artifacts live under [Gate_Reviews/](Gate_Reviews/README.md). Index **Active overrides** for Open gates that still have a Governed Dependency Override (governance debt). Do not add a separate debt register.

| Gate ID | Record | Status | Active overrides |
|---|---|---|---|
| _Add rows when EGR files exist_ | | Open / Satisfied / Rejected / Deferred / Waived / Superseded | none / [link] |

Use [Gate_Review_Record_Template.md](../Templates/Gate_Review_Record_Template.md) when creating new EGR files.

## Bootstrap vs Program Gates

| Type | IDs | Meaning |
|---|---|---|
| Bootstrap validation gates (BVG) | BVG-1 … BVG-6 | Automated adoption checks (Framework Advisor tiers, bootstrap report) |
| Engineering Gate Review (EGR) | G0, G1, EGR-0001, … | Human approval bundles in `Gate_Reviews/` |

Do not use bootstrap G1–G6 as program gate IDs in EGR filenames.

## Parent

- [Project Index](../../PROJECT_INDEX.md)

## Related Documents

- [ADR-0007](../Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md)
- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
- [Glossary](../Reference/Glossary.md)
