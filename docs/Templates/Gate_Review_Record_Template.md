# EGR-[GateID]: [Gate Title]

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Program](../Program/README.md) › [Gate Reviews](../Program/Gate_Reviews/) › EGR-[GateID]

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Engineering Gate Review Record |
| **Normative** | Yes (when gate is declared blocking) |
| **Gate ID** | [G0 / G1 / EGR-0001] |
| **Gate Status** | Open / Satisfied / Rejected / Deferred |
| **Milestone** | [M0 / M1 / …] |
| **Owner** | [Role or name] |
| **Unblocks** | [What work this gate permits] |

## Purpose

Describe why this gate exists and what must be reviewed before work proceeds.

## Gate Decision

Check **one** outcome when closing the gate:

- [ ] **Gate satisfied** — criteria met; unblocked work may proceed
- [ ] **Gate rejected** — criteria not met; do not proceed
- [ ] **Gate deferred** — decision postponed (record reason in Notes)

| Field | Value |
|---|---|
| **Decision maker** | |
| **Decision date** | YYYY-MM-DD |
| **Notes** | |

## Documents Under Review

| Document | Link | Reviewed | Approved |
|---|---|:---:|:---:|
| [Title] | [relative/path.md](relative/path.md) | - [ ] | - [ ] |
| [Title] | [relative/path.md](relative/path.md) | - [ ] | - [ ] |

Add one row per authoritative document required by this gate.

## ADR Dispositions

For each ADR required by this gate, check **one** disposition (mutually exclusive per ADR):

### ADR-NNNN: [Title]

- [ ] Accept (then update ADR **Status** to Accepted per [ADR Approval Workflow](../Architecture/ADRs/ADR_Approval_Workflow.md))
- [ ] Reject
- [ ] Revise (gate may remain open until revision complete)

## Post-Gate Actions

After gate satisfied:

- [ ] Update implementation roadmap / milestone status
- [ ] Update bootstrap or adoption report if applicable
- [ ] Update ADR indexes and **Status** fields for accepted ADRs
- [ ] Update SPEC/Charter **Status** if approved
- [ ] Link this EGR from [Program README](../Program/README.md) or gate index

## Parent

- [Program](../Program/README.md)

## Related Documents

- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [Implementation Roadmap or equivalent](../Development/Implementation_Roadmap.md)
