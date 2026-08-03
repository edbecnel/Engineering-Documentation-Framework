# Implementation Bindings

[Home](../README.md) › [Project Index](../PROJECT_INDEX.md) › [Interaction Layer](README.md) › Implementation Bindings

> **Status:** Maintained
> **Owner:** Engineering Documentation Framework
> **Applies To:** Interaction Specification execution channels
> **Last Reviewed:** 2026-08-03
> **Review Frequency:** On Change
> **Authoritative:** Yes (interaction layer only)

## Purpose

This document defines **implementation binding profiles** — how specific interaction technologies execute an [Interaction Specification](specs/README.md) without redefining canonical methodology.

Normative architecture: [ADR-0004 — Interaction Specifications](../docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md).

## Reference Architecture

```text
Engineering Documentation Framework
        ↓
Canonical Engineering Methodology          [docs/, governance, IA — authoritative]
        ↓
Interaction Specifications               [interaction/specs/ — orchestration contracts]
        ↓
Specific Interaction Implementations     [replaceable adapters]
```

| Layer | Authority | Examples |
|-------|-----------|----------|
| EDF | Framework definition | Core, Domain Profiles, packaging |
| Canonical methodology | **Normative** | Charter, guides, ADRs, templates, governance |
| Interaction Specifications | **Orchestration** | Phase graphs, traceability bindings |
| Implementations | **Execution** | Cursor, `adopt-edf.sh`, VS Code, future wizards |

**Bridge artifacts:** `scripts/adopt-edf.sh` and Framework Advisor may span implementation and methodology validation. They should remain thin orchestrators; normative rules stay in `docs/`.

---

## Binding Profiles

An Interaction Specification may declare one or more `implementation_bindings`. Each binding is an adapter that executes the same phase graph.

### Document navigation (methodology layer)

| Attribute | Value |
|-----------|-------|
| **Binding ID** | `document` |
| **Role** | Human reads canonical methodology directly |
| **Not an Interaction Spec** | This is the authoritative path — not optional |
| **Artifacts** | `docs/`, `PROJECT_INDEX.md`, domain READMEs |

### CLI binding

| Attribute | Value |
|-----------|-------|
| **Binding ID** | `cli` |
| **Role** | Shell/PowerShell executes spec `command:` phases |
| **Examples** | `adopt-edf.sh bootstrap`, `analyze_project_structure.sh` |
| **Spec fields** | `command` per phase |
| **Non-AI parity** | Required via `non_ai_equivalent` pointing to guide + CLI |

CLI scripts **implement** Interaction Spec phases. They must not embed normative methodology prose beyond usage messages.

### Conversation binding (AI / IDE)

| Attribute | Value |
|-----------|-------|
| **Binding ID** | `conversation` |
| **Role** | AI assistant executes phases via `prompt_ref` to playbooks |
| **Former name** | Conversation Specification (ADR-0003 pilot term) |
| **Examples** | Cursor + Composer, VS Code + Copilot |
| **Spec fields** | `prompt_ref` per phase; prompts live in `docs/AI/` playbooks |
| **Non-AI parity** | Required — conversation is never the only path |

Conversation binding is one **implementation channel**, not the umbrella spec type.

### GUI binding (future)

| Attribute | Value |
|-----------|-------|
| **Binding ID** | `gui` |
| **Role** | Graphical wizard maps UI steps to Interaction Spec phases |
| **Status** | Not implemented — reference only |
| **Spec fields** | Future: `gui_step_ref` per phase |
| **Non-AI parity** | Wizard must reference same `non_ai_equivalent` as CLI/document paths |

### IDE integration binding

| Attribute | Value |
|-----------|-------|
| **Binding ID** | `ide` |
| **Role** | IDE extension invokes spec phases (may combine CLI + conversation) |
| **Examples** | Cursor rules, VS Code tasks referencing `interaction/specs/` |
| **Spec fields** | `command`, `prompt_ref`, or extension-specific refs |

### Voice and future bindings

Reserved for future interaction technologies. Must conform to Reference, Not Replace and declare non-AI equivalence.

---

## Binding Selection Matrix

| User context | Preferred binding | Fallback |
|--------------|-------------------|----------|
| First-time adopter, no AI | `document` + `cli` | Bootstrap Guide + `adopt-edf.sh` |
| AI-assisted adoption | `conversation` + `cli` | Interaction Spec + playbooks |
| CI/automation | `cli` | Scripts only |
| Non-technical stakeholder (future) | `gui` | Document guide |

---

## Workflow Catalog (Interaction Spec candidates)

| workflow_id | Canonical methodology | CLI | Conversation | GUI |
|-------------|----------------------|-----|--------------|-----|
| `edf.repository.bootstrap` | Bootstrap Guide | `adopt-edf bootstrap` | Bootstrap Playbook | Future |
| `edf.repository.migrate` | Migration Guide | `adopt-edf migrate` | Migration Playbook | Future |
| `edf.repository.validate` | Adopter Conformance Tiers | `adopt-edf validate` | — | Future |
| `edf.repository.analyze` | Framework Advisor doc | `analyze_project_structure.sh` | — | Future |
| `edf.adr.create` | ADR Template, ADR index | — | Future playbook | Future |
| `edf.documentation.review` | Governance Checklist | — | Future | Future |
| `edf.framework.evolve` | EDF self-hosting | `run_self_hosting_validation.sh` | — | Future |

Pilots today: `edf.repository.bootstrap`, `edf.adr.create`.

---

## Parent

- [Interaction Layer](README.md)

## Related Documents

- [ADR-0004 — Interaction Specifications](../docs/Architecture/ADRs/ADR-0004-Interaction-Specifications.md)
- [ADR-0003 — Conversation Specifications](../docs/Architecture/ADRs/ADR-0003-Conversation-Specifications.md)
- [Interaction Specifications index](specs/README.md)
