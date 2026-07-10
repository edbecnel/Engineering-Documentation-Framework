# Project Index

> **Navigation hub** for this repository. In a project that adopts this framework, `PROJECT_INDEX.md` is the first document contributors and AI tools should read after the root README.

## Purpose

`PROJECT_INDEX.md` serves as the **living map** of all project documentation.

It answers:

- What is the current state of the project?
- Where does specific information live?
- Which documents are authoritative?
- Who owns each area?

This file is intentionally maintained as a **dashboard**, not a dump of detailed content. Link outward; keep summaries short.

## Current Status

| Field | Value |
|-------|-------|
| **Project phase** | _[e.g., Planning / Active Development / Maintenance / Sunset]_ |
| **Last updated** | _[YYYY-MM-DD]_ |
| **Documentation health** | _[e.g., Green / Needs attention — describe gaps]_ |
| **Primary maintainers** | _[Names or team]_ |

### Active priorities

1. _[Current documentation priority]_
2. _[Second priority]_
3. _[Third priority]_

## Important Documents

| Document | Location | Description |
|----------|----------|-------------|
| Project Charter | [PROJECT_CHARTER.md](./PROJECT_CHARTER.md) | Mission, scope, stakeholders, success criteria |
| Architecture Decisions | [ARCHITECTURE_DECISIONS.md](./ARCHITECTURE_DECISIONS.md) | ADR index and decision log template |
| Documentation Information Architecture | [docs/Architecture/Documentation_Information_Architecture.md](./docs/Architecture/Documentation_Information_Architecture.md) | Authoritative guide for documentation domains, structure, ownership, and placement |
| AI Engineering Handbook | [docs/AI/](./docs/AI/) | AI tool roles, model selection, prompting, verification, security, and governance |
| Changelog | [CHANGELOG.md](./CHANGELOG.md) | Version history and release notes |
| Developer Handbook | [docs/Developer_Handbook/](./docs/Developer_Handbook/) | Environment, Git, coding, testing, deployment |
| Architecture | [docs/Architecture/](./docs/Architecture/) | System design, diagrams, component docs |
| API | [docs/API/](./docs/API/) | REST/GraphQL/gRPC contracts and guides |
| Database | [docs/Database/](./docs/Database/) | Schema, ERDs, migration strategy |
| Deployment | [docs/Deployment/](./docs/Deployment/) | Environments, CI/CD, runbooks |
| Specifications | [docs/Specifications/](./docs/Specifications/) | Requirements and functional specs |
| User Guides | [docs/User_Guides/](./docs/User_Guides/) | End-user facing documentation |
| Development Tools | [docs/Development/](./docs/Development/) | Framework development tooling and guidance |
| Active tasks | [tasks/](./tasks/) | Current work items and checklists |

## Bootstrap Scripts

To add the canonical folder layout inside an **existing software project**, pass that project's root directory to the structure script:

- **Unix / macOS / Linux:**

  ```bash
  ./scripts/create_canonical_structure.sh "/Users/ed/Projects/The Recipe Vault"
  ```

- **Windows (PowerShell):**

  ```powershell
  .\scripts\create_canonical_structure.ps1 -ProjectRoot "D:\Projects\The Recipe Vault"
  ```

The scripts do not assume they are run from the project root. Quote paths that contain spaces.

The scripts create missing canonical directories and, if absent, `ENGINEERING_DOCUMENTATION_FRAMEWORK.md` at the project root — a local adoption guide explaining the `docs/` layout and how `documents/` is treated as legacy content.

They do not create README files inside generated folders. Any existing `documents/` folder is left completely untouched.

These scripts only create missing directories and the optional framework guide file. They do not delete, overwrite, move, rename, or modify existing files.

## Analysis and Migration Tools

| Tool | Purpose |
|---|---|
| `scripts/analyze_project_structure.sh` | Read-only project structure analysis for macOS/Linux |
| `scripts/analyze_project_structure.ps1` | Read-only project structure analysis for Windows PowerShell |
| `scripts/plan_documentation_migration.sh` | Read-only Markdown migration planning for macOS/Linux |
| `scripts/plan_documentation_migration.ps1` | Read-only Markdown migration planning for Windows PowerShell |

These tools help projects evaluate framework alignment and plan documentation migration without automatically moving or modifying files.

## Folder Structure

```text
.
├── README.md
├── PROJECT_INDEX.md                  ← You are here
├── PROJECT_CHARTER.md
├── ARCHITECTURE_DECISIONS.md
├── CHANGELOG.md
│
├── docs/
│   ├── Architecture/                 ← What we built and why; includes documentation architecture
│   ├── AI/                           ← AI Engineering Handbook
│   ├── Developer_Handbook/           ← How we build; process and standards
│   ├── Development/                  ← Framework development tooling and guides
│   ├── API/                          ← External and internal interfaces
│   ├── Database/                     ← Data layer
│   ├── Deployment/                   ← How we ship and operate
│   ├── Specifications/               ← What we're building; requirements
│   ├── User_Guides/                  ← How end users consume the product
│   ├── Reference/                    ← Glossary, standards, terminology, references
│   └── Templates/                    ← Reusable documentation templates
│
├── scripts/                          ← Framework utility scripts
├── tasks/                            ← Short-lived active work
└── archive/                          ← Retired documents with context
```

