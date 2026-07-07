# AI Workflow

This document defines how AI tools are intended to support software development across the lifecycle. It applies to any project adopting the Engineering Documentation Framework and should be customized with team-specific policies (data handling, approved models, etc.).

## Purpose

AI accelerates development when roles are clear, context is structured, and humans retain accountability. This workflow:

- Assigns **appropriate tools** to appropriate tasks.
- Reduces overlap and confusion between AI products.
- Ensures documentation remains the **source of truth** AI tools reference.
- Defines where **human judgment** is non-negotiable.

## Principles

1. **Human owns outcomes** — AI drafts; humans review, test, approve, and deploy.
2. **Context is deliberate** — Point AI at `PROJECT_INDEX.md`, ADRs, specs, and relevant code — not the entire repo blindly.
3. **No secrets in prompts** — Never paste credentials, PII, or unreleased proprietary data into cloud AI without policy approval.
4. **Same PR standards** — AI-generated code and docs go through the same review as human-written work.
5. **Document decisions** — Significant AI-influenced architecture choices still require ADRs.

---

## Primary AI Roles

Artificial intelligence is used throughout the Software Development Lifecycle (SDLC). Each AI tool has different strengths and should be selected based on the nature of the task rather than using a single model for everything.

The goal is to **use the least expensive AI that can comfortably solve the task**, while recognizing that developer time is also valuable. Spending a small amount on a more capable model is often justified if it significantly improves productivity or avoids costly design mistakes.

The following roles define the primary responsibility of each AI tool within this development workflow.

### ChatGPT – Engineering Advisor and Documentation Partner

**Primary Role**

ChatGPT serves as the primary engineering advisor throughout the software development lifecycle. It is used for high-level thinking, problem solving, architectural design, documentation, and technical decision making.

**Typical Responsibilities**

- Product vision and feature brainstorming
- Requirements analysis
- Software architecture
- Database design
- API design
- Design reviews and trade-off analysis
- Project planning and roadmaps
- Technical documentation
- Markdown documentation
- Architecture Decision Records (ADRs)
- Troubleshooting complex engineering problems
- Explaining technical concepts
- Reviewing implementation strategies

**Best Used When**

- Making engineering decisions
- Designing new systems
- Creating or reviewing documentation
- Evaluating alternative approaches
- Planning implementation before writing code

---

### Cursor Composer – Implementation and Agentic Coding

**Primary Role**

Cursor Composer is the primary AI tool for implementing software. It excels at coordinated, multi-file development and large-scale code changes within an existing project.

**Typical Responsibilities**

- Multi-file feature implementation
- Large refactoring tasks
- Cross-file updates
- Project-wide code generation
- Applying coordinated code changes
- Test generation
- Code modernization
- Repetitive implementation tasks

**Best Used When**

- Implementing planned features
- Modifying multiple related files
- Generating production-ready code
- Performing project-wide changes

---

### Visual Studio Code + Continue – Interactive Coding Assistant

**Primary Role**

Continue provides an interactive AI assistant directly within Visual Studio Code. It is intended for focused development tasks, code understanding, and iterative problem solving while working inside a specific project.

Depending on the complexity of the task, Continue may use either a local Ollama model or a cloud model such as Claude Sonnet.

**Typical Responsibilities**

- Explaining code
- Answering programming questions
- Reviewing selected code
- Refactoring individual functions
- Writing unit tests
- Debugging
- Interactive development assistance

**Best Used When**

- Working within the currently open project
- Exploring unfamiliar code
- Iterating on individual files or components
- Asking implementation-specific questions

---

### Local Ollama – Private, Low-Cost AI

**Primary Role**

Ollama provides local AI inference without requiring Internet access or API costs. It is intended for routine development tasks where privacy, speed, or operating cost are more important than advanced reasoning.

**Typical Responsibilities**

- Code explanation
- Documentation
- JSON generation
- Markdown editing
- README updates
- Small refactoring tasks
- Learning unfamiliar code
- Offline development

**Advantages**

- No API cost
- Private execution
- Works offline
- Fast response time
- Ideal for routine development support

**Limitations**

- Smaller context window
- Less capable reasoning than premium cloud models
- Not recommended for large multi-file architecture or complex design problems

---

### Human Developer – Final Engineering Judgment

**Primary Role**

Artificial intelligence assists the development process but does not replace engineering judgment. The human developer remains responsible for all final technical decisions.

**Responsibilities**

- Evaluate AI-generated recommendations
- Verify correctness
- Review security implications
- Validate architecture
- Approve implementation decisions
- Ensure maintainability
- Perform final testing
- Accept responsibility for released software

AI should be viewed as an engineering assistant rather than an autonomous software engineer. Final responsibility for software quality, security, correctness, and long-term maintainability always remains with the developer.

---

## Roles Across the Software Development Lifecycle

The following table describes the recommended primary AI tool for each stage of software development.

