# EGR-0001: Engineering Gate Review Records

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › EGR-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Proposed |
| **Specification ID** | EGR-0001 |
| **Version** | 1.0 |
| **Date** | 2026-09-15 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |

## Purpose

Define adoptable requirements for **Engineering Gate Review Records (EGR)** — checkbox-based human approval artifacts for program gates, milestone transitions, and bundled review of authoritative documentation.

## Scope

### In scope

- EGR artifact structure, location, identifiers, and gate states
- Separation from bootstrap validation gates (BVG)
- Relationship to ADR and document lifecycle workflows

### Out of scope

- Tool-specific UI for gates
- Agile sprint mechanics
- Automatic status mutation of ADRs or SPECs without separate workflow steps

## Normative Requirements

1. Projects that define **program gates** (for example in an implementation roadmap, charter phases, or release plan) SHOULD maintain **one EGR Markdown file per program gate** under `docs/Program/Gate_Reviews/`.
2. Each EGR MUST include a **Gate ID** (for example `G0`, `G1`, or `EGR-0001`) unique among EGR files in the repository.
3. Each EGR MUST declare **Gate status**: `Open`, `Satisfied`, `Rejected`, or `Deferred`.
4. Each EGR MUST include a **Gate decision** section with Markdown checkboxes for the final outcome (for example gate satisfied, gate rejected, gate deferred). Exactly one outcome MUST be checked when the gate is closed.
5. Each EGR MUST include an **Documents under review** section with, for every authoritative document required by that gate, a relative link and checkboxes for **Reviewed** and **Approved** (or equivalent labels defined in the project template).
6. When a gate requires ADR disposition, the EGR MUST include per-ADR checkboxes or fields for **Accept**, **Reject**, or **Revise** (only one disposition per ADR). Changing ADR **Status** MUST follow [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md) after the EGR is satisfied.
7. An EGR MUST record **Decision maker** (name or role) and **Decision date** when the gate is closed.
8. Implicit approval (chat, email only) MUST NOT substitute for an updated EGR when the project declares that gate in the roadmap or charter.
9. Satisfying an EGR MUST NOT by itself change linked document lifecycle or ADR **Status** fields; post-gate actions MUST be tracked explicitly (checklist or separate commits).
10. Bootstrap **validation_gates** labeled G1–G6 in [edf.bootstrap.v1.yaml](../../interaction/specs/edf.bootstrap.v1.yaml) are **Bootstrap Validation Gates (BVG)**. They MUST NOT be used as program gate IDs in EGR filenames. Documentation MAY refer to BVG-1 … BVG-6 as aliases for bootstrap G1–G6.
11. Projects SHOULD use [Gate_Review_Record_Template.md](../Templates/Gate_Review_Record_Template.md) or a project copy derived from it.

## Conformance

An adopting project conforms when:

- Every program gate referenced as blocking work in the authoritative roadmap (or equivalent) has a corresponding EGR file in `docs/Program/Gate_Reviews/`, and
- Open gates have incomplete gate decision checkboxes, and
- Closed gates have decision maker, decision date, and completed required review checklists.

## Rationale

Program gates bundle human review across multiple documents. A single traceable artifact supports auditability, AI-assisted tooling, and alignment with the General Engineering Project Model (milestones / releases).

## Relationship to Discovery Records

Discovery records (for example PCON-0000) are non-normative context. An EGR MAY list them as **Acknowledged** but MUST NOT treat them as approval blockers unless explicitly declared in the gate definition.

## Parent

- [Specifications](README.md)

## Related Documents

- [ADR-0007](../Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md)
- [Program](../Program/README.md)
- [Document Lifecycle](../Governance/Document_Lifecycle.md)
