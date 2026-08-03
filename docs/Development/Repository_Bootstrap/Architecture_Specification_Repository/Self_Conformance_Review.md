# ASR Self-Conformance Review Procedure

[Home](../../../../README.md) › [Project Index](../../../../PROJECT_INDEX.md) › [Development](../../README.md) › [Repository Bootstrap](../README.md) › [Architecture Specification Repository](README.md) › Self-Conformance Review Procedure

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Architecture Specification Repositories evaluating conformance with published ASR guidance
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes

## Purpose

Define a structured self-validation activity for repositories that **already use EDF** and publish ASR bootstrap guidance — distinct from [Bootstrap Procedure](Bootstrap_Procedure.md) (initialization) and migration (adoption of EDF).

Self-conformance review determines where a repository already conforms to ASR guidance, where improvements are warranted, and where alignment should occur over time — without forcing mechanical compliance.

## When to Use

| Activity | Use when |
|---|---|
| **Bootstrap Procedure** | Initializing or restructuring a repository as an ASR |
| **Self-Conformance Review** | An existing ASR (or EDF itself) validating alignment with published ASR guidance |
| **Migration Guide** | Adopting EDF structure in a non-EDF repository |

## Procedure

1. **Confirm scope** — This is architectural review, not bootstrap. Do not relocate documents automatically.
2. **Establish baseline** — Read ASR README, Guidance, Reference Model, and Validation Checklist.
3. **Apply checklist selectively** — Use the [Checklist Applicability](#checklist-applicability) matrix; document exemptions for framework source repos.
4. **Compare artifact types** — Assess discovery vs normative vs ADR vs watch item vs governance vs reference vs adoption vs methodology distinctions.
5. **Classify differences** — Label each gap as intentional, historical, transitional, implementation debt, or future refinement.
6. **Evaluate discovery records** — Author a formal Architectural Discovery Record only if historical analysis demonstrates genuine benefit beyond existing artifacts.
7. **Record outcomes** — Publish a maintained Self-Conformance Review document (see [EDF example](../../EDF_ASR_Self_Conformance_Review.md)).
8. **Feed back to guidance** — Propose targeted ASR guidance revisions where the reference implementation reveals gaps.

## Checklist Applicability

Not every Validation Checklist item applies to every repository context.

| Artifact / check | Bootstrap target | Framework source repo (e.g. EDF) | Mature existing ASR |
|---|---|---|---|
| Bootstrap Procedure followed | Required | N/A — use Self-Conformance Review instead | N/A if pre-dates ASR guidance |
| `profile: core` structure | Required | Evaluate; reference implementation paths may coexist | Valid if documented |
| `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` | Required | Exempt — adopter artifact | Required for adopters |
| `ASR_BOOTSTRAP_REPORT.md` | Required | Replace with Self-Conformance Review | Optional if self-review exists |
| Discovery records | Required if history exists | Evaluate if warranted after historical analysis | Preserve existing; map in review |
| Normative specs in `docs/Specifications/` | Required when specs exist | Maturity-dependent | Historical normative content in Architecture is valid |
| Domain README annotations | Required | Required | Required |

## Valid ASR Layouts

Mature Architecture Specification Repositories may hold normative content in `docs/Architecture/` historically (for example, information architecture documents predating ASR numbering). Bootstrap and self-conformance review **map forward** — they do not require backward-forcing relocation to `docs/Specifications/`.

Migration of normative content to numbered architecture specifications in `docs/Specifications/` is incremental maturity, not a bootstrap blocker.

## Dual-Semantics README Pattern

Domain READMEs in ASR repositories should note when EDF Core domains carry ASR-specific interpretation. Use a context note rather than replacing default guidance wholesale.

Example (Specifications domain):

> **ASR interpretation:** In Architecture Specification Repositories, this domain holds **normative architecture specifications** rather than product requirements. See [ASR Guidance](Guidance.md).

## Reference Implementation Documentation

When an ASR includes optional reference implementations (for example, a Software Engineering profile layout), the repository README must state explicitly that those paths are **non-canonical demonstrations**, not normative architecture.

## Worked Example

EDF conducted the first Self-Conformance Review: [EDF ASR Self-Conformance Review](../../EDF_ASR_Self_Conformance_Review.md).

## Parent

- [Architecture Specification Repository](README.md)

## Related Documents

- [Bootstrap Procedure](Bootstrap_Procedure.md)
- [Validation Checklist](Validation_Checklist.md)
- [Guidance](Guidance.md)
- [EDF ASR Self-Conformance Review](../../EDF_ASR_Self_Conformance_Review.md)
