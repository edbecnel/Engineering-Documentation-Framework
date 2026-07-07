# AI Development

## Purpose

This document establishes practical conventions for using AI tools during day-to-day software development. It complements [AI_WORKFLOW.md](../../AI_WORKFLOW.md) with team-specific rules, prompt patterns, and quality expectations for AI-assisted work.

## When to use it

- **Before first AI-assisted commit** — Read this alongside the AI Workflow document.
- **Code review** — Reviewers verify AI-generated changes meet these standards.
- **Onboarding** — New developers learn approved tools and data policies.
- **Policy updates** — When the organization changes AI vendor or privacy rules.
- **Prompt engineering** — Reference shared patterns instead of reinventing prompts.

## Suggested contents

---

## Approved tools

| Tool | Use case | Approval status |
|------|----------|-----------------|
| Cursor Composer | Multi-file implementation, refactors | _[Approved / Restricted]_ |
| ChatGPT | Research, specs, prose | _[Approved tier]_ |
| VS Code + Continue | Inline completion | _[Approved]_ |
| Ollama (local) | Offline / sensitive drafts | _[Approved models: list]_ |
| _[Cloud provider]_ | _[CI automation]_ | _[Requires security review]_ |

For role definitions and SDLC mapping, see [AI_WORKFLOW.md](../../AI_WORKFLOW.md).

---

## Data and privacy rules

### May send to cloud AI

- _[Public documentation, open-source dependencies, synthetic examples]_
- _[Anonymized code patterns without business logic]_

### Must not send to cloud AI

- Production credentials, API keys, certificates.
- Customer PII, PHI, PCI, or unreleased financial data.
- Unreleased proprietary algorithms or trade secrets (unless enterprise agreement covers it).

### When in doubt

- Use **local AI (Ollama)** or **redact** identifiers before prompting.
- Consult security team: _[contact]_.

---

## Providing context to AI

Effective sessions include structured context. Prefer referencing files over pasting large blobs.

### Context stack (recommended order)

1. [PROJECT_INDEX.md](../../PROJECT_INDEX.md) — Where to find things
2. Relevant specification or ticket
3. Applicable [ADR](../../ARCHITECTURE_DECISIONS.md)
4. [04_Coding_Standards.md](./04_Coding_Standards.md) — Style and patterns
5. Specific source files in scope (`@` references in Cursor)

### Prompt template for implementation tasks

```text
Task: [One sentence goal]

Context:
- Spec: [link or path]
- ADRs: [ADR-NNN if applicable]
- Constraints: [performance, security, backwards compatibility]

Requirements:
- [ ] [Acceptance criterion 1]
- [ ] [Acceptance criterion 2]

Deliverables:
- Code changes
- Tests per 05_Testing.md
- Doc updates if behavior changes
```

---

## Quality expectations for AI-generated code

AI output is **draft** quality until a human verifies it.

### Author checklist (before opening PR)

- [ ] Code compiles / runs locally
- [ ] Tests added or updated; all pass
- [ ] No secrets, debug logging, or commented-out dead code
- [ ] Follows [04_Coding_Standards.md](./04_Coding_Standards.md)
- [ ] Edge cases considered (null, empty, errors, permissions)
- [ ] Dependencies are necessary and approved
- [ ] Documentation updated if public behavior changed

### Reviewer checklist

- [ ] Logic matches requirements — not just plausible-looking code
- [ ] Security: input validation, authz, injection risks
- [ ] Performance: N+1 queries, unbounded loops, memory leaks
- [ ] Consistency with existing patterns (AI often invents parallel patterns)
- [ ] Tests assert behavior, not implementation details only

---

## Common pitfalls

| Pitfall | Mitigation |
|---------|------------|
| Hallucinated APIs | Verify against official docs and existing codebase |
| Outdated patterns | Pin context to current ADRs and handbook |
| Over-engineering | Scope prompts narrowly; reject unnecessary abstractions |
| Missing error handling | Explicitly request error paths in prompt |
| License contamination | Do not accept large pasted blocks from unknown sources without review |
| Doc drift | Update specs and API docs in same PR as code |

---

## AI in specific activities

### Writing tests

- AI can scaffold test cases from acceptance criteria.
- Human must add boundary cases and verify assertions match business rules.
- See [05_Testing.md](./05_Testing.md).

### Refactoring

- Provide explicit scope: files, goal, non-goals.
- Require no behavior change unless specified; run full test suite.
- Large refactors may need an ADR if architectural.

### Documentation

- AI drafts; human verifies accuracy against code.
- Match tone of existing [User Guides](../User_Guides/) or API docs.

### Debugging

- Paste error messages and relevant stack traces — redact secrets.
- Ask for hypotheses ranked by likelihood; verify with logs and debugger.

---

## Logging AI usage (optional)

Teams may track AI assistance for learning and compliance:

| Field | Example |
|-------|---------|
| PR label | `ai-assisted` |
| Description note | "Composer implemented CRUD; human adjusted authz" |
| Model used | _[gpt-4o, claude-3.5, local llama3]_ |

---

## Escalation

| Situation | Action |
|-----------|--------|
| AI suggests unsafe security pattern | Stop; consult security / senior engineer |
| Unclear requirements | Clarify with product owner before more AI iteration |
| Repeated AI failures on same task | Pair with human; problem may need design change |

---

## Related documents

- [AI_WORKFLOW.md](../../AI_WORKFLOW.md) — Tool roles across the SDLC
- [03_Git_Workflow.md](./03_Git_Workflow.md) — Branching and PR process
- [04_Coding_Standards.md](./04_Coding_Standards.md) — Code conventions
- [05_Testing.md](./05_Testing.md) — Test requirements

---

## Maintenance

| Field | Value |
|-------|-------|
| **Document owner** | _[Engineering lead]_ |
| **Last reviewed** | _[YYYY-MM-DD]_ |
| **Review cadence** | _[Quarterly or when AI policy changes]_ |
