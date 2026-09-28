# GMR-0002: DVW human-interactive placement ergonomics

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Program](../../Program/README.md) › [Maintenance Records](README.md) › GMR-0002

## Identity

| Field | Value |
|---|---|
| **Record ID** | GMR-0002 |
| **Maintenance status** | Published |
| **Change class** | GMFP |
| **Owner** | Engineering Documentation Framework |
| **Baseline** | `main` @ `8e1884a5c1dac307d49c75ff21327db52b7a85bb` |

## Defect

During ProjectConcord A1c governed manual verification, a DVW under macOS platform temporary storage was technically valid but ergonomically burdensome for human operators using native folder-selection dialogs. DVW-0001 v1.0 §Placement over-emphasized platform-temp resolution as the default path for all DVWs, which conflicted with semantics-first intent when humans must directly interact with paths.

## Reproduction and attribution

- **Reproduction:** Operator executing ProjectConcord A1c MVR with DVW paths under a long platform-generated temp directory (for example `/var/folders/.../T/ProjectConcord-A1c-MVR-...`).
- **Attribution:** pre-existing documentation gap discovered through real-world adoption (not a regression in DVW safety or identity semantics).

## Root cause

DVW-0001 v1.0 required default resolution to begin with platform temporary-storage semantics without distinguishing human-interactive verification from automation-oriented DVW creation and consumption.

## GMFP eligibility

Architecture authority (Project Architect) classified this item as bounded clarification under GMFP via the DVW Human-Interactive Path Ergonomics handover (2026-09-28).

- [x] Localized defect with evidence
- [x] Bounded file or component list (see Authorized scope)
- [x] No new capability (placement ergonomics clarification only)
- [x] No Accepted ADR behavior change; clarification to Proposed DVW-0001 v1.1 aligned with existing semantics-first rules
- [x] No schema or persistent model change
- [x] No material API or external contract change
- [x] No security or RBAC model change
- [x] No new integration or architectural dependency
- [x] No destructive data operation
- [x] Validation can demonstrate the fix directly
- [x] Documentation impact bounded to traceability

## Authorized scope

| Path or component | Allowed change |
|---|---|
| `docs/Specifications/DVW-0001-Disposable-Verification-Workspaces.md` | §Placement human-interactive vs automation-oriented guidance; prospective validity; version 1.1 |
| `docs/Developer_Handbook/05_Testing.md` | DVW table row sync only if contradictory |
| `docs/AI/Verification.md` | Minimal human-interactive placement pointer if needed |
| `docs/Program/Maintenance_Records/` | This GMR and index row |
| `tasks/DVW-human-interactive-placement-refinement-plan.md` | Authoritative refinement plan |
| `tasks/README.md` | Optional index link |
| `CHANGELOG.md` | Unreleased traceability entry |

**Out of scope:** MVR-0001 and template; GMR-0001; ADRs; glossary; ProjectConcord; path canonicalization rules; universal DVW root; in-use A1c DVW relocation or MVT rerun.

## Authorization gate (GMFP-1)

| Field | Value |
|---|---|
| **Authority** | Project Architect (DVW Human-Interactive Path Ergonomics disposition) |
| **Date** | 2026-09-28 |
| **Decision** | GMFP IMPLEMENTATION AUTHORIZED |

## Implementation summary (GMFP-2)

DVW-0001 v1.1 distinguishes human-interactive from automation-oriented placement, prefers short navigable disposable locations for human-interactive DVWs when practical, retains platform temp as appropriate for automation-oriented DVWs, and states that v1.0-conformant DVWs remain valid prospectively. Companion handbook and AI verification pointers updated minimally.

## Validation

| Command or procedure | Result | Notes |
|---|---|---|
| `./scripts/run_self_hosting_validation.sh` | pass | 2026-09-28; report `reports/self-hosting/framework-advisor-20260928-203405.txt` |

## Unrelated failures

_None anticipated._

## Commits

| SHA | Message |
|---|---|
| `76fc7af` | Clarify DVW placement for human-interactive verification |
| `9ba130b` | docs(gmfp): record GMR-0002 commit reference and GMFP-2 STOP |

## Acceptance and publication gate (GMFP-3)

| Field | Value |
|---|---|
| **Authority** | Project Architect |
| **Date** | 2026-09-28 |
| **Decision** | GMFP ACCEPTED — PUBLICATION AUTHORIZED. GMFP-2 accepted. DVW-0001 lifecycle status remains **Proposed** (not promoted). |

## Publication evidence

| Field | Value |
|---|---|
| **Pushed** | 2026-09-28 |
| **Remote refs** | `origin/main` @ `ed30da6` |
| **Verification** | clean working tree; `local` == `origin/main`; ahead/behind 0/0 |

## Parent

- [Maintenance Records](README.md)

## Related Documents

- [GMFP-0001](../../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [DVW-0001](../../Specifications/DVW-0001-Disposable-Verification-Workspaces.md)
- [DVW human-interactive placement refinement plan](../../../tasks/DVW-human-interactive-placement-refinement-plan.md)
