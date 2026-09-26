# GMFP-0001: Governed Maintenance Fast Path

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › GMFP-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Proposed |
| **Specification ID** | GMFP-0001 |
| **Version** | 1.0 |
| **Date** | 2026-09-26 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |

## Purpose

Define adoptable requirements for the **Governed Maintenance Fast Path (GMFP)** — a workflow for **bounded corrective maintenance** with explicit eligibility, two human **declared architecture authority** gates, an authorized execution interval without intermediate approvals, evidence consolidated in a lightweight **Governed Maintenance Record (GMR)**, escalation, and publication control.

GMFP is an **optional governed capability**. Projects MAY adopt it when they need formal bounded-maintenance governance. GMFP is not a SHOULD requirement for every EDF adopter.

## Scope

### In scope

- GMFP workflow stages and the two human governance gates
- GMR artifact structure, location, identifiers, and maintenance status
- Eligibility, disqualifiers, escalation, and relationship to normal governance
- Evidence, commits, publication, and unrelated test-failure handling
- Separation from program gates (EGR), Governed Dependency Overrides (GDO), and Architectural Audit Records (AAR)

### Out of scope

- Tool-specific UI, Interaction Specifications, and ProjectConcord workflow (deferred)
- Automatic mutation of ADR or specification **Status** from a GMR
- Analyzer/parser implementation (future Framework Advisor class)

## Normative Requirements

### Workflow model

1. GMFP comprises three **workflow stages**: **GMFP-1**, **GMFP-2**, and **GMFP-3**.
2. GMFP comprises exactly **two human governance gates** synchronized with the **declared architecture authority** (projects MAY map this role in templates, for example to Project Architect):
   - **Authorization gate (GMFP-1):** diagnose, classify, bound scope, and authorize maintenance.
   - **Acceptance and publication gate (GMFP-3):** review completed implementation and evidence; accept work; authorize publication in one decision when appropriate.
3. **GMFP-2** is the **authorized maintenance execution interval**. It is **not** a human approval gate. During GMFP-2, the authorized agent or developer MAY implement, validate, generate evidence, update maintenance documentation, and create appropriate **local** commits without intermediate architecture-authority approval.
4. Automated tools MUST NOT begin GMFP-2 without explicit authorization recorded on the GMR. Automated tools MUST NOT push to a remote without explicit publication authorization from GMFP-3.

### Governed Maintenance Records (GMR)

5. Projects that use GMFP SHOULD maintain **one GMR Markdown file per maintenance item** under `docs/Program/Maintenance_Records/`.
6. Each GMR MUST use the filename pattern `GMR-NNNN-<short-title>.md` where `NNNN` is a zero-padded sequence unique among GMR files in the repository.
7. Each GMR MUST declare **Maintenance status**: `Proposed`, `Authorized`, `Implemented`, `Accepted`, `Published`, or `Escalated`.
8. A GMR MUST remain a **concise structured maintenance record** that consolidates evidence. It MUST NOT duplicate large test logs or repeat normative architecture prose. It SHOULD link or reference existing authoritative artifacts when appropriate.
9. Each GMR MUST include at minimum: identity and status; defect; reproduction and attribution; root cause; GMFP eligibility determination; authorized scope; implementation summary; validation results; unrelated failures if applicable; commit references; escalation record if applicable; architecture-authority acceptance; publication evidence when published.
10. Projects SHOULD use [Governed_Maintenance_Record_Template.md](../Templates/Governed_Maintenance_Record_Template.md) or a project copy derived from it.

### Authorization gate (GMFP-1)

11. GMFP-1 MUST establish: observed defect; reproduction evidence; root cause to the extent reasonably established; attribution (pre-existing vs introduced by current governed work); proposed correction; expected files or components; impact assessment (architecture, schema, API/contracts, security, data integrity); validation strategy; documentation or traceability impact; and whether GMFP eligibility criteria are satisfied.
12. Authorization MUST be recorded on the GMR with **authority** (role or name), **date**, and explicit authorization text (for example **GMFP IMPLEMENTATION AUTHORIZED**). Maintenance status MUST become `Authorized` before GMFP-2 begins.

### Execution interval (GMFP-2)

13. Work during GMFP-2 MUST remain within the **authorized scope** recorded on the GMR.
14. GMFP-2 MAY include implementation, validation, evidence capture, bounded maintenance documentation updates, and one or more local commits (implementation commit and, when materially distinct, a documentation or traceability commit).
15. At the end of GMFP-2, maintenance status SHOULD become `Implemented` and the GMR MUST contain or link the evidence required by §22. The agent or developer MUST STOP before push and await GMFP-3.

### Acceptance and publication gate (GMFP-3)

16. GMFP-3 SHOULD combine in **one** architecture-authority decision: implementation acceptance, evidence acceptance, documentation acceptance, and **publication authorization** (for example **GMFP ACCEPTED — PUBLICATION AUTHORIZED**).
17. After publication authorization, the authorized agent MAY push, verify `local` matches `origin`, verify ahead/behind is `0/0`, verify a clean working tree, and record publication evidence on the GMR. A further human gate is required only if publication fails or reveals a materially unexpected condition. A routine post-push approval gate MUST NOT be required.
18. When publication completes successfully, maintenance status MUST become `Published`.

