# Book principles

A concise, original guide to major ideas in Robert C. Martin's *Clean Architecture* (2017). Chapter references indicate provenance, not a transcription. Read the book for its full arguments and case studies. Distinguish these principles from the optional engineering concerns in other references.

## Architecture's purpose (Chapters 1–2, 15–18)

- Good architecture minimises the human cost of developing, deploying, operating, maintaining and changing software over time.
- Architecture and detailed design are continuous: local dependencies and decisions determine whether high-level boundaries really work.
- Separate independently evolving policies and use cases; keep significant options open until enough information justifies a commitment.
- Independence may be at source, component, deployment or operational boundaries. Choose its strength based on actual change and runtime needs, not a mandate to distribute the system.
- Repeated syntax is not necessarily duplicated policy; concepts that change for different reasons may need independent ownership even when code initially looks similar.

## Programming paradigms (Chapters 3–6)

- Structured programming makes control flow amenable to reasoning and tests.
- Object-oriented mechanisms can reverse source dependency relative to runtime calls; that capability serves policy independence, not inheritance for its own sake.
- Functional discipline helps isolate data transformations and reduce uncontrolled mutation. State and effects still require explicit ownership.
- These chapters do not require a single programming language, paradigm or framework.

## SOLID (Chapters 7–11)

See [SOLID principles](../../clean-design/references/solid.md) for the five principles and their shared trade-offs. At component scale, apply them to actual policy ownership, substitutability and dependency direction; use the component principles below for packaging and stability.

## Components: cohesion (Chapters 12–13)

- **Reuse/Release Equivalence (REP):** reusable components need coherent identity, releases and compatibility expectations.
- **Common Closure (CCP):** group things that change together for the same reasons so change does not scatter unnecessarily.
- **Common Reuse (CRP):** do not force consumers to depend on unrelated features merely because they share packaging.
- REP, CCP and CRP exert competing pressures. Balance them against the way the system is built, changed and distributed.

## Components: coupling (Chapter 14)

- **Acyclic Dependencies (ADP):** avoid component dependency cycles; investigate their real ownership and change consequences.
- **Stable Dependencies (SDP):** dependencies should tend toward components less subject to forced change; stability is about dependency pressure, not lack of development.
- **Stable Abstractions (SAP):** sufficiently stable components must permit required adaptation without forcing their consumers to change.
- The book discusses abstractness, instability and distance measures as diagnostic aids. They are **not universal gates**, numerical goals or reasons to introduce hollow abstractions.

## Policy, entities and use cases (Chapters 19–20)

- Separate policies by their level of business generality. Higher-level policy should not be constrained by a particular delivery, storage or execution mechanism.
- **Entities** express general business rules. They need not be DDD aggregates, ORM entities, classes or a specified project.
- **Use cases** express application-specific rules and coordinate the interaction needed to achieve an actor's goal.
- Treat an application's use-case input/output as policy-relevant meaning, not as uncontrolled external framework data.

## Screaming architecture and the Dependency Rule (Chapters 21–22)

- A system's organisation should communicate its use cases and purpose more clearly than the framework or technology it runs on.
- **The Dependency Rule:** source code dependencies point inward, toward higher-level policies. Inner policy does not name outer implementation types, nor accept outer data formats as its own.
- Runtime execution may flow outward through a contract controlled by the inner policy. Dependency direction and call direction are different concerns.
- The book's entity / use-case / interface-adapter / framework circles are illustrative, not a required four-package structure.
- Data crossing a boundary should be shaped to the boundary's needs, avoiding accidental coupling to another side's representation.

## Boundaries, composition and testing (Chapters 23–29)

- **Humble Object:** separate testable policy from difficult-to-test delivery/device glue; verify the glue through appropriately scoped tests.
- **Partial boundaries:** a boundary may be logical or less strictly enforced than a separately deployable component. Be explicit about which guarantees it does and does not provide.
- **Main component:** composition knows how to construct the system; it should not become the owner of its business rules.
- **Service boundaries:** remote deployment does not itself separate business concerns. A monolith may preserve strong policy independence; a distributed system may not.
- **Test boundary:** tests should exercise core policy without depending on delivery mechanisms while integration tests verify real adapters and composition.
- In embedded systems, operating system and hardware are details relative to the policy they serve.

## Databases, Web, frameworks and packaging (Chapters 30–34)

- Persistence, web delivery and frameworks matter operationally but should not decide higher-level business policy.
- Delay irreversible coupling where practical. Integrate external choices through boundaries that protect significant policy or known change drivers.
- Packaging should reinforce real cohesion and dependency direction; naming directories after layers does not establish an architecture.
- The book's examples and historical technologies are explanations, not instructions to replicate their structures.

## Attribution and boundaries of this guidance

Book-derived: separation of policies/mechanisms; Dependency Rule; SOLID; REP/CCP/CRP and ADP/SDP/SAP; entities/use cases; interface adapters; Humble Object; partial boundaries; main/composition; architectural independence and testability.

Supplementary, **not prescribed by the book**: specific domain-modelling styles, command/query patterns, event buses, repositories, messaging systems, transactional patterns, worker hosting, dependency injection frameworks, result libraries and observability stacks. Consider these only when the actual problem warrants them.

Primary sources:

- Robert C. Martin, *Clean Architecture: A Craftsman's Guide to Software Structure and Design*, Pearson, 2017. [Publisher's contents](https://www.informit.com/store/clean-architecture-a-craftsmans-guide-to-software-structure-9780134494166).
- Robert C. Martin, [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), 13 August 2012. Author's account of the Dependency Rule and boundary-crossing.
