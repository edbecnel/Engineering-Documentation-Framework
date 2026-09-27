# AAR-0001: Architectural Audit Records

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › AAR-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Proposed |
| **Specification ID** | AAR-0001 |
| **Version** | 1.1 |
| **Date** | 2026-09-22 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |

## Purpose

Define adoptable requirements for **Architectural Audit Records (AAR)** — governed documentation that records an **implementation conformance review** of code or reference implementation against authoritative architectural requirements (Accepted ADRs, normative specifications, and other declared requirements in scope).

## Scope

### In scope

- AAR artifact structure, location, identifiers, and audit states
- Finding classifications (conformant, gap, violation, deferred, out of scope)
- Separation from documentation self-conformance, bootstrap reports, and program gate records (EGR)
- Relationship to ADR and document lifecycle workflows for remediation
- Relationship to Engineering Gate Review Records and Governed Dependency Overrides

### Out of scope

- Tool-specific static analysis or CI integration
- Automatic mutation of ADR or specification **Status** from audit findings
- Replacing normative architecture specifications in `docs/Specifications/`

## Normative Requirements

1. Projects that conduct an **implementation conformance review** against authoritative architecture SHOULD record it as **one AAR Markdown file** under `docs/Architecture/Audits/`.
2. Each AAR MUST declare an **Audit ID** (`AAR-NNNN`, for example `AAR-0001`) unique among AAR files in the repository.
3. Each AAR MUST declare **Audit status**: `Open`, `Complete`, or `Superseded`.
4. Each AAR MUST include **Scope** (what the audit covers), **Audit date** (or audit period), and **Owner** (name or role).
5. Each AAR MUST include a **Requirements basis** section listing every ADR, normative specification, or other authoritative requirement in scope, with relative links. Where ADRs are in scope, the audit MUST note each ADR **Status** (typically only **Accepted** ADRs are binding unless the audit charter states otherwise).
6. Each AAR MUST include an **Implementation scope** section identifying repository paths, modules, branches, commits, tags, or other anchors so the audit is reproducible.
7. Each AAR MUST document **Findings**. Each finding MUST use a **Classification** of at least one of: **Conformant**, **Gap** (requirement not implemented), **Violation** (implementation contradicts requirement), **Deferred** (acknowledged but not resolved in this audit), **Out of scope** (explicitly excluded by the audit charter). Each finding MUST include **Expected** (from the requirement), **Observed** (in the implementation), **Evidence** (paths, symbols, or references), and **Remediation** (for example none, fix PR, task link, Proposed ADR, AWI).
8. AAR findings MUST NOT change ADR **Status** or normative specification **Status**. Remediation MUST follow [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md) and [Document Lifecycle](../Governance/Document_Lifecycle.md) in separate steps.
9. Individual AAR instance files are **non-normative** assessments. Normative requirements remain in ADRs and `docs/Specifications/`. AAR files MUST NOT be placed in `docs/Specifications/`.
10. An AAR MUST NOT substitute for an [ASR Self-Conformance Review](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Self_Conformance_Review.md) (documentation structure vs ASR guidance) or for Framework Advisor output under `reports/conformance/`. Cross-reference only.
11. When an audit is re-run, the prior AAR SHOULD be marked **Superseded** with a link to the replacement AAR.
12. **Audit ID** namespace (`AAR-NNNN`) MUST remain separate from architectural discovery record identifiers (for example `CRA-0000`), **Engineering Gate Review** gate IDs, and bootstrap **Bootstrap Validation Gate (BVG)** aliases (BVG-1 … BVG-6).
13. An [Engineering Gate Review Record (EGR)](EGR-0001-Engineering-Gate-Review-Records.md) MAY require a **Complete** AAR before the gate is satisfied. Satisfying an EGR MUST NOT by itself close open findings or change remediation status in an AAR.
14. An AAR SHOULD record whether in-scope implementation proceeded under an Active [Governed Dependency Override](EGR-0001-Engineering-Gate-Review-Records.md). A GDO MUST NOT by itself mark an AAR Complete or hide Gaps or Violations. If work that remained Open under a GDO later exposes conflicting requirements affecting implementation, the finding MUST be classified as Gap or Violation and the relevant GDO MUST be Reactivated. Unreconciled Active GDOs at a declared closeout SHOULD be noted in any AAR covering that increment; they do not automatically fail architectural completeness unless the audit charter treats the missing documentation as an implementation requirement.
15. Projects SHOULD use [Architectural_Audit_Record_Template.md](../Templates/Architectural_Audit_Record_Template.md) or a project copy derived from it.
16. When an audit charter requires human-executed manual verification, the project MUST link a [Manual Verification Record (MVR)](MVR-0001-Manual-Verification-Records.md). An AAR MUST NOT be marked **Complete** while a linked **required** MVR has unresolved required manual verification, except through explicit waiver on the governing record (for example the EGR or charter-defined acceptance authority) per applicable EDF governance. Waiver does not alter factual MVT **Result** on the MVR.

## Conformance

An adopting project conforms when:

- Every architecture implementation audit referenced as authoritative in the roadmap, charter, EGR, or equivalent has a corresponding AAR file in `docs/Architecture/Audits/`, and
- **Open** audits have incomplete finding disposition or remediation tracking as defined in the project template, and
- **Complete** audits record closed remediation, explicit deferrals, or documented follow-up (tasks, ADRs, AWIs), and
- **Superseded** audits link forward to the replacement AAR.

## Rationale

Implementation drifts from documented architecture without a canonical audit artifact. AARs provide traceable gap and violation analysis tied to ADRs and normative specs, support remediation planning, and align with [ADR-0006](../Architecture/ADRs/ADR-0006-Engineering-Documentation-vs-Artifacts.md) (validation reports as engineering documentation).

## Relationship to Discovery Records

Discovery records (for example PCON-0000) are non-normative historical context. An AAR MAY cite them for background but MUST NOT treat them as implementation requirements unless promoted via an Accepted ADR or normative specification.

## Relationship to Self-Conformance and Reports

| Artifact | Evaluates |
|---|---|
| ASR Self-Conformance Review | Repository **documentation** vs ASR bootstrap guidance |
| Framework Advisor reports | Automated **documentation** tier scoring (`reports/conformance/`) |
| Architectural Audit Record | **Implementation** vs architectural **requirements** |

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0008](../Architecture/ADRs/ADR-0008-Architectural-Audit-Records.md)
- [Architecture Audits](../Architecture/Audits/README.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
- [EGR-0001](EGR-0001-Engineering-Gate-Review-Records.md)
- [MVR-0001](MVR-0001-Manual-Verification-Records.md)
