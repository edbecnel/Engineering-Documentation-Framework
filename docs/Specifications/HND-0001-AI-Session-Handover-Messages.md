# HND-0001: AI Session Handover Messages

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Specifications](README.md) › HND-0001

## Document Metadata

| Field | Value |
|---|---|
| **Document Type** | Architecture Specification |
| **Normative** | Yes |
| **Status** | Accepted |
| **Specification ID** | HND-0001 |
| **Version** | 1.0 |
| **Date** | 2026-10-24 |
| **Owner** | Engineering Documentation Framework |
| **Authoritative** | Yes |
| **Primary Logical Domain** | EPI |
| **Related Logical Domains** | DA, EG |
| **Normative Approval Reference** | [ADR-0014](../Architecture/ADRs/ADR-0014-AI-Session-Handover-Messages.md) |
| **Approved Git Revision** | `f33e01e9134c964efc21c6231771dac811e30d04` |
| **Normative Effective Scope** | EDF framework self-hosting; adoptable EDF Core for projects that declare AI session handover workflows |
| **Normative Effective Date** | 2026-10-24 |

## Purpose

Define adoptable requirements for **AI session handover messages** — interaction-layer artifacts that transfer governed context, execution constraints, and session continuity intent between people, tools, or AI sessions without replacing normative engineering records in `docs/`.

## Scope

### In scope

- Required **header prefix** anatomy: title line, identity and context block, and **§1 Session and Execution Control**
- **Handover UUID** and **Handover ID** identity rules and namespace separation
- Minimum enumerated **chat state** and **EA execution mode** values
- Binding precedence of **Authorization** and **EA Execution Mode** over informal body prose
- Relationship to persisted handover documents and optional PA/EA logical-role workflows

### Out of scope

- Mandatory adoption of a Project Architect / Engineering Agent organizational model for every EDF adopter
- Relay transport schemas, JSON envelopes, or Interaction Specifications (future work)
- Framework Advisor automated validation of handover messages in this tranche
- Requiring a handover message for every AI chat session
- Normative taxonomy for handover body sections beyond numbering from **§2** onward

## Normative Requirements

### Obligation

1. When a project or workflow profile requires an **AI session handover message** for continuity between sessions, tools, or logical roles, the emitting assistant **MUST** produce a single plain-text or Markdown message whose **prefix** conforms to §3–§5 **before** any optional body content numbered **§2** or higher.

2. When no project-declared handover workflow applies, HND-0001 does **not** require handover messages. Projects **MAY** adopt HND-0001 via charter, governance, or workflow profile declaration.

### Message anatomy

3. The handover message prefix **MUST** comprise, in order:

   | Layer | Content |
   |---|---|
   | **A** | Title line (§4) |
   | **B** | Identity and context block — six labeled lines (§5) |
   | **C** | Section **1. Session and Execution Control** — seven labeled lines (§6) |

4. Optional handover body content **MAY** follow layer **C**. When numbered sections are used, body sections **MUST** begin at **2.** (for example `2. Current Status`).

### Title line (layer A)

5. The title line **MUST** use this format:

   ```text
   {SourceRole} → {TargetRole} HANDOVER — {HandoverSubject}
   ```

   where:

   - `{SourceRole}` is the logical role emitting the handover (project-defined label, for example `PA`, `EA`, `PO`);
   - `{TargetRole}` is the logical role intended to receive and act on the handover;
   - `HANDOVER` is the literal token shown;
   - `{HandoverSubject}` is a short workstream label.

### Identity and context block (layer B)

