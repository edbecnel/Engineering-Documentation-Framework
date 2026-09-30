# TGR-0001: Terminology Governance

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › TGR-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Accepted |
| **Specification ID** | TGR-0001 |
| **Version** | 1.1 |
| **Date** | 2026-10-01 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |

## Purpose

Define adoptable requirements for **terminology governance** in EDF-enabled projects: stable governed concepts, evolving preferred labels and aliases, scoped semantic equivalence, external terminology accuracy, living-document modernization rules, historical preservation, identifier separation, and a minimum downstream consumption contract.

## Scope

### In scope

- Glossary term references as stable concept identity within a glossary file
- Terminology dispositions, scopes, provenance, and equivalence declarations
- Living versus provenance-sensitive documentation classes
- Relationship to document lifecycle, GMFP, and existing alias precedents
- Layered terminology authority: EDF recommendation, adopter policy, adopter enforcement
- EDF framework terminology versus adopting-organization or downstream-project terminology policy

### Out of scope

- Mandatory adoption of any specific EDF-recommended human-facing term by all adopters
- Mass terminology migration or rewrites of historical records
- Filename or directory renames driven solely by terminology presentation
- Mandatory adopter CI, linting, or Framework Advisor enforcement (adopter-optional)
- Machine-readable terminology registries or migration tooling (future work)
- CRA/CKES runtime dependencies

## Normative Requirements

### Governed concepts and glossary term references

1. A **governed concept** is a documented engineering meaning that a project chooses to control for consistent use across governed documentation.
2. Each governed concept recorded in a glossary **MUST** have a **glossary term reference**: an immutable kebab-case slug, unique within that glossary file, assigned at first governance and **MUST NOT** change thereafter.
3. The glossary term reference identifies the concept. The **Term** column (preferred display label) **MAY** change when terminology policy changes.
4. Projects **SHOULD** record governed concepts in `docs/Reference/Glossary.md` (EDF framework) or a project glossary documented in adoption material. Product-only glossaries **MAY** live elsewhere when documented (for example software-profile `Specifications/Glossary.md`).
5. A fully qualified consumer reference **SHOULD** be expressed as the repository-relative glossary path plus term reference (for example `docs/Reference/Glossary.md#glossary-term-reference` as a convention; fragment spelling equals the slug).

### Terminology representations

6. For each governed concept, the glossary **SHOULD** document where applicable:
   - **Preferred term** — default label for new living documentation in declared scopes
   - **Abbreviation** — registered short form when used
   - **Aliases** — other accepted labels for discovery and migration (including former preferred terms)
   - **External labels** — third-party or provider terms associated with the concept without implying universal equivalence
7. Representations **MUST NOT** be treated as artifact identifiers (ADR-NNNN, API paths, schema property names, and similar).

### Terminology disposition

