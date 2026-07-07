# Coding Standards

## Purpose

This document defines conventions for writing readable, maintainable, and consistent code across the project. Standards reduce cognitive load in reviews, help AI tools generate compatible code, and make onboarding faster.

## When to use it

- **Writing new code** — Follow conventions from the first commit.
- **Code review** — Use as an objective checklist.
- **AI-assisted development** — Include in AI context so generated code matches team style.
- **Adding a language or service** — Extend this document before widespread adoption.
- **Refactoring** — Opportunistically align legacy code when touching an area.

## Suggested contents

Customize all sections for your stack. Remove languages and patterns that do not apply.

---

## General principles

1. **Clarity over cleverness** — Optimize for the next reader.
2. **Small, focused units** — Functions and modules should do one thing well.
3. **Explicit over implicit** — Obvious behavior beats magic.
4. **Fail fast** — Validate inputs; surface errors with context.
5. **Consistency** — Match surrounding code unless improving a documented pattern.
6. **Security by default** — Never trust external input; least privilege.

---

## Language-specific standards

### _[Language 1 — e.g., TypeScript]_

#### Style and formatting

- Formatter: _[Prettier / rustfmt / black — config file location]_
- Linter: _[ESLint / clippy / pylint — config file location]_
- Run before commit: `_[command]_`

#### Naming

| Element | Convention | Example |
|---------|------------|---------|
| Variables | camelCase | `userAccount` |
| Constants | UPPER_SNAKE or camelCase | `MAX_RETRIES` |
| Types / classes | PascalCase | `PaymentService` |
| Files | kebab-case or match language norm | `payment-service.ts` |

#### Patterns

- Prefer _[composition / dependency injection / functional style]_.
- Avoid _[anti-patterns specific to codebase]_.
- Error handling: _[exceptions / Result types / error codes]_.

### _[Language 2 — if applicable]_

_[Repeat structure]_

---

## Architecture and structure

### Project layout

```text
src/
  [Describe domain-oriented or layer-oriented structure]
tests/
  [Mirror src/ or co-locate — state preference]
```

### Module boundaries

- _[Rule: e.g., domain layer must not import from API handlers]_
- _[Rule: shared utilities live in `lib/` or `common/`]_

### Dependencies

- Add dependencies deliberately; document rationale for new libraries.
- Prefer standard library and existing project utilities.
- Keep versions aligned with [01_Development_Environment.md](./01_Development_Environment.md).

---

## API and interface design

- Public APIs must be typed and documented.
- Use consistent naming for REST resources: _[plural nouns, kebab URLs, etc.]_
- Version breaking API changes; update `docs/API/`.
- Deprecation policy: _[e.g., support N-1 version for 90 days]_.

---

## Error handling

- Return meaningful error messages for operators; sanitize messages for end users.
- Log errors with correlation IDs.
- Do not swallow exceptions without logging.
- Use structured logging: _[JSON / key-value format]_.

---

## Security standards

| Area | Requirement |
|------|-------------|
| Authentication | _[JWT / session / OAuth — reference ADR]_ |
| Authorization | Check permissions at service boundary |
| Input validation | Validate at system edges |
| Secrets | Environment variables or secret manager only |
| SQL | Parameterized queries only |
| Dependencies | Regular audit: `_[command]_` |

---

## Performance guidelines

- Measure before optimizing; document performance requirements in specs.
- Avoid premature abstraction that blocks optimization.
- Database: document N+1 expectations; use pagination for list endpoints.
- Caching: document invalidation strategy in `docs/Architecture/`.

---

## Comments and documentation

### When to comment

- **Do:** Explain *why*, document non-obvious invariants, reference tickets/ADRs.
- **Do not:** Restate what the code obviously does.

### Docstrings / JSDoc

Required for:

- Public APIs and exported functions
- Complex algorithms
- Non-obvious parameters and return values

---

## AI-generated code

Code produced with AI assistance must meet the same standards. Authors are responsible for verifying:

- Naming matches conventions in this document.
- No invented dependencies or APIs.
- Tests included per [05_Testing.md](./05_Testing.md).

See [02_AI_Development.md](./02_AI_Development.md).

---

## Enforcement

| Mechanism | Scope |
|-----------|-------|
| CI lint job | All PRs |
| Format check | All PRs |
| Pre-commit hooks | _[Optional — list if used]_ |
| Code review | Human judgment for architecture and clarity |

---

## Exceptions

To deviate from a standard:

1. Document reason in PR description.
2. For recurring patterns, propose handbook or ADR update.
3. Use `// eslint-disable` (or equivalent) sparingly with comment explaining why.

---

## Related documents

- [03_Git_Workflow.md](./03_Git_Workflow.md) — How changes land in the repo
- [05_Testing.md](./05_Testing.md) — Quality bar for tests
- [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md) — Architectural constraints
- [docs/API/](../API/) — API documentation standards

---

## Maintenance

| Field | Value |
|-------|-------|
| **Document owner** | _[Tech lead]_ |
| **Last reviewed** | _[YYYY-MM-DD]_ |
| **Review cadence** | _[Semi-annual or when stack changes]_ |
