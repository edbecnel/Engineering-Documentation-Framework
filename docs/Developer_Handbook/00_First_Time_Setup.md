# First-Time Setup

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Developer Handbook](README.md) › First-Time Setup

## Purpose

This guide is the **entry point for new contributors** setting up a local development environment for the first time.

It does not duplicate setup instructions. Each step links to the authoritative document and section where the detailed instructions live. Customize the linked documents for your project; keep this guide as a stable onboarding path.

## Who this is for

- New developers joining the project
- Contributors returning after a long absence
- AI assistants performing first-time environment setup

## Before you begin

Read these short references for context:

| Topic | Document |
|-------|----------|
| Project scope and goals | [PROJECT_CHARTER.md](../../PROJECT_CHARTER.md) |
| Technology stack | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) — Technology Stack |
| Architecture overview | [docs/Architecture/](../Architecture/) |
| Domain terminology | [docs/Reference/Glossary.md](../Reference/Glossary.md) |

---

## Setup checklist

Work through the steps below in order. Open each link and complete the referenced section before moving on.

### 1. Install prerequisites

**Authoritative section:** [Development Environment → Prerequisites](./01_Development_Environment.md#prerequisites)

Install required tools (Git, language runtimes, Docker, IDE, and so on) listed in:

- [Required software](./01_Development_Environment.md#required-software)
- [Optional tools](./01_Development_Environment.md#optional-tools) — when applicable
- [Hardware recommendations](./01_Development_Environment.md#hardware-recommendations) — when applicable

**Checkpoint:** You can run `git --version` and each required runtime or tool from a terminal.

---

### 2. Clone the repository and initialize the workspace

**Authoritative section:** [Development Environment → Repository setup](./01_Development_Environment.md#repository-setup)

Complete:

- [Clone and initialize](./01_Development_Environment.md#clone-and-initialize)
- [Environment variables](./01_Development_Environment.md#environment-variables)
- [Secrets handling](./01_Development_Environment.md#secrets-handling)

**Checkpoint:** The repository is cloned, dependencies are installed, and `.env` (or equivalent) is configured from `.env.example`.

---

### 3. Understand the technology stack and frameworks

**Authoritative documents:**

| Concern | Where to read |
|---------|---------------|
| Stack summary | [PROJECT_INDEX.md](../../PROJECT_INDEX.md) |
| System design and components | [docs/Architecture/](../Architecture/) |
| Major technology choices | [ARCHITECTURE_DECISIONS.md](../../ARCHITECTURE_DECISIONS.md) and [docs/Architecture/ADRs/](../Architecture/ADRs/) |
| API contracts | [docs/API/](../API/) |
| Coding conventions | [Coding Standards](./04_Coding_Standards.md) |

**Checkpoint:** You know which languages, frameworks, and services this project uses and where their design is documented.

---

### 4. Set up the database and persistence layer

**Authoritative documents:**

| Concern | Where to read |
|---------|---------------|
| Schema, entities, migrations | [docs/Database/](../Database/) |
| Local database connection | [Development Environment → Environment variables](./01_Development_Environment.md#environment-variables) |
| Seed and fixture data | [Development Environment → Seed data](./01_Development_Environment.md#seed-data) |

**Checkpoint:** You can connect to the local database (or equivalent persistence) and apply migrations or seed data successfully.

---

### 5. Start local services and dependencies

**Authoritative section:** [Development Environment → Local services](./01_Development_Environment.md#local-services)

Complete:

- [Running dependencies](./01_Development_Environment.md#running-dependencies) — databases, caches, queues, containers
- [Local service endpoints](./01_Development_Environment.md#service-endpoints-local)
- [Seed data](./01_Development_Environment.md#seed-data) — if not completed in step 4

For platform-level environment detail, see [docs/Deployment/](../Deployment/).

**Checkpoint:** All required backing services are running locally.

---

### 6. Run the application and verify installation

**Authoritative section:** [Development Environment → Running the application](./01_Development_Environment.md#running-the-application)

Complete:

- [Start commands](./01_Development_Environment.md#start-commands)
- [Verify installation](./01_Development_Environment.md#verify-installation)
- [Common development tasks](./01_Development_Environment.md#common-development-tasks)

**Checkpoint:** The application starts, health checks pass, and you can run the primary dev commands (lint, test, build).

---

### 7. Configure your IDE and AI tooling

**Authoritative section:** [Development Environment → IDE configuration](./01_Development_Environment.md#ide-configuration)

Also review:

- [AI Development](./02_AI_Development.md) — approved tools and privacy rules
- [AI Engineering Handbook](../AI/README.md) — model selection and repository workflow

**Checkpoint:** Your editor is configured with recommended extensions and project settings.

---

### 8. Run tests and confirm CI alignment

**Authoritative documents:**

| Concern | Where to read |
|---------|---------------|
| Test strategy and commands | [Testing](./05_Testing.md) |
| Git branching and PR workflow | [Git Workflow](./03_Git_Workflow.md) |
| CI/CD and environments | [docs/Deployment/](../Deployment/) |

**Checkpoint:** Unit tests pass locally and you understand how changes are validated in CI.

---

### 9. Validate documentation conformance (optional)

If this project adopts EDF validation tooling, capture a conformance snapshot:

```bash
/path/to/Engineering-Documentation-Framework/scripts/run_conformance_validation.sh "/path/to/this/project/root"
```

See [Project Analysis and Validation Tool](../Development/Project_Analysis_Validation_Tool.md).

---

## When something fails

**Authoritative section:** [Development Environment → Troubleshooting](./01_Development_Environment.md#troubleshooting)

| Problem type | Start here |
|--------------|------------|
| Environment, ports, dependencies | [Troubleshooting](./01_Development_Environment.md#troubleshooting) |
| Test failures | [Testing](./05_Testing.md) |
| Deployment or CI issues | [Developer deployment checklist](./06_Deployment.md) and [docs/Deployment/](../Deployment/) |

---

## After setup

You are ready for day-to-day work. Use the [Developer Handbook](README.md) for ongoing practices:

| Topic | Document |
|-------|----------|
| Git and PRs | [03_Git_Workflow.md](./03_Git_Workflow.md) |
| Code style | [04_Coding_Standards.md](./04_Coding_Standards.md) |
| Testing | [05_Testing.md](./05_Testing.md) |
| Releases | [06_Deployment.md](./06_Deployment.md) |

## Maintenance

| Field | Value |
|-------|-------|
| **Document owner** | _[Engineering lead]_ |
| **Last reviewed** | _[YYYY-MM-DD]_ |
| **Review cadence** | When onboarding steps or authoritative setup documents change |

## Parent

- [Developer Handbook](README.md)

## Related documents

- [01_Development_Environment.md](./01_Development_Environment.md) — canonical environment reference
- [Documentation Information Architecture](../Architecture/Documentation_Information_Architecture.md)
- [Development Environment Template](../Templates/Development_Environment_Template.md)
