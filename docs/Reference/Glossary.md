# Glossary

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Reference](README.md) › Glossary

## Purpose

This document defines domain terms and consistent terminology used across project documentation, user guides, and specifications.

## Terms

| Term | Definition |
|------|------------|
| **Architecture Specification Repository (ASR)** | A repository whose primary engineering artifact is an architecture, methodology, protocol, framework, specification, standard, or engineering discipline intended for independent adoption, implementation, conformance, or extension. |
| **Architectural Audit Record (AAR)** | A governed, non-normative document recording an implementation conformance review against authoritative ADRs and normative specifications — gaps, violations, and conformant areas. Framework rules: [AAR-0001](../Specifications/AAR-0001-Architectural-Audit-Records.md). |
| **Architectural Discovery Record** | A non-normative document capturing historical architectural context, origin, and motivation before or alongside normative specifications. |
| **Architectural Watch Item (AWI)** | A deferred architectural initiative recorded for future review. AWIs are non-authoritative for implementation while Active until promoted to ADRs or closed. An AWI is not the tracking record for an Open program-gate obligation or a Governed Dependency Override. |
| **Adopting Project Root** | The filesystem root of the governed EDF repository (or equivalent valuable project tree) used for real engineering work — canonical documentation, governance, and adopted project content. Distinct from a Disposable Verification Workspace (DVW). Framework rules: [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md). |
| **Authorized Downstream Scope** | The explicitly identified governed activity a Governed Dependency Override permits to start. Not limited to another EGR or gate. MAY be a clearly bounded downstream gate, implementation tranche, milestone, release activity, named work package, or other explicitly identified governed activity. MUST be precise enough to determine what is and is not authorized. Work outside that scope remains Blocking. |
| **Bootstrap Validation Gate (BVG)** | An automated EDF adoption/bootstrap check (documentation aliases BVG-1 … BVG-6 for interaction-spec G1–G6). Distinct from program gates. A GDO MUST NOT relax BVG checks. |
| **Dependency Disposition** | Whether a declared prerequisite remains **Blocking** (default while the source gate is Open) or **Non-Blocking** (only via an Active Governed Dependency Override) for a stated Authorized Downstream Scope. Independent of Gate Status. |
| **Disposable Verification Workspace (DVW)** | A filesystem workspace of one directory or a coordinated set of directories created or selected solely as a non-valuable subject of verification. Not an Adopting Project Root, MVR, `reports/` output, product operational state, or committed test fixture. Individual DVW instances do not receive global EDF IDs. Framework rules: [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md). |
| **Engineering Gate Review (EGR)** | Governed Markdown record of human approval for a program gate, stored under `docs/Program/Gate_Reviews/`. Framework rules: [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md). |
| **Gate Status** | Lifecycle of a program-gate obligation: Open, Satisfied, Rejected, Deferred (decision postponed), Waived (obligation no longer required), or Superseded (replaced). Not the same fact as Dependency Disposition. |
| **Governed Dependency Override (GDO)** | An explicit, authorized, auditable change recorded on a still-Open source EGR that sets Dependency Disposition to Non-Blocking for a precise Authorized Downstream Scope. It does not complete, waive, or supersede the remaining obligation. Local IDs only (for example `GDO-1`); not a separate record type. |
| **Governed Maintenance Fast Path (GMFP)** | An optional EDF workflow for bounded corrective maintenance with two human declared-architecture-authority gates (authorization; acceptance and publication) and an authorized execution interval (GMFP-2) that is not an approval gate. Framework rules: [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md). |
| **Governed Maintenance Record (GMR)** | A concise Markdown record of one maintenance item under GMFP, stored under `docs/Program/Maintenance_Records/` as `GMR-NNNN-<short-title>.md`. Consolidates evidence; does not replace normative architecture. |
| **Maintenance status** | Lifecycle of a GMR: `Proposed`, `Authorized`, `Implemented`, `Accepted`, `Published`, or `Escalated`. Independent of EGR Gate Status. |
| **Manual Verification Record (MVR)** | Governed documentation that is the canonical executable human manual verification procedure and factual execution record when EDF-governed work requires human-executed manual verification. One MVR per obligation under `docs/Verification/Records/` as `MVR-NNNN-<short-title>.md`. Framework rules: [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md). |
| **Manual Verification Test (MVT)** | A single human-executable test within an MVR, identified locally as `MVT-1`, `MVT-2`, … Global reference: `MVR-NNNN / MVT-n`. MVT **Result** is `Pending`, `Pass`, `Fail`, or `Blocked` only. |
| **Human execution status** | Record-level MVR lifecycle for actual human verification execution: `Pending`, `In progress`, or `Complete` (successful required execution per MVR-0001). Not a waiver disposition. |
| **Program gate** | A human checkpoint declared in a roadmap, charter, or release plan that bundles review of authoritative documents before unblocking defined work. Recorded as an EGR. Distinct from a Bootstrap Validation Gate. |
| **Architecture Specification** | A normative document defining adoptable architecture, behavior, or conformance requirements. |
| **Engineering Methodology** | The canonical, normative engineering knowledge corpus in `docs/` and governance — the sole authoritative source that interaction-layer artifacts and scripts execute but do not redefine. |
| **Repository Bootstrap** | EDF guidance for initializing repositories with specialized engineering contexts; procedures are invoked intentionally by engineers. |
| **Self-Conformance Review** | A structured architectural self-validation activity for existing repositories that already publish ASR guidance — distinct from bootstrap or migration. Determines alignment with published ASR guidance without forcing mechanical compliance. |

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | _[Product owner / technical writer]_ |
| **Review cadence** | When terminology changes or new domain concepts are introduced |
| **Index** | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Parent

- [Reference](README.md)

## Related documents

- [docs/Specifications/](../Specifications/) — requirements that introduce domain terms
- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md) — program gates and Governed Dependency Override
- [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md) — optional bounded maintenance workflow
- [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md) — governed human manual verification records
- [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md) — disposable verification workspaces
- [docs/User_Guides/](../User_Guides/) — end-user documentation using these terms
