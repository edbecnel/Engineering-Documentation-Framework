# EGR-[GateID]: [Gate Title]

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Program](../Program/README.md) › [Gate Reviews](../Program/Gate_Reviews/README.md) › EGR-[GateID]

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Engineering Gate Review Record |
| **Normative** | Yes (when gate is declared blocking) |
| **Gate ID** | [G0 / G1 / EGR-0001] |
| **Gate Status** | Open / Satisfied / Rejected / Deferred / Waived / Superseded |
| **Milestone** | [M0 / M1 / …] |
| **Owner** | [Role or name] |
| **Unblocks** | [What work this gate permits when Satisfied] |

## Purpose

Describe why this gate exists and what must be reviewed before work proceeds.

Gate Status is the lifecycle of this obligation. It is not Dependency Disposition. Do not mark this gate Satisfied merely to allow downstream work to begin.

## Gate Decision

Check **one** outcome when closing the gate:

- [ ] **Gate satisfied** — criteria met; unblocked work may proceed
- [ ] **Gate rejected** — criteria not met; do not proceed
- [ ] **Gate deferred** — decision postponed (record reason in Notes). This is not Non-Blocking authorization.
- [ ] **Gate waived** — obligation no longer required (complete waiver fields below)
- [ ] **Gate superseded** — replaced by another accepted gate, artifact, or decision (link replacement below)

| Field | Value |
|---|---|
| **Decision maker** | |
| **Decision date** | YYYY-MM-DD |
| **Notes** | |

### Waiver or supersession (when that outcome is checked)

| Field | Value |
|---|---|
| **Affected gate** | |
| **Rationale** | |
| **Owner** | |
| **Approval** | |
| **Review date** | YYYY-MM-DD |
| **Permanent or resolution plan** | Permanent / [plan] |
| **Superseded by** | [link if Superseded] |

## Governed Dependency Overrides

Use while **Gate Status** remains `Open` and a declared Blocking dependency should become Non-Blocking for a **precise** Authorized Downstream Scope. Repeat the table for each override. Local IDs only (`GDO-1`, `GDO-2`). Do not create a separate GDO file.

Authorized Downstream Scope is not limited to another EGR or gate. Identify a clearly bounded gate, implementation tranche, milestone, release activity, named work package, or other governed activity. Work outside that explicit scope remains Blocking. A downstream EGR is not required merely because a GDO exists; if one exists, it SHOULD cite this override.

### GDO-1

| Field | Value |
|---|---|
| **Override ID** | GDO-1 |
| **Source gate** | |
| **Remaining obligation** | |
| **Authorized Downstream Scope** | [explicit activity — not a vague “implementation”] |
| **Dependency Disposition** | Non-Blocking |
| **Authority** | [role or name] |
| **Date** | YYYY-MM-DD |
| **Rationale** | |
| **Safety basis** | [why unfinished work does not materially affect the authorized activity; expediency alone is not sufficient] |
| **Conditions / constraints** | |
| **Reactivation conditions** | |
| **Affected declared dependencies** | |
| **Override Status** | Active / Reactivated / Closed |

## Prerequisite overrides (downstream EGR only)

If **this** gate or activity was authorized by a GDO on a still-Open prerequisite, cite that source override. Omit this section when this EGR is not such a downstream record.

| Source EGR | Override ID | Authorized Downstream Scope |
|---|---|---|
| [link] | GDO-1 | |

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

After gate satisfied, waived, or superseded:

- [ ] Update implementation roadmap / milestone status
- [ ] Update bootstrap or adoption report if applicable
- [ ] Update ADR indexes and **Status** fields for accepted ADRs
- [ ] Update SPEC/Charter **Status** if approved
- [ ] Close or carry forward any Active GDOs on this EGR
- [ ] Link this EGR from [Program README](../Program/README.md) or gate index, including **Active overrides** if still Open with a GDO

## Parent

- [Program](../Program/README.md)

## Related Documents

- [EGR-0001](../Specifications/EGR-0001-Engineering-Gate-Review-Records.md)
- [ADR-0007](../Architecture/ADRs/ADR-0007-Engineering-Gate-Review-Records.md)
- [Implementation Roadmap or equivalent](../Development/Implementation_Roadmap.md)
