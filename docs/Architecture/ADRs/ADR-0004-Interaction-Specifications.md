# ADR-0004-Interaction-Specifications

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0004 Interaction Specifications

| | |
|---|---|
| **Status** | Proposed |
| **Date** | 2026-08-03 |
| **Decision Makers** | Ed Becnel |
| **Supersedes** | Terminology and schema scope of [ADR-0003](ADR-0003-Conversation-Specifications.md) |
| **Superseded By** | None |
| **Related** | [AWI-0002](../Watch_Items/AWI-0002-Interaction-Layer-Separation.md), [ADR-0003](ADR-0003-Conversation-Specifications.md), [Implementation Bindings](../../../interaction/Implementation_Bindings.md) |

---

# Context

[ADR-0003](ADR-0003-Conversation-Specifications.md) piloted optional interaction-layer contracts under the name **Conversation Specifications**. Follow-up architectural review found:

- AWI-0002 defines multiple interaction models (CLI, GUI, AI conversation); "Conversation" is too narrow as the umbrella term.
- The pilot [edf.bootstrap.v1.yaml](../../../interaction/specs/edf.bootstrap.v1.yaml) already includes CLI `command:` phases — not purely conversational.
- **Reference, not replace** should be a foundational layer principle, not only a schema field.
- Traceability needs explicit **authoritative_sources** (read context) distinct from **executes_methodology** (operational bindings).
- The interaction layer must be **workflow-independent** — adoption is the first pilot wave, not the architectural boundary.

This ADR refines ADR-0003 without changing EDF Core methodology or the adoption roadmap.

---

# Decision

EDF shall use **Interaction Specifications** as the umbrella artifact type for optional, versioned interaction-layer contracts.

**Conversation Specifications** remain valid as terminology for specs whose primary implementation binding is AI/IDE conversational execution (`prompt_ref` phases).

## Foundational principle — Reference, Not Replace

Interaction-layer artifacts **SHALL**:

1. **Execute** canonical engineering methodology — orchestrate phases, not invent new normative rules.
2. **Reference** authoritative paths in `docs/` and operational paths in `scripts/`.
3. **Not redefine** methodology — no normative rules in interaction specs without traceability to methodology.
4. **Not duplicate** methodology prose — bindings and phase graphs only; prose stays in `docs/`.

The engineering methodology in `docs/` remains the **sole authoritative source** of engineering knowledge.

## Reference architecture (dependency direction)

```text
Engineering Documentation Framework
        ↓
Canonical Engineering Methodology     [normative — docs/, governance, IA]
        ↓
Interaction Specifications          [optional — interaction/specs/]
        ↓
Specific Interaction Implementations [pluggable — AI, CLI, GUI, IDE, voice, future]
```

See [Implementation Bindings](../../../interaction/Implementation_Bindings.md) for binding profiles.

**Bridge artifacts:** Some tools (for example `adopt-edf.sh`, Framework Advisor) span implementation and methodology validation. They should trend toward thin orchestration over time; normative rules remain in guides.

## Workflow-independent scope

Interaction Specifications are **workflow-typed, not workflow-limited**.

- Each spec declares `workflow_id` (for example `edf.repository.bootstrap`, `edf.adr.create`).
- Adoption workflows are the first pilots; future workflows include ADR creation, documentation review, architecture review, and framework evolution.
- No conformance tier may require an Interaction Specification or any specific interaction channel.

## Schema v2

Required fields (v2 specs):

| Field | Purpose |
|-------|---------|
| `interaction_spec_id` | Stable identifier with version suffix |
| `workflow_id` | Workflow type (dot-separated, for example `edf.adr.create`) |
| `display_name` | Human-readable name |
| `spec_version` | Semver of this spec file |
| `schema_version` | `"2.0"` for v2 specs |
| `authoritative_sources` | Canonical docs the workflow **consumes** (read-only context) |
| `executes_methodology` | Scripts and guides the workflow **runs** |
| `non_ai_equivalent` | Primary human/CLI path without AI or interaction spec |
| `inputs` | Named inputs |
| `phases` | Ordered steps with bindings |
| `outputs` | Expected artifacts |

