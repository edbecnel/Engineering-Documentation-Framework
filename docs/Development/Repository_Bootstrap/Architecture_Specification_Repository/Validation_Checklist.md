# ASR Validation Checklist

[Home](../../../../README.md) › [Project Index](../../../../PROJECT_INDEX.md) › [Development](../../README.md) › [Repository Bootstrap](../README.md) › [Architecture Specification Repository](README.md) › Validation Checklist

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Architecture Specification Repository bootstrap validation
> **Last Reviewed:** 2026-08-03
> **Authoritative:** Yes

## Purpose

Validate that an Architecture Specification Repository bootstrap completed successfully. Use with Framework Advisor (`profile: core`) and produce a gap report for remaining work.

## Validation Layers

| Layer | Method |
|---|---|
| Structural | Framework Advisor with `profile: core` |
| ASR bootstrap | This checklist |
| Semantic | Manual review: historical vs normative separation |
| Gap reporting | `ASR_BOOTSTRAP_REPORT.md` in target repository |

## Required

- [ ] Engineer followed the [Bootstrap Procedure](Bootstrap_Procedure.md) intentionally
- [ ] `profile: core` (or equivalent Core-only structure)
- [ ] EDF Core directories exist
- [ ] `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` at project root
- [ ] `PROJECT_CHARTER.md`, `PROJECT_INDEX.md`, and root `README.md` identify ASR purpose
- [ ] `docs/Architecture/README.md` includes discovery record document type guidance
- [ ] `docs/Architecture/ADRs/README.md` exists
- [ ] `docs/Architecture/Watch_Items/README.md` exists (create if missing)
- [ ] `docs/Specifications/README.md` notes ASR normative specification role
- [ ] `docs/Governance/README.md` exists
- [ ] `docs/Reference/README.md` exists
- [ ] `docs/Development/README.md` exists
- [ ] Discovery records marked non-normative; not in `docs/Specifications/`
- [ ] Normative specifications (if any) in `docs/Specifications/`, not presented as discovery records
- [ ] `ASR_BOOTSTRAP_REPORT.md` or `ADOPTION_STATUS.md` records deferred items and document mappings

## Recommended

- [ ] `docs/Reference/Glossary.md` started
- [ ] Foundational principles document(s) in `docs/Architecture/`
- [ ] Adoption guidance in `docs/Development/`
- [ ] Validation methodology notes in `docs/Development/`

## Optional

- [ ] Reference models, conformance material, reference implementation — only if applicable and documented

## Framework Advisor

```bash
/path/to/Engineering-Documentation-Framework/scripts/run_conformance_validation.sh "/path/to/repo"
```

With `profile: core`, missing software profile directories must not penalize the repository.

## Gap Report

Copy [ASR Bootstrap Report Template](../../../Templates/ASR_Bootstrap_Report_Template.md) to the target repository as `ASR_BOOTSTRAP_REPORT.md`. Record:

- Completed bootstrap steps
- Document location mappings
- Deferred artifacts
- Items requiring human decision
- Feedback for EDF improvement

## CRA Validation Criteria

After CRA bootstrap:

- `CRA-0000` preserved as non-normative architectural discovery record
- Repository ready for `CRA-0001` in `docs/Specifications/`
- Gap report lists any CRA-specific decisions

## EDF Self-Validation

EDF should be describable as an ASR without special exceptions. Full EDF structural self-migration is explicitly out of scope for initial ASR guidance implementation.

| Criterion | EDF state |
|---|---|
| Primary artifact is adoptable specification | Yes — documentation methodology |
| Discovery vs normative separation | AWIs vs ADRs vs Specifications — see [Guidance](Guidance.md) mapping |
| Reference implementation | Software profile layout is reference, not canonical architecture |

## Parent

- [Architecture Specification Repository](README.md)

## Related Documents

- [Bootstrap Procedure](Bootstrap_Procedure.md)
- [Project Analysis and Validation Tool](../../Project_Analysis_Validation_Tool.md)
