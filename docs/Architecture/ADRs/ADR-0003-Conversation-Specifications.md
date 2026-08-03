# ADR-0003-Conversation-Specifications

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0003 Conversation Specifications

| | |
|---|---|
| **Status** | Proposed (terminology refined by [ADR-0004](ADR-0004-Interaction-Specifications.md)) |
| **Date** | 2026-08-03 |
| **Decision Makers** | Ed Becnel |
| **Supersedes** | None |
| **Superseded By** | [ADR-0004](ADR-0004-Interaction-Specifications.md) — umbrella terminology and schema v2 |
| **Related** | [AWI-0002 — Interaction Layer Separation](../Watch_Items/AWI-0002-Interaction-Layer-Separation.md), [AWI-0002 Revisit Assessment](../Watch_Items/AWI-0002-Revisit-Assessment.md), [ADR-0001](ADR-0001-Domain-Profiles.md), [ADR-0004](ADR-0004-Interaction-Specifications.md) |

---

# Context

The repository adoption initiative established document-centric bootstrap and migration guides, CLI orchestration (`adopt-edf`), and AI playbooks with embedded prompt templates.

[AWI-0002](../Watch_Items/AWI-0002-Interaction-Layer-Separation.md) identified that EDF must distinguish **canonical engineering methodology** (authoritative, in `docs/`) from **optional interaction layers** (guides, CLI, AI conversation). The [AWI-0002 Revisit Assessment](../Watch_Items/AWI-0002-Revisit-Assessment.md) found:

- Playbooks partially duplicate methodology-adjacent rules.
- Prompt templates are not versioned as first-class interaction contracts.
- Non-AI parity exists in practice but is not machine-verifiable.

This ADR formalizes **Conversation Specifications** as an optional interaction-layer artifact type without changing EDF Core methodology.

> **Note:** [ADR-0004](ADR-0004-Interaction-Specifications.md) refines this pilot with the umbrella term **Interaction Specifications**, schema v2 (`authoritative_sources`, `workflow_id`), and the foundational **Reference, Not Replace** principle. v1 decisions on optional conformance and `interaction/specs/` placement remain valid.

---

# Decision

EDF shall introduce **Conversation Specifications** as an optional, versioned interaction layer that **executes** canonical methodology — it does not replace or redefine it.

## Core rules

1. **Methodology unchanged** — Charter, specifications, ADRs, governance, and domain structure remain authoritative in `docs/`.
2. **Reference, not replace** — Every Conversation Specification declares `executes_methodology` paths to canonical documents and/or scripts.
3. **Non-AI equivalence required** — Every spec declares `non_ai_equivalent` pointing to a documented human/CLI path.
4. **Optional for conformance** — No adopter conformance tier may require AI or a Conversation Specification.
5. **Independent versioning** — Specs use `conversation_spec_id` with semver (for example `edf.bootstrap.v1`).

## Packaging and placement

Conversation Specifications live under **`interaction/specs/`** at the repository root — outside `docs/` Core domains, analogous to `scripts/` for operational tooling.

Supporting documentation: [interaction/README.md](../../../interaction/README.md).

## Schema (v1)

Required fields:

| Field | Purpose |
|-------|---------|
| `conversation_spec_id` | Stable identifier with version suffix |
| `display_name` | Human-readable name |
| `spec_version` | Semver of this spec file |
| `executes_methodology` | List of canonical doc/script paths this spec orchestrates |
| `non_ai_equivalent` | Primary human/CLI path without AI |
| `inputs` | Named inputs (for example `project_root`, `profile`) |
| `phases` | Ordered steps with `id`, optional `human_gate`, `methodology_ref`, `command`, `prompt_ref` |
| `outputs` | Expected artifacts produced |

Optional fields:

| Field | Purpose |
|-------|---------|
| `prompt_ref` | Link to playbook section (does not embed prompt text in spec) |
| `validation_gates` | References to conformance tier or gate IDs |
| `status` | `pilot`, `maintained`, `deprecated` |

Prompt text remains in [AI playbooks](../../AI/README.md); specs reference playbook sections to avoid dual maintenance of prose.

## Relationship to existing artifacts

| Artifact | Role |
|----------|------|
| Bootstrap Guide, Migration Guide | Canonical methodology for adoption |
| `adopt-edf.sh` | CLI interaction layer |
| AI Playbooks | Conversational guidance and prompt templates |
| Conversation Specification | Machine-readable contract binding phases to methodology + CLI + playbook refs |

## Validation

Optional validation: `scripts/validate_conversation_specs.sh` checks schema completeness and `non_ai_equivalent` presence. Not part of Framework Advisor scoring unless explicitly enabled.

---

# Alternatives Considered

### Embed prompts in YAML specs only

- **Advantages:** Single file for AI execution.
- **Disadvantages:** Duplicates playbook prose; harder for humans to read; methodology drift risk.
- **Reason not selected:** Prompts stay in playbooks; specs reference them.

### Place specs under `docs/AI/`

- **Advantages:** Co-located with AI handbook.
- **Disadvantages:** Blurs interaction layer with Core methodology domain.
- **Reason not selected:** `interaction/` root packaging per AWI-0002 separation.

### Require Conversation Specifications for Governed tier

- **Advantages:** Strong AI adoption discipline.
- **Disadvantages:** Violates AWI-0002 non-prerequisite principle; excludes non-AI teams.
- **Reason not selected:** Specs remain optional.

---

# Consequences

## Positive

- Clear boundary between methodology and conversational execution.
- Reduced playbook drift via traceable `executes_methodology` bindings.
- Machine-verifiable non-AI parity declaration.
- Portable interaction contracts across AI tools.

## Negative

- Additional artifact type to maintain.
- Pilot specs may lag playbook updates until process matures.

## Risks

- **Methodology fragmentation** — Mitigated by reference-only rule and ADR review for spec changes.
- **Over-engineering** — Mitigated by pilot status, optional validation, no tier requirement.

---

# Implementation Notes

1. Pilot: [edf.bootstrap.v1.yaml](../../../interaction/specs/edf.bootstrap.v1.yaml)
2. Optional validator: [validate_conversation_specs.sh](../../../scripts/validate_conversation_specs.sh)
3. Conformance: optional check in [Adopter Conformance Tiers](../../Development/Adopter_Conformance_Tiers.md)
4. Playbooks: add `Conversation Specification` cross-links; reduce duplicated phase definitions over time

---

# Validation

- `validate_conversation_specs.sh` passes on all specs in `interaction/specs/`
- Pilot spec `non_ai_equivalent` resolves to Bootstrap Guide
- Adopter tiers remain achievable without any Conversation Specification

---

# References

- [interaction/README.md](../../../interaction/README.md)
- [Bootstrap Guide](../../Development/Bootstrap_Guide.md)
- [Bootstrap Playbook](../../AI/Bootstrap_Playbook.md)
- [Documentation Information Architecture](../Documentation_Information_Architecture.md)
