# AI Session Handover Message Template

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Templates](README.md) › AI Handover Message Template

> **Status:** Template  
> **Owner:** Engineering Documentation Framework  
> **Applies To:** AI session handover messages between logical roles or sessions  
> **Authoritative:** No — normative rules: [HND-0001](../Specifications/HND-0001-AI-Session-Handover-Messages.md)

## Purpose

Copy-paste structure for an **AI session handover message** governed by [HND-0001](../Specifications/HND-0001-AI-Session-Handover-Messages.md). Use when transferring work between chats, tools, or logical roles (for example PA → EA).

## Before you send

- Generate a **new** [RFC 4122](https://www.rfc-editor.org/rfc/rfc4122) **Handover UUID** for each distinct handover emission (do not reuse across separate handovers).
- Assign a project-unique **Handover ID** (see HND-0001 §6–7).
- Set **Issued** to today’s date (`YYYY-MM-DD`).
- Set **Authorization** and **EA Execution Mode** so the receiving session cannot misread permissions from body prose alone.

## Field checklist

| Layer | Required content |
|-------|------------------|
| **A** | `{SourceRole} → {TargetRole} HANDOVER — {HandoverSubject}` |
| **B** | Handover UUID, Handover ID, Project, Work Item, Issued, Governance (fixed order) |
| **C** | Heading `1. Session and Execution Control` + seven labeled lines (fixed order) |
| **D** (optional) | Body sections starting at `2.` |

**Chat state** tokens (minimum): `CONTINUE`, `NEW`, `STOP`.  
**EA Execution Mode** tokens (minimum): `PLAN`, `AGENT`.

§1 allows optional blank lines between labeled lines (not extra fields). The example below uses one blank line after **Authorization** before the role-attribution lines, per [HND-0001](../Specifications/HND-0001-AI-Session-Handover-Messages.md) §10.

## Canonical example (replace placeholders)

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

## Optional body (after §1)

```text
2. Current Status

[Summary]

3. Next Actions

1. [Action]
```

## Parent

- [Templates](README.md)

## Related documents

- [HND-0001](../Specifications/HND-0001-AI-Session-Handover-Messages.md)
- [Handover Template](Handover_Template.md) — persisted repository handover documents
