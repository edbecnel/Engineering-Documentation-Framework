# Testing

## Purpose

This document defines the project's testing strategy, expectations, and conventions. A clear testing standard improves reliability, speeds up refactors (including AI-assisted ones), and documents what "done" means for each change.

## When to use it

- **Implementing features** — Write tests as part of the same PR as production code.
- **Fixing bugs** — Add a regression test that fails before the fix.
- **Code review** — Verify coverage and quality of test assertions.
- **Release readiness** — Confirm test gates pass per release checklist.
- **AI-assisted development** — Require AI-generated code to include tests meeting this bar.

## Suggested contents

---

## Testing philosophy

| Principle | Description |
|-----------|-------------|
| **Test behavior, not implementation** | Tests should survive internal refactors |
| **Pyramid balance** | Many unit tests, fewer integration, minimal E2E |
| **Fast feedback** | Unit tests run in seconds locally and in CI |
| **Deterministic** | No flaky tests; fix or quarantine immediately |
| **Readable tests** | Arrange–Act–Assert (or Given–When–Then) structure |

---

## Test levels

### Unit tests

**Scope:** Single function, class, or module in isolation (dependencies mocked).

**When required:** All business logic, utilities, and edge cases.

**Location:** _[e.g., `*.test.ts` alongside source or in `tests/unit/`]_

**Run:** `_[command]_`

### Integration tests

**Scope:** Multiple components together — database, HTTP layer, message queues.

**When required:** Data access, API endpoints, workflow orchestration.

**Location:** _[e.g., `tests/integration/`]_

**Run:** `_[command — may require Docker services]_`

### End-to-end (E2E) tests

**Scope:** Full user journeys through deployed or locally composed stack.

**When required:** Critical paths (login, checkout, core workflow).

**Location:** _[e.g., `tests/e2e/`]_

**Run:** `_[command]_`

### Manual / exploratory testing

**When:** UX validation, complex visual flows, one-off release verification.

**Document:** Record steps in PR test plan; add automated coverage when paths stabilize.

---

## Coverage expectations

| Area | Target | Enforced in CI |
|------|--------|----------------|
| Overall line coverage | _[e.g., 80%]_ | _[Yes / No]_ |
| New code in PR | _[e.g., no decrease]_ | _[Yes]_ |
| Critical modules | _[e.g., auth, billing — 90%]_ | _[Yes]_ |

Coverage is a **guide**, not a goal. Prefer meaningful assertions over chasing percentages.

---

## Writing good tests

### Structure

```text
# Arrange — set up inputs and dependencies
# Act — execute the behavior under test
# Assert — verify outcomes (and side effects if relevant)
```

### Naming

```text
[unitUnderTest]_[scenario]_[expectedResult]
```

Example: `calculateDiscount_appliesPercentForPremiumMember`

### What to test

- Happy path
- Boundary values (empty, zero, max)
- Invalid input and error paths
- Authorization and permission boundaries
- Idempotency and concurrency where relevant

### What to avoid

- Testing framework internals
- Brittle snapshot tests without review
- Sleep-based timing (use deterministic waits)
- Shared mutable state between tests

---

## Test data and fixtures

- Use factories or builders: _[library or pattern]_
- Seed data for integration tests: _[location / scripts]_
- Do not use production data in tests.
- Anonymize any data derived from real sources.

---

## Mocking and stubs

| Dependency | Approach |
|------------|----------|
| External HTTP APIs | _[Mock server / nock / wiremock]_ |
| Database | _[Test containers / in-memory / dedicated test DB]_ |
| Time | _[Inject clock / freeze time library]_ |
| Randomness | _[Seed RNG in tests]_ |

Prefer integration tests over heavy mocking when cost is acceptable.

---

## Continuous integration

### CI pipeline test stages

1. Lint and format
2. Unit tests
3. Integration tests (_[on every PR / nightly]_)
4. E2E tests (_[on main / release branch]_)

### Failure policy

- **Red main is unacceptable** — fix or revert immediately.
- Flaky test: fix within _[timeframe]_ or `@flaky` quarantine with ticket.

---

## Bug fix workflow

1. Write a failing test reproducing the bug (or document why impossible).
2. Implement fix.
3. Confirm test passes; run full suite.
4. Reference test in PR: "Regression test for ENG-XXX."

---

## Performance and load testing

**When:** Before major releases or infrastructure changes.

**Tools:** _[k6, locust, artillery, etc.]_

**Documentation:** Store scenarios and results in `docs/Architecture/` or `docs/Deployment/`.

---

## Security testing

- Dependency scanning: _[tool]_
- SAST: _[tool]_
- DAST / penetration test: _[schedule and owner]_

Findings tracked in `tasks/` or issue tracker.

---

## AI-assisted test generation

AI may scaffold tests from acceptance criteria. Human must:

- Verify assertions match business rules, not AI assumptions.
- Add missing edge cases AI omitted.
- Ensure tests are deterministic and independent.

See [02_AI_Development.md](./02_AI_Development.md).

---

## Related documents

- [04_Coding_Standards.md](./04_Coding_Standards.md) — Code quality conventions
- [06_Deployment.md](./06_Deployment.md) — Pre-release verification
- [docs/Specifications/](../Specifications/) — Acceptance criteria source
- [03_Git_Workflow.md](./03_Git_Workflow.md) — PR test plan requirements

---

## Maintenance

| Field | Value |
|-------|-------|
| **Document owner** | _[QA lead / engineering lead]_ |
| **Last reviewed** | _[YYYY-MM-DD]_ |
| **Review cadence** | _[Per release or semi-annual]_ |