## Where Major Information Belongs

Use this table when deciding where to file new documentation.

| Information type | Primary location | Notes |
|-----------------|------------------|-------|
| Project goals and scope | `PROJECT_CHARTER.md` | Update when scope changes materially |
| Documentation architecture / information architecture | `docs/Architecture/Documentation_Information_Architecture.md` | Defines documentation domains and placement rules |
| Technical decisions | `ARCHITECTURE_DECISIONS.md` + `docs/Architecture/` | ADR for the decision; Architecture for design detail |
| System diagrams | `docs/Architecture/` | Link from ADRs and PROJECT_INDEX |
| AI tool roles, prompting, verification, security, governance | `docs/AI/` | AI Engineering Handbook |
| REST/OpenAPI specs | `docs/API/` | Keep in sync with implementation |
| Database schema | `docs/Database/` | Include ERD and migration notes |
| Environment config | `docs/Deployment/` | Never commit secrets; document variable names only |
| Functional requirements | `docs/Specifications/` | Separate from implementation docs |
| User-facing help | `docs/User_Guides/` | Written for non-developers |
| Dev environment setup | `docs/Developer_Handbook/01_Development_Environment.md` | |
| Git branching policy | `docs/Developer_Handbook/03_Git_Workflow.md` | |
| Coding conventions | `docs/Developer_Handbook/04_Coding_Standards.md` | |
| Test strategy | `docs/Developer_Handbook/05_Testing.md` | |
| Release procedure | `docs/Developer_Handbook/06_Deployment.md` + `docs/Deployment/` | Handbook = developer steps; Deployment = infrastructure detail |
| Framework development tools | `docs/Development/` | Tool documentation for framework scripts and migration helpers |
| Sprint/epic tracking | `tasks/` | Link to external issue tracker if used |
| Superseded specs | `archive/` | Prefix filename with retirement date |

**Rule of thumb:** If a document describes *why* a choice was made, it likely belongs in an ADR. If it describes *how* something works today, it belongs in the appropriate `docs/` folder.

## Document Ownership

Every major document or folder should have a **named owner** responsible for accuracy and timely updates.

| Area | Owner | Backup |
|------|-------|--------|
| PROJECT_INDEX.md | _[Name]_ | _[Name]_ |
| PROJECT_CHARTER.md | _[Product owner / lead]_ | _[Name]_ |
| ARCHITECTURE_DECISIONS.md | _[Tech lead / architect]_ | _[Name]_ |
| docs/Architecture/ | _[Architect]_ | _[Name]_ |
| docs/AI/ | _[Engineering lead / AI workflow owner]_ | _[Name]_ |
| docs/Developer_Handbook/ | _[Engineering lead]_ | _[Name]_ |
| docs/Development/ | _[Framework maintainer]_ | _[Name]_ |
| docs/API/ | _[API owner]_ | _[Name]_ |
| docs/Database/ | _[Data owner]_ | _[Name]_ |
| docs/Deployment/ | _[DevOps / SRE]_ | _[Name]_ |
| docs/Specifications/ | _[Product / BA]_ | _[Name]_ |
| docs/User_Guides/ | _[Technical writer / PM]_ | _[Name]_ |

Owners should:

- Review their area at least once per release cycle.
- Update `PROJECT_INDEX.md` when adding or removing major documents.
- Route disputes about placement to the tech lead or documentation steward.

## How Future Documentation Should Be Organized

### Naming conventions

- Use **descriptive filenames** with underscores or hyphens: `Payment_Service_Design.md`, not `doc2.md`.
- Prefix ordered sequences with numbers when sequence matters: `01_`, `02_`.
- ADR files should use a clear ADR naming convention and be referenced from the central ADR index.

### Document structure

Each substantive document should include at minimum:

1. **Title and one-line summary**
2. **Purpose** — Why this document exists
3. **Audience** — Who should read it
4. **Last reviewed** — Date and reviewer name
5. **Body** — Organized with clear headings
6. **Related links** — Cross-references to other docs

### Lifecycle

| Stage | Action |
|-------|--------|
| **Create** | Add entry to PROJECT_INDEX; assign owner |
| **Update** | Same PR as related code when possible |
| **Review** | Owner verifies quarterly or per release |
| **Retire** | Move to `archive/` with a note explaining replacement |
| **Delete** | Avoid; prefer archive for audit trail unless the document is an obsolete transitional file |

### Scaling to large projects

- **Split by domain** — e.g., `docs/Architecture/billing/`, `docs/Architecture/identity/`.
- **Keep indexes shallow** — PROJECT_INDEX links to domain indexes, not every file.
- **Avoid duplication** — One canonical source; elsewhere link to it.
- **Prefer small files** — Easier to review, diff, and feed to AI context windows.

---

_When bootstrapping a new project, replace all `_[placeholder]_` values above and delete sections that do not apply._
