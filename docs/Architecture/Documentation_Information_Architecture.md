# Documentation Information Architecture

> **Status:** Canonical  
> **Owner:** Engineering Documentation Framework  
> **Authoritative:** Yes

---

# Purpose

This document defines the canonical documentation information architecture for the Engineering Documentation Framework (EDF).

It serves as the authoritative specification for how documentation is organized, structured, related, generated, analyzed, governed, and maintained throughout the lifecycle of an engineering project.

All projects adopting EDF should organize their documentation in accordance with this architecture unless there is a documented architectural decision approving a deviation.

---

# Objectives

The documentation architecture is designed to:

- Provide a consistent documentation structure across projects.
    
- Improve discoverability and navigation.
    
- Support long-lived engineering projects.
    
- Minimize duplication.
    
- Encourage modular documentation.
    
- Improve maintainability.
    
- Provide an architecture that is easy for both humans and AI systems to understand.
    
- Serve as the foundation for governance, generation, and analysis tools.
    

---

# Architectural Principles

The documentation architecture follows these guiding principles:

1. The repository is the single source of truth.
    
2. Documentation architecture is as important as software architecture.
    
3. Documentation is modular.
    
4. Each document has a single primary responsibility.
    
5. Every concept has one authoritative source.
    
6. Documentation should evolve continuously.
    
7. Existing project content is never overwritten automatically.
    
8. AI assists; humans retain final authority.
    
9. The framework should be data-driven rather than hardcoded.
    
10. Existing projects should be improved incrementally rather than requiring wholesale restructuring.
    

---

# Canonical Repository Structure

```text
README.md
PROJECT_INDEX.md
PROJECT_CHARTER.md
ARCHITECTURE_DECISIONS.md
CHANGELOG.md

docs/
    AI/
    API/
    Architecture/
    Database/
    Deployment/
    Development/
    Reference/
    Specifications/
    Templates/
    User_Guides/

tasks/

archive/

scripts/
```

This structure represents the canonical organization of an EDF repository.

---

# Documentation Domains

Documentation is organized into domains based on responsibility rather than document type.

Each domain contains a `README.md` that serves as its navigation hub.

Typical domains include:

- AI
    
- Architecture
    
- API
    
- Database
    
- Deployment
    
- Development
    
- Reference
    
- Specifications
    
- Templates
    
- User Guides
    

---

# Navigation Architecture

Documentation should form a consistent navigation hierarchy.

```text
README.md
        │
        ▼
PROJECT_INDEX.md
        │
        ▼
Domain README
        │
        ▼
Individual Documents
```

Every document should, where appropriate, include:

- Parent document
    
- Related documents
    
- Authoritative references
    
- Breadcrumb navigation
    

Navigation should be generated automatically whenever practical.

---

# Documentation as a Knowledge Graph

EDF views documentation as a connected knowledge graph rather than an isolated collection of Markdown files.

Documents should reference related concepts rather than duplicate them.

Cross-references should make relationships between architecture, specifications, APIs, deployment, governance, and development clear and easy to follow.

---

# Canonical Documents

The following documents define the framework itself:

- README.md
    
- PROJECT_INDEX.md
    
- PROJECT_CHARTER.md
    
- ARCHITECTURE_DECISIONS.md
    
- CHANGELOG.md
    
- Documentation Information Architecture
    
- (Future) Governance Handbook
    

These documents serve as authoritative references for the framework.

---

# Framework-Owned vs. Project-Owned Artifacts

EDF distinguishes between framework-owned and project-owned artifacts.

## Framework-Owned

Examples include:

- Templates
    
- Generators
    
- Analyzer
    
- Governance definitions
    
- Framework documentation
    

These evolve as EDF evolves.

## Project-Owned

Examples include:

- Generated documentation
    
- Project architecture
    
- Project requirements
    
- Project decisions
    
- Project-specific guides
    

Once generated, these belong to the adopting project.

EDF generators must never overwrite them automatically.

---

# Generation Philosophy

Documentation generators shall:

- Create missing documentation.
    
- Populate navigation.
    
- Generate links.
    
- Never overwrite existing project content.
    
- Never rename existing files.
    
- Never delete existing files.
    
- Never move existing files automatically.
    

Generated documentation becomes project-owned.

---

# Analyzer Philosophy

The Framework Advisor (Analyzer) is advisory rather than prescriptive.

Its responsibilities include:

- Structural analysis
    
- Documentation completeness
    
- Governance compliance
    
- Navigation validation
    
- Link validation
    
- Template compliance
    
- Documentation health
    
- Documentation debt identification
    

The analyzer recommends improvements but does not automatically modify documentation.

---

# Incremental Adoption

EDF supports:

- New repositories
    
- Existing repositories
    
- Legacy repositories
    

Projects should be able to adopt EDF incrementally without requiring large-scale reorganization.

---

# Data-Driven Framework

EDF should minimize hardcoded assumptions.

Framework behavior should instead be driven by:

- Templates
    
- Specifications
    
- Governance
    
- Configuration
    
- Documentation standards
    

This improves flexibility, maintainability, and future evolution.

---

# AI-Friendly but AI-Independent

EDF is designed to benefit both humans and AI.

Well-structured documentation improves:

- Human understanding
    
- AI context retrieval
    
- Documentation generation
    
- Project analysis
    
- Long-term maintenance
    

However, the framework does not require AI in order to remain useful.

---

# Framework Self-Hosting

Before the Engineering Documentation Framework reaches Version 1.0, the framework repository shall fully comply with its own standards.

Self-hosting includes:

- Canonical structure
    
- Navigation
    
- Governance
    
- Templates
    
- Analyzer compliance
    
- Link validation
    
- Documentation completeness
    

The framework should successfully analyze itself with no significant compliance issues.

---

# Related Documents

- README.md
    
- PROJECT_INDEX.md
    
- ARCHITECTURE_DECISIONS.md
    
- Documentation First Development Policy
    
- Governance Handbook (planned)
    
- Framework Advisor documentation (planned)
    

---

# Future Evolution

This document defines the canonical documentation architecture.

Future enhancements should extend this architecture without compromising the core principles of:

- Single authoritative sources
    
- Modular organization
    
- Incremental adoption
    
- Non-destructive tooling
    
- Human oversight
    
- Continuous improvement