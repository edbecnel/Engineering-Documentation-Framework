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
- [Developer Handbook](docs/Developer_Handbook/README.md)
- [First-Time Setup](docs/Developer_Handbook/00_First_Time_Setup.md)
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
    "docs/Developer_Handbook/README.md" = @'
# Developer Handbook

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Developer Handbook

## Purpose

Day-to-day project engineering: first-time setup, development environment, Git workflow, coding standards, testing, and releases.

## Start here

New contributors begin with [00_First_Time_Setup.md](./00_First_Time_Setup.md).

## Authoritative Documents

- [00_First_Time_Setup.md](./00_First_Time_Setup.md)
- [01_Development_Environment.md](./01_Development_Environment.md)

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Development](../Development/README.md)

## Maintenance

Update this index whenever a major document in this domain is created, moved, renamed, or retired.
'@
    "docs/Developer_Handbook/00_First_Time_Setup.md" = @'
# First-Time Setup

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → [Developer Handbook](README.md) → First-Time Setup

## Purpose

Entry point for new contributors setting up a local development environment. This guide links to authoritative setup documents and specific sections.

## Setup checklist

1. **Prerequisites** → [01_Development_Environment.md → Prerequisites](./01_Development_Environment.md#prerequisites)
2. **Clone and configure** → [01_Development_Environment.md → Repository setup](./01_Development_Environment.md#repository-setup)
3. **Technology stack** → [PROJECT_INDEX.md](../../PROJECT_INDEX.md), [docs/Architecture/](../Architecture/)
4. **Database** → [docs/Database/](../Database/)
5. **Local services** → [01_Development_Environment.md → Local services](./01_Development_Environment.md#local-services)
6. **Run and verify** → [01_Development_Environment.md → Running the application](./01_Development_Environment.md#running-the-application)
7. **IDE and AI tooling** → [01_Development_Environment.md → IDE configuration](./01_Development_Environment.md#ide-configuration)
8. **Tests and CI** → [docs/Deployment/](../Deployment/)

## When something fails

→ [01_Development_Environment.md → Troubleshooting](./01_Development_Environment.md#troubleshooting)

## Parent

- [Developer Handbook](README.md)
'@
    "docs/Developer_Handbook/01_Development_Environment.md" = @'
# Development Environment

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → [Developer Handbook](README.md) → Development Environment

## Purpose

Canonical reference for local development environment setup, configuration, and troubleshooting.

New contributors should follow [00_First_Time_Setup.md](./00_First_Time_Setup.md) first.

## Prerequisites

### Required software

| Tool | Minimum version | Purpose | Install reference |
|------|-----------------|---------|-------------------|
| Git | | Version control | |
| | | | |

## Repository setup

### Clone and initialize

```bash
git clone <repository-url>
cd <project-directory>
```

### Environment variables

| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| | | | |

### Secrets handling

- Use `.env` (gitignored) and provide `.env.example`.

## Local services

### Running dependencies

[Describe how to start local databases, caches, or containers.]

### Seed data

[Describe how to load development data.]

## Running the application

### Start commands

```bash
# [command]
```

### Verify installation

```bash
# [health check]
```

## IDE configuration

[Editor extensions and project settings.]

## Troubleshooting

[Common environment issues and resolutions.]

## Parent

- [Developer Handbook](README.md)
'@
    "docs/Development/README.md" = @'
# Development

> **Documentation path:** [Project Index](../../PROJECT_INDEX.md) → Development

## Purpose

Framework adoption engineering: documentation-first policies, migration and validation tooling, and engineering practices for maintaining documentation alongside code.

For day-to-day project engineering (setup, Git, coding, testing), see [Developer Handbook](../Developer_Handbook/README.md).

## Authoritative Documents

- Add links to authoritative documents in this domain.

## What Belongs Here

Add documents whose primary responsibility matches this domain.

## Navigation

- [Project Index](../../PROJECT_INDEX.md)
- [Developer Handbook](../Developer_Handbook/README.md)
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