Optional fields:

| Field | Purpose |
|-------|---------|
| `conversation_spec_id` | **Deprecated alias** of `interaction_spec_id` for v1 compatibility |
| `implementation_bindings` | List: `cli`, `conversation`, `gui` (see Implementation Bindings) |
| `prompt_ref` | Per-phase link to AI playbook (conversation binding) |
| `command` | Per-phase CLI invocation |
| `validation_gates` | Conformance references |
| `status` | `pilot`, `maintained`, `deprecated` |

### Traceability semantics

| Field | Role |
|-------|------|
| `authoritative_sources` | What canonical knowledge must be **read** before/during execution |
| `executes_methodology` | What operational artifacts are **invoked** |
| `non_ai_equivalent` | How to complete the workflow **without** this interaction channel |

## Packaging

- Specs: `interaction/specs/`
- Bindings reference: [interaction/Implementation_Bindings.md](../../../interaction/Implementation_Bindings.md)
- Validator: `scripts/validate_interaction_specs.sh` (alias: `validate_conversation_specs.sh`)

## Relationship to ADR-0003

ADR-0003 introduced the pilot model. ADR-0004 **refines** naming and schema; ADR-0003 decisions on optional conformance, `interaction/specs/` placement, and reference-not-replace intent remain valid. v1 pilot files may retain `conversation_spec_id` until migrated.

---

# Alternatives Considered

### Keep "Conversation Specifications" as umbrella term

- **Advantages:** No terminology change.
- **Disadvantages:** Misrepresents CLI/GUI scope; conflicts with AWI-0002 breadth.
- **Reason not selected:** Interaction Specifications matches `interaction/` directory and AWI-0002.

### "Interactive Workflow Specifications"

- **Advantages:** Emphasizes process.
- **Disadvantages:** Redundant wording; less aligned with AWI-0002 "interaction models."
- **Reason not selected:** Interaction Specifications is preferred.

### Embed methodology rules in YAML specs

- **Advantages:** Single file for AI execution.
- **Disadvantages:** Violates Reference, Not Replace; creates shadow methodology.
- **Reason not selected:** Bindings only; prose in `docs/`.

---

# Consequences

## Positive

- Multi-modal interaction layer (AI, CLI, GUI, future) under one contract type.
- Normative Reference, Not Replace principle at layer level.
- Explicit traceability via `authoritative_sources`.
- Workflow-independent architecture proven beyond adoption.

## Negative

- Terminology transition from Conversation to Interaction Specifications.
- v1/v2 schema coexistence during migration.

## Risks

- **Methodology fragmentation** — Mitigated by authoritative_sources validation and ADR review.
- **Over-specification** — Mitigated by pilot status and optional conformance.

---

# Implementation Notes

1. Pilot specs: [edf.bootstrap.v1.yaml](../../../interaction/specs/edf.bootstrap.v1.yaml), [edf.adr.create.v1.yaml](../../../interaction/specs/edf.adr.create.v1.yaml)
2. [Implementation_Bindings.md](../../../interaction/Implementation_Bindings.md)
3. Update [interaction/README.md](../../../interaction/README.md) and indexes
4. v1 `conversation_spec_id` accepted by validator as alias

---

# Validation

- `validate_interaction_specs.sh` passes on all specs in `interaction/specs/`
- Each spec has resolvable `non_ai_equivalent` and `authoritative_sources`
- Adopter tiers achievable without any Interaction Specification

---

# References

- [ADR-0003 — Conversation Specifications](ADR-0003-Conversation-Specifications.md)
- [AWI-0002 — Interaction Layer Separation](../Watch_Items/AWI-0002-Interaction-Layer-Separation.md)
- [interaction/README.md](../../../interaction/README.md)
- [Documentation Information Architecture](../Documentation_Information_Architecture.md)