6. Immediately after the title line, the message **MUST** include **exactly six** labeled lines in this order (`Label: value`, one field per line):

   | Order | Label | Requirement |
   |------:|-------|-------------|
   | 1 | `Handover UUID` | [RFC 4122](https://www.rfc-editor.org/rfc/rfc4122) UUID in canonical lowercase hexadecimal with hyphens; **new** UUID for each distinct handover emission |
   | 2 | `Handover ID` | Project-scoped structured identifier unique within the project’s handover-id scheme |
   | 3 | `Project` | Human-readable project name |
   | 4 | `Work Item` | Governed work identifier and short title |
   | 5 | `Issued` | Calendar date `YYYY-MM-DD` (issuance date of this message) |
   | 6 | `Governance` | Declared governance stack or workflow profile (free text) |

7. Projects **SHOULD** use a **Handover ID** pattern such as `{program}-{task}-{phase}-{mode}-{seq}` (example: `NSA-002-T7-1-PLAN-001`). EDF does not mandate a single global Handover ID grammar.

### §1 Session and Execution Control (layer C)

8. After a blank line following layer **B**, the message **MUST** include this section heading **verbatim**:

   ```text
   1. Session and Execution Control
   ```

9. Under that heading, the message **MUST** include **exactly seven** labeled lines in this order:

   | Order | Label | Requirement |
   |------:|-------|-------------|
   | 1 | `PA Chat State` | Session continuity intent for the Project Architect (or source planning role) chat |
   | 2 | `EA Chat State` | Session continuity intent for the Engineering Agent chat |
   | 3 | `EA Execution Mode` | Engineering Agent routing or execution mode for the receiving session |
   | 4 | `Authorization` | Plain-language binding constraints on permitted work |
   | 5 | `Product Owner` | Accountable product role — name, handle, or `TBD` |
   | 6 | `Project Architect` | Declared architecture authority or PA actor label |
   | 7 | `Engineering Agent` | EA actor label |

10. §1 conformance is determined by the **presence, order, and values** of the seven labels in §9, not by the total line count of the section. Blank lines **MAY** appear between labeled lines; the canonical example uses one blank line immediately after **Authorization** before the three role-attribution lines. Blank lines **MUST NOT** be treated as additional fields. Automated validators **MUST** ignore blank lines when verifying §1 label presence and order.

11. When the title line uses `PA → EA HANDOVER`, the §1 field labels in §9 **MUST** be used as written. For other `{SourceRole} → {TargetRole}` pairs, projects **MUST** either use the same §1 labels when their workflow profile maps to PA/EA semantics, or document equivalent field labels in project governance (**role profile extensions**).

### Chat state enumeration

12. Values for `PA Chat State` and `EA Chat State` **MUST** be uppercase ASCII tokens. HND-0001 defines at minimum:

    | Value | Meaning |
    |-------|---------|
    | `CONTINUE` | Prior context remains active; handover extends continuity |
    | `NEW` | Receiving session should treat the handover as bootstrap for a fresh thread |
    | `STOP` | Target session must not proceed autonomously; await human direction |

13. Projects **MAY** define additional chat-state tokens in project governance. Receiving agents that encounter an unrecognized chat-state value **MUST** treat it as `STOP`.

### EA execution mode enumeration

14. `EA Execution Mode` **MUST** be an uppercase ASCII token. HND-0001 defines at minimum:

    | Value | Meaning |
    |-------|---------|
    | `PLAN` | Planning, analysis, architecture, or investigation — no implementation or repository mutation unless **Authorization** explicitly permits |
    | `AGENT` | Implementation-style Engineering Agent work — still bound by **Authorization**, engineering governance, and assurance rules; mode alone does not satisfy gates or authorize publication |

15. **EA Execution Mode** does not grant program-gate satisfaction, implementation authorization, or publication rights without applicable EG, AE, and project rules.

### Authorization binding

16. Receiving agents **MUST** treat **Authorization** and **EA Execution Mode** in §1 as binding execution constraints.

17. When §1 constraints conflict with informal prose in the handover body, §1 **MUST** prevail unless a human explicitly overrides in the new session.

18. Role attribution lines (`Product Owner`, `Project Architect`, `Engineering Agent`) are routing and attribution metadata. They are **not** proof of human attestation; [MVR-0001](MVR-0001-Manual-Verification-Records.md) and other AE rules apply separately when human verification is required.

### Identifier separation

19. **Handover UUID**, **Handover ID**, and specification identifier **HND-0001** **MUST** remain separate namespaces.

20. **Handover UUID** and **Handover ID** **MUST NOT** be conflated with **Record ID** namespaces such as `MVR-NNNN`, `GMR-NNNN`, EGR program-gate filenames, BVG aliases, AAR instance ids, or normative specification ids in `docs/Specifications/`.

### Persisted handover documents

21. When a handover is saved as a governed Markdown document in the repository, the document **SHOULD** embed layers **A–C** verbatim at the top under a `Session handover header (HND-0001)` section per [Handover_Template.md](../Templates/Handover_Template.md).

22. Persisted handover documents **MUST NOT** replace EGR, MVR, GMR, or other canonical governed record types; they summarize transfer state and pointers.

### Receiving sessions

23. When continuing work from a prior handover, the receiving human or assistant **SHOULD** cite the prior **Handover UUID** in the new session bootstrap context.

24. Receiving agents **MUST** read and obey layer **C** before acting on body content.

## Canonical example (non-normative illustration)

```text
PA → EA HANDOVER — NSA-002 T7-1 Architectural Design

Handover UUID: b71a6022-edf7-4ac7-8f86-19df33c80e50
Handover ID: NSA-002-T7-1-PLAN-001
Project: New Science Archives
Work Item: NSA-002 — T7-1 Document Model and Archive CMS
Issued: 2026-10-24
Governance: EDF / Manual ProjectConcord

1. Session and Execution Control

PA Chat State: CONTINUE
EA Chat State: CONTINUE
EA Execution Mode: PLAN
Authorization: Read-only architectural investigation and planning artifact preparation.

Product Owner: Dale Pond
Project Architect: ChatGPT
Engineering Agent: Cursor
```

## Rationale

Session continuity between AI tools and logical roles needs a stable, copy-paste header so humans and assistants agree on identity, governance context, and execution bounds without duplicating full methodology in chat prose. **Handover UUID** supplies a globally unique instance key; **Handover ID** supplies human-scoped traceability within a project.

## Downstream tooling (non-normative)

Optional relay or desktop tooling (for example governed exchange renderers) **may** align rendered handover text to HND-0001. EDF Core does not require a specific product in this tranche.

## Parent

- [Specifications](README.md)

## Related Documents

- [AI Handover Message Template](../Templates/AI_Handover_Message_Template.md)
- [Handover Template](../Templates/Handover_Template.md)
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md) — EPI responsibilities
- [Governance Overview](../Governance/Governance_Overview.md) — optional PA/EA organizational model
- [MVR-0001](MVR-0001-Manual-Verification-Records.md)
- [Repository Workflow](../AI/Repository_Workflow.md)
- [Glossary](../Reference/Glossary.md)
- [ADR-0014](../Architecture/ADRs/ADR-0014-AI-Session-Handover-Messages.md)
- [HND implementation plan](../../tasks/HND-implementation-plan.md)
