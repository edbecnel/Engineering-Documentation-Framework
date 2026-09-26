# Governed Maintenance Fast Path (GMFP) — EDF Implementation Plan

**Status:** Accepted with binding amendments (Project Architect, 2026-09-26)  
**Implementation:** Authorized in Agent mode after this plan was saved; no push until PA acceptance + publication authorization.

---

## Binding amendments (authoritative)

### Amendment 1 — Two human governance gates

GMFP retains three **workflow stages** (GMFP-1, GMFP-2, GMFP-3) but only **two human / declared-architecture-authority synchronization gates**:

| Gate | Stage | Purpose |
|------|-------|---------|
| **Authorization gate** | GMFP-1 | Diagnose, classify, bound, authorize |
| **Acceptance + publication gate** | GMFP-3 | Review completed implementation/evidence; authorize publication |

**GMFP-2** is the **authorized maintenance execution interval** — **not** an approval gate. During GMFP-2 the authorized agent/developer may implement, validate, generate evidence, update maintenance documentation, and create appropriate local commits without intermediate architecture-authority approval.

### Amendment 2 — Acceptance may authorize push directly

GMFP-3 acceptance SHOULD normally combine implementation acceptance, evidence acceptance, documentation acceptance, and **publication authorization** in **one** architecture-authority decision (for example: **GMFP ACCEPTED — PUBLICATION AUTHORIZED**).

After that decision, the authorized agent may push, verify `local == origin`, ahead/behind `0/0`, clean working tree, and record publication evidence in the GMR — **without** another PA approval. Further STOP only if publication fails or exposes a materially unexpected condition. **No routine post-push PA approval gate.**

### Amendment 3 — GMR must remain lightweight

- **Location:** `docs/Program/Maintenance_Records/`
- **Identifier:** `GMR-NNNN-<short-title>.md`
- Concise structured record; consolidate evidence; link/reference existing artifacts; do not duplicate large test logs or normative architecture.

### Amendment 4 — Interaction spec deferred

Do **not** implement `interaction/specs/edf.gmfp.v1.yaml` in this change set. Do not modify interaction indexes to anticipate it. Tooling encoding deferred until GMFP is exercised operationally.

### PA decisions on open questions

1. GMR location/ID — **approved** as above.
2. Normative: **declared architecture authority**; templates may use **Project Architect**.
3. **Optional governed capability** — not a SHOULD for every adopter.
4. ADR-0009 + GMFP-0001 developed and reviewed together.
5. Interaction spec — **deferred**.
6. **No synthetic example GMR**; dogfood on first real qualifying maintenance.

### EDF implementation governance simplification

One coherent PA review package for the GMFP governance change. **No** separate routine PA stops for draft ADR, ADR acceptance, and spec acceptance when artifacts form one package. Final runtime STOP: one acceptance review after implementation evidence (this EDF repo change set).

---

## Principal usability requirement

- **One** architecture-authority authorization before bounded maintenance (GMFP-1).
- **One** architecture-authority acceptance after the work (GMFP-3), normally including publication authorization.
- No intermediate approval of implementation, testing, documentation, commits, or mechanical publication unless risk or scope changes.

---

## Implementation scope (this change set)

**Add:** ADR-0009, GMFP-0001, GMR template, `Maintenance_Records/README`, navigation/index cross-links, glossary, minimal policy links, CHANGELOG if appropriate.

**Do not:** interaction YAML, synthetic GMR, push.

**Defer:** ProjectConcord / machine-readable workflow (document as future work in GMFP-0001 only).

---

## GOVERNANCE OVERHEAD ANALYSIS (non-normative)

Representative bounded maintenance (e.g. pre-existing test isolation; one test file): eliminates four to five intermediate PA gates between authorization and publication; retains two human gates and full traceability via GMR + commits.

---

## Plan history

- Initial plan: Cursor plan `gmfp_edf_canon_plan_b84d922f.plan.md`
- Authoritative copy: this file (`tasks/GMFP-implementation-plan.md`)
