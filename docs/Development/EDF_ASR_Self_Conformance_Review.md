# EDF ASR Self-Conformance Review

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Development](README.md) › EDF ASR Self-Conformance Review

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** EDF as first reference implementation of Architecture Specification Repository guidance
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes
> **Normative:** No

## Purpose

This document records a structured architectural self-validation of the Engineering Documentation Framework (EDF) against its published [Architecture Specification Repository](Repository_Bootstrap/Architecture_Specification_Repository/README.md) bootstrap guidance.

This is **not** a bootstrap and **not** a migration. EDF already defines the engineering methodology. The review determines where EDF conforms to its own ASR guidance, where improvements are warranted, and where alignment should occur over time.

**Guidance baseline:** [ASR Bootstrap Package](Repository_Bootstrap/Architecture_Specification_Repository/) (README, Guidance, Bootstrap Procedure, Reference Model, Validation Checklist) plus [AWI-0003](../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md).

## A. Overall Assessment

**Verdict: EDF naturally satisfies the characteristics of an Architecture Specification Repository, with strong structural and governance conformance and deliberate semantic gaps that AWI-0003 already anticipates.**

EDF meets the ASR definition:

- Its **primary engineering artifact** is an adoptable documentation methodology and engineering discipline.
- Documentation is **constitutive** of the deliverable.
- **Independent adoption** is an explicit success criterion (bootstrap guides, conformance tiers, templates).
- **ADRs, governance, and watch items** are first-class, mature artifacts.
- The **Software Engineering profile** functions as an optional, non-canonical reference implementation — consistent with ASR guidance.

Against EDF's own [Validation Checklist](Repository_Bootstrap/Architecture_Specification_Repository/Validation_Checklist.md), EDF would **not pass a literal bootstrap checklist** if applied mechanically to this repository. That is expected and largely appropriate:

| Checklist category | EDF posture |
|---|---|
| Structural (Core directories, domain READMEs) | **Strong** — all Core domains exist and are navigable |
| Identity documents identify ASR purpose | **Partial** — [README.md](../../README.md) yes; [PROJECT_CHARTER.md](../../PROJECT_CHARTER.md) still generic template |
| Semantic (discovery vs normative separation) | **Conceptually aligned, structurally immature** — pattern is published; EDF has no discovery records and no normative specs in `docs/Specifications/` |
| Bootstrap artifacts (`ASR_BOOTSTRAP_REPORT.md`, `ENGINEERING_DOCUMENTATION_FRAMEWORK.md`) | **N/A by design** — these target adopting repos, not the framework source repo |
| Self-validation note in checklist | **Explicitly defers full structural self-migration** |

The review confirms what [Validation Checklist.md § EDF Self-Validation](Repository_Bootstrap/Architecture_Specification_Repository/Validation_Checklist.md) already states: EDF is describable as an ASR without special exceptions, while **full structural self-migration is out of scope** for initial ASR guidance.

## B. Exemplary Reference Implementation Areas

EDF already demonstrates ASR guidance effectively in these areas:

1. **Complete ASR bootstrap package** — authoritative documents, AI playbook, templates, integrated into [Bootstrap Guide](Bootstrap_Guide.md) and [PROJECT_INDEX](../../PROJECT_INDEX.md).
2. **Conservative design principle** — [Repository Bootstrap README](Repository_Bootstrap/README.md) defers taxonomy finalization; procedural invocation avoids premature `repository_class`.
3. **AWI-0003 as meta-conformance** — EDF used its own watch-item mechanism to record the semantic gap ASR exposed.
4. **Decision and deferral governance** — ADR/AWI lifecycle with demonstrated promotion (AWI-0002 → ADR-0003/0004).
5. **Historical vs normative rules** — [Guidance.md](Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md) defines separate identifier namespaces and anti-promotion rules.
6. **Methodology vs execution separation** — `docs/` canonical; `interaction/` and `scripts/` execute without redefining methodology (ADR-0004).
7. **Adoption and validation engineering** — Bootstrap, migration, conformance tiers, Framework Advisor, self-hosting governance.
8. **Reference Model as non-normative planning tool** — Correctly scoped; bootstrap tiers separated from conceptual areas.

