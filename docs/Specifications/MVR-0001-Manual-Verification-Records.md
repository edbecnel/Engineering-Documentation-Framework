# MVR-0001: Manual Verification Records

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › MVR-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Proposed |
| **Specification ID** | MVR-0001 |
| **Version** | 1.0 |
| **Date** | 2026-09-28 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |

## Purpose

Define adoptable requirements for **Manual Verification Records (MVR)** — governed documentation that is the canonical **executable human manual verification procedure** and **factual execution record** when EDF-governed work requires human-executed manual verification.

## Scope

### In scope

- MVR artifact structure, location, identifiers, and human execution status
- Manual Verification Test (MVT) identity, presentation, checkbox and structured result semantics
- Separation from planning artifacts, program gates, implementation audits, and maintenance records
- Anti-embedding rules for architecture, specifications, and implementation plans
- Gate and acceptance blocking when required MVR is unresolved
- Human authority and AI non-impersonation
- Implementation-neutral tooling interoperability (deterministic Markdown structure)

### Out of scope

- Tool-specific UI, parsers, databases, YAML/JSON schemas, or interaction specifications for MVR
- ProjectConcord implementation, parsing, or UI (deferred; non-normative downstream obligations only)
- Framework Advisor MVR recognition in this tranche (see [Analyzer Compliance](../Governance/Analyzer_Compliance.md))
- Ordinary non-governed PR manual checks (remain lightweight per Developer Handbook)
- A generalized QA management application

## Normative Requirements

### Obligation and mandatory use

1. When an EDF-governed work item, gate, tranche, review, or acceptance decision **requires human-executed manual verification**, the project **MUST** maintain **one MVR Markdown file** as the canonical executable procedure and execution record for that obligation.
2. When no EDF-governed human-manual-verification obligation exists, an MVR is **not** required. Ordinary developer manual checks MAY continue to use PR test plans and handbook guidance without an MVR.
3. Planning artifacts (specifications, architecture documents, implementation plans, handover documents, and similar) **MUST** declare the governed manual-QA obligation and **MUST** link the canonical MVR with a relative path. They **MUST NOT** be the canonical container for detailed operator checklists when §1 applies.
4. The same executable manual verification procedure **MUST NOT** be duplicated in full across planning artifacts and the MVR. Planning artifacts summarize **what** and **why**; the MVR holds **how** and execution truth.

### Location and identity

5. MVR instance files **MUST** live under `docs/Verification/Records/` as `MVR-NNNN-<short-title>.md`.
6. Each MVR **MUST** declare a **Record ID** (`MVR-NNNN`) unique among MVR files in the repository.
7. Each executable manual test **MUST** declare a local **MVT ID** (`MVT-1`, `MVT-2`, …) unique within that MVR. The globally unambiguous reference is **`MVR-NNNN / MVT-n`**. EDF MUST NOT allocate a global `MVT-NNNN` namespace in this specification.
8. **Record ID** namespace (`MVR-NNNN`) MUST remain separate from AAR, GMR, EGR gate IDs, BVG aliases, and normative specification IDs in `docs/Specifications/`.

### MVR structure (single record, distinct sections)

9. Each MVR **MUST** include the following governed sections (headings MAY use equivalent clear titles; section roles MUST be present):
   - **Verification basis / obligation** — authoritative requirements, acceptance conditions, and verification obligation
   - **Implementation scope** — paths, branch, commit, or other anchors (reproducibility)
   - **Manual verification — human execution required** — executable MVT checklist (see §10–12)
   - **Execution record** — structured MVT results (see §13–15)
   - **Evidence references** — links to engineering artifacts outside `docs/` per [ADR-0006](../Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md) and supplementary proof
   - **Governing work / acceptance relationship** — links to tranche, EGR, GMR, AAR charter, or project-declared architecture-authority acceptance
10. Projects **SHOULD** use [Manual_Verification_Record_Template.md](../Templates/Manual_Verification_Record_Template.md) or a project copy derived from it.

### Metadata declarations

11. When human manual verification is required for the obligation, the MVR **MUST** include metadata declaring:
    - **Manual QA:** `Required` or `Not required`
    - **Human execution status:** `Pending`, `In progress`, or `Complete`
12. **Human execution status** MUST reflect **actual human verification execution**:
    - **Pending** — required human execution has not started for all required MVTs
    - **In progress** — at least one required MVT has been addressed but **Complete** criteria (§14) are not met
    - **Complete** — all **required** MVTs have been executed by an authorized human and have the **successful outcome required by the verification obligation** (typically **Pass** in the execution record)
13. If required human execution has **not** successfully completed, **Human execution status** MUST NOT be set to **Complete** merely because governance granted a waiver on a governing record. Optional **Notes** MAY reference the governing waiver for traceability; Notes are informational and MUST NOT constitute another MVR state or disposition field.

### Executable manual verification section

14. The section **Manual verification — human execution required** MUST NOT be buried inside narrative prose. It MUST be visually obvious as the operator checklist.
15. For each **required** MVT, the MVR MUST visibly provide:
    - a Markdown checkbox (`- [ ]` default for not yet passed)
    - **MVT-n** and a short test name
    - **Procedure** — concise human-executable steps
    - **Expected result** — explicit pass condition
16. Checkbox state is a **human-usability execution aid**. It is **not** an independent source of truth for governance.

### Execution record (authoritative)

