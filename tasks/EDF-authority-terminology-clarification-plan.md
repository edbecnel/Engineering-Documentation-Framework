# EDF Authority, Terminology, and Navigation Clarification — Implementation Plan

**Status:** STOP-1 PASSED — Stage 2 validation complete (STOP-2 pending PA commit authorization)  
**Authorization:** PA STOP-0 plan acceptance with binding amendments (2026-09-29); STOP-1 accepted 2026-09-29  
**Downstream:** ProjectConcord A2 remains **NOT AUTHORIZED** until this tranche is PA-accepted, implemented, and published per closeout below

---

## PA binding amendments (STOP-0)

| Amendment | Disposition |
|-----------|-------------|
| **Glossary Owner** | **`Engineering Documentation Framework`** — apply in Stage 1 Glossary Maintenance table (resolved; not open) |
| **Framework Advisor** | **No** canonical Glossary entry; concise disambiguation in [docs/Reference/README.md](../docs/Reference/README.md) only |
| **Documentation IA pointer** | **Not by default**; assess at STOP-1 whether PROJECT_INDEX + Reference README + Specifications README suffice; propose one IA sentence in STOP-1 evidence only if insufficient |
| **Other terminology** | ADR, GEP, declared architecture authority, EGR reconciliation, BVG/G1–G6, GMFP stage pointers, navigation, Option B clarifications — **accepted** as in plan body |

---

## Purpose

Execute one **small, controlled documentation tranche** that makes existing EDF governance boundaries understandable **without ProjectConcord context**, by:

1. **Option B clarification** — document how EGR, GDO, GMFP/GMR, and orchestration checkpoints relate using **existing normative semantics** (no new governance mechanisms).
2. **Justified terminology corrections** — reconcile discoverable naming (especially EGR vs Engineering Gate Review Record).
3. **Glossary improvements** — add missing canonical entries (ADR, GEP, declared architecture authority; refine EGR, BVG; GMFP stage pointers only).
4. **Navigation discoverability** — link canonical glossary from `PROJECT_INDEX.md`; fix misleading `docs/Specifications/README.md` glossary-path narrative.

This tranche is **documentation clarification only**. It must not change adoptable normative requirements in `docs/Specifications/` except where PA explicitly approves any flagged item during implementation review.

---

## Scope

### In scope

| Area | Intent |
|------|--------|
| **Option B — EGR** | Clarify program gate vs review record; Satisfied + **Unblocks**; no universal intermediate supervision cadence |
| **Option B — GDO** | Governed Dependency Override on Open EGR; Authorized Downstream Scope; not gate satisfaction; not generic execution envelope; Reactivation unchanged |
| **Option B — GMFP/GMR** | Optional maintenance path; GMR record; GMFP-2 not a human gate; no generalization to feature development |
| **Option B — orchestration** | Handbook-level clarification: extra STOP/review cycles from policy, risk, workflow, human/AI arrangement, tooling — not EDF gates unless a governing record binds decision/evidence |
| **Glossary** | ADR, GEP, declared architecture authority; EGR/BVG refinements; GMFP-1/2/3 pointer lines only |
| **Reference README** | Terminology/identifiers + Framework Advisor disambiguation (not a tool catalog) |
| **Navigation** | `PROJECT_INDEX.md`, `docs/Specifications/README.md`, `docs/Reference/README.md` |
| **Supporting cross-links** | `docs/Program/README.md`, `docs/AI/Repository_Workflow.md`, `tasks/README.md` |
| **Publication** | `CHANGELOG.md` entry at Stage 4 |

### Explicit non-goals

- No new generalized engineering-execution authorization mechanism (Option C rejected).
- No work-item, assignment, sprint, Scrum, backlog, or PM model in Core.
- No fixed organizational-role ontology; **Project Architect** remains an example mapping only.
- No ProjectConcord-specific execution semantics, parsers, or workflow specs.
- No glossary entries for PA, STOP-N, TRV, GAP-*, PCON-*, M1/M2/M3, NFR, RFC, product `SPEC-NNN`.
- No **“not Gate Dependency Override”** glossary warning (error was outside EDF canon).
- No rewrite of ADR-0003 to erase “Conversation Specification” history.
- **No Framework Advisor Glossary entry** (PA binding amendment 2).
- No new ADR or new normative specification ID unless PA separately authorizes after a STOP flag.
- No Framework Advisor implementation, interaction specs, or analyzer rule changes.
- No ProjectConcord repository changes.
- **No Documentation Information Architecture edit by default** (assess at STOP-1).