## C. Incremental Improvement Areas

### Completed by this review

| Item | Action taken |
|---|---|
| `docs/Architecture/Watch_Items/README.md` | Created domain index |
| Architecture README discovery guidance | Added Architectural Discovery Records section |
| Specifications README ASR note | Added ASR interpretation (dual semantics) |
| Self-Conformance artifact | This document |
| Glossary gaps | Added AWI, engineering methodology, self-conformance review |
| Reference implementation labeling | Strengthened root README callout |
| ASR Self-Conformance procedure | Added to ASR guidance package |
| Framework Advisor self-validation | Ran via `run_self_hosting_validation.sh` (2026-08-03); report under `reports/self-hosting/` per [Framework Self-Hosting](../Governance/Framework_Self_Hosting.md) |

### Remaining (future, maturity-dependent)

| Item | Action |
|---|---|
| Architectural Discovery Record evaluation | See [Discovery Record Evaluation](#architectural-discovery-record-evaluation) below |
| Normative architecture specifications | Introduce numbered specs in `docs/Specifications/` when adoptable conformance claims warrant extraction from DIA |
| PROJECT_CHARTER completion | Replace template with architecture-program mission, scope, and specification authority |
| AWI template | Add to `docs/Templates/` for consistency with ADR/discovery/spec templates |
| ADR-0002 completion | Profile-aware validation reduces false signals for ASR adopters |

### Deferred (AWI-0003 and related)

- Repository semantic context / convention binding mechanism
- Dedicated discovery-record subdomain vs document-type decision
- Context-aware Framework Advisor validation
- Machine-readable repository classification
- Whether EDF should structurally converge to `profile: core` only

## D. Review Question Answers

### 1. Does EDF naturally satisfy ASR characteristics?

**Yes.** EDF is listed as an ASR example alongside CRA and SIP. Its deliverable is the methodology itself.

### 2. Where does EDF already conform?

See [Section B](#b-exemplary-reference-implementation-areas).

### 3–4. Where does EDF differ, and why?

| Difference | Classification | Rationale |
|---|---|---|
| Normative methodology in `docs/Architecture/` rather than `docs/Specifications/` | Historical + intentional | Pre-ASR organization; DIA is authoritative IA, not a numbered architecture specification |
| Empty `docs/Specifications/` (README only) | Transitional opportunity | ASR guidance defines normative specs here; not a conformance failure for a mature repo |
| No architectural discovery records | Evaluate if warranted | See [Discovery Record Evaluation](#architectural-discovery-record-evaluation) |
| `PROJECT_CHARTER.md` is generic template | Implementation debt | ASR guidance maps charter to architecture program mission |
| Full Software Engineering profile paths present | Intentional reference implementation | Documented in README and ADR-0002 |
| Missing domain README gaps | Implementation debt | Addressed by this review |
| No `ASR_BOOTSTRAP_REPORT.md` | Intentional | This Self-Conformance Review is the appropriate equivalent |
| No `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` at EDF root | Intentional | Adopter artifact created by bootstrap scripts |

### 5. What should evolve to better demonstrate the guidance?

Incremental, high-value demonstrations — not reorganization. See [Section C](#c-incremental-improvement-areas).

### 6. Should ASR guidance be revised based on EDF?

**Yes — targeted revisions.** See [Self-Conformance Review procedure](Repository_Bootstrap/Architecture_Specification_Repository/Self_Conformance_Review.md) and updated [Validation Checklist](Repository_Bootstrap/Architecture_Specification_Repository/Validation_Checklist.md).

### 7. Does EDF distinguish the eight artifact types sufficiently?

| Type | Distinguished? | Notes |
|---|---|---|
| Historical architectural discovery | Defined for adopters; EDF instance TBD | Whether one is warranted depends on historical analysis |
| Normative architectural specifications | Defined, not demonstrated | Normative content effectively lives in DIA and governance docs |
| Architectural decisions (ADRs) | Strong | Clear status model and indexes |
| Architectural watch items (AWIs) | Strong | Promotion path demonstrated (AWI-0002) |
| Governance | Strong | Baseline + EDF-specific layers |
| Reference material | Good | Glossary, self-hosting report |
| Adoption guidance | Strong | Development domain + AI playbooks |
| Engineering methodology | Good | Glossary entry added; distributed across `docs/` |

### 8. Are organization, navigation, and semantics internally consistent?

**Navigation: yes.** **Semantics: partially consistent.** AWI-0003 documents the central tension; domain README annotations improve surfacing without mass relocation.

### 9. Does EDF need incremental structural evolution?

**Yes — incremental only.** Priority is semantic surfacing and maturity-dependent normative spec development.

## E. Architectural Discovery Record Evaluation

**Question:** Should EDF author a formal Architectural Discovery Record?

**Method:** Review existing origin and motivation artifacts — [README.md](../../README.md), [CHANGELOG.md](../../CHANGELOG.md), [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md), milestone ADRs, [archive/](../../archive/), and framework ADRs.

**Conclusion:** A formal discovery record is **not warranted at this time**. Existing artifacts collectively capture EDF's origin, evolution, and architectural motivation with sufficient depth for adopters. A discovery record should be reconsidered only if future historical analysis identifies a genuine gap — for example, if adoptable context exists only in non-canonical sources (chat, wikis, oral history) that cannot be referenced from the repository.

**This is not a conformance gap.** EDF provides the discovery record pattern and template for adopters without requiring a self-referential instance.

## F. Normative Specifications — Maturity Roadmap

Numbered normative architecture specifications in `docs/Specifications/` remain **maturity-dependent**. Candidates for future extraction include documentation domain rules currently embedded in [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md). No placeholder specifications should be created for demonstration purposes.

## G. AWI-0003 Revisit Status

This review satisfies the EDF portion of AWI-0003 promotion criterion 1 ("ASR bootstrap capability reviewed against EDF self-description"). CRA bootstrap review remains pending before full mechanism evaluation. See [AWI-0003](../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md) for revisit scheduling.

## H. Changes That Should NOT Be Made

- **Do not** mass-relocate DIA, governance, or methodology docs to `docs/Specifications/` for checklist compliance
- **Do not** introduce `repository_class` or equivalent in `edf-adoption.yaml`
- **Do not** remove Software Engineering profile paths without ADR and replacement strategy
- **Do not** run ASR bootstrap procedure against EDF
- **Do not** generate empty placeholder normative specifications or discovery records for conformance demonstration
- **Do not** author an Architectural Discovery Record unless historical analysis demonstrates genuine benefit
- **Do not** rewrite historical ADRs or archive content to fit ASR numbering
- **Do not** treat Validation Checklist as mandatory literal compliance for the framework source repository

## Engineering Principle

EDF **should remain the primary reference implementation of its own methodology** — not a mechanically checklist-compliant clone of what it prescribes for greenfield ASR bootstraps.

**Conformance is architectural alignment:** EDF publishes mature ASR guidance, governs its own evolution through AWIs, and honestly documents where semantic binding remains open.

## Parent

- [Development](README.md)

## Related Documents

- [Architecture Specification Repository](Repository_Bootstrap/Architecture_Specification_Repository/README.md)
- [Self-Conformance Review Procedure](Repository_Bootstrap/Architecture_Specification_Repository/Self_Conformance_Review.md)
- [Validation Checklist](Repository_Bootstrap/Architecture_Specification_Repository/Validation_Checklist.md)
- [AWI-0003](../Architecture/Watch_Items/AWI-0003-Repository-Semantic-Context-and-Convention-Binding.md)
