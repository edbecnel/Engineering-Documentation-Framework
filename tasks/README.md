# Tasks

[Home](../README.md) › [Project Index](../PROJECT_INDEX.md) › Tasks

## Purpose

The `tasks/` directory tracks active, short-lived work that benefits from living near documentation, including migration checklists, release checklists, documentation improvement epics, and sprint notes. It complements rather than replaces a full issue tracker.

## When to Use This Folder

| Use `tasks/` | Use an issue tracker instead |
|---|---|
| Documentation migration checklists | Bug reports with long discussion threads |
| Release checklists for a specific version | Permanent product backlog |
| One-off engineering initiatives with documentation deliverables | Customer support tickets |
| Onboarding task lists | Automated CI failure tracking |

## Recommended Practices

### File Naming

Use descriptive names such as:

- `2026-Q3-api-doc-refresh.md`
- `2026-07-release-1.2.0-checklist.md`
- `onboarding-contributor-checklist.md`

### Task File Template

```markdown
# [Task title]

| Field | Value |
|---|---|
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

1. Create a task file when work spans multiple sessions and includes documentation deliverables.
2. Update checklist items as work progresses.
3. Mark completed work as done and archive it when it retains historical value.
4. Link high-visibility initiatives from [PROJECT_INDEX.md](../PROJECT_INDEX.md).

## Current Tasks

No active tasks are defined in the framework template.

## Parent

- [Project Index](../PROJECT_INDEX.md)

## Related Documents

- [Changelog](../CHANGELOG.md)
- [Archive](../archive/)
- [Development](../docs/Development/README.md)
- [Governance](../docs/Governance/README.md)
