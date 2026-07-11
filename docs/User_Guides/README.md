# User Guides

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › User Guides


## Purpose

This directory contains **end-user documentation** — written for people who use the software product, not for engineers who build it. Guides should be clear, task-oriented, and free of implementation jargon unless the audience is technical users.

## Audience

- End users (customers, internal business users)
- Customer support and success teams
- Technical writers maintaining public help centers
- AI chatbots answering user questions (when grounded on these docs)

## What belongs here

| Document type | Examples |
|---------------|----------|
| Getting started | Account setup, first-run walkthrough |
| How-to guides | Task-oriented procedures ("Export a report") |
| Conceptual overviews | Product concepts explained in plain language |
| FAQ | Common questions and answers |
| Troubleshooting (user-facing) | "Why can't I log in?" |
| Release notes (user-facing) | What changed from the user perspective |
| Admin guides | Tenant configuration for customer admins |

## What does not belong here

- API reference → [docs/API/](../API/)
- Developer setup → [docs/Developer_Handbook/](../Developer_Handbook/)
- Infrastructure runbooks → [docs/Deployment/](../Deployment/)
- Internal requirements → [docs/Specifications/](../Specifications/)

## Writing guidelines

1. **Task-first titles** — "Create a project" not "Project creation module."
2. **Short sentences** — Aim for grade 8–10 reading level unless audience is expert.
3. **Screenshots and diagrams** — Update when UI changes; store assets in `images/`.
4. **Consistent terminology** — Use [docs/Reference/Glossary.md](../Reference/Glossary.md) terms.
5. **Version awareness** — Note minimum product version when behavior differs.

## Suggested document structure

### How-to guide template

```markdown
# How to [ accomplish task ]

## Before you begin
[Permissions, prerequisites]

## Steps
1. [Action with UI labels in bold]
2. [Next action]

## Expected result
[What the user should see]

## Troubleshooting
| Problem | Solution |
|---------|----------|

## Related
[Links to other guides]
```

## Recommended organization (as project grows)

```
User_Guides/
├── README.md
├── Getting_Started.md
├── FAQ.md
├── how-to/
│   ├── create-a-project.md
│   └── invite-team-members.md
├── admin/
│   └── manage-billing.md
├── images/
└── release-notes/
    └── v1.2.0.md
```

## Publishing

This directory may be:

- Rendered directly in the repository (GitHub renders Markdown).
- Synced to a documentation site (MkDocs, Docusaurus, ReadMe.io).
- Exported to a help center (Zendesk, Intercom).

Document the publishing pipeline in [docs/Deployment/](../Deployment/) when established.

## Maintenance

| Field | Value |
|-------|-------|
| **Owner** | _[Technical writer / product marketing]_ |
| **Review cadence** | Each user-visible release |
| **Index** | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |

## Related documents

- [docs/Specifications/](../Specifications/) — source requirements for features
- [docs/API/](../API/) — for technical user / developer audience
- [CHANGELOG.md](../../CHANGELOG.md) — engineering changelog; user guides may summarize

## Parent

- [Project Index](../../PROJECT_INDEX.md)
