[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Program

# Program

## Purpose

Program-level engineering documentation: milestones, releases, **Engineering Gate Review Records (EGR)**, and optional **Governed Maintenance Records (GMR)** under the Governed Maintenance Fast Path (GMFP).

Normative specification: [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md). Gate Status and Dependency Disposition are independent. An Open gate may carry an Active **Governed Dependency Override** that authorizes a precise downstream activity without completing the gate.

Optional bounded-maintenance governance: [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) ([ADR-0009](../Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md)).

## Gate Reviews

Authoritative gate approval artifacts live under [Gate_Reviews/](Gate_Reviews/README.md). Index **Active overrides** for Open gates that still have a Governed Dependency Override (governance debt). Do not add a separate debt register.

| Gate ID | Record | Status | Active overrides |
|---|---|---|---|
| _Add rows when EGR files exist_ | | Open / Satisfied / Rejected / Deferred / Waived / Superseded | none / [link] |

Use [Gate_Review_Record_Template.md](../Templates/Gate_Review_Record_Template.md) when creating new EGR files.

## Maintenance Records

Optional **Governed Maintenance Records** for GMFP live under [Maintenance_Records/](Maintenance_Records/README.md). Use [Governed_Maintenance_Record_Template.md](../Templates/Governed_Maintenance_Record_Template.md). GMFP uses two human governance gates (authorization; acceptance and publication); GMFP-2 is execution only.

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
- [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [ADR-0009](../Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
- [Glossary](../Reference/Glossary.md)
