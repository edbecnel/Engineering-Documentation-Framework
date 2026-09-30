# Glossary

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Reference](README.md) › Glossary

## Purpose

This document defines domain terms and consistent terminology used across project documentation, user guides, and specifications.

## Terminology governance

EDF framework terminology evolution is governed by [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md) and [ADR-0011](../Architecture/ADRs/ADR-0011-Terminology-Governance.md).

Each row below includes a **Term reference** — an immutable slug identifying the governed concept within this file. The **Term** column is the current preferred display label and may change when terminology policy changes. Cross-references and downstream consumers should use the term reference where stability matters.

This glossary governs **EDF framework terminology**. EDF publishes **terminology recommendations** here where applicable; adopters are not automatically required to use those labels for EDF conformance. Adopting organizations and downstream projects may adopt separate **adopter terminology policy** and optional **adopter terminology enforcement** per TGR-0001 §17–21 and §31–33.

## Terms

| Term | Term reference | Definition |
|------|----------------|------------|
| **Architecture Decision Record (ADR)** | `adr` | A governed document in `docs/Architecture/ADRs/` recording a significant architectural decision, rationale, and status (for example Proposed, Accepted). Approval workflow: [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md). Not an **Architectural Discovery Record**. |
| **Architecture Specification Repository (ASR)** | `asr` | A repository whose primary engineering artifact is an architecture, methodology, protocol, framework, specification, standard, or engineering discipline intended for independent adoption, implementation, conformance, or extension. |
| **Architectural Audit Record (AAR)** | `aar` | A governed, non-normative document recording an implementation conformance review against authoritative ADRs and normative specifications — gaps, violations, and conformant areas. Framework rules: [AAR-0001](../Specifications/AAR-0001-Architectural-Audit-Records.md). |
| **Architectural Discovery Record** | `architectural-discovery-record` | A non-normative document capturing historical architectural context, origin, and motivation before or alongside normative specifications. Distinct from an **Architecture Decision Record (ADR)**. Template: [Architectural Discovery Record Template](../Templates/Architectural_Discovery_Record_Template.md). |
| **Architectural Watch Item (AWI)** | `awi` | A deferred architectural initiative recorded for future review. AWIs are non-authoritative for implementation while Active until promoted to ADRs or closed. An AWI is not the tracking record for an Open program-gate obligation or a Governed Dependency Override. |
| **Adopting Project Root** | `adopting-project-root` | The filesystem root of the governed EDF repository (or equivalent valuable project tree) used for real engineering work — canonical documentation, governance, and adopted project content. Distinct from a Disposable Verification Workspace (DVW). Framework rules: [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md). |
| **Authorized Downstream Scope** | `authorized-downstream-scope` | The explicitly identified governed activity a Governed Dependency Override permits to start. Not limited to another EGR or gate. MAY be a clearly bounded downstream gate, implementation tranche, milestone, release activity, named work package, or other explicitly identified governed activity. MUST be precise enough to determine what is and is not authorized. Work outside that scope remains Blocking. |
| **Bootstrap Validation Gate (BVG)** | `bvg` | An automated EDF adoption/bootstrap check. Documentation uses **BVG-1 … BVG-6** as aliases for interaction-spec gate ids **G1 … G6** in [edf.bootstrap.v1.yaml](../../interaction/specs/edf.bootstrap.v1.yaml). BVGs are **not** program gates and **must not** be used as program gate IDs in EGR filenames ([EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) §10). A GDO MUST NOT relax BVG checks. |
| **declared architecture authority** | `declared-architecture-authority` | A project-declared human authority (named role or decision maker) authorized to make specified governance decisions under applicable EDF specifications and project charter or governance — for example activating a Governed Dependency Override or authorizing or accepting GMFP maintenance. EDF does not assign a single universal title; project templates MAY map this authority to a local label (for example a project architect role). See [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md), [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md), [ADR-0007](../Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md). |
| **Dependency Disposition** | `dependency-disposition` | Whether a declared prerequisite remains **Blocking** (default while the source gate is Open) or **Non-Blocking** (only via an Active Governed Dependency Override) for a stated Authorized Downstream Scope. Independent of Gate Status. |
| **Disposable Verification Workspace (DVW)** | `dvw` | A filesystem workspace of one directory or a coordinated set of directories created or selected solely as a non-valuable subject of verification. Not an Adopting Project Root, MVR, `reports/` output, product operational state, or committed test fixture. Individual DVW instances do not receive global EDF IDs. Framework rules: [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md). |
| **Engineering Gate Review Record (EGR)** | `egr` | The governed Markdown **artifact** that records human review and outcome for a **program gate**, stored under `docs/Program/Gate_Reviews/`. Framework rules: [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md). Abbreviation **EGR** refers to this record type, not to the program gate obligation itself. |
| **gate review** | `gate-review` | The **human review activity** of evaluating whether a program gate’s criteria are met. Outcomes are recorded in an **Engineering Gate Review Record (EGR)**. |
| **Gate Status** | `gate-status` | Lifecycle of a program-gate obligation: Open, Satisfied, Rejected, Deferred (decision postponed), Waived (obligation no longer required), or Superseded (replaced). Not the same fact as Dependency Disposition. |
| **General Engineering Project Model (GEP)** | `gep` | Discipline-independent engineering concepts EDF uses during bootstrap, adoption, and governance (identity, scope, artifacts, verification, milestones, and related ideas). Authoritative document: [General Engineering Project Model](../Architecture/General_Engineering_Project_Model.md). |
| **glossary term reference** | `glossary-term-reference` | Immutable kebab-case slug identifying a governed concept within one glossary file. Independent of the current preferred **Term** label. Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |
| **Governed Dependency Override (GDO)** | `gdo` | An explicit, authorized, auditable change recorded on a still-Open source EGR that sets Dependency Disposition to Non-Blocking for a precise Authorized Downstream Scope. It does not complete, waive, or supersede the remaining obligation. Local IDs only (for example `GDO-1`); not a separate record type. |
| **Governed Maintenance Fast Path (GMFP)** | `gmfp` | An optional EDF workflow for bounded corrective maintenance with two human declared-architecture-authority gates (authorization; acceptance and publication) and an authorized execution interval (GMFP-2) that is not an approval gate. Framework rules: [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md). |
| **GMFP-1** | `gmfp-1` | GMFP authorization gate (diagnose, classify, bound, authorize). See [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md). |
| **GMFP-2** | `gmfp-2` | GMFP authorized maintenance **execution interval** — not a human approval gate. See [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md). |
| **GMFP-3** | `gmfp-3` | GMFP acceptance and publication gate. See [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md). |
| **Governed Maintenance Record (GMR)** | `gmr` | A concise Markdown record of one maintenance item under GMFP, stored under `docs/Program/Maintenance_Records/` as `GMR-NNNN-<short-title>.md`. Consolidates evidence; does not replace normative architecture. |
| **Maintenance status** | `maintenance-status` | Lifecycle of a GMR: `Proposed`, `Authorized`, `Implemented`, `Accepted`, `Published`, or `Escalated`. Independent of EGR Gate Status. |
| **Manual Verification Record (MVR)** | `mvr` | Governed documentation that is the canonical executable human manual verification procedure and factual execution record when EDF-governed work requires human-executed manual verification. One MVR per obligation under `docs/Verification/Records/` as `MVR-NNNN-<short-title>.md`. Framework rules: [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md). |
| **Manual Verification Test (MVT)** | `mvt` | A single human-executable test within an MVR, identified locally as `MVT-1`, `MVT-2`, … Global reference: `MVR-NNNN / MVT-n`. MVT **Result** is `Pending`, `Pass`, `Fail`, or `Blocked` only. |
| **Human execution status** | `human-execution-status` | Record-level MVR lifecycle for actual human verification execution: `Pending`, `In progress`, or `Complete` (successful required execution per MVR-0001). Not a waiver disposition. |
| **Program gate** | `program-gate` | A declared governance obligation or checkpoint (typically in a roadmap, charter, or release plan) requiring human review of authoritative documents before defined work is unblocked. Documented in an **Engineering Gate Review Record (EGR)**. Distinct from a Bootstrap Validation Gate (BVG). |
| **Architecture Specification** | `architecture-specification` | A normative document defining adoptable architecture, behavior, or conformance requirements. |
| **Engineering Methodology** | `engineering-methodology` | The canonical, normative engineering knowledge corpus in `docs/` and governance — the sole authoritative source that interaction-layer artifacts and scripts execute but do not redefine. |
| **Repository Bootstrap** | `repository-bootstrap` | EDF guidance for initializing repositories with specialized engineering contexts; procedures are invoked intentionally by engineers. |
| **Self-Conformance Review** | `self-conformance-review` | A structured architectural self-validation activity for existing repositories that already publish ASR guidance — distinct from bootstrap or migration. Determines alignment with published ASR guidance without forcing mechanical compliance. |
| **adopter terminology enforcement** | `adopter-terminology-enforcement` | Optional mechanisms an adopting project uses to require compliance with its own **adopter terminology policy** (for example project linting, CI, or UI guidelines). Not mandatory EDF core. Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |
| **adopter terminology policy** | `adopter-terminology-policy` | Terminology requirements an adopting organization or adopting project makes mandatory through its own governance, optionally elevating an EDF **terminology recommendation**. Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |
| **terminology disposition** | `terminology-disposition` | Classification of a label’s role for a governed concept (for example Preferred, Recommended, Alias, Legacy, Deprecated, Historical, External). Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |
| **terminology governance** | `terminology-governance` | EDF rules for stable governed concepts, evolving labels and aliases, scoped equivalence, external terminology accuracy, historical preservation, and layered recommendation/policy/enforcement. Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |
| **terminology recommendation** | `terminology-recommendation` | Human-facing label EDF (or another publishing glossary) promotes for adopters using **Recommended** disposition; not an automatic EDF conformance requirement until elevated to **adopter terminology policy**. Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |
| **terminology scope** | `terminology-scope` | Declared context where a preferred term or alias applies (for example EDF canonical prose, public positioning, provider API). Framework rules: [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md). |

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | Engineering Documentation Framework |
| **Review cadence** | When terminology changes or new domain concepts are introduced |
| **Index** | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Parent

- [Reference](README.md)

## Related documents

- [TGR-0001](../Specifications/TGR-0001-Terminology-Governance.md) — terminology governance requirements
- [ADR-0011](../Architecture/ADRs/ADR-0011-Terminology-Governance.md) — terminology governance decision
- [docs/Specifications/](../Specifications/) — requirements that introduce domain terms
- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) — program gates and Governed Dependency Override
- [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) — optional bounded maintenance workflow
- [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md) — governed human manual verification records
- [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md) — disposable verification workspaces
- [docs/User_Guides/](../User_Guides/) — end-user documentation using these terms
