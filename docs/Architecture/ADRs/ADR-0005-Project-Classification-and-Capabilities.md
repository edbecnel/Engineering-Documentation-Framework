# ADR-0005-Project-Classification-and-Capabilities

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0005 Project Classification and Capabilities

| | |
|---|---|
| **Status** | Accepted |
| **Date** | 2026-08-23 |
| **Decision Makers** | Ed Becnel |
| **Supersedes** | None (extends and reframes [ADR-0001](ADR-0001-Domain-Profiles.md)) |
| **Superseded By** | None |
| **Related** | [ADR-0001](ADR-0001-Domain-Profiles.md), [ADR-0002](ADR-0002-Domain-Profile-Specification.md), [General Engineering Project Model](../General_Engineering_Project_Model.md) |

---

# Context

[ADR-0001](ADR-0001-Domain-Profiles.md) established a layered architecture: **EDF Core → Domain Profiles → Project Customizations**.

Multi-discipline bootstrap planning and architectural review identified that atomic domain profiles (for example `electronics-research`) conflate independent dimensions and cause combinatorial profile explosion. CRA and CKES demonstrate that invariant cores compose with domain-specific extensions rather than cross-product profile identifiers.

This ADR answers architectural questions **Q1** and **Q2**:

- **Q1:** What are the independent dimensions for characterizing an EDF project?
- **Q2:** What is an EDF "profile" versus a composable capability?

---

# Problem

1. A single `profile_id` such as `electronics-research` combines engineering discipline (`electronics`) with engineering activity (`research`).
2. Expanding atomic profiles produces unmaintainable cross-products (`mechanical-development`, `software-education`, etc.).
3. Multidisciplinary projects cannot be represented without choosing a single "primary" profile.
4. [ADR-0002](ADR-0002-Domain-Profile-Specification.md) profile manifest outline assumed monolithic profiles; capability composition is a better fit.

---

# Decision

## 1. Multi-dimensional project classification

An EDF project SHALL be characterized using four composable dimensions:

| Dimension | Question | Cardinality |
|---|---|---|
| **Repository role** | What role does this repository perform? | One primary role (human-confirmed) |
| **Engineering disciplines** | What fields of engineering knowledge does this project use? | Zero or more |
| **Engineering activities** | What kinds of engineering work are being performed? | Zero or more |
| **Project extensions** | What project-specific additions are not covered by Core or capabilities? | Zero or more (documented) |

These dimensions are recorded in `edf-project-context.yaml` at the adopting project root (schema in [capabilities/project-context.schema.yaml](../../../capabilities/project-context.schema.yaml)).

Repository role examples (not a closed taxonomy): `engineering-project`, `architecture-specification-repository`, `knowledge-repository`, `reference-implementation`, `research-program`, `product-repository`.

Discipline examples: `electronics`, `mechanical-engineering`, `software-engineering`, `systems-engineering`.

Activity examples: `research`, `design`, `development`, `analysis`, `simulation`, `prototyping`, `verification`, `validation`, `testing`, `manufacturing`, `education`.

Activities SHALL NOT automatically become directory names.

## 2. EDF Capabilities replace monolithic domain profiles

Reusable EDF extensions SHALL be modeled as **EDF Capabilities** composed per project, not as atomic `{discipline}-{activity}` profiles.

| Capability type | Purpose | Examples |
|---|---|---|
| **Discipline capability** | Artifact classes, vocabulary, governance patterns for a discipline | `electronics`, `software-engineering`, `mechanical` |
| **Activity capability** | Workflow patterns and lifecycle expectations | `research`, `development`, `manufacturing` |
| **Repository role capability** | Procedure overlays for repository types | `asr` |

A project's effective configuration is the **composition** of selected capabilities plus documented project extensions.

Capability manifests live under `capabilities/` in the EDF repository. See [capabilities/index.yaml](../../../capabilities/index.yaml).

## 3. Relationship to ADR-0001 and ADR-0002

- [ADR-0001](ADR-0001-Domain-Profiles.md) layered architecture remains valid: **EDF Core → specialization → project customization**.
- The term **Domain Profile** is reframed: legacy `core` and `software-engineering` profile IDs remain operational for bootstrap scripts until capability-driven tooling ships (Phase 4). `software-engineering` is formally a composed capability set.
- [ADR-0002](ADR-0002-Domain-Profile-Specification.md) profile manifest outline is superseded for new work by the capability manifest schema in `capabilities/`. ADR-0002 remains historical reference for software extraction inventory.

## 4. ASR repository role

Architecture Specification Repository (ASR) classification remains **human-confirmed, never auto-detected**, per [Repository Bootstrap conservative design](../../Development/Repository_Bootstrap/README.md).

ASR bootstrap applies the `asr` repository role capability and [ASR Bootstrap Procedure](../../Development/Repository_Bootstrap/Architecture_Specification_Repository/Bootstrap_Procedure.md) on top of EDF Core.

## 5. Unknown disciplines

When no discipline capability matches, bootstrap proceeds with **EDF Core only** plus documented project extensions. This is a required capability, not a degraded mode.

---

# Rationale

Composable dimensions avoid combinatorial profile explosion, support multidisciplinary projects, and align with CRA/CKES separation of invariant core from domain integration.

Capabilities can mature independently (discipline module, activity module, artifact class definition) without promoting an entire monolithic profile.

---

# Consequences

**Positive:**

- Multidisciplinary projects compose disciplines and activities explicitly.
- Reusable units mature with scope-matched validation (see [EDF Capability Contribution Guide](../../Development/EDF_Capability_Contribution_Guide.md)).
- Bootstrap works before discipline is known.

**Implementation:**

- `edf-project-context.yaml` records project composition.
- `capabilities/index.yaml` registers built-in and community capabilities.
- Legacy `edf-adoption.yaml` `profile:` field remains supported; maps to capability composition internally in Phase 4.

---

# Parent

- [Architecture Decision Records](README.md)

## Related Documents

- [ADR-0001 — Domain Profiles](ADR-0001-Domain-Profiles.md)
- [ADR-0006 — Engineering Documentation vs Artifacts](ADR-0006-Engineering-Documentation-vs-Artifacts.md)
- [General Engineering Project Model](../General_Engineering_Project_Model.md)
- [CRA, CKES, and EDF Boundaries](../CRA_CKES_EDF_Boundaries.md)
