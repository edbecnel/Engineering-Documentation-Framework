# Disposable Verification Workspaces (DVW) — EDF Implementation Plan

**Status:** Project Architect accepted and published (2026-09-28)  
**Authorization:** Stage 3 release/publication authorization, 2026-09-28  
**Publication:** Pushed to `origin/main` (DVW Stage 1–3 baseline; see git log for publication commit SHA)

**Governance status (authoritative in-repository record):**

| Milestone | Status |
|---|---|
| **STOP-0** — Plan acceptance | **PASSED** / PA accepted |
| **Stage 1** — Normative Core | **ACCEPTED** |
| **STOP-1** — Stage 1 review | **PASSED** |
| **Stage 2** — Companion Documentation | **ACCEPTED** |
| **STOP-2** — Stage 2 review | **PASSED** |
| **Stage 3** — Release / Publication | **ACCEPTED** / **PUBLISHED** |
| **STOP-3** — Publication evidence | Recorded in publication commit and STOP-3 package |
| **STOP-4** — ProjectConcord reconciliation | **NOT AUTHORIZED** |

---

## Binding scope

- [DVW-0001](../docs/Specifications/DVW-0001-Disposable-Verification-Workspaces.md) — normative EDF Core specification for **Disposable Verification Workspaces (DVW)**
- **No ADR** for DVW v1 (ADR-0006 and ADR-0010 remain unchanged)
- **No** Framework Advisor rules, analyzer enforcement, bootstrap mandates, generators, or mandatory Core DVW directory layout
- **No** universal literal temp paths (`~/tmp`, `./tmp`) as EDF Core requirements
- **No** mandatory `tests/fixtures/` Core path
- **No** separate canonical glossary concept “Ephemeral Verification Directory”
- Individual DVW instances do **not** receive global EDF identifiers
- [MVR-0001](../docs/Specifications/MVR-0001-Manual-Verification-Records.md) — governed verification **procedure and execution record**; DVW is the disposable **filesystem subject**; MVR **MAY** reference resolved DVW paths as execution/evidence metadata only

## Architectural decisions (preserved)

1. **DVW definition:** Filesystem workspace (one directory or coordinated set) created or selected solely as a **non-valuable subject** of verification.
2. **Placement:** Semantics-first; default **outside** valuable/adopting repository working trees; platform-appropriate user-writable temporary-storage semantics (OS paths/APIs as non-normative examples only).
3. **Safety:** Destructive, relocation, move, and mutation-oriented verification **defaults to DVW**; valuable **Adopting Project Root** not used by default; real-project exceptions require explicit governing need and documented safeguards.
4. **Lifecycle:** Conceptual phases only (Planned, Created, In use, Evidenced, Disposed) — **no** persisted DVW lifecycle state machine requirement.
5. **Cleanup:** Manual operator **SHOULD** dispose when done; automated ephemeral DVWs **MUST** use teardown / `finally` / dispose semantics; DVW content is not canonical VCS evidence.
6. **Fixtures:** Committed deterministic fixtures are a **distinct** pattern; hybrid seed/copy into DVW permitted; fixture paths remain project-chosen.
7. **Distinctions:** DVW is not MVR, `reports/`, product operational state, Git identity, EDF adoption status, or canonical `docs/` domain.

## PA resolutions incorporated

1. **No ADR:** DVW semantics live in DVW-0001 and companion cross-references only.
2. **MVR boundary:** Do not merge DVW normative requirements into MVR-0001; optional MVR template section for operator environment metadata only.
3. **Framework Advisor:** Out of scope for DVW-0001 v1.
4. **ProjectConcord:** Downstream reconciliation **after** EDF publication (STOP-4) — includes A1c `~/tmp` wording, GAP-046, ProjectConcord MVR template sync, A1c guided UI MVR execution; **paused** until authorized.

## Implementation stages

| Stage | Deliverable | STOP |
|-------|-------------|------|
| **0** | PA acceptance of this implementation plan | STOP-0 |
| **1** | [DVW-0001](../docs/Specifications/DVW-0001-Disposable-Verification-Workspaces.md); Glossary entries (**Adopting Project Root**, **Disposable Verification Workspace (DVW)**) | STOP-1 |
| **2** | Companion documentation: implementation plan in `tasks/`; MVR template optional section; MVR-0001 Related Documents link; [05_Testing.md](../docs/Developer_Handbook/05_Testing.md); Specifications / Verification README; minimal GEP and DIA cross-references; [AI Verification](../docs/AI/Verification.md); template/index updates as required by convention | STOP-2 |
| **3** | Release validation, CHANGELOG closeout, publication to `origin/main`, self-hosting evidence | STOP-3 |
| **4** | ProjectConcord adoption: replace ad hoc temp-path guidance with DVW-0001 semantics; MVR template parity; gap closure (e.g. GAP-046); governed manual verification execution where applicable | STOP-4 (not authorized) |

## Stage 2 companion scope (explicit)

**In scope:**

- `tasks/DVW-implementation-plan.md` (this file)
- `docs/Templates/Manual_Verification_Record_Template.md` — optional **Operator environment and test data**
- `docs/Specifications/MVR-0001-Manual-Verification-Records.md` — Related Documents / navigation only
- `docs/Developer_Handbook/05_Testing.md` — fixtures vs DVW vs production data
- `docs/Specifications/README.md` — register DVW-0001
- `docs/Verification/README.md` — MVR vs DVW relationship
- `docs/Architecture/General_Engineering_Project_Model.md` — minimum DVW cross-reference
- `docs/Architecture/Documentation_Information_Architecture.md` — light distinction (not a `docs/` domain)
- `docs/AI/Verification.md` — AI operator guidance pointing to DVW-0001
- `tasks/README.md` — governance implementation plan index entry
- `PROJECT_INDEX.md` — if normative specs are indexed (existing convention)

**Out of scope (Stage 2):**

- Material normative edits to DVW-0001 (conflicts → STOP and return to PA)
- ADR create/modify
- Framework Advisor / bootstrap / analyzer changes
- CHANGELOG release closeout (Stage 3)
- ProjectConcord repository changes

## Downstream (ProjectConcord — STOP-4, not started)

After EDF Stage 3 publication, authorized reconciliation may include:

- Align ProjectConcord manual verification and handbook text with DVW-0001 (remove canonical `~/tmp` as EDF policy)
- Synchronize ProjectConcord MVR template with EDF optional operator-environment section
- Close tracking gaps (e.g. GAP-046) tied to disposable workspace governance
- Execute paused A1c guided UI MVR and related commits **only** under STOP-4 authorization

ProjectConcord A1c manual MVR remains **PAUSED** until STOP-4.

## Closeout

DVW framework change **published** when Stage 3 validation succeeds, CHANGELOG records the release, and `origin/main` contains the publication commit. STOP-4 (ProjectConcord) is a **separate** authorization.

## Plan history

- Initial plan: Cursor plan **DVW-0001 — Governed EDF implementation plan** (PA accepted at STOP-0)
- Durable authoritative copy: this file (`tasks/DVW-implementation-plan.md`) — persisted 2026-09-28 at Stage 2 authorization
