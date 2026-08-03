# AWI-0003-Repository-Semantic-Context-and-Convention-Binding

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › AWI-0003 Repository Semantic Context and Convention Binding

| | |
|---|---|
| **Status** | Active |
| **Owner** | Engineering Documentation Framework |
| **Created** | 2026-08-03 |
| **Revisit Trigger** | After ASR bootstrap capability is validated against CRA and EDF |
| **Self-Conformance Status** | EDF portion complete — [EDF ASR Self-Conformance Review](../../Development/EDF_ASR_Self_Conformance_Review.md) (2026-08-03). CRA bootstrap review pending. |
| **Related ADRs** | [ADR-0001](../ADRs/ADR-0001-Domain-Profiles.md) (Accepted), [ADR-0002](../ADRs/ADR-0002-Domain-Profile-Specification.md) (Proposed) |
| **Related AWIs** | [AWI-0001](AWI-0001-Domain-Independence.md) (Active) |

---

# Repository Semantic Context and Convention Binding

## Objective

Record a validated architectural discovery and an unresolved architectural question about how EDF should interpret documentation domains across different engineering contexts — without blocking practical bootstrap guidance for Architecture Specification Repositories.

---

# Validated Discovery

The following observations are treated as established architectural facts:

- EDF defines repository **structure** (Core) and **discipline extensions** (Domain Profiles) but leaves some **repository-level semantic interpretation** implicit.
- The same EDF documentation domains may serve **different engineering purposes** depending on the repository. For example, `docs/Specifications/` may describe product requirements in one repository and normative architecture specifications in another.
- **Architecture Specification Repositories** exposed this gap because their documentation **constitutes** the primary engineering deliverable rather than describing an external implementation.
- EDF itself exhibits Architecture Specification Repository characteristics without having explicitly recognized them.
- Introducing a canonical machine-readable repository classification field (such as `repository_class`) while this question remains open would prematurely commit EDF to one possible solution.

---

# Unresolved Question

How should EDF model repository-level semantic interpretation so that:

- future repository classes can be introduced through extension rather than redesign;
- EDF, CRA, SIP, and other repositories can be described without special-case treatment;
- validation, governance, and bootstrap conventions can bind appropriately to engineering context?

---

# Candidate Mechanisms (Not Selected)

The following have been identified as **candidates only**. None are accepted architectural decisions:

- Repository semantics
- Engineering context
- Semantic bindings
- Repository archetypes
- Convention extensions
- Another extension mechanism parallel to Domain Profiles

**Explicit constraint:** "Convention Extensions" SHALL NOT be recorded as an accepted architectural decision in any ADR or canonical document while this watch item is Active.

**Explicit constraint:** No canonical `repository_class` or equivalent machine-readable taxonomy field SHALL be introduced while this watch item is Active. Repository classification remains **procedural** (engineers invoke documented bootstrap procedures) until a mechanism is selected.

---

# Non-Blocking Statement

This unresolved architectural question does **not** prevent EDF from providing bootstrap guidance for Architecture Specification Repositories.

Practical ASR bootstrap guidance may later be refactored into a more general abstraction without invalidating repositories that adopted earlier procedural guidance.

---

# Scope and Non-Goals

This watch item:

- Does **not** authorize Convention Extensions or any other final classification mechanism.
- Does **not** supersede [ADR-0001](../ADRs/ADR-0001-Domain-Profiles.md) or [ADR-0002](../ADRs/ADR-0002-Domain-Profile-Specification.md).
- Does **not** block ASR bootstrap guidance under [Repository Bootstrap](../../Development/Repository_Bootstrap/README.md).
- Does **not** mandate permanent information architecture changes (such as dedicated discovery-record subdomains) before validation across multiple ASRs.

While `Active`, this document is **non-authoritative for mechanism selection**. It is authoritative for recording the discovered gap and preserving architectural uncertainty.

---

# Signals to Watch

Indicators that promotion of this initiative may be warranted:

- Multiple Architecture Specification Repositories (CRA, SIP, others) requiring consistent semantic interpretation guidance.
- Repeated need to explain how Core domains bind differently per repository type.
- Demand for machine-readable repository classification beyond procedural bootstrap invocation.
- Evidence that document-type conventions alone are insufficient for discovery-record separation.

---

# Promotion Criteria

When this watch item is revisited:

1. ASR bootstrap capability has been applied to at least CRA and reviewed against EDF self-description.
   - **EDF:** Complete — [EDF ASR Self-Conformance Review](../../Development/EDF_ASR_Self_Conformance_Review.md) (2026-08-03).
   - **CRA:** Pending CRA bootstrap and review.
2. Framework maintainer approves elevation to one or more Proposed ADR(s) or scoped implementation planning.
3. Candidate mechanisms have been evaluated against the self-classification test (EDF, CRA, SIP fit without special cases).

**Revisit scheduling:** Mechanism evaluation may proceed after CRA bootstrap review completes. No `repository_class` or equivalent field shall be introduced while this watch item is Active.

---

# Open Questions

Deferred until revisit:

- Whether architectural discovery records warrant a dedicated subdomain or remain a document type under `docs/Architecture/`.
- How repository semantic context relates to Domain Profiles on orthogonal axes.
- Whether Framework Advisor should eventually support context-aware validation.
- Final naming and packaging of any selected extension mechanism.

---

# Parent

- [Architecture](../README.md)

## Related Documents

- [ADR-0001 — Domain Profiles](../ADRs/ADR-0001-Domain-Profiles.md)
- [ADR-0002 — Domain Profile Specification](../ADRs/ADR-0002-Domain-Profile-Specification.md)
- [AWI-0001 — Domain Independence](AWI-0001-Domain-Independence.md)
- [Repository Bootstrap](../../Development/Repository_Bootstrap/README.md)
- [Architecture Specification Repository Bootstrap Procedure](../../Development/Repository_Bootstrap/Architecture_Specification_Repository/Bootstrap_Procedure.md)
- [EDF ASR Self-Conformance Review](../../Development/EDF_ASR_Self_Conformance_Review.md)
