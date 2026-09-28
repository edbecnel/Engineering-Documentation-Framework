# Verification

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › Verification


## Purpose

This document defines how AI-generated work should be reviewed and validated.

AI output should never be accepted blindly. It must be verified according to the same standards as human-generated work.

## General Verification Rules

AI-generated work should be checked for:

- correctness
- completeness
- security implications
- consistency with architecture
- consistency with documentation
- maintainability
- test coverage
- formatting and style
- broken links
- unintended file changes

## Code Verification

When reviewing AI-generated code:

- read the diff carefully
- run relevant tests
- inspect error handling
- verify data validation
- check security-sensitive logic
- confirm naming and style consistency
- ensure no secrets were introduced
- verify dependency changes
- confirm performance implications when relevant

## Documentation Verification

When reviewing AI-generated documentation:

- confirm facts against the implementation
- verify links
- check that authoritative sources remain clear
- remove duplication
- ensure terminology is consistent
- update `PROJECT_INDEX.md` when major documents are added or moved
- ensure outdated content is archived or clearly replaced

## Architecture Verification

When AI influences architecture:

- review trade-offs
- document significant decisions in ADRs
- confirm alternatives were considered
- validate assumptions
- check long-term maintainability
- confirm operational implications

## Manual Verification Records (MVR)

When [MVR-0001](../Specifications/MVR-0001-Manual-Verification-Records.md) applies, human-executed manual verification is recorded on a **Manual Verification Record (MVR)**. AI assistants **MUST NOT**:

- set a required **Manual Verification Test (MVT)** **Result** to **Pass** based solely on implementation completion, automated test success, code or source inspection, model inference, expected behavior, or other non-human evidence
- set **Human execution status** to **Complete** when required human execution has not successfully completed per MVR-0001

AI assistants **MAY** draft or maintain MVR structure, formulate procedures and expected results, explain tests, surface pending tests, collect observations, record results **explicitly supplied by an authorized human**, and assist evidence reconciliation.

The MVR **Execution record** is authoritative for governance; Markdown checkboxes are a usability aid and must stay consistent with **Result**.

## Disposable verification workspaces (DVW)

When drafting MVR procedures or operator instructions that require disposable filesystem subjects (open-folder tests, relocation simulation, mutation-safe stand-ins, and similar):

- Follow [DVW-0001](../Specifications/DVW-0001-Disposable-Verification-Workspaces.md) for placement, safety, and cleanup semantics.
- Use the optional **Operator environment and test data** section on the [MVR template](../Templates/Manual_Verification_Record_Template.md) to record whether DVWs are required and the **resolved paths used at execution** — not as canonical engineering artifacts.
- **MUST NOT** invent machine-specific canonical temp paths (for example prescribing `~/tmp` or `./tmp` as EDF policy).
- Do not duplicate DVW-0001 normative requirements in MVR prose; link the specification instead.

## Git Verification

Before committing AI-generated changes:

- inspect `git status`
- review the full diff
- confirm no unrelated files changed
- confirm no files were accidentally deleted
- confirm generated files are intentional
- run tests when applicable

## Related Documents

- [Governance.md](./Governance.md)
- [Security.md](./Security.md)
- [AI_Philosophy.md](./AI_Philosophy.md)

## Parent

- [AI Engineering Handbook](README.md)
