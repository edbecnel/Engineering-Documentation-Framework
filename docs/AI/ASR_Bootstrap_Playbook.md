# ASR Bootstrap Playbook

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › ASR Bootstrap Playbook

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** AI-assisted Architecture Specification Repository bootstrap
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes (interaction layer — executes canonical procedure)

## Purpose

This playbook enables AI assistants (Cursor, Copilot, etc.) to bootstrap **Architecture Specification Repositories** reliably.

Execute the canonical [Architecture Specification Repository Bootstrap Procedure](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Bootstrap_Procedure.md). Do not embed normative rules here that belong in that procedure or [Guidance](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md).

## AI Responsibilities

- Read the Bootstrap Procedure and [Guidance](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md) before acting
- Confirm the repository is an ASR (procedural intent — no config field)
- Use `profile: core` only unless optional reference implementation requires software domains
- Preserve all historical artifacts; never rewrite discovery record content
- Create missing files only; never overwrite existing content
- Produce `ASR_BOOTSTRAP_REPORT.md` from template
- Run Framework Advisor after structural changes

## Decision Tree

```text
User wants to bootstrap an Architecture Specification Repository?
│
├─ Existing repository with history and foundational documents (e.g., CRA-0000)
│     → Follow Bootstrap Procedure steps 1–10 for existing repository
│     → Map discovery records to docs/Architecture/ with document type metadata
│     → Prepare docs/Specifications/ for future normative specs (CRA-0001+)
│
└─ New empty repository
      → Follow Bootstrap Procedure for new repository
      → create_canonical_structure.sh --profile core
```

## Document Mapping Rules

| Content | Action |
|---|---|
| Historical discovery record (e.g., CRA-0000) | Map to `docs/Architecture/`; set Document Type: Architectural Discovery Record; Normative: No |
| Future normative spec (e.g., CRA-0001) | Do not create until ready; location is `docs/Specifications/` |
| ADRs | `docs/Architecture/ADRs/` |
| Open questions | `docs/Architecture/Watch_Items/` |
| Glossary | `docs/Reference/Glossary.md` |

If relocating `CRA-0000`, prefer `git mv`, record in bootstrap report, or preserve path with mapping.

## Prompt Template — Existing ASR Bootstrap

```text
Bootstrap this repository as an Architecture Specification Repository using EDF.

1. Read EDF's ASR Bootstrap Procedure and Guidance from the local EDF clone.
2. Inspect this repository; inventory existing documents including CRA-0000.
3. Apply EDF Core with profile: core (create-only).
4. Map CRA-0000 as a non-normative Architectural Discovery Record under docs/Architecture/.
5. Create only missing bootstrap artifacts.
6. Do not author CRA-0001 or other normative specifications.
7. Produce ASR_BOOTSTRAP_REPORT.md with mappings, deferred items, and gaps.
8. Run Framework Advisor validation with profile: core.
```

## Validation Gate

Before declaring bootstrap complete:

- [ ] [Validation Checklist](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Validation_Checklist.md) required items satisfied
- [ ] Framework Advisor run with `profile: core`
- [ ] `ASR_BOOTSTRAP_REPORT.md` produced

## Parent

- [AI Engineering Handbook](README.md)

## Related Documents

- [Bootstrap Procedure](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Bootstrap_Procedure.md)
- [Guidance](../Development/Repository_Bootstrap/Architecture_Specification_Repository/Guidance.md)
- [General Bootstrap Playbook](Bootstrap_Playbook.md)
