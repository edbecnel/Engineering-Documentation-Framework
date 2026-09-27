# Manual Verification Records (MVR) — EDF Implementation Plan

**Status:** Project Architect accepted and published (2026-09-28)  
**Authorization:** Project Architect implementation authorization, 2026-09-28  
**Publication:** Pushed to `origin/main` (baseline commits `6032bf4`, `dce255f`, `7764e7b` plus publication closeout)

---

## Binding scope

- [ADR-0010](../docs/Architecture/ADRs/ADR-0010-Manual-Verification-Records.md) + [MVR-0001](../docs/Specifications/MVR-0001-Manual-Verification-Records.md)
- Single MVR per governed human-manual-verification obligation
- `docs/Verification/Records/` — **no** synthetic `MVR-NNNN` instance in EDF
- Framework Advisor MVR parsing — **deferred** (Analyzer_Compliance note only)
- ProjectConcord / TRV — **downstream** after EDF publish

## PA resolutions incorporated

1. **Waiver state:** No extra MVR disposition field. MVR stays truthful; waiver on governing record; optional Notes link only.
2. **Framework Advisor:** Note only in Analyzer_Compliance; no parser, interaction spec, or AWI for deferral.

## Implementation stages (this change set)

| Stage | Deliverable |
|-------|-------------|
| 1 | ADR-0010, MVR-0001 |
| 2 | Template, `docs/Verification/` tree |
| 3 | EGR/AAR/GMFP, AI, handbook, feature/architecture templates, concern matrix |
| 4 | IA, glossary, indexes, bootstrap scripts, CHANGELOG, ASR Guidance, GEP pointer |
| 5 | Self-hosting / conformance validation evidence |

## Closeout

MVR framework change **closed**. Downstream sequence: ProjectConcord MVR adoption, then TRV CC-4B MVR migration (separate handovers; not started from this repository).

## Plan history

- Authoritative planning: Cursor plan `manual_qa_governance_ee92e1ff.plan.md` (PA accepted with amendments)
- Authoritative copy: this file (`tasks/MVR-implementation-plan.md`)
