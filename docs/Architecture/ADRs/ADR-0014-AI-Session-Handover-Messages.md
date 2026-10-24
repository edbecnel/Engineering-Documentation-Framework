# ADR-0014: AI Session Handover Messages

[Home](../../../README.md) › [Project Index](../../../PROJECT_INDEX.md) › [Architecture](../README.md) › [Architecture Decision Records](README.md) › ADR-0014 AI Session Handover Messages

| | |
|---|---|
| **Status** | Accepted |
| **Date** | 2026-10-24 |
| **Decision Makers** | Project Owner |
| **Related** | [HND-0001](../../Specifications/HND-0001-AI-Session-Handover-Messages.md), [ADR-0012](ADR-0012-Logical-Architectural-Domains.md), [Documentation Information Architecture](../Documentation_Information_Architecture.md), [ADR Approval Workflow](ADR_Approval_Workflow.md) |

---

# Context

[Documentation Information Architecture](../Documentation_Information_Architecture.md) assigns **EPI** responsibility for interaction and handover contracts and session continuity. EDF had no normative requirements for **AI session handover messages** — ephemeral interaction artifacts used between chats, tools, or logical roles (for example PA → EA).

[HND-0001](../../Specifications/HND-0001-AI-Session-Handover-Messages.md) v1.0 was introduced to define a comprehensive header prefix (title line, identity block including **Handover UUID**, and **§1 Session and Execution Control**) without mandating a Project Architect / Engineering Agent model for all adopters.

---

# Decision

## 1. Adopt HND-0001 as EDF Core normative specification

Projects that declare an AI session handover workflow **MUST** conform to [HND-0001](../../Specifications/HND-0001-AI-Session-Handover-Messages.md) for message headers.

HND-0001 does **not** require every EDF adopter to use PA/EA handovers; it defines the header contract when handover messages are used.

## 2. Templates and handbook

[AI_Handover_Message_Template.md](../../Templates/AI_Handover_Message_Template.md) and the HND-0001 session header section in [Handover_Template.md](../../Templates/Handover_Template.md) are the canonical EDF copy-paste and persistence companions.

## Normative specification approval

| Element | Value |
|---------|--------|
| Specification ID | HND-0001 |
| Specification Version | 1.0 |
| Canonical path | `docs/Specifications/HND-0001-AI-Session-Handover-Messages.md` |
| Approved Git Revision | `f33e01e9134c964efc21c6231771dac811e30d04` |
| Approving authority | Project Owner |
| Approval decision | Accept HND-0001 v1.0 normative requirements at the Approved Git Revision for EDF framework self-hosting and adopter reference |
| Approval date | 2026-10-24 |
| Effective scope | EDF framework self-hosting; adoptable EDF Core requirements for projects that declare AI session handover workflows |
| Effective date | 2026-10-24 |
| Limitations | Does not require handover messages for every AI session; does not mandate PA/EA organizational models; Framework Advisor validation deferred per [Analyzer Compliance](../../Governance/Analyzer_Compliance.md) |

---

# Consequences

## Positive

- Traceable session handovers via **Handover UUID**
- Clear execution constraints in §1 separate from informal body prose
- EPI logical domain has a normative handover contract

## Negative

- Authors must learn header field order and minimum enums when adopting the workflow

---

# Related Documents

- [HND-0001](../../Specifications/HND-0001-AI-Session-Handover-Messages.md)
- [HND implementation plan](../../../tasks/HND-implementation-plan.md)
