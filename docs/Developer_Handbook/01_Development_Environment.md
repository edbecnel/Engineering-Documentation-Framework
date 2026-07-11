# Development Environment

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [Developer Handbook](README.md) › Development Environment


## Purpose

This document defines how developers set up, configure, and maintain a local development environment that matches production closely enough to build and test software confidently. It is the canonical reference for onboarding and troubleshooting environment issues.

## When to use it

- **Onboarding** — New contributors follow [00_First_Time_Setup.md](./00_First_Time_Setup.md) on day one.
- **Stack changes** — When runtime, toolchain, or dependency versions change, update this document in the same PR.
- **"Works on my machine" incidents** — Compare local setup against this baseline.
- **CI alignment** — Ensure local tooling versions match CI images defined here.
- **AI-assisted setup** — Point AI tools at this file when generating setup scripts or diagnosing environment errors.

## Suggested contents

Customize each section below for your project's languages, platforms, and services.

---

## Prerequisites

### Required software

| Tool | Minimum version | Purpose | Install reference |
|------|-----------------|---------|-------------------|
| _[e.g., Git]_ | _[2.40+]_ | Version control | _[Link or command]_ |
| _[e.g., Node.js]_ | _[20 LTS]_ | Runtime | _[nvm / fnm / official installer]_ |
| _[e.g., Docker]_ | _[24+]_ | Local services | _[docker.com]_ |
| _[e.g., IDE]_ | _[Cursor / VS Code]_ | Development | _[Link]_ |

### Optional tools

- _[e.g., direnv, jq, httpie, database GUI]_
- _[Tool and when it helps]_

### Hardware recommendations

- _[RAM, disk, OS notes if relevant]_

---

## Repository setup

### Clone and initialize

```bash
# Example — replace with project-specific commands
git clone <repository-url>
cd <project-directory>
# ./scripts/setup.sh   # if provided
```

### Environment variables

| Variable | Required | Description | Example |
|----------|----------|-------------|---------|
| _[APP_ENV]_ | Yes | Runtime environment | `development` |
| _[DATABASE_URL]_ | Yes | Local DB connection | `postgresql://...` |
| _[API_KEY]_ | No | Third-party integration | _[Use .env, never commit]_ |

### Secrets handling

- Store secrets in `.env` (gitignored) or a team secret manager.
- Provide `.env.example` with variable names and dummy values.
- Never commit credentials, tokens, or private keys.

---

## Local services

### Running dependencies

_[Describe how to start databases, caches, message queues, mock services.]_

```bash
# Example
docker compose up -d
```

### Service endpoints (local)

| Service | URL | Notes |
|---------|-----|-------|
| _[API]_ | _[http://localhost:3000]_ | _[...]_ |
| _[Database]_ | _[localhost:5432]_ | _[...]_ |
| _[Admin UI]_ | _[http://localhost:8080]_ | _[...]_ |

### Seed data

_[How to load fixtures, migrations, or sample data for development.]_

---

## Running the application

### Start commands

```bash
# Development server
# npm run dev
# make run
# cargo run
```

### Verify installation

```bash
# Health check or smoke test command
# curl http://localhost:3000/health
```

### Common development tasks

| Task | Command |
|------|---------|
| Install dependencies | _[command]_ |
| Run linter | _[command]_ |
| Run formatter | _[command]_ |
| Run tests | _[command]_ |
| Build production artifact | _[command]_ |

---

## IDE configuration

### Recommended extensions

- _[Extension name — purpose]_
- _[Extension name — purpose]_

### Editor settings

_[Point to committed `.editorconfig`, `.vscode/settings.json`, or equivalent.]_

### AI tooling

See [02_AI_Development.md](./02_AI_Development.md) and the [AI Engineering Handbook](../AI/README.md).

---

## Troubleshooting

### Issue: _[Common problem]_

**Symptoms:** _[What the developer sees]_

**Resolution:**

1. _[Step]_
2. _[Step]_

### Issue: _[Port already in use / dependency version mismatch]_

**Symptoms:** _[...]_

**Resolution:** _[...]_

### Getting help

- Check [PROJECT_INDEX.md](../../PROJECT_INDEX.md) for related docs.
- Search closed issues / team chat channel: _[channel name]_.
- Escalate to: _[team or owner]_.

---

## Maintenance

| Field | Value |
|-------|-------|
| **Document owner** | _[Name / team]_ |
| **Last reviewed** | _[YYYY-MM-DD]_ |
| **Review cadence** | _[e.g., Each major release or quarterly]_ |

## Parent

- [Developer Handbook](README.md)
