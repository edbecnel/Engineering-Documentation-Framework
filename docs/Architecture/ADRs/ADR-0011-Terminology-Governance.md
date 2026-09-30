# ADR-0011: Terminology Governance

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0011 Terminology Governance

| | |
|---|---|
| **Status** | Accepted |
| **Date** | 2026-10-01 |
| **Decision Makers** | EDF maintainers |
| **Related** | [TGR-0001](../../Specifications/TGR-0001-Terminology-Governance.md), [Glossary](../../Reference/Glossary.md), [ADR-0004](ADR-0004-Interaction-Specifications.md), [ADR-0006](ADR-0006-Engineering-Documentation-vs-Artifacts.md), [CRA_CKES_EDF_Boundaries](../CRA_CKES_EDF_Boundaries.md), [Document Lifecycle](../../Governance/Document_Lifecycle.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

EDF maintains a canonical [Glossary](../../Reference/Glossary.md), document [lifecycle](../../Governance/Document_Lifecycle.md) rules, stable artifact identifier namespaces (for example ADR, EGR, MVR), and narrow precedents for aliases and terminology transitions (for example BVG ↔ G1–G6, [ADR-0004](ADR-0004-Interaction-Specifications.md) Interaction Specifications).

Downstream EDF adopters need a **general** contract for terminology evolution: preferred labels, abbreviations, aliases, legacy and external wording, semantic equivalence boundaries, and historical preservation — without conflating presentation terminology with artifact identity or falsifying provenance-sensitive records.

[CRA_CKES_EDF_Boundaries](../CRA_CKES_EDF_Boundaries.md) states that EDF may apply CRA principles (canonical knowledge versus representations) without requiring CRA identity registries or CKES runtimes. Terminology governance belongs in EDF Core, not in an external ontology or registry service.

This ADR does **not** adopt any organization-wide or adopter-mandatory preferred term. Specific label choices remain separate **adopter terminology policy** decisions.

---

# Problem

1. Glossary rows are keyed by **display terms**; there is no stable reference for a governed meaning when the preferred label changes.
2. Document deprecation rules apply to **documents**, not to **terms** within living corpora.
3. A global terminology migration could collide with stable artifact IDs, filenames, historical audit records, and accurate external quotations.
4. Adopters lack a minimum contract for shared vocabulary consumption without project-local alias tables.

---

# Decision

## 1. Introduce terminology governance as an EDF framework capability

Normative requirements: [TGR-0001](../../Specifications/TGR-0001-Terminology-Governance.md).

Terminology governance applies to **governed concepts** recorded in project glossaries (for EDF self-hosting: [docs/Reference/Glossary.md](../../Reference/Glossary.md)). It does **not** make the EDF glossary the universal terminology database for every concept an adopting organization governs.

## 2. Stable identity: glossary term reference (smallest adequate mechanism)

A governed concept is identified by a **glossary term reference**:

- An **immutable**, **unique-within-glossary-file** slug (kebab-case) assigned when the concept is first governed.
- Scoped to the glossary file path (for example `docs/Reference/Glossary.md` in EDF).
- **Independent** of the current preferred display label in the **Term** column.

**Why this mechanism**

| Alternative | Reason not selected |
|---|---|
| Display term as identity | Changes when preferred terminology changes; breaks stable cross-references. |
| Reuse ADR/spec/gate IDs | Those identify **artifacts** and obligations, not domain meanings. |
| New global concept-ID namespace | Heavier than required; risks ontology creep. |
| CRA/CKES identity registry | Out of scope; EDF must not require external runtime or registry dependency. |
| Separate terminology registry repository | Unnecessary for v1; duplicates glossary authority. |

A glossary-local reference is sufficient because EDF already designates the glossary as **controlled vocabulary** ([ASR Guidance](../../Development/Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md)) and downstream adopters can qualify references as `{glossary-path}#{term-reference}` without a global registry.

## 3. Representations versus meaning

Following the documentation/artifact distinction in [ADR-0006](ADR-0006-Engineering-Documentation-vs-Artifacts.md) and CRA-informed boundaries:

- **Governed concept** — the meaning EDF or an adopter intends to keep stable across label changes (identified by glossary term reference).
- **Terminology representations** — preferred labels, abbreviations, aliases, legacy labels, external/provider labels, and context-specific presentation strings.

Material divergence in meaning **MUST** be modeled as **separate** governed concepts, not forced aliases.

## 4. Historical provenance

Preferred terminology changes **MUST NOT** be implemented by rewriting provenance-sensitive historical records. Living documentation may be modernized under [TGR-0001](../../Specifications/TGR-0001-Terminology-Governance.md). Historical association with current terminology uses references, aliases, successor records, or glossary resolution — not retroactive editing of original wording.

## 5. Identifier separation

Terminology presentation changes **MUST NOT** automatically rename or mutate artifact IDs, schema keys, API identifiers, filenames, or directory names. Identifier migration is a separate governed decision.

## 6. Governance path

Establishing terminology governance (this ADR and TGR-0001) and adopting **adopter terminology policy** are **not** [GMFP](../../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) work. Later bounded mechanical updates to eligible living documents may qualify for GMFP only when GMFP-0001 eligibility criteria are independently satisfied.

## 7. Recommendation, policy, and enforcement

EDF publishes **terminology recommendations** (including **Recommended** dispositions in [TGR-0001](../../Specifications/TGR-0001-Terminology-Governance.md)). **EDF conformance does not** automatically require adopters to use those human-facing labels.

An adopting organization or adopting project **may** elevate an EDF recommendation into **adopter terminology policy** through its own governance. **Adopter enforcement** (optional CI, linting, project glossary rules, and similar) applies only after that elevation and is the adopter's responsibility.

EDF **must not** encode adopting-organization-specific or downstream-project-specific terminology mandates as universal EDF normative requirements.

---

# Consequences

**Positive**

- Domain-neutral model for terminology evolution consumable by EDF-based projects.
- Preserves auditability and historical truth.
- Aligns with existing glossary authority without CRA/CKES dependency.

**Negative**

- Glossary maintainers must assign and preserve term references.
- Full backfill of term references on legacy glossary rows is incremental.

**Risks**

- **Semantic overload** — Mitigated by explicit equivalence/non-equivalence and split concepts.
- **Corporate terminology scope creep** — Mitigated by EDF recommendation versus adopter policy boundary in TGR-0001.

---

# Parent

- [Architecture Decision Records](README.md)

## Related Documents

- [TGR-0001 — Terminology Governance](../../Specifications/TGR-0001-Terminology-Governance.md)
- [Glossary](../../Reference/Glossary.md)
