# Boundaries, systems and separating construction from use

Apply the book's boundary and system-design principles without prescribing an application architecture. They apply to UI code, libraries, scripts, CLIs and services alike.

## Consumer-facing boundaries

- Let consumers depend on the capabilities they need rather than the full shape of an external dependency.
- Isolate third-party details when doing so reduces concrete coupling, protects an unstable dependency or clarifies translation. Do not wrap every library automatically.
- Keep boundary assumptions visible and use focused tests to characterise unfamiliar dependency behaviour.
- An existing boundary may be intentionally thin. Evaluate its contract and reason to change before calling it redundant.
- Avoid leaking mutable internal representations that let callers bypass an object's promised behaviour.

These are practical interpretations of Chapters 6 and 8, not instructions to introduce repositories, adapters or separate projects.

## Construction and use

- Separate object construction and dependency wiring from the code that uses those objects when it improves clarity and testability.
- Constructors should establish usable state, not hide unrelated processing or expensive side effects.
- Make dependencies explicit; avoid hidden service lookup and ambient mutable state.
- Use dependency injection where useful, without requiring a container or registration framework.
- Let system structure grow from demonstrated needs. Do not add layers or extension mechanisms for hypothetical future requirements.
- Use cohesive responsibilities and intentional extension points rather than scattered special cases.

Chapter 11 discusses system construction, dependency injection, cross-cutting concerns, emergent architecture and domain-specific languages. Those topics do not require adopting DDD or establish a detailed service-layer ownership model. For an adopted/requested Clean Architecture target, load [clean-architecture](../../clean-architecture/SKILL.md) (bundled companion skill) for architectural ownership and use-case boundaries. Do not impose that architecture on other targets.

## Contracts and translation

- Keep interfaces small enough to express a coherent consumer need.
- Name contracts for their meaning and observable effects, not incidental implementation mechanics.
- Translate when representations have genuinely different meanings or contracts; do not create mapping layers solely to copy identical properties.
- Express data ownership and mutation guarantees clearly; an exposed read-only view may still refer to shared mutable state.
- Translate at boundaries when meanings, representations or contracts genuinely differ. Choose the implementation that best preserves clarity, correctness and existing guarantees.
- Preserve existing translation contracts and repository decisions unless their change is authorised.

These are language-independent design considerations, not requirements to adopt a particular representation or translation mechanism.

## Scope and compatibility safeguards

- Preserve public and externally consumed contracts unless the task intentionally changes them.
- Understand existing ownership and dependencies before moving behaviour. A clearer local method does not justify an unrequested architectural migration.
- Use the project's existing persistence, transport, hosting and error conventions rather than selecting alternatives here.

Use [abstraction decisions](abstraction-decisions.md) for the cost of a new seam. Implementation-specific decisions are outside this skill's implementation-quality scope; follow repository conventions.