| SDLC Stage | Primary AI | Secondary AI | Typical Use Cases |
|------------|------------|--------------|-------------------|
| Vision & Product Ideas | ChatGPT | Claude Sonnet | Brainstorming, feature ideas, market analysis |
| Requirements Analysis | ChatGPT | Claude Sonnet | Functional requirements, user stories, acceptance criteria |
| Architecture & System Design | ChatGPT | Claude Sonnet | System architecture, technology selection, trade-off analysis |
| Database Design | ChatGPT | Claude Sonnet | Entity modeling, normalization, indexing strategies |
| API Design | ChatGPT | Claude Sonnet | REST APIs, validation rules, security, versioning |
| Project Planning | ChatGPT | Claude Sonnet | Roadmaps, milestones, task decomposition |
| Documentation | ChatGPT | VS Code + Qwen 14B | Markdown, developer guides, user documentation |
| Single-File Coding | VS Code + Qwen 14B | VS Code + Claude Sonnet | Explain code, small edits, documentation, local/private code |
| Multi-File Coding | Cursor Composer Standard | Cursor Composer Fast | Feature implementation, coordinated changes across multiple files |
| Complex Implementation | VS Code + Claude Sonnet | Cursor Composer | Difficult algorithms, architectural refactoring, advanced debugging |
| Code Review | Claude Sonnet | ChatGPT | Review design, identify bugs, improve maintainability |
| Testing | Cursor Composer | Claude Sonnet | Unit tests, integration tests, test coverage |
| Deployment | Cursor Composer | ChatGPT | CI/CD, deployment scripts, release documentation |
| Final Engineering Review | Human Developer | ChatGPT | Final design validation and engineering judgment |

### Regarding Claude Sonnet:

Use the latest generally available Claude Sonnet model.

Claude Sonnet is the preferred cloud model for:

- Architecture
- Complex debugging
- Cross-file reasoning
- Code reviews
- Large refactoring
- Difficult implementation tasks

Whenever a newer Sonnet release becomes generally available and demonstrates improved coding performance, update this guide to use the latest Sonnet version unless there is a documented reason to remain on an older release.

---

## Choosing Between VS Code + Qwen 14B and VS Code + Claude Sonnet

### Use VS Code + Qwen 14B when:

- Explaining existing code
- Learning an unfamiliar file
- Writing Markdown
- Creating JSON
- Updating README files
- Small refactoring
- Simple bug fixes
- Unit test generation
- Working offline
- Working with sensitive or proprietary code

Advantages:

- Free after installation
- Runs locally
- Fast response time
- No Internet required
- No API cost

Limitations:

- Smaller context window
- Weaker reasoning
- Not suitable for large multi-file projects
- May struggle with complex architecture

---

### Use VS Code + Claude Sonnet when:

- Working across multiple files
- Understanding a large codebase
- Designing new features
- Performing architectural refactoring
- Debugging difficult problems
- Reviewing pull requests
- Evaluating design alternatives
- Implementing complex business logic
- Working with Flutter, Firebase, or PostgreSQL where cross-file reasoning is required

Advantages:

- Excellent reasoning
- Strong architectural understanding
- Large effective context window
- High-quality code reviews
- Better handling of complex TypeScript and Flutter projects

Trade-offs:

- Requires Internet access
- API usage costs money
- Should be reserved for problems where the additional capability provides clear value

---

## Cost Optimization Strategy

Always begin with the least expensive AI that is likely to complete the task successfully.

Recommended progression:

1. Qwen 14B (local, free)
2. Claude Sonnet (when stronger reasoning or larger context is needed)
3. GPT-5 reasoning (only for exceptionally difficult engineering problems)
4. Codex (for high-value agentic implementation tasks)

The objective is not to minimize API usage at all costs. The objective is to minimize the total cost of development, including developer time. Spending a few cents on a stronger model is often justified if it avoids hours of redesign or debugging.


---


## AI Decision Matrix

| If you need to... | Recommended Tool |
|---|---|
| Brainstorm products, requirements, architecture, APIs, databases | ChatGPT |
| Explain or refactor a single file | VS Code + Continue + Qwen 14B |
| Work with sensitive/private code | VS Code + Continue + Qwen 14B |
| Understand multiple files or perform complex debugging | VS Code + Continue + Claude Sonnet |
| Implement features spanning multiple files | Cursor Composer Standard |
| Rapid implementation where speed is critical | Cursor Composer Fast |
| Perform code reviews | Claude Sonnet |
| Produce technical documentation | ChatGPT |
| Make the final engineering decision | Human Developer |

---

## Prompting Best Practices

- Start with the smallest amount of context necessary.
- Reference `PROJECT_INDEX.md` and relevant specifications.
- Ask for trade-off analysis before implementation.
- Keep documentation and code synchronized.
- Verify all AI-generated output before committing.

---

## Recommended Workflows

### New Feature

1. Define requirements.
2. Review architecture with ChatGPT if needed.
3. Record important decisions in `ARCHITECTURE_DECISIONS.md`.
4. Implement with Cursor Composer Standard.
5. Escalate to Claude Sonnet only when stronger reasoning is required.
6. Review, test, and commit.

### Existing Code Investigation

1. Begin with VS Code + Continue + Qwen 14B.
2. Escalate to Claude Sonnet for multi-file reasoning.
3. Document important findings.

### Documentation

1. Draft with ChatGPT.
2. Verify against the implementation.
3. Commit documentation with related code whenever practical.

---

## Context Checklist

- Relevant requirements
- Applicable ADRs
- Coding standards
- Only the files required for the task
- Clear success criteria

---

## Governance

- Human developers remain responsible for all released software.
- AI-generated code follows the same review standards as human-written code.
- Significant technical decisions belong in `ARCHITECTURE_DECISIONS.md`.
- Never submit secrets or regulated data to cloud AI without approval.

---

## Related Documents

- PROJECT_INDEX.md
- PROJECT_CHARTER.md
- ARCHITECTURE_DECISIONS.md
- docs/Developer_Handbook/02_AI_Development.md
- docs/Developer_Handbook/04_Coding_Standards.md
