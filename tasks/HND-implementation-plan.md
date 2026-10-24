# AI Session Handover Messages (HND) — EDF Implementation Plan

**Status:** Documentation complete in EDF repository (STOP-1/STOP-2 deliverables; STOP-3 publication and P2 acceptance pending Project Architect)  
**Authorization:** Plan `HND-0001 — Comprehensive AI session handover message header`  
**Binding scope:** [HND-0001](../docs/Specifications/HND-0001-AI-Session-Handover-Messages.md)

---

## Binding scope

- [HND-0001](../docs/Specifications/HND-0001-AI-Session-Handover-Messages.md) — comprehensive session handover message header (identity block + §1 Session and Execution Control)
- [`docs/Templates/AI_Handover_Message_Template.md`](../docs/Templates/AI_Handover_Message_Template.md) — canonical copy-paste example
- Persisted handover alignment in [`Handover_Template.md`](../docs/Templates/Handover_Template.md)
- Framework Advisor handover parsing — **deferred** (Analyzer_Compliance note only)
- Interaction Specification `edf.handover.v1.yaml` — **out of scope** (future)

## PA acceptance criteria (STOP gates)

| STOP | Deliverable | Acceptance |
|------|-------------|------------|
| **STOP-0** | This implementation plan | PA accepts scope and STOP table |
| **STOP-1** | HND-0001 draft, AI handover template, glossary terms (draft) | PA accepts normative header anatomy and enums |
| **STOP-2** | Handover template, nav, AI handbook, classification index, DIA EPI link | PA accepts companion consistency |
| **STOP-3** | CHANGELOG, self-conformance note, validation evidence, publication | PA accepts P2 normative approval record when promoting Status |

## Implementation stages (this change set)

| Stage | Deliverable |
|-------|-------------|
| 1 | `tasks/HND-implementation-plan.md`, HND-0001 |
| 2 | `AI_Handover_Message_Template.md`, `Handover_Template.md` session header section |
| 3 | Glossary, Specifications README, Logical Domain Classification Index, DIA |
| 4 | `Repository_Workflow.md`, `Prompting_Guide.md`, `Context_Checklist.md`, Templates README, Bootstrap_Context_Template |
| 5 | CHANGELOG, `EDF_ASR_Self_Conformance_Review.md`, `Analyzer_Compliance.md` deferral note |

## Closeout

HND EDF framework change completes at STOP-3 with traceable publication evidence. Downstream adopters (for example ProjectConcord relay renderers) MAY align optional transport layers to HND-0001 without requiring an EDF ADR in this tranche.

## Plan history

- Authoritative planning: Cursor plan `hnd-0001_handover_uuid_59c68e28.plan.md`
- Authoritative copy: this file (`tasks/HND-implementation-plan.md`)
