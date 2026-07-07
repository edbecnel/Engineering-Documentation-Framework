# Tasks

## Purpose

The `tasks/` directory tracks **active, short-lived work** that benefits from living near documentation — migration checklists, release checklists, documentation improvement epics, and sprint notes. It is not a replacement for a full issue tracker but complements one for doc-centric and engineering-process work.

## When to use this folder

| Use `tasks/` | Use issue tracker instead |
|--------------|---------------------------|
| Documentation migration checklists | Bug reports with long discussion threads |
| Release checklists for a specific version | Permanent product backlog |
| One-off engineering initiatives with doc deliverables | Customer support tickets |
| Onboarding task lists for new contributors | Automated CI failure tracking |

## Recommended practices

### File naming

```
YYYY-MM-short-description.md
```

Examples:

- `2026-Q3-api-doc-refresh.md`
- `2026-07-release-1.2.0-checklist.md`
- `onboarding-contributor-checklist.md` (living document)

### Task file template

```markdown
# [Task title]

| Field | Value |
|-------|-------|
| Status | Not started / In progress / Done |
| Owner | [Name] |
| Created | YYYY-MM-DD |
| Target date | YYYY-MM-DD |
| Issue link | [#123](url) |

## Objective
[What success looks like]

## Checklist
- [ ] Item 1
- [ ] Item 2

## Notes
[Progress updates]
```

## Lifecycle

1. **Create** when work spans multiple sessions and involves documentation deliverables.
2. **Update** checklist items as work progresses.
3. **Complete** — mark status Done; archive if historical value, or delete if fully captured elsewhere.
4. **Link** from [PROJECT_INDEX.md](../PROJECT_INDEX.md) for high-visibility initiatives.

## Current tasks

_No active tasks in the framework template. Projects adopting this framework should list active task files here or link to an external board._

## Related documents

- [PROJECT_INDEX.md](../PROJECT_INDEX.md)
- [CHANGELOG.md](../CHANGELOG.md) — completed release work
- [archive/](../archive/) — completed initiatives worth preserving
