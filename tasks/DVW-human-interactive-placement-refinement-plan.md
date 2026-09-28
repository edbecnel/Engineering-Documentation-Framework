# DVW Human-Interactive Path Ergonomics — Refinement Plan

**Status:** **CLOSED** / Project Architect **ACCEPTED** / **PUBLISHED** (2026-09-28)  
**Authorization:** Project Architect — PA PLAN ACCEPTED; GMFP eligibility affirmed; **GMFP IMPLEMENTATION AUTHORIZED**  
**Governance record:** [GMR-0002](../docs/Program/Maintenance_Records/GMR-0002-DVW-human-interactive-placement.md)  
**Baseline:** `main` @ `8e1884a5c1dac307d49c75ff21327db52b7a85bb`

This file is the **authoritative implementation plan** for the bounded DVW placement clarification. It does not reopen [DVW-implementation-plan.md](DVW-implementation-plan.md) Stage 3 closeout.

---

## Purpose

Improve DVW **location guidance** for **human-interactive** verification when operators must browse, type, select, or inspect paths—without changing DVW identity semantics, Project Root identity, MVR boundaries, or filesystem canonicalization rules.

## Binding scope

| In scope | Out of scope |
|---|---|
| [DVW-0001](../docs/Specifications/DVW-0001-Disposable-Verification-Workspaces.md) v1.1 §Placement (+ Conformance, Rationale as needed) | MVR-0001, MVR template, ADRs, GMR-0001 reopen |
| GMR-0002, maintenance index, CHANGELOG | Universal DVW root; mandatory `~/ProjectConcord-Verification` |
| Minimal companion sync if contradictory ([05_Testing.md](../docs/Developer_Handbook/05_Testing.md), [AI Verification](../docs/AI/Verification.md)) | ProjectConcord; path-normalization architecture |
| `./scripts/run_self_hosting_validation.sh` | Framework Advisor rule changes |

## Normative intent (summary)

- **Human-interactive DVWs:** **SHOULD** use a short, recognizable, readily navigable, user-writable disposable location when practical; platform temp **MAY** be used but **SHOULD NOT** be preferred when path complexity materially burdens human interaction.
- **Automation-oriented DVWs:** platform-appropriate temporary storage remains appropriate and generally preferred.
- **All DVWs:** existing safety, cleanup, MVR relationship, and semantics-first rules remain binding.
- **Prospective:** DVWs valid under DVW-0001 v1.0 remain valid; revised guidance applies when choosing locations for **future** DVWs after the current ProjectConcord A1c manual-verification sequence completes.

## Implementation stages

| Stage | Deliverable | Gate |
|-------|-------------|------|
| **Plan** | This file + PA plan acceptance | **PASSED** |
| **GMFP-1** | GMR-0002 with **GMFP IMPLEMENTATION AUTHORIZED** | **PASSED** |
| **GMFP-2** | DVW-0001 v1.1; companion sync; validation; local commit(s) | **COMPLETE** — STOP before push |
| **GMFP-3** | PA **GMFP ACCEPTED — PUBLICATION AUTHORIZED**; push; GMR Published | **PASSED** |

## Publication

Implementation published to `origin/main` @ `9ba130b` (2026-09-28). GMR-0002 **Published**; closeout evidence on `main` per GMR publication record.

## STOP gates

- **STOP-3 (publication):** **PASSED** — refinement closed.
- Do not alter, relocate, or invalidate the in-use ProjectConcord A1c DVW; do not require MVT rerun.

## Related documents

- [GMFP-0001](../docs/Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [DVW-0001](../docs/Specifications/DVW-0001-Disposable-Verification-Workspaces.md)