8. Each representation **SHOULD** carry a **terminology disposition** describing its role. Allowed values:
   - **Preferred** — default for new living documentation in a **declared mandatory scope** (typically the publishing project's own adopter terminology policy)
   - **Recommended** — label the publishing project (for example EDF) promotes for adopters; **not** an automatic EDF conformance requirement for adopting projects unless the adopter elevates it to policy
   - **Abbreviation** — registered short form of the preferred or recommended term
   - **Alias** — accepted equivalent for discovery within declared scope
   - **Legacy** — former preferred or common label; still recognized until removed from maintained docs
   - **Deprecated (term)** — MUST NOT be introduced in new normative text in scope; MAY remain for search until removed per policy
   - **Historical** — wording frozen in a cited provenance-sensitive record; not a living-doc label
   - **External** — defined outside project authority; quoted accurately; equivalence limited to declared scope
9. A single governed concept **MAY** have multiple dispositions simultaneously (for example Preferred + Legacy aliases).

### Terminology scope

10. **Terminology scope** declares where a preferred term or alias applies. Examples: EDF canonical prose, normative specifications, user guides, public positioning, provider API surface, source code comments, machine contracts.
11. Context-specific preferred terms **MAY** be declared for the **same** glossary term reference only when scopes are explicit and mutually consistent. Conflicting scopes **MUST** be resolved by split concepts or explicit non-equivalence — not silent project forks.

### Semantic equivalence and non-equivalence

12. When a new label replaces or supplements an older label, the governing decision **MUST** declare **equivalence**:
   - **Equivalent** within stated scope
   - **Narrower** — new label covers a subset; split concept or boundary note required
   - **Broader** — new label superset; split concept or boundary note required
   - **Overlapping** — partial overlap; aliases **MUST NOT** imply full interchangeability
   - **External-only** — external label associated but not adopted as preferred
   - **Historical-only** — label preserved only in cited historical records
13. If meanings diverge materially, projects **MUST** create a **separate** governed concept with its own glossary term reference rather than adding aliases to one identity.

### Terminology provenance and transition

14. Changes to preferred terminology **SHOULD** record **provenance**: governing ADR, normative specification amendment, organization policy reference, or EGR decision — with date and authority.
15. **Effective transition** information (for example effective date, migration tranche ID) **SHOULD** be recorded when living documentation modernization is authorized.
16. Terminology policy adoption **MUST NOT** retroactively alter the wording of provenance-sensitive historical records.

### Terminology authority, policy, and enforcement

17. Terminology authority is **layered**:
   - **EDF** defines and publishes **terminology recommendations** appropriate to the framework (including entries in the EDF glossary where applicable).
   - **Adopter governance** (adopting organization or adopting project) **MAY** elevate an EDF recommendation into a **project-specific normative requirement** (**adopter terminology policy**).
   - **Adopter enforcement** — mechanisms that check or require compliance with adopter terminology policy — are **optional** and belong to the adopter once policy is adopted.
18. **EDF conformance** to TGR-0001 **MUST NOT** automatically require adopters to use EDF's recommended human-facing terminology. Declining an EDF **Recommended** label, by itself, **MUST NOT** be treated as nonconformance with EDF.
19. Once an adopter adopts terminology policy through its own governance (for example project ADR, project specification, or project glossary rule), violation of that policy **MAY** constitute nonconformance with **that adopter's** requirements. Enforcement of that policy is the adopter's responsibility, not EDF's.
20. EDF **MAY** provide general guidance or reusable mechanisms supporting adopter enforcement (for example documentation conventions or optional analyzer rules). EDF **MUST NOT** assume every adopter enables them.
21. Candidate adopter enforcement mechanisms (non-exhaustive, **not** mandatory EDF core): project glossary rules; project specifications; architectural decisions; documentation conventions; Framework Advisor configuration; validation or CI checks; UI terminology requirements; code or documentation linting; migration policies.

### Living documentation

22. After **adopter terminology policy** is accepted for a mandatory scope, that adopter **SHOULD** use **Preferred** terms in **new** living documentation within that scope. EDF **Recommended** terms alone do not impose this obligation on adopters.
23. Modernization of **existing** living documentation **MAY** be required, allowed, discouraged, or prohibited by artifact class (see §Living-document matrix) **when** adopter policy mandates it. Unless adopter or EDF-self-hosting governance mandates migration, modernization **MAY** be opportunistic or tranche-based.
24. **Generated or derived** material (for example advisor reports) **SHOULD** be regenerated from sources rather than hand-edited for terminology alone.

### Provenance-sensitive historical records

25. The following **MUST NOT** be rewritten solely to modernize terminology:
   - Accepted ADR content where rewriting would alter the historical decision record
   - Architectural discovery records
   - AAR, MVR, EGR, and GMR instances
   - Completed implementation plans and closeout or evidence records under `tasks/` or equivalent
   - Archived material
26. Current terminology **MAY** be linked from these records via glossary term reference, alias tables, successor ADRs, or annotations that do not replace original quoted wording.

### Artifact and machine identifiers

27. Terminology governance **MUST NOT** require renaming ADR, specification, AAR, MVR, EGR, GMR, requirement, gap, or watch-item IDs; schema or API identifiers; source-code identifiers; filenames; or directory names.
28. Identifier migration, when needed, **MUST** be authorized separately and **MUST** address compatibility, references, and provenance explicitly.

### External terminology

29. Standards, provider APIs, product names, legal or regulatory text, and quotations **MUST** retain accurate external wording.
30. An external label **MAY** be associated with a governed concept using **External** disposition with explicit equivalence scope. EDF **MUST NOT** imply universal equivalence beyond that scope.

### EDF framework authority versus adopter organization policy

31. [docs/Reference/Glossary.md](../Reference/Glossary.md) governs **EDF framework terminology** and mechanisms defined by EDF normative specifications.
32. **Adopting-organization** or **downstream-project** terminology policy **MAY** exceed EDF scope (for example corporate positioning labels). Such policy **SHOULD** be recorded in that organization's or project's own governance. Adopters **SHOULD** map adopted terms into project glossaries using this specification rather than inventing conflicting local definitions for shared governed concepts.
33. EDF **MUST NOT** encode adopting-organization-specific or downstream-project-specific terminology mandates as universal EDF normative requirements. EDF **MUST NOT** silently claim authority over all domain concepts an adopter governs. Gaps **SHOULD** be recorded as open policy questions in the relevant adopter governance, not as implicit EDF glossary entries.

### Downstream consumption (minimum contract)

34. When sharing governed concepts with downstream EDF adopters, the publishing project **SHOULD** expose at minimum:
   - Glossary file path and **glossary term reference**
   - **Recommended** and/or **Preferred** terms and abbreviations for each declared scope, with dispositions clearly marked
   - Aliases with dispositions
   - Equivalence or non-equivalence statement and scope
   - Provenance pointer (ADR, spec, or policy)
   - Whether a label is EDF **terminology recommendation** only or has been elevated to **adopter terminology policy** in the publishing project (when applicable)
35. Machine-readable JSON or YAML export **MAY** be added in a future tranche; it is **not** required for conformance to TGR-0001 v1.

### Relationship to GMFP

36. Establishing terminology governance and adopting terminology policy are **not** GMFP-eligible activities.
37. Bounded mechanical updates to living documents after policy acceptance **MAY** use [GMFP-0001](GMFP-0001-Governed-Maintenance-Fast-Path.md) only when all GMFP eligibility criteria hold, including no change to Accepted ADR or normative specification **behavior**, and no change to canonical identity, ownership, reference, or lifecycle semantics except traceability recorded on a GMR.

### Glossary integration

38. EDF self-hosting projects **SHOULD** integrate terminology metadata into glossary tables or clearly linked subsections per [Glossary](../Reference/Glossary.md).
39. New governed concepts **MUST** include a glossary term reference at introduction.
40. Existing glossary rows **SHOULD** receive term references when next materially updated.

## Living-document matrix (default guidance)

| Artifact class | Terminology modernization |
|---|---|
| Normative specifications (`docs/Specifications/`) | **Required** after **adopter terminology policy** mandates when in scope; EDF self-hosting follows EDF governance |
| Maintained architecture (non-historical ADRs in Maintained/Proposed drafting) | **Allowed**; **required** when adopter policy mandates |
| Current guidance (handbooks, domain-specific living content) | **Context-dependent** — channel or domain labels may differ from EDF **Recommended** technology labels |
| User and developer documentation | **Allowed** / tranche-based |
| Glossary / reference | **Required** when policy changes preferred terms |
| Generated reports | **Regenerate** |
| Provenance-sensitive instances (§25) | **Prohibited** (rewrite) |
| Archive | **Prohibited** |

## Conformance

### EDF conformance (TGR-0001)

An adopting project conforms to **EDF terminology governance** when:

- Governed concepts that participate in shared or evolving terminology use glossary term references and document dispositions/scopes as required above, and
- Terminology **adopter policy** and migration decisions (when adopted) are traceable without rewriting historical records, and
- Downstream consumers can resolve shared concepts from published glossary material without conflicting local alias tables for the same term reference.

**EDF conformance does not require** adopting EDF **Recommended** human-facing labels. **Recommended** is not **Preferred** until the adopter elevates it through adopter terminology policy.

### Adopter policy and enforcement (separate)

Conformance with an **adopter's own** mandatory terminology policy — and any **adopter enforcement** applied to living documentation, UI, or other project-controlled surfaces — is governed by **that adopter's** requirements, not by TGR-0001 alone.

## Rationale

EDF already maintains controlled vocabulary and identifier stability but lacked a general terminology-evolution contract. Glossary-local term references provide the smallest stable identity without a global registry or CRA dependency.

## Future validation (non-normative)

Future tranches may add Framework Advisor checks for deprecated terms in normative paths or missing term references on new glossary rows. No validator changes are authorized by TGR-0001 v1.

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0011](../Architecture/ADRs/ADR-0011-Terminology-Governance.md)
- [Glossary](../Reference/Glossary.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
- [GMFP-0001](GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [CRA_CKES_EDF_Boundaries](../Architecture/CRA_CKES_EDF_Boundaries.md)

## Appendix A — Worked example (non-normative): layered recommendation, policy, and enforcement

This appendix **does not** adopt any specific preferred term. It demonstrates how TGR-0001 represents a **hypothetical** technology label change using neutral roles.

### Layer 1 — EDF terminology recommendation (not universal EDF conformance)

| Field | Example value |
|---|---|
| Publishing glossary | EDF or upstream framework glossary (hypothetical entry) |
| Glossary term reference | `intelligent-systems-capability` |
| **Recommended** (EDF scope) | Label B (full form); abbreviation **LB** |
| Alias / legacy / external | Label A; abbreviation **LA** — **Alias**, **Legacy**, or **External** as semantically appropriate |
| Equivalence | Declared only within stated scope; **Overlapping** or **Narrower** if not fully equivalent |
| EDF conformance | Adopters **need not** use Label B solely because EDF **Recommended** it |

### Layer 2 — Independent adopter (no project policy)

| Behavior | Example |
|---|---|
| Living documentation | May continue using Label A |
| EDF nonconformance | **Not** triggered solely by keeping Label A |

### Layer 3 — Adopting project policy

| Field | Example value |
|---|---|
| Adopter governance | Project ADR or project specification adopts EDF **Recommended** Label B as **Preferred** in project scope |
| Disposition change | **Recommended** (EDF) → **Preferred** (mandatory in project scope) |

### Layer 4 — Adopter enforcement (optional)

| Mechanism | Example |
|---|---|
| Project glossary / specs / lint / CI / UI guidelines | Require Label B on applicable living surfaces |
| Historical / external / provider / API / schema uses of Label A | Still governed by preservation and semantic-safety rules (§25–30) |

### Separate governed concept (channel vs technology)

| Field | Example value |
|---|---|
| Glossary term reference | `assisted-engineering-channel` (example only) |
| **Preferred** in EDF handbook scope | Label describing the engineering channel |
| Notes | Directory or path names are **identifiers**; terminology-only policy does not rename them |

### Open questions (adopter or framework PA disposition)

- Equivalence scope between Label A and Label B
- Whether adopting project policy should align handbook paths with technology branding
- Where adopting-organization authority ends and EDF framework glossary authority begins
