# Architecture Decision Records

This document serves as the **index and template** for Architecture Decision Records (ADRs) in projects that adopt this framework. ADRs capture significant technical decisions with enough context that future contributors — human or AI — understand *why* the system is built the way it is.

## Purpose

- Provide a durable record of architectural choices.
- Document alternatives considered and consequences accepted.
- Reduce repeated debate and archaeology in code reviews.
- Give AI tools authoritative context when suggesting changes.

## When to write an ADR

Create an ADR when a decision:

- Is **hard to reverse** (database choice, cloud provider, auth model).
- Affects **multiple teams or services**.
- Has **significant cost, security, or compliance** implications.
- Was **contested** and needed explicit resolution.
- Establishes a **pattern** other parts of the system should follow.

Skip ADRs for trivial choices (formatter settings, local variable naming) — those belong in the Developer Handbook.

## ADR index

Maintain this table as decisions are added. Store individual ADR files in `docs/Architecture/decisions/` (recommended) or inline below for small projects.

| ID | Title | Status | Date | Link |
|----|-------|--------|------|------|
| _[ADR-001]_ | _[Example: Adopt PostgreSQL as primary datastore]_ | Proposed | _[YYYY-MM-DD]_ | _[./docs/Architecture/decisions/ADR-001-postgresql.md]_ |

### Status values

| Status | Meaning |
|--------|---------|
| **Proposed** | Under discussion; not yet adopted |
| **Accepted** | Active decision; implement accordingly |
| **Deprecated** | No longer recommended; migration may be in progress |
| **Superseded** | Replaced by another ADR (link the successor) |

---

## ADR template

Copy the template below for each new decision. Filename convention: `ADR-NNN-short-kebab-title.md`.

---

# ADR-NNN: [Title]

## Decision ID

`ADR-NNN`

## Title

_[Short, descriptive title — e.g., "Use event sourcing for order lifecycle"]_

## Status

_[Proposed | Accepted | Deprecated | Superseded by ADR-XXX]_

## Date

_[YYYY-MM-DD — date of last status change]_

## Context

_[Describe the forces at play: technical, business, team skill, timeline, compliance, scale requirements. What problem are we solving? What constraints exist? Include enough background that someone joining in two years understands the situation.]_

### Requirements driving this decision

- _[Requirement or constraint 1]_
- _[Requirement or constraint 2]_

## Decision

_[State the decision clearly and unambiguously. Use active voice: "We will use X for Y because Z."]_

## Alternatives considered

### Alternative 1: _[Name]_

- **Description:** _[What this option entails]_
- **Pros:** _[Benefits]_
- **Cons:** _[Drawbacks]_
- **Why rejected:** _[Reason]_

### Alternative 2: _[Name]_

- **Description:** _[What this option entails]_
- **Pros:** _[Benefits]_
- **Cons:** _[Drawbacks]_
- **Why rejected:** _[Reason]_

### Alternative 3: _[Name]_ (optional)

- **Description:** _[...]_
- **Pros:** _[...]_
- **Cons:** _[...]_
- **Why rejected:** _[...]_

## Consequences

### Positive

- _[Benefit or enablement resulting from this decision]_
- _[Benefit]_

### Negative / trade-offs

- _[Cost, complexity, or limitation accepted]_
- _[Trade-off]_

### Neutral

- _[Side effects that are neither clearly good nor bad]_

### Follow-up actions

- [ ] _[Action item — e.g., spike, migration, documentation update]_
- [ ] _[Action item]_

## References

- _[Link to RFC, vendor doc, internal design doc, prior ADR]_
- _[Link to discussion thread, PR, or issue]_
- _[Relevant standards or regulations]_

---

## Process

1. **Draft** — Author creates ADR with status `Proposed` in a pull request.
2. **Review** — Tech lead and affected teams comment; alternatives section is mandatory.
3. **Accept** — Merge PR; update status to `Accepted` and add row to index table above.
4. **Implement** — Link implementation PRs to the ADR.
5. **Supersede** — When reversing a decision, create a new ADR and mark the old one `Superseded by ADR-XXX`. Do not delete historical ADRs.

## Tips for AI-friendly ADRs

- Use consistent field names (as in this template) so agents can parse records reliably.
- Keep each ADR focused on **one** decision.
- Link to code paths or modules affected when known.
- State explicit rejection reasons — AI tools otherwise may re-suggest discarded options.

## Related documents

- [docs/Architecture/README.md](./docs/Architecture/README.md) — System design documentation
- [PROJECT_CHARTER.md](./PROJECT_CHARTER.md) — Project scope and constraints
- [AI_WORKFLOW.md](./AI_WORKFLOW.md) — Using AI during design and implementation
