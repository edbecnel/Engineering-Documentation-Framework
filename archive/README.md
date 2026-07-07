# Archive

## Purpose

The `archive/` directory preserves **retired, superseded, or historical documents** that should not be deleted but are no longer authoritative. Archiving maintains audit trails, explains past decisions, and prevents confusion with current documentation.

## When to archive (instead of delete)

- A specification has been fully implemented and replaced by user guides or API docs.
- An ADR has been superseded (keep the old ADR here with a pointer to the successor).
- A runbook no longer applies after infrastructure migration.
- A major documentation restructure moves content to new locations.
- A project phase ends (e.g., beta program documentation).

## When not to archive

- **Secrets or credentials** — Remove and rotate; never archive secrets in Git.
- **Duplicate copies of active docs** — Update the canonical source instead.
- **Trivial drafts** — Delete if never published and have no historical value.

## Archiving procedure

1. **Add header** to the document at the top:

```markdown
> **ARCHIVED** — YYYY-MM-DD
> **Reason:** [Superseded by X / Feature removed / Restructured]
> **Replacement:** [Link to current document]
> **Archived by:** [Name]
```

2. **Move file** to `archive/` preserving subdirectory structure when helpful:

```text
archive/
├── 2026-07-specs/
│   └── SPEC-001-legacy-auth.md
├── 2026-08-deployment/
│   └── old-runbook-ec2.md
└── README.md
```

3. **Update references** — Fix or remove links in active docs pointing to the archived file.
4. **Update** [PROJECT_INDEX.md](../PROJECT_INDEX.md) if the document was listed there.
5. **Commit** with message: `docs: archive [document name] — [reason]`

## Naming convention

Prefix folders or files with retirement date for sortability:

```text
archive/YYYY-MM-description/
```

## Retention policy

Customize per organization:

| Policy | Default recommendation |
|--------|------------------------|
| Minimum retention | Keep archived docs for life of repository |
| Review | Annual review; confirm replacements still valid |
| Legal hold | Do not delete if litigation or compliance requires retention |

## Current archive contents

_This framework template has no archived documents yet._

## Related documents

- [ARCHITECTURE_DECISIONS.md](../ARCHITECTURE_DECISIONS.md) — superseded ADRs
- [PROJECT_INDEX.md](../PROJECT_INDEX.md) — active document index
- [CHANGELOG.md](../CHANGELOG.md) — framework version history
