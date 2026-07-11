# ADR-0001-Domain-Profiles

| | |
|---|---|
| **Status** | Proposed |
| **Date** | YYYY-MM-DD |
| **Decision Makers** | Ed Becnel |
| **Supersedes** | None |
| **Superseded By** | None |

---

# Context

The Engineering Documentation Framework (EDF) was originally designed to improve documentation quality, governance, maintainability, and consistency for software engineering projects.

As the framework has been applied to a growing number of real-world projects, it has demonstrated that its core documentation philosophy is applicable far beyond software development.

Current projects using EDF principles include:

- Software engineering
- AI-assisted development
- Electronics and hardware design
- Educational platforms
- Documentation systems
- Recipe publishing
- Music education
- Marching percussion curriculum development
- AI workstation configuration

These projects differ substantially in their deliverables, workflows, and required documentation. However, they all benefit from the same core architectural principles.

This experience suggests that the Engineering Documentation Framework has evolved into a general-purpose documentation framework with engineering origins.

---

# Problem

As additional project types are supported, there is a temptation to continuously expand the EDF Core by adding documentation requirements that apply only to specific disciplines.

Examples include:

- API specifications
- Musical arranging guides
- Recipe schemas
- Educational curriculum
- Laboratory notebooks
- Manufacturing procedures

Including every discipline-specific document within the EDF Core would increase complexity, reduce clarity, and make the framework more difficult to maintain.

---

# Decision

The EDF shall evolve using a layered architecture consisting of:

```text
Engineering Documentation Framework
│
├── EDF Core
│
├── Domain Profiles
│
└── Project Customizations
```

The EDF Core remains domain-independent.

Domain Profiles extend the Core by defining documentation appropriate for a particular discipline.

Individual projects may further customize the selected profile to satisfy project-specific requirements.

This ADR establishes the architectural direction only.

It does **not** define the implementation details of Domain Profiles.

---

# Rationale

Separating the framework into layers provides several advantages.

## Stability

The EDF Core remains concise, stable, and broadly applicable.

---

## Extensibility

New domains can be supported without modifying existing framework guidance.

---

## Reusability

Projects within the same discipline can reuse a common profile instead of repeatedly defining similar documentation.

---

## Maintainability

Domain-specific guidance can evolve independently of the EDF Core.

---

## Consistency

Projects using the same Domain Profile naturally share terminology, organization, and documentation standards.

---

# Architectural Model

The long-term architecture becomes:

```text
EDF Core
        │
        ├──────────────┐
        │              │
Software Profile       Music Education Profile
        │              │
Web Profile            Research Profile
        │              │
Hardware Profile       Book Authoring Profile
        │              │
Embedded Profile       Recipe Publishing Profile
```

Projects are built by combining the EDF Core with one or more Domain Profiles.

For example:

```text
EDF Core
        │
        ▼
Music Education Profile
        │
        ▼
Philippine Marching Percussion Fusion Project
```

The Philippine Marching Percussion Fusion Project is **not** the Music Education Profile.

Rather, it is one implementation that uses the profile.

This distinction enables future music-related projects to reuse the same profile without duplication.

---

# Examples of Candidate Domain Profiles

Potential profiles include:

- Software Development
- Web Applications
- Embedded Systems
- Electronics Design
- AI & Machine Learning
- Music Education
- Scientific Research
- Recipe Publishing
- Book Authoring
- Historical Archive
- Educational Curriculum

Additional profiles may be introduced as the framework evolves.

---

# Alternatives Considered

## Alternative 1 — Continue Expanding the EDF Core

Rejected.

Adding every domain-specific document to the EDF Core would make the framework increasingly complex and difficult to maintain.

---

## Alternative 2 — Maintain Independent Framework Variants

Rejected.

Maintaining separate documentation frameworks for each discipline would duplicate effort and reduce consistency across projects.

---

## Alternative 3 — Introduce Domain Profiles

Accepted.

This approach preserves a stable core while allowing controlled specialization.

---

# Consequences

Positive outcomes include:

- Improved scalability
- Better separation of concerns
- Easier maintenance
- Greater reuse across disciplines
- Consistent governance

Potential challenges include:

- Defining the boundaries between the EDF Core and Domain Profiles.
- Establishing conventions for creating and validating new profiles.
- Ensuring documentation remains discoverable across multiple profile layers.

These implementation details are intentionally deferred to future ADRs.

---

# Future Work

This ADR establishes only the architectural direction.

Future ADRs may define:

- Domain Profile specification
- Profile metadata format
- Validation rules for profiles
- Profile packaging
- Profile inheritance and composition
- Profile discovery and registration

---

# Backward Compatibility

This decision is fully backward compatible.

Existing EDF projects continue to function without modification.

Domain Profiles are introduced as an optional extension mechanism and will be implemented only after the EDF Core reaches sufficient maturity.

---

# References

- Engineering Documentation Framework (EDF)
- Philippine Marching Percussion Fusion Project
- The Recipe Vault
- SpeakUp Connect
- Online Schematics Editor
- KiCad AI Integration

These projects collectively demonstrated that the EDF architecture is applicable across multiple domains while revealing the need for a structured extension mechanism.