# GMR-NNNN: [Short title]

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Program](../Program/README.md) › [Maintenance Records](../Program/Maintenance_Records/README.md) › GMR-NNNN

## Identity

| Field | Value |
|---|---|
| **Record ID** | GMR-NNNN |
| **Maintenance status** | Proposed / Authorized / Implemented / Accepted / Published / Escalated |
| **Change class** | GMFP |
| **Owner** | [Role or name] |
| **Baseline** | branch, commit (pre-maintenance) |

Keep this record concise. Link evidence; do not paste large logs or repeat normative architecture.

## Defect

_One short paragraph: what was broken._

## Reproduction and attribution

- **Reproduction:** [steps or link]
- **Attribution:** pre-existing / introduced by [governed work reference] / unknown

## Root cause

_As known after investigation._

## GMFP eligibility

Check **all** before authorization. Any unchecked item disqualifies GMFP unless architecture authority reclassifies.

- [ ] Localized defect with evidence
- [ ] Bounded file or component list (see Authorized scope)
- [ ] No new capability
- [ ] No Accepted ADR or normative spec behavior change
- [ ] No schema or persistent model change
- [ ] No material API or external contract change
- [ ] No security or RBAC model change
- [ ] No new integration or architectural dependency
- [ ] No destructive data operation
- [ ] Validation can demonstrate the fix directly
- [ ] Documentation impact bounded to traceability

## Authorized scope

| Path or component | Allowed change |
|---|---|
| | |

**Out of scope:** _explicit exclusions_

## Authorization gate (GMFP-1)

| Field | Value |
|---|---|
| **Authority** | [declared architecture authority / Project Architect] |
| **Date** | YYYY-MM-DD |
| **Decision** | GMFP IMPLEMENTATION AUTHORIZED |

## Implementation summary (GMFP-2)

_Brief summary of what changed. List commits below._

## Validation

| Command or procedure | Result | Notes |
|---|---|---|
| | pass / fail | |

## Unrelated failures

_None, or brief summary with causation assessment._

## Commits

| SHA | Message |
|---|---|
| | |

## Escalation (if applicable)

| Trigger | Date | Action taken |
|---|---|---|
| | | |

## Acceptance and publication gate (GMFP-3)

| Field | Value |
|---|---|
| **Authority** | |
| **Date** | |
| **Decision** | GMFP ACCEPTED — PUBLICATION AUTHORIZED (or rejection / escalate) |

## Publication evidence

| Field | Value |
|---|---|
| **Pushed** | YYYY-MM-DD |
| **Remote refs** | branch @ commit |
| **Verification** | clean tree; local == origin; ahead/behind 0/0 |

## Parent

- [Maintenance Records](../Program/Maintenance_Records/README.md)

## Related Documents

- [GMFP-0001](../Specifications/GMFP-0001-Governed-Maintenance-Fast-Path.md)