17. The **Execution record** MUST include a structured table (or equivalent fixed column layout) with at least: **MVT ID**, **Result**, **Executor**, **Date**, **Evidence** (links).
18. **MVT Result** MUST be exactly one of: **Pending**, **Pass**, **Fail**, **Blocked**.
19. **Waived** MUST NOT be used as an MVT Result. Waiver of a verification obligation MUST be recorded on the **governing record** (for example EGR waiver outcome per [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md)) according to applicable EDF governance.
20. Checkbox state and **Result** MUST remain consistent. If they disagree, **Result** is authoritative for governance; the discrepancy MUST be reconciled. **Pass** MUST NOT be inferred solely from a checked box if **Result** is not **Pass**.
21. An MVR that proceeds to governing acceptance under waiver while MVTs remain non-Pass MUST retain truthful MVT Results and MUST NOT appear equivalent to an MVR whose required MVTs all **Pass**.

### Human authority

22. Only authorized humans (or explicitly delegated testers named in project governance) MAY set MVT **Result** to **Pass**, **Fail**, or **Blocked**, and MAY set **Human execution status** to **Complete** when §12 criteria are met.
23. Automated tools and AI assistants **MUST NOT** set a required MVT **Result** to **Pass** or **Human execution status** to **Complete** based solely on: implementation completion, automated test success, code or source inspection, model inference, expected behavior, or other non-human evidence.
24. Automated tools and AI assistants **MAY**: draft or maintain MVR structure; formulate procedures and expected results; explain tests; surface pending tests; collect observations; record results **explicitly supplied by an authorized human**; assist evidence reconciliation. They **MUST NOT** impersonate the human execution step.

### Gate and acceptance integration

25. A governing acceptance decision **MUST NOT** be represented as fully satisfied while a **linked required MVR** has unresolved required manual verification (for example **Human execution status** `Pending` or `In progress`, or any **required** MVT **Result** `Pending`, `Fail`, or unresolved **Blocked**), except through **explicit waiver** of the verification obligation on the **governing record** per applicable EDF governance.
26. This requirement integrates with [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md) (gate satisfaction), [AAR-0001](AAR-0001-Architectural-Audit-Records.md) when the audit charter requires manual QA, [GMFP-0001](GMFP-0001-Governed-Maintenance-Fast-Path.md) (GMFP-3 acceptance), and project-declared architecture-authority or tranche acceptance. EDF MUST NOT introduce a second gate system for manual verification.
27. A **Governed Dependency Override** MUST NOT substitute for human manual test execution.
28. GMFP maintenance validation recorded on a GMR **MUST NOT** imply that a separate **required** governed human manual QA obligation was human-executed unless the linked MVR execution record shows successful human execution per §12.

### Tooling interoperability

29. The canonical MVR Markdown structure **MUST** make the following **deterministically identifiable** by conforming tooling **without** relying on interpretation of arbitrary narrative prose:
    - whether required manual verification applies (**Manual QA** metadata)
    - **Human execution status**
    - each **MVT ID** and its **Result**
    - evidence references
    - governing-work relationships (dedicated section and/or metadata links)
30. This requirement is implementation-neutral. It does **not** require a ProjectConcord-specific parser, database schema, YAML, JSON, interaction specification, or UI in this tranche.

### Relationship to other artifacts

31. Individual MVR instance files are **non-normative execution records** for a specific obligation; normative requirements remain in ADRs and `docs/Specifications/`. MVR files MUST NOT be placed in `docs/Specifications/`.
32. An MVR MUST NOT substitute for an [ASR Self-Conformance Review](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Self_Conformance_Review.md) or Framework Advisor reports under `reports/conformance/`. Cross-reference only.
33. An MVR is complementary to an AAR: AAR assesses implementation conformance to requirements; MVR records human manual verification execution against declared verification obligations.

## Conformance

An adopting project conforms when:

- Every governed human-manual-verification obligation declared in authoritative governance references a corresponding MVR under `docs/Verification/Records/`, and
- Required MVRs include the sections and metadata required by this specification, and
- Executable MVTs use local MVT IDs and the prescribed presentation, and
- Execution records use only **Pending**, **Pass**, **Fail**, **Blocked** as MVT Results, and
- Governing acceptance is not represented as fully satisfied while a linked required MVR remains unresolved except via explicit waiver on the governing record, and
- Planning artifacts do not host canonical operator checklists when an MVR is required.

Absence of governed human-manual-verification obligations is not nonconformance.

## Rationale

Human manual verification is operational work. Burying checklists in architecture or implementation-plan prose blocks discoverability for QA engineers and downstream tooling. One MVR per obligation consolidates GEP procedure and results semantics without a parallel QA subsystem.

## Downstream tooling (non-normative)

**ProjectConcord** is an intended downstream consumer of MVR semantics. When EDF-governed project state indicates that **required** human manual QA remains **pending**, ProjectConcord **should eventually** surface that requirement prominently to the appropriate QA role. A QA engineer **should not** be required to discover pending manual work by reading architecture, specification, or implementation-plan prose alone. Exact ProjectConcord UI is **TBD** and is not defined in EDF.

**TRV adoption (non-normative):** After this baseline is published, The Recipe Vault CC-4B should migrate executable manual QA from its implementation plan into `docs/Verification/Records/MVR-NNNN-<short-title>.md` in the TRV repository, leaving requirement, status, MVR reference, and summary in the plan.

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0010](../Architecture/ADRs/ADR-0010-Manual-Verification-Records.md)
- [Verification README](../Verification/README.md)
- [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md)
- [AAR-0001](AAR-0001-Architectural-Audit-Records.md)
- [GMFP-0001](GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [ADR-0006](../Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md)
- [AI Verification](../AI/Verification.md)
- [DVW-0001](DVW-0001-Disposable-Verification-Workspaces.md) — disposable verification workspaces (filesystem subjects; optional execution metadata on an MVR)
- [Glossary](../Reference/Glossary.md)
