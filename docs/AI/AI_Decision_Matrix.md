# AI Decision Matrix

[Home](../../README.md) › [Project Index](../../PROJECT_INDEX.md) › [AI Engineering Handbook](README.md) › AI Decision Matrix


## Purpose

This document helps developers choose the appropriate AI tool for a software engineering task.

The recommended approach is to start with the least expensive tool that can comfortably solve the problem, then escalate only when needed.

## Roles Across the Software Development Lifecycle

| SDLC stage | Primary AI | Secondary AI | Typical use cases |
|---|---|---|---|
| Vision and product ideas | ChatGPT | Claude Sonnet | Brainstorming, feature ideas, market analysis |
| Requirements analysis | ChatGPT | Claude Sonnet | Functional requirements, user stories, acceptance criteria |
| Architecture and system design | ChatGPT | Claude Sonnet | System architecture, technology selection, trade-off analysis |
| Database design | ChatGPT | Claude Sonnet | Entity modeling, normalization, indexing strategies |
| API design | ChatGPT | Claude Sonnet | REST APIs, validation rules, security, versioning |
| Project planning | ChatGPT | Claude Sonnet | Roadmaps, milestones, task decomposition |
| Documentation | ChatGPT | VS Code + Qwen 14B | Markdown, developer guides, user documentation |
| Single-file coding | VS Code + Qwen 14B | VS Code + Claude Sonnet | Explain code, small edits, documentation, local/private code |
| Multi-file coding | Cursor Composer Standard | Cursor Composer Fast | Feature implementation, coordinated changes across multiple files |
| Complex implementation | VS Code + Claude Sonnet | Cursor Composer | Difficult algorithms, architectural refactoring, advanced debugging |
| Code review | Claude Sonnet | ChatGPT | Review design, identify bugs, improve maintainability |
| Testing | Cursor Composer | Claude Sonnet | Unit tests, integration tests, test coverage |
| Deployment | Cursor Composer | ChatGPT | CI/CD, deployment scripts, release documentation |
| Final engineering review | Human Developer | ChatGPT | Final design validation and engineering judgment |

## General Tool Selection

| If you need to... | Recommended tool |
|---|---|
| Brainstorm products, requirements, architecture, APIs, or databases | ChatGPT |
| Explain or refactor a single file | VS Code + Continue + Qwen 14B |
| Work with sensitive or private code | VS Code + Continue + Qwen 14B |
| Understand multiple files or perform complex debugging | VS Code + Continue + Claude Sonnet |
| Implement features spanning multiple files | Cursor Composer Standard |
| Rapid implementation where speed is critical | Cursor Composer Fast |
| Perform code reviews | Claude Sonnet |
| Produce technical documentation | ChatGPT |
| Make the final engineering decision | Human Developer |

## VS Code + Qwen 14B

Use VS Code + Qwen 14B when working on routine, local, or privacy-sensitive tasks.

### Good Fit

- explaining existing code
- learning an unfamiliar file
- writing Markdown
- creating JSON
- updating README files
- small refactoring
- simple bug fixes
- unit test generation
- working offline
- working with sensitive or proprietary code

### Advantages

- free after installation
- runs locally
- fast response time
- no Internet required
- no API cost

### Limitations

- smaller context window
- weaker reasoning
- not suitable for large multi-file projects
- may struggle with complex architecture

## VS Code + Claude Sonnet

Use VS Code + Claude Sonnet when stronger reasoning or broader context is required.

### Good Fit

- working across multiple files
- understanding a large codebase
- designing new features
- performing architectural refactoring
- debugging difficult problems
- reviewing pull requests
- evaluating design alternatives
- implementing complex business logic
- working with Flutter, Firebase, or PostgreSQL where cross-file reasoning is required

### Advantages

- excellent reasoning
- strong architectural understanding
- large effective context window
- high-quality code reviews
- better handling of complex TypeScript and Flutter projects

### Trade-Offs

- requires Internet access
- API usage costs money
- should be reserved for problems where the additional capability provides clear value

## Escalation Strategy

Start with the lowest-cost tool that is likely to solve the task successfully.

Recommended progression:

1. Qwen 14B or another suitable local model
2. GPT-4o-mini or comparable low-cost cloud model when appropriate
3. Claude Sonnet for stronger reasoning, large context, and code review
4. GPT-5 reasoning for exceptionally difficult engineering problems
5. Codex only when high-value agentic implementation is justified

## Related Documents

- [AI_Roles.md](./AI_Roles.md)
- [Cost_Optimization.md](./Cost_Optimization.md)
- [Context_Checklist.md](./Context_Checklist.md)

## Parent

- [AI Engineering Handbook](README.md)
