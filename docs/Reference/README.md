# Reference

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › Reference

## Purpose

This domain contains stable framework reference material, validation records,
terminology, and supporting information that does not belong to another
authoritative documentation domain.

## Terminology and identifiers

The canonical EDF glossary is [Glossary.md](Glossary.md). Start there for governance terms (for example **Engineering Gate Review Record (EGR)**, **Governed Dependency Override (GDO)**, **GMFP**, **MVR**, **AAR**, **BVG**). Terminology evolution rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md).

| Kind | Pattern / location | Notes |
|------|-------------------|--------|
| **Architecture Decision Record (ADR)** | `docs/Architecture/ADRs/ADR-NNNN-*.md` | Governed decisions; not an **Architectural Discovery Record** |
| **Normative framework specifications** | `docs/Specifications/*-0001-*.md` | For example EGR-0001, GMFP-0001, MVR-0001, TGR-0001 |
| **Program gate records** | `docs/Program/Gate_Reviews/` | **EGR** artifacts; gate IDs are project-defined |
| **Product feature specs (software profile)** | `SPEC-NNN` in adopting projects | Local product requirements — not the same namespace as EDF framework specs |

## Framework Advisor (disambiguation)

The [Framework Advisor](../Development/Project_Analysis_Validation_Tool.md) is EDF’s read-only documentation conformance analyzer (reports under `reports/conformance/`). It recommends improvements; it does **not** authorize governance outcomes. It is **not** an [Architectural Audit Record (AAR)](../Specifications/AAR-0001-Architectural-Audit-Records.md) (implementation vs architecture) and **not** a [Bootstrap Validation Gate (BVG)](Glossary.md) (automated bootstrap checks).

## Documents

- [Glossary](Glossary.md)
- [EDF Self-Hosting Report](EDF_Self_Hosting_Report.md)

## Child Documents

- [Glossary](Glossary.md)
- [EDF Self-Hosting Report](EDF_Self_Hosting_Report.md)

## Parent

- [Project Index](../../PROJECT_INDEX.md)

## Related Documents

- [Governance](../Governance/README.md)
- [Framework Self-Hosting](../Governance/Framework_Self_Hosting.md)
- [Program](../Program/README.md)
