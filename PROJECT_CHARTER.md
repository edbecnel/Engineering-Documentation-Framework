# Project Charter

> **Template** — Copy this document when starting a new software project. Replace all `_[bracketed placeholders]_` with project-specific content. Remove instructional callouts once complete.

---

## Document metadata

| Field | Value |
|-------|-------|
| **Project name** | _[Official project name]_ |
| **Charter version** | _[1.0]_ |
| **Effective date** | _[YYYY-MM-DD]_ |
| **Last reviewed** | _[YYYY-MM-DD]_ |
| **Author** | _[Name]_ |
| **Approver** | _[Sponsor / executive stakeholder]_ |

---

## 1. Executive summary

_[Two to four sentences describing what this project is, who it serves, and the primary outcome it delivers. Write for someone who has sixty seconds.]_

---

## 2. Problem statement

### Background

_[What situation or pain point motivates this project? Include relevant context about users, market, or internal operations.]_

### Problem

_[State the specific problem in clear, measurable terms where possible.]_

### Impact of not solving

_[What happens if this project does not proceed or fails?]_

---

## 3. Vision and objectives

### Vision

_[The desired end state — what the world looks like when this project succeeds.]_

### Objectives

| # | Objective | Success indicator |
|---|-----------|-------------------|
| 1 | _[Objective]_ | _[How you will know it is achieved]_ |
| 2 | _[Objective]_ | _[Indicator]_ |
| 3 | _[Objective]_ | _[Indicator]_ |

### Non-goals

Explicitly list what this project will **not** do. This prevents scope creep.

- _[Non-goal 1]_
- _[Non-goal 2]_
- _[Non-goal 3]_

---

## 4. Scope

### In scope

- _[Capability or deliverable 1]_
- _[Capability or deliverable 2]_
- _[Capability or deliverable 3]_

### Out of scope

- _[Excluded item 1]_
- _[Excluded item 2]_

### Assumptions

- _[Assumption about technology, resources, or dependencies]_
- _[Assumption about timeline or external teams]_

### Constraints

- _[Budget, regulatory, technical, or organizational constraint]_
- _[Constraint]_

---

## 5. Stakeholders

| Role | Name / team | Interest | Influence |
|------|-------------|----------|-----------|
| Executive sponsor | _[Name]_ | _[What they care about]_ | High |
| Product owner | _[Name]_ | _[Interest]_ | High |
| Engineering lead | _[Name]_ | _[Interest]_ | High |
| End users | _[Segment]_ | _[Interest]_ | Medium |
| _[Other stakeholder]_ | _[Name]_ | _[Interest]_ | _[Low/Medium/High]_ |

### RACI (optional)

| Activity | Responsible | Accountable | Consulted | Informed |
|----------|-------------|-------------|-----------|----------|
| Requirements | _[Role]_ | _[Role]_ | _[Role]_ | _[Role]_ |
| Architecture | _[Role]_ | _[Role]_ | _[Role]_ | _[Role]_ |
| Delivery | _[Role]_ | _[Role]_ | _[Role]_ | _[Role]_ |
| Operations | _[Role]_ | _[Role]_ | _[Role]_ | _[Role]_ |

---

## 6. Success criteria

The project is considered successful when:

1. _[Measurable criterion — e.g., "API p99 latency under 200ms under expected load"]_
2. _[Measurable criterion — e.g., "95% user task completion in usability testing"]_
3. _[Measurable criterion — e.g., "Zero critical security findings at launch"]_
4. _[Adoption or business metric]_

---

## 7. High-level requirements

Link to detailed specifications in `docs/Specifications/`. Summarize the most critical requirements here.

| ID | Requirement | Priority | Source |
|----|-------------|----------|--------|
| REQ-001 | _[Requirement summary]_ | Must | _[Stakeholder / regulation]_ |
| REQ-002 | _[Requirement summary]_ | Should | _[Source]_ |
| REQ-003 | _[Requirement summary]_ | Could | _[Source]_ |

---

## 8. Technical approach (summary)

_[Brief description of the proposed solution architecture. Detailed design belongs in `docs/Architecture/`. Link to initial ADRs in `ARCHITECTURE_DECISIONS.md`.]_

### Key technology choices

| Area | Choice | Rationale (link to ADR) |
|------|--------|-------------------------|
| Language / runtime | _[e.g., TypeScript / Node.js]_ | _[ADR-001]_ |
| Data store | _[e.g., PostgreSQL]_ | _[ADR-002]_ |
| Hosting | _[e.g., AWS ECS]_ | _[ADR-003]_ |

---

## 9. Timeline and milestones

| Milestone | Target date | Deliverables | Status |
|-----------|-------------|--------------|--------|
| Charter approved | _[Date]_ | Signed charter | _[Not started / Done]_ |
| Architecture baseline | _[Date]_ | ADRs, architecture overview | _[Status]_ |
| MVP | _[Date]_ | _[Core features]_ | _[Status]_ |
| Beta | _[Date]_ | _[Features + docs]_ | _[Status]_ |
| General availability | _[Date]_ | _[Production release]_ | _[Status]_ |

---

## 10. Resources

### Team

| Role | Allocation | Name |
|------|------------|------|
| _[Role]_ | _[% or FTE]_ | _[Name]_ |
| _[Role]_ | _[% or FTE]_ | _[Name]_ |

### Budget (if applicable)

_[Summary of budget categories and limits.]_

### Dependencies

- _[External team, vendor, or system dependency]_
- _[Dependency]_

---

## 11. Risks

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| _[Risk description]_ | Low / Med / High | Low / Med / High | _[Mitigation plan]_ |
| _[Risk description]_ | _[L/M/H]_ | _[L/M/H]_ | _[Plan]_ |

---

## 12. Communication plan

| Audience | Channel | Frequency | Owner |
|----------|---------|-----------|-------|
| Core team | _[Slack / standup]_ | Daily | _[Name]_ |
| Stakeholders | _[Email / demo]_ | _[Bi-weekly]_ | _[Name]_ |
| Users | _[Release notes / blog]_ | Per release | _[Name]_ |

---

## 13. Governance

### Decision authority

- **Scope changes** — Require approval from _[product owner + sponsor]_.
- **Architecture changes** — Require ADR and review by _[tech lead / architecture board]_.
- **Release approval** — _[Who signs off on production releases]_.

### Change control

_[Describe how charter amendments are proposed, reviewed, and versioned. Major scope changes increment charter version and update PROJECT_INDEX.]_

---

## 14. Related documents

- [PROJECT_INDEX.md](./PROJECT_INDEX.md) — Documentation navigation
- [ARCHITECTURE_DECISIONS.md](./ARCHITECTURE_DECISIONS.md) — Technical decision log
- [docs/Specifications/](./docs/Specifications/) — Detailed requirements
- [docs/Architecture/](./docs/Architecture/) — System design
- [AI_WORKFLOW.md](./AI_WORKFLOW.md) — AI-assisted development practices

---

## Approval

| Role | Name | Signature / date |
|------|------|------------------|
| Project sponsor | _[Name]_ | _[Date]_ |
| Product owner | _[Name]_ | _[Date]_ |
| Engineering lead | _[Name]_ | _[Date]_ |
