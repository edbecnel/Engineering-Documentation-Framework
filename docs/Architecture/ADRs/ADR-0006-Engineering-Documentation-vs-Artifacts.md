# ADR-0006-Engineering-Documentation-vs-Artifacts

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0006 Engineering Documentation vs Artifacts

| | |
|---|---|
| **Status** | Accepted |
| **Date** | 2026-08-23 |
| **Decision Makers** | Ed Becnel |
| **Supersedes** | None |
| **Superseded By** | None |
| **Related** | [General Engineering Project Model](../General_Engineering_Project_Model.md), [ADR-0005](ADR-0005-Project-Classification-and-Capabilities.md) |

---

# Context

Early multi-discipline bootstrap planning proposed discipline-specific paths such as `docs/Schematics` and `docs/BOM` under the documentation tree.

Architectural review correctly identified that many engineering outputs are **not documentation** — they are **engineering artifacts** with different lifecycles, toolchains, and governance needs.

This ADR answers **Q4:** What is an engineering artifact versus engineering documentation?

---

# Problem

1. Placing schematics, CAD models, firmware, and datasets under `docs/` conflates governed prose with tool-generated artifacts.
2. Bootstrap profiles that mandate `docs/Schematics` teach adopters the wrong model.
3. Future artifact traceability (requirement → schematic → test result) requires artifacts to be first-class, not nested under documentation domains.
4. Engineering tool outputs (simulation results, Gerbers, bitstreams) do not fit the documentation lifecycle model.

---

# Decision

## 1. Two categories of engineering project information

EDF distinguishes:

| Category | Definition | Examples |
|---|---|---|
| **Engineering documentation** | Governed prose and structured documents describing intent, rationale, procedures, and interpretation | Requirements, ADRs, test procedures, validation reports, charters |
| **Engineering artifacts** | Durable outputs of engineering work, often tool-generated or binary | Schematics, PCB layouts, CAD models, SPICE models, firmware, datasets, oscilloscope captures, Gerbers |

Both categories are governable by EDF. They are not the same category.

## 2. Default placement

- Engineering documentation lives in EDF Core documentation domains under `docs/` per [Documentation Information Architecture](../Documentation_Information_Architecture.md).
- Engineering artifacts live in **project-appropriate locations** outside `docs/` unless the project explicitly chooses otherwise with documented rationale in an ADR.

Capability manifests MAY declare **artifact class** definitions (name, typical location patterns, governance metadata) without mandating `docs/` paths.

## 3. Bootstrap behavior

During bootstrap:

1. Inspect and map existing artifacts in their current locations.
2. Do not relocate engineering artifacts into `docs/` without explicit human approval and ADR.
3. Document artifact classes and locations in `edf-project-context.yaml` extensions or capability application records.
4. Record artifact-to-documentation relationships in ADRs or specifications as the project matures.

## 4. Traceability (future-ready)

EDF SHOULD support expressing relationships between documentation and artifacts (for example requirement → decision → schematic → test result). Storage mechanism is deferred; bootstrap must not foreclose this capability.

---

# Rationale

Separating documentation from artifacts aligns EDF with how engineering projects actually work, supports external tool integration, and prevents `docs/` from becoming a dumping ground for non-document files.

---

# Consequences

**Positive:**

- KiCad, CAD, and simulation outputs remain in sensible project locations.
- Capabilities describe artifact classes without forcing documentation tree structure.
- CRA-aligned separation of canonical knowledge (documentation) from representations (artifacts) where applicable.

**Negative:**

- Framework Advisor cannot assume all governed content is under `docs/`.
- Capability manifests use `artifact_classes` instead of `required_dirs` under `docs/` for discipline-specific outputs.

---

# Parent

- [Architecture Decision Records](README.md)

## Related Documents

- [General Engineering Project Model](../General_Engineering_Project_Model.md)
- [ADR-0005 — Project Classification and Capabilities](ADR-0005-Project-Classification-and-Capabilities.md)
- [AWI-0005 — Engineering Tool Provider Compatibility](../Watch_Items/AWI-0005-Engineering-Tool-Provider-Compatibility.md)
