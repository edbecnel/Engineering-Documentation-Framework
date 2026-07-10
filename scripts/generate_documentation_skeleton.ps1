<#
Creates missing starter documentation only.
Never overwrites, edits, moves, renames, or deletes existing files.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $ProjectRoot
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $ProjectRoot -PathType Container)) {
    Write-Error "Project root does not exist: $ProjectRoot"
}

$Files = @{
    "PROJECT_INDEX.md" = @'
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
'@
    "PROJECT_CHARTER.md" = @'
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
'@
    "ARCHITECTURE_DECISIONS.md" = @'
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
'@
    "docs/Architecture/README.md" = @'
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
'@
    "docs/AI/README.md" = @'
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
'@
    "docs/Development/README.md" = @'
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
'@
    "docs/Specifications/README.md" = @'
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
'@
    "docs/API/README.md" = @'
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
'@
    "docs/Database/README.md" = @'
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
'@
    "docs/Deployment/README.md" = @'
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
'@
    "docs/User_Guides/README.md" = @'
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
'@
    "docs/Reference/README.md" = @'
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
'@
    "docs/Templates/README.md" = @'
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
'@
    "docs/Architecture/ADRs/README.md" = @'
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
'@
}

$Created = [System.Collections.Generic.List[string]]::new()
$Skipped = [System.Collections.Generic.List[string]]::new()
$Conflicts = [System.Collections.Generic.List[string]]::new()

foreach ($RelativePath in $Files.Keys) {
    $Target = Join-Path -Path $ProjectRoot -ChildPath $RelativePath
    $Parent = Split-Path -Path $Target -Parent

    if (Test-Path -LiteralPath $Target -PathType Leaf) {
        $Skipped.Add($RelativePath)
        continue
    }

    if (Test-Path -LiteralPath $Target) {
        $Conflicts.Add($RelativePath)
        continue
    }

    if ((Test-Path -LiteralPath $Parent) -and -not (Test-Path -LiteralPath $Parent -PathType Container)) {
        $Conflicts.Add("$RelativePath (parent is not a directory)")
        continue
    }

    if (-not (Test-Path -LiteralPath $Parent -PathType Container)) {
        New-Item -ItemType Directory -Path $Parent -Force | Out-Null
    }

    [System.IO.File]::WriteAllText($Target, $Files[$RelativePath], [System.Text.UTF8Encoding]::new($false))
    $Created.Add($RelativePath)
}

Write-Host ""
Write-Host "Created:"
if ($Created.Count -eq 0) { Write-Host "  None" } else { $Created | ForEach-Object { Write-Host "  $_" } }

Write-Host ""
Write-Host "Skipped — already exists:"
if ($Skipped.Count -eq 0) { Write-Host "  None" } else { $Skipped | ForEach-Object { Write-Host "  $_" } }

Write-Host ""
Write-Host "Conflicts:"
if ($Conflicts.Count -eq 0) { Write-Host "  None" } else { $Conflicts | ForEach-Object { Write-Host "  $_" } }

Write-Host ""
Write-Host "No existing files were modified."