---

## Architectural constraints (binding)

Preserve accepted PA direction: GDO = **Governed Dependency Override**; distinct EGR / GDO / GMFP / GMR / MVR / AAR / BVG / ADR lifecycle / documentation-first semantics; orchestration ≠ automatic EDF governance gate.

---

## Authoritative semantics source (do not alter meaning)

| Topic | Normative anchor |
|-------|------------------|
| EGR, GDO | [EGR-0001](../docs/Specifications/EGR-0001-Engineering-Gate-Review-Records.md), [ADR-0007](../docs/Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md) |
| GMFP, GMR | [GMFP-0001](../docs/Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md), [ADR-0009](../docs/Architecture/ADRs/ADR-0009-Governed-Maintenance-Fast-Path.md) |
| MVR | [MVR-0001](../docs/Specifications/MVR-0001-Manual-Verification-Records.md) |
| AAR | [AAR-0001](../docs/Specifications/AAR-0001-Architectural-Audit-Records.md) |
| BVG | EGR-0001 §10; [Program README](../docs/Program/README.md) |
| ADR lifecycle | [ADR Approval Workflow](../docs/Architecture/ADRs/ADR_Approval_Workflow.md) |
| Change / human authority | [Change Management](../docs/Governance/Change_Management.md), [Governance Overview](../docs/Governance/Governance_Overview.md) |

**Implementation rule:** Clarifications in handbook, glossary, and program navigation must **align with** these specs. If draft text would contradict a normative §, **STOP** and escalate to PA — do not “fix” via clarification tranche.

---

## Proposed files to change

| File | Change type | Normative? |
|------|-------------|------------|
| [docs/Reference/Glossary.md](../docs/Reference/Glossary.md) | Add/revise entries; Owner = Engineering Documentation Framework | Reference terminology |
| [docs/Reference/README.md](../docs/Reference/README.md) | Terminology/identifiers; Framework Advisor vs AAR/BVG pointer | Navigation |
| [docs/Program/README.md](../docs/Program/README.md) | Option B clarifications | Clarification only |
| [docs/AI/Repository_Workflow.md](../docs/AI/Repository_Workflow.md) | Orchestration vs EDF governance gates | Handbook |
| [PROJECT_INDEX.md](../PROJECT_INDEX.md) | Canonical Glossary link | Navigation |
| [docs/Specifications/README.md](../docs/Specifications/README.md) | EDF canonical glossary location | Clarification |
| [tasks/README.md](README.md) | Link this plan | Index |
| [CHANGELOG.md](../CHANGELOG.md) | Stage 4 only | Release record |

### Files explicitly NOT changed

| File | Reason |
|------|--------|
| `docs/Specifications/EGR-0001.md`, `GMFP-0001.md`, etc. | Avoid normative drift |
| `docs/Architecture/ADRs/ADR-0003-*` | Historical terminology |
| `docs/Architecture/Documentation_Information_Architecture.md` | **Default unchanged** — assess at STOP-1 |

---

## Terminology decisions (resolved at STOP-0)

### ADR, GEP, declared architecture authority, EGR, BVG, GMFP stages

As documented in prior plan sections; **Framework Advisor:** Reference README only.

### Glossary Owner

**`Engineering Documentation Framework`** — **PA accepted** (binding amendment 1).

---

## Staged implementation sequence

| Stage | Deliverable | STOP |
|-------|-------------|------|
| **0** | PA accepts plan with binding amendments | **STOP-0 PASSED** (2026-09-29) |
| **1** | Draft all scoped edits; self-review; STOP-1 evidence | **STOP-1** (current) |
| **2** | Apply feedback; validation; prepare commit | **STOP-2** |
| **3** | Commit; self-hosting validation | **STOP-3** |
| **4** | Push; CHANGELOG; plan closeout | **STOP-4** |

---

## Plan history

- **2026-09-29:** Created from PA disposition — Option B + acronym inventory.
- **2026-09-29:** STOP-0 PASSED with binding amendments (Glossary Owner; no Framework Advisor glossary entry; IA pointer deferred to STOP-1 assessment).

---

## Related documents

- [EGR-0001](../docs/Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [GMFP-0001](../docs/Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [Glossary](../docs/Reference/Glossary.md)
- [Governance Overview](../docs/Governance/Governance_Overview.md)
- [tasks/README.md](README.md)