### Eligibility

19. GMFP is eligible only when the declared architecture authority determines that **all** of the following hold for the proposed correction:
   - Localized defect with reproduction evidence and root cause established or strongly evidenced.
   - Bounded change set with an explicit file or component list.
   - No new capability; correction restores or fixes behavior against already-accepted intent.
   - No architectural redesign and no change to Accepted ADR or normative specification behavior.
   - No schema migration or persistent data model semantic change.
   - No material public, API, or external contract change.
   - No authorization, security, or RBAC model change.
   - No new external integration or architectural dependency.
   - No destructive data operation or material data repair.
   - No change to canonical identity, ownership, reference, or lifecycle semantics (except traceability in the GMR).
   - Validation can directly demonstrate the correction.
   - Documentation impact is bounded to maintenance history, GMR, watch items, evidence links, changelog, or similar traceability.
20. Examples in a non-normative appendix MAY illustrate eligibility; examples do not constitute automatic authorization.

### Disqualifiers and escalation

21. If investigation or implementation discovers work outside the authorized scope or any disqualifying condition, GMFP MUST **STOP**, maintenance status MUST become `Escalated`, evidence MUST be preserved, and the project MUST return to normal governance. GMFP authorization MUST NOT be interpreted as authorization for expanded work.
22. Mandatory escalation triggers include, when discovered: required architecture or Accepted ADR/spec behavior change; schema migration; persistent model semantic change; material API or contract change; security or RBAC semantic change; canonical identity, ownership, reference, or lifecycle semantic change; significant data migration or repair; new third-party dependency or integration; material cross-subsystem scope expansion; root cause materially differing from authorized diagnosis; fix that adds capability rather than restoring accepted behavior; validation showing a likely regression from the maintenance change that requires additional production work.

### Unrelated test failures

23. A GMFP correction MUST NOT automatically expand scope because the full test suite contains pre-existing or environmental failures. The GMR MUST report failures accurately, determine whether evidence indicates the maintenance change caused them, MUST NOT describe a failing suite as passing, MUST NOT repair unrelated failures without authorization, and SHOULD record unrelated failures as observations or watch items when appropriate. Failures caused by the maintenance change are in scope and MUST be resolved or escalated.

### Relationship to other governance

24. GMFP is **subordinate** to normal EDF governance. It does not replace documentation-first development for architectural or product change, EGR program gates, GDO, schema or security-sensitive gates, major features, cross-cutting refactors, or migration planning.
25. GMFP MUST NOT be used as a substitute for a **Governed Dependency Override** on an Open program gate unless the maintenance item is explicitly tied to that gate’s remaining obligation.
26. GMFP MUST NOT relax **Bootstrap Validation Gates (BVG)** (same constraint as [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md) §10).
27. When GMFP eligibility is unclear, the project MUST use normal governance or STOP for architecture-authority classification.
28. An **Architectural Audit Record (AAR)** is not required for typical test-harness or isolation corrections with no production change. GMFP that addresses an AAR finding SHOULD reference the finding. GMFP that reveals a **Violation** of Accepted architecture MUST escalate; remediation follows normal paths.

### Git and publication

29. After GMFP-1 authorization, local commits for the authorized work MAY proceed without per-commit architecture-authority gates.
30. **Push** to a remote MUST NOT occur until GMFP-3 publication authorization.
31. Amend, rebase, or squash of accepted historical commits MUST NOT occur without separate authorization.

### Human authority

32. Only humans (or explicitly delegated decision makers named in project governance) may authorize GMFP-1, accept GMFP-3, or authorize publication. Automated tools MAY pre-fill GMR sections but MUST NOT change maintenance status to `Authorized`, `Accepted`, or `Published` without explicit human direction ([Change Management](../Governance/Change_Management.md)).

## Conformance

A project conforms to GMFP when it chooses to adopt GMFP and:

- Qualifying maintenance items are tracked with GMR files under `docs/Program/Maintenance_Records/` that follow this specification, and
- Only two human governance gates are used for GMFP (authorization and acceptance/publication), with GMFP-2 as execution only, and
- Escalated items are not continued under GMFP without new authorization, and
- Publication follows GMFP-3 authorization and is recorded on the GMR.

Absence of GMFP adoption is not nonconformance.

## Rationale

Documentation-first governance and program gates provide strong traceability but are disproportionate for small, bounded corrective maintenance. GMFP preserves authorization, bounds, evidence, validation, traceability, commits, and publication control while eliminating unnecessary synchronization gates between implementation, testing, documentation, and commits.

## Worked example (non-normative)

A pre-existing test-isolation defect reproduced on multiple baselines, traced to incomplete test dependency isolation, corrected in a single test file with no production, schema, API, or architecture change, may qualify for GMFP: one authorization gate, execution interval with test fix and validation, one acceptance gate authorizing push, evidence consolidated in a GMR.

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0009](../Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md)
- [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md)
- [AAR-0001](AAR-0001-Architectural-Audit-Records.md)
- [Documentation-First Development Policy](../Development/Documentation_First_Development_Policy.md)
- [Governance Overview](../Governance/Governance_Overview.md)
- [Glossary](../Reference/Glossary.md)
- [Program](../Program/README.md)
