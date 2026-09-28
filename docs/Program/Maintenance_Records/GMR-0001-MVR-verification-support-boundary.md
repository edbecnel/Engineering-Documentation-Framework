# GMR-0001: MVR verification support versus human attestation boundary

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Program](../../Program/README.md) › [Maintenance Records](README.md) › GMR-0001

## Identity

| Field | Value |
|---|---|
| **Record ID** | GMR-0001 |
| **Maintenance status** | Published |
| **Change class** | GMFP |
| **Owner** | Engineering Documentation Framework |
| **Baseline** | `main` @ `73ed6f2566c12f1f24d4669e09cf15b380c0b45d` |

## Defect

During ProjectConcord A1c adoption, governed MVR manual verification required deterministic DVW and filesystem setup that does not inherently require human attestation, but EDF did not explicitly permit delegating that **automatable verification support** to an automation agent while preserving the human-verification boundary.

## Reproduction and attribution

- **Reproduction:** Operator executing a governed MVR with DVW-based MVT preconditions (ProjectConcord A1c manual verification).
- **Attribution:** pre-existing documentation gap discovered through real-world adoption (not a regression in published DVW-0001).

## Root cause

MVR-0001 strongly defined human authority and AI non-impersonation but did not explicitly distinguish automatable preparation/support from human procedure steps or evidence provenance for automation-assisted setup.

## GMFP eligibility

Architecture authority (Project Architect) classified this item as bounded corrective clarification under GMFP via the MVR AI-Assisted Verification Preparation Refinement handover (2026-09-28).

- [x] Localized defect with evidence
- [x] Bounded file or component list (see Authorized scope)
- [x] No new capability (explicit boundary clarification only)
- [x] No Accepted ADR behavior change; additive clarification to Proposed MVR-0001 v1.1 aligned with existing human-authority rules
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
| `docs/Specifications/MVR-0001-Manual-Verification-Records.md` | Add §24–27 verification-support boundary; MVT presentation clarification; version 1.1 |
| `docs/Templates/Manual_Verification_Record_Template.md` | Optional preparation/support vs human procedure in MVT blocks |
| `docs/Program/Maintenance_Records/` | This GMR and index row |
| `CHANGELOG.md` | Unreleased traceability entry |

**Out of scope:** DVW-0001 redesign; ADR changes; glossary; ProjectConcord; validators; provider-specific policy.

## Authorization gate (GMFP-1)

| Field | Value |
|---|---|
| **Authority** | Project Architect (MVR AI-Assisted Verification Preparation Refinement handover) |
| **Date** | 2026-09-28 |
| **Decision** | GMFP IMPLEMENTATION AUTHORIZED |

## Implementation summary (GMFP-2)

MVR-0001 v1.1 adds normative separation of automatable verification support from human verification, permits automation agents for permitted preparation when MVR allows, and requires distinguishable evidence provenance. MVR template updated with optional **Preparation / support** block. DVW-0001 unchanged (existing lifecycle semantics already cover disposable subjects).

## Validation

| Command or procedure | Result | Notes |
|---|---|---|
| `./scripts/run_self_hosting_validation.sh` | pass | 2026-09-28; report `reports/self-hosting/framework-advisor-20260928-191810.txt` |

## Unrelated failures

_None anticipated._

## Commits

| SHA | Message |
|---|---|
| `323e8a3` | Clarify automated support for manual verification |

## Acceptance and publication gate (GMFP-3)

| Field | Value |
|---|---|
| **Authority** | Project Architect |
| **Date** | 2026-09-28 |
| **Decision** | GMFP ACCEPTED — PUBLICATION AUTHORIZED. GMFP-2 accepted. MVR-0001 lifecycle status remains **Proposed** (not promoted). |

## Publication evidence

| Field | Value |
|---|---|
| **Pushed** | 2026-09-28 |
| **Remote refs** | `origin/main` @ `323e8a3` |
| **Verification** | clean working tree; `local` == `origin/main`; ahead/behind 0/0 |

## Parent

- [Maintenance Records](README.md)

## Related Documents

- [GMFP-0001](../../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
- [MVR-0001](../../Specifications/MVR-0001-Manual-Verification-Records.md)
