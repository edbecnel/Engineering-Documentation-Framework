# AWI-0002-Interaction-Layer-Separation

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › AWI-0002 Interaction Layer Separation

| | |
|---|---|
| **Status** | Promoted |
| **Owner** | Engineering Documentation Framework |
| **Created** | 2026-08-03 |
| **Promoted** | 2026-08-03 |
| **Revisit Trigger** | After the current repository adoption initiative is complete |
| **Related ADRs** | [ADR-0003 — Conversation Specifications](../ADRs/ADR-0003-Conversation-Specifications.md) |

---

# Interaction Layer Separation

## Objective

The Engineering Documentation Framework should clearly distinguish between the **canonical engineering methodology** and the various **interaction models** used to execute it.

The engineering methodology remains the authoritative source.

Interaction mechanisms are optional interfaces that enable users to execute the same methodology. Examples include:

- Traditional documentation
- Step-by-step guides
- Graphical tools
- Command-line tools
- AI conversational guidance
- Future interaction technologies

AI conversational guidance should be treated as an **optional interaction layer**.

It should improve usability and accelerate adoption, but it must never become a prerequisite for using EDF.

Every engineering workflow should remain fully executable through the documentation and traditional tooling without requiring AI assistance.

Future AI conversation specifications should execute the existing methodology rather than replace it.

---

# Scope and Non-Goals

This watch item:

- Does **not** change the v1.0 roadmap or the current repository adoption initiative.
- Does **not** supersede the [AI Engineering Handbook](../../AI/README.md), [Documentation Information Architecture](../Documentation_Information_Architecture.md), or existing ADRs.
- Does **not** authorize new AI tooling, Framework Advisor changes, bootstrap changes, or interaction-layer implementation packages.

While `Active`, this document is **non-authoritative for implementation**. It records a deferred architectural direction for intentional future review.

**Update (2026-08-03):** This watch item was revisited after the adoption initiative completed. See [AWI-0002 Revisit Assessment](AWI-0002-Revisit-Assessment.md). Promotion outcome: [ADR-0003 — Conversation Specifications](../ADRs/ADR-0003-Conversation-Specifications.md). Pilot specs live under [interaction/](../../../interaction/README.md).

---

# Context

This objective emerged during the repository adoption review.

The [AI Engineering Handbook](../../AI/README.md) provides operational guidance for AI-assisted engineering—philosophy, roles, playbooks, and verification practices—but does not architecturally separate canonical methodology from optional interaction layers. [Documentation Information Architecture](../Documentation_Information_Architecture.md) positions `docs/AI/` as the modular handbook and the repository as the source of truth, without formalizing an interaction-layer model.

Framework Advisor, bootstrap scripts, and migration playbooks function as interaction and execution aids. This watch item captures the **longer-horizon architectural relationship** between those aids and the authoritative engineering methodology they should execute—not redefine.

This initiative is complementary to [AWI-0001 — Domain Independence](AWI-0001-Domain-Independence.md): domain independence addresses *what* the methodology covers; interaction layer separation addresses *how* users engage with it.

---

# Signals to Watch

Indicators that promotion of this initiative may be warranted:

- AI features or playbooks becoming required for conformance or adoption tiers.
- Workflows documented only as AI prompts without equivalent documentation or tooling paths.
- Framework Advisor, bootstrap, or validation requiring AI assistance.
- New interaction modes (graphical, CLI, conversational) embedding methodology rules instead of referencing canonical documentation.
- Adoption blockers for teams without AI access or with a preference for non-AI workflows.

---

# Promotion Criteria

When this watch item is revisited (after the adoption initiative completes):

1. Repository adoption initiative is complete and stable.
2. Framework maintainer approves elevation to one or more Proposed ADR(s) or post-adoption implementation planning.
3. Clear evidence that interaction-layer boundaries need formal specification (e.g., conformance rules, interaction-layer packaging).

---

# Open Questions

Deferred until revisit:

- How to structure interaction-layer specifications versus canonical methodology documents.
- Whether conformance tiers should explicitly validate non-AI executability.
- Framework Advisor's role: validation methodology versus CLI interaction layer.
- Packaging and discovery model for graphical and CLI interaction layers.
- How future AI conversation specifications reference and execute methodology without redefining it.

---

# Parent

- [Architecture](../README.md)

## Related Documents

- [Documentation Information Architecture](../Documentation_Information_Architecture.md)
- [AI Engineering Handbook](../../AI/README.md)
- [AI Philosophy](../../AI/AI_Philosophy.md)
- [Project Analysis / Framework Advisor](../../Development/Project_Analysis_Validation_Tool.md)
- [AWI-0001 — Domain Independence](AWI-0001-Domain-Independence.md)
- [AWI-0002 Revisit Assessment](AWI-0002-Revisit-Assessment.md)
- [ADR-0003 — Conversation Specifications](../ADRs/ADR-0003-Conversation-Specifications.md)
- [Interaction Layer](../../../interaction/README.md)
