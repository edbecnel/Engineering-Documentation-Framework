# [Project or Workstream] Handover

## Session handover header (HND-0001)

**Required when this document records a chat-originated AI session handover**

When this file persists content from an [AI session handover message](../Specifications/HND-0001-AI-Session-Handover-Messages.md), embed layers **A–C** verbatim below (title line through §1 Session and Execution Control). Use [AI_Handover_Message_Template.md](AI_Handover_Message_Template.md) as the source structure. Generate a new **Handover UUID** only when creating a **new** handover emission; retain the same UUID when this document is an archival copy of an existing message.

```text
{SourceRole} → {TargetRole} HANDOVER — {HandoverSubject}

Handover UUID: [uuid]
Handover ID: [project-handover-id]
Project: [name]
Work Item: [id — title]
Issued: YYYY-MM-DD
Governance: [stack]

1. Session and Execution Control

PA Chat State: [CONTINUE|NEW|STOP]
EA Chat State: [CONTINUE|NEW|STOP]
EA Execution Mode: [PLAN|AGENT]
Authorization: [binding constraints]

Product Owner: [name or TBD]
Project Architect: [label]
Engineering Agent: [label]
```

## Purpose

**Required**

Explain what work is being transferred and why.

## Current Objective

**Required**

[Immediate goal]

## Current Status

**Required**

### Completed

- [Completed item]

### In Progress

- [Work in progress]

### Not Started

- [Pending item]

## Important Decisions

**Required**

- [Decision and rationale]

## Current Architecture or Approach

**Optional**

[Summary]

## Files and Documents

**Required**

| Path | Purpose | Status |
|---|---|---|
| [Path] | [Purpose] | [Status] |

## Known Problems

**Required**

- [Problem]

## Next Actions

**Required**

1. [Action]
2. [Action]

## Constraints and Warnings

**Required**

- [Constraint or warning]

## Verification

**Optional**

Describe tests, checks, or evidence confirming the current state.

## Recommended Starting Context

**Required**

List the documents or files the receiving person or AI assistant should read first.

1. `PROJECT_INDEX.md`
2. [Document]

## Suggested Commit or Branch

**Optional**

- Branch:
- Commit message:

## Handover Date

YYYY-MM-DD
