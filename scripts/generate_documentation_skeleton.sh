#!/usr/bin/env bash
# Creates missing starter documentation only.
# Never overwrites, edits, moves, renames, or deletes existing files.

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") "/path/to/project root"" >&2
    exit 1
fi

PROJECT_ROOT="${1%/}"

if [[ ! -d "$PROJECT_ROOT" ]]; then
    echo "Error: project root does not exist: $PROJECT_ROOT" >&2
    exit 1
fi

created=()
skipped=()
conflicts=()

create_file_if_missing() {
    local rel="$1"
    local target="$PROJECT_ROOT/$rel"
    local parent
    parent="$(dirname "$target")"

    if [[ -f "$target" ]]; then
        skipped+=("$rel")
        cat >/dev/null
        return 0
    fi

    if [[ -e "$target" ]]; then
        conflicts+=("$rel")
        cat >/dev/null
        return 0
    fi

    if [[ -e "$parent" && ! -d "$parent" ]]; then
        conflicts+=("$rel (parent is not a directory)")
        cat >/dev/null
        return 0
    fi

    mkdir -p -- "$parent"
    cat >"$target"
    created+=("$rel")
}

create_file_if_missing "PROJECT_INDEX.md" <<'EDF_EOF'
# Project Index

> **Navigation hub:** Begin with the project [README](README.md), then use this index to locate authoritative documentation.

## Purpose

This is the primary documentation hub for humans and AI assistants.

## Core Documents

- [Project Charter](PROJECT_CHARTER.md)
- [Architecture Decisions](ARCHITECTURE_DECISIONS.md)
- [Architecture](docs/Architecture/README.md)
- [AI Engineering](docs/AI/README.md)
- [Development](docs/Development/README.md)
- [Specifications](docs/Specifications/README.md)
- [API](docs/API/README.md)
- [Database](docs/Database/README.md)
- [Deployment](docs/Deployment/README.md)
- [User Guides](docs/User_Guides/README.md)
- [Reference](docs/Reference/README.md)
- [Templates](docs/Templates/README.md)

## Current Priorities

1. Replace this placeholder with the highest-priority documentation work.
2. Add links to project-specific authoritative documents.
3. Keep this index current when major documents move or change.

## AI Context

AI assistants should begin here, follow links to authoritative documents, and avoid inventing project facts.

## Last Reviewed

Not yet reviewed.
EDF_EOF

create_file_if_missing "PROJECT_CHARTER.md" <<'EDF_EOF'
# Project Charter

> **Documentation path:** [Project Index](PROJECT_INDEX.md) → Project Charter

## Mission

Describe why the project exists.

## Goals

- Define the project's primary goals.

## Non-Goals

- Define what the project intentionally does not attempt.

## Scope

### In Scope

- Add in-scope work.

### Out of Scope

- Add excluded work.

## Stakeholders

Identify owners, users, maintainers, and decision-makers.

## Constraints

Document technical, schedule, budget, legal, and operational constraints.

## Related Documents

- [Project Index](PROJECT_INDEX.md)
- [Architecture](docs/Architecture/README.md)
- [Specifications](docs/Specifications/README.md)
EDF_EOF

create_file_if_missing "ARCHITECTURE_DECISIONS.md" <<'EDF_EOF'
# Architecture Decisions

> **Documentation path:** [Project Index](PROJECT_INDEX.md) → Architecture Decisions

## Purpose

This document indexes significant architecture decisions.

## ADR Location

Individual ADRs belong in [docs/Architecture/ADRs/](docs/Architecture/ADRs/README.md).

## Decision Index

| ID | Decision | Status | Date |
|---|---|---|---|
| _None yet_ | | | |

## Related Documents

- [Project Index](PROJECT_INDEX.md)
- [Architecture](docs/Architecture/README.md)
- [ADR Index](docs/Architecture/ADRs/README.md)
EDF_EOF

create_file_if_missing "docs/Architecture/README.md" <<'EDF_EOF'
# Architecture

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Architecture

## Purpose

System architecture, technical design, diagrams, and architecture decisions.

## Authoritative Documents

- [Architecture Decision Records](ADRs/README.md)
- [Project Architecture Decisions](../../ARCHITECTURE_DECISIONS.md)

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/AI/README.md" <<'EDF_EOF'
# AI

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → AI

## Purpose

AI-assisted engineering practices, tool roles, model selection, prompting, verification, security, and governance.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Development/README.md" <<'EDF_EOF'
# Development

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Development

## Purpose

Developer setup, workflows, coding practices, testing, debugging, and engineering tools.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Specifications/README.md" <<'EDF_EOF'
# Specifications

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Specifications

## Purpose

Functional requirements, non-functional requirements, feature specifications, and acceptance criteria.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/API/README.md" <<'EDF_EOF'
# API

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → API

## Purpose

External and internal API contracts, authentication behavior, schemas, and interface documentation.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Database/README.md" <<'EDF_EOF'
# Database

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Database

## Purpose

Data models, schemas, migrations, persistence design, backup, restore, and retention.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Deployment/README.md" <<'EDF_EOF'
# Deployment

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Deployment

## Purpose

Environments, CI/CD, releases, runbooks, rollback, monitoring, and operations.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/User_Guides/README.md" <<'EDF_EOF'
# User Guides

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → User Guides

## Purpose

End-user instructions, tutorials, walkthroughs, and troubleshooting guidance.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Reference/README.md" <<'EDF_EOF'
# Reference

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Reference

## Purpose

Glossaries, standards, terminology, conventions, and external references.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Templates/README.md" <<'EDF_EOF'
# Templates

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Templates

## Purpose

Reusable source templates for creating consistent project documentation.

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Project README](../../README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
EDF_EOF

create_file_if_missing "docs/Architecture/ADRs/README.md" <<'EDF_EOF'
# Architecture Decision Records

> **Documentation path:** [Project Index](../../../PROJECT_INDEX.md) → [Architecture](../README.md) → Architecture Decision Records

## Purpose

This directory contains individual Architecture Decision Records.

## ADR Index

| ID | Decision | Status | Date |
|---|---|---|---|
| _None yet_ | | | |

## Navigation

- [Project Index](../../../PROJECT_INDEX.md)
- [Architecture](../README.md)
- [Architecture Decisions](../../../ARCHITECTURE_DECISIONS.md)
EDF_EOF


echo
echo "Created:"
if [[ ${#created[@]} -eq 0 ]]; then echo "  None"; else printf '  %s\n' "${created[@]}"; fi
echo
echo "Skipped — already exists:"
if [[ ${#skipped[@]} -eq 0 ]]; then echo "  None"; else printf '  %s\n' "${skipped[@]}"; fi
echo
echo "Conflicts:"
if [[ ${#conflicts[@]} -eq 0 ]]; then echo "  None"; else printf '  %s\n' "${conflicts[@]}"; fi
echo
echo "No existing files were modified."
