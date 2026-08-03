# AWI-0002 Revisit Assessment

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › AWI-0002 Revisit Assessment

| | |
|---|---|
| **Status** | Complete |
| **Owner** | Engineering Documentation Framework |
| **Assessment Date** | 2026-08-03 |
| **Related** | [AWI-0002 — Interaction Layer Separation](AWI-0002-Interaction-Layer-Separation.md), [ADR-0003](../ADRs/ADR-0003-Conversation-Specifications.md) |

---

## Purpose

This document records the formal revisit of [AWI-0002](AWI-0002-Interaction-Layer-Separation.md) after completion of the repository adoption initiative (Bootstrap Guide, Migration Guide, `adopt-edf`, AI playbooks, conformance tiers).

---

## Revisit Trigger Met

The adoption initiative delivered:

- [Bootstrap Guide](../../Development/Bootstrap_Guide.md) and [Migration Guide](../../Development/Migration_Guide.md)
- [adopt-edf.sh](../../../scripts/adopt-edf.sh) orchestration (`bootstrap`, `migrate`, `validate`)
- [Bootstrap Playbook](../../AI/Bootstrap_Playbook.md) and [Migration Playbook](../../AI/Migration_Playbook.md)
- [Adopter Conformance Tiers](../../Development/Adopter_Conformance_Tiers.md)

Promotion criteria from AWI-0002 are satisfied:

1. Adoption initiative is complete and stable in the EDF reference repository.
2. Framework maintainer direction: elevate to Proposed ADR (ADR-0003).
3. Evidence: playbooks embed methodology-adjacent rules; interaction-layer boundaries need formal specification.

---

## Playbook Drift Assessment

Comparison of [Bootstrap Playbook](../../AI/Bootstrap_Playbook.md) against canonical methodology ([Bootstrap Guide](../../Development/Bootstrap_Guide.md), [Framework Generation Principles](../Framework_Generation_Principles.md)):

| Area | Drift risk | Finding |
|------|------------|---------|
| Greenfield decision tree | Low | Playbook defers to Bootstrap Guide; does not redefine folder layout |
| File copy rules | Medium | Playbook duplicates operational rules (what to copy vs stub) that also appear in Bootstrap Guide § Customize profile content |
| Validation gates | Medium | G1–G5 criteria paraphrase Adopter Conformance Tiers without formal traceability IDs |
| Prompt templates | High | Phase 0–3 prompts are conversation-only artifacts; not versioned as structured specs |
| Script commands | Low | Playbook references `adopt-edf.sh`; matches Bootstrap Guide |

**Conclusion:** Playbooks are aligned in intent but **duplicate methodology-adjacent content** in prose and prompts. Without a Conversation Specification layer, drift risk increases as playbooks evolve independently of guides.

**Mitigation applied:** Pilot [edf.bootstrap.v1.yaml](../../../interaction/specs/edf.bootstrap.v1.yaml) references canonical docs; playbooks should defer to specs for phased execution.

---

## Non-AI Parity Assessment

| Workflow | Non-AI path exists? | Equivalent artifacts |
|----------|---------------------|----------------------|
| Bootstrap | Yes | [Bootstrap Guide](../../Development/Bootstrap_Guide.md) + `./scripts/adopt-edf.sh bootstrap` |
| Migration planning | Yes | [Migration Guide](../../Development/Migration_Guide.md) + `./scripts/adopt-edf.sh migrate` |
| Conformance validation | Yes | `./scripts/adopt-edf.sh validate` + [Adopter Conformance Tiers](../../Development/Adopter_Conformance_Tiers.md) |
| AI-assisted bootstrap | Optional | [Bootstrap Playbook](../../AI/Bootstrap_Playbook.md) — not required for any tier |

**Gaps identified:**

1. Conformance tiers do not explicitly verify that a non-AI path is documented for AI-promoted workflows.
2. No machine-readable declaration of `non_ai_equivalent` on interaction-layer artifacts.
3. README Quick Start elevates AI playbooks alongside human guides — practical bias, not architectural requirement.

**Mitigation applied:** ADR-0003 requires `non_ai_equivalent` on every Conversation Specification; optional conformance validation added per [Interaction Layer README](../../../interaction/README.md).

---

## AWI-0002 Promotion Outcome

| Item | Outcome |
|------|---------|
| AWI-0002 status | Promoted → [ADR-0003](../ADRs/ADR-0003-Conversation-Specifications.md) |
| Open question: structure interaction specs vs methodology | Resolved in ADR-0003 (`interaction/` packaging, reference-only binding) |
| Open question: non-AI executability in conformance | Optional check via `validate_conversation_specs.sh` |
| Open question: conversation specs execute methodology | Pilot `edf.bootstrap.v1` demonstrates pattern |

---

## Parent

- [AWI-0002 — Interaction Layer Separation](AWI-0002-Interaction-Layer-Separation.md)

## Related Documents

- [ADR-0003 — Conversation Specifications](../ADRs/ADR-0003-Conversation-Specifications.md)
- [Interaction Layer](../../../interaction/README.md)
- [Bootstrap Playbook](../../AI/Bootstrap_Playbook.md)
