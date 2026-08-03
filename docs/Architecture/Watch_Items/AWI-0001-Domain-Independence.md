# AWI-0001-Domain-Independence

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › AWI-0001 Domain Independence

| | |
|---|---|
| **Status** | Active |
| **Owner** | Engineering Documentation Framework |
| **Created** | 2026-08-03 |
| **Revisit Trigger** | After the current repository adoption initiative is complete |
| **Related ADRs** | [ADR-0001](../ADRs/ADR-0001-Domain-Profiles.md) (Accepted), [ADR-0002](../ADRs/ADR-0002-Domain-Profile-Specification.md) (Proposed) |

---

# Domain Independence

## Objective

The Engineering Documentation Framework should evolve into a **domain-independent engineering documentation methodology** rather than remaining implicitly centered on software engineering.

Although software engineering has been the primary reference implementation to date, EDF should be architected so that it can naturally support other engineering disciplines and structured knowledge domains, including (but not limited to):

- Software Engineering
- Electrical Engineering
- Mechanical Engineering
- Civil Engineering
- Chemical Engineering
- Educational Knowledge Systems
- Scientific Research
- Legal Knowledge Systems
- Future engineering and technical disciplines

The core engineering methodology should remain independent of any particular discipline.

Individual disciplines should become **reference implementations** rather than defining the framework itself.

---

# Scope and Non-Goals

This watch item:

- Does **not** change the v1.0 roadmap or the current repository adoption initiative.
- Does **not** supersede [ADR-0001](../ADRs/ADR-0001-Domain-Profiles.md) or [ADR-0002](../ADRs/ADR-0002-Domain-Profile-Specification.md).
- Does **not** authorize profile implementation, bootstrap changes, or Framework Advisor changes.

While `Active`, this document is **non-authoritative for implementation**. It records a deferred architectural direction for intentional future review.

---

# Context

This objective emerged during the repository adoption review.

[ADR-0001](../ADRs/ADR-0001-Domain-Profiles.md) establishes the layered Core + Domain Profile model: EDF Core remains domain-independent, and Domain Profiles extend Core with discipline-specific documentation. [ADR-0002](../ADRs/ADR-0002-Domain-Profile-Specification.md) outlines the near-term profile specification, deferred until after v1.0.

This watch item captures a **broader, longer-horizon methodological evolution** beyond profile specification: positioning EDF as a discipline-neutral documentation methodology where software engineering—and every other discipline—is a reference implementation, not an implicit framework definition.

---

# Signals to Watch

Indicators that promotion of this initiative may be warranted:

- Multiple non-software adopters requiring distinct profile structures.
- Core documentation or validation remains implicitly software-centric after profile implementation.
- Demand for reference implementations in electrical, mechanical, educational, legal, or other knowledge domains.
- Growing adoption outside traditional engineering disciplines (educational systems, scientific research, legal knowledge).

---

# Promotion Criteria

When this watch item is revisited (after the adoption initiative completes):

1. Repository adoption initiative is complete and stable.
2. [ADR-0002](../ADRs/ADR-0002-Domain-Profile-Specification.md) profile specification is implemented or explicitly scoped.
3. Framework maintainer approves elevation to one or more Proposed ADR(s) or post-adoption implementation planning.

---

# Open Questions

Deferred until revisit:

- How to formalize non-engineering knowledge domains (legal, educational) within an "engineering documentation methodology" framing.
- Reference implementation packaging and discovery model across heterogeneous disciplines.
- Framework Advisor scoring and validation across heterogeneous profiles.
- Boundary between universal Core methodology and discipline-specific reference implementations as the framework scales.

---

# Parent

- [Architecture](../README.md)

## Related Documents

- [ADR-0001 — Domain Profiles](../ADRs/ADR-0001-Domain-Profiles.md)
- [ADR-0002 — Domain Profile Specification](../ADRs/ADR-0002-Domain-Profile-Specification.md)
- [Documentation Information Architecture](../Documentation_Information_Architecture.md)
- [Repository Overview](../../../README.md)
