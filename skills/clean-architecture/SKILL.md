---
name: clean-architecture
description: 'Selective, language-agnostic architectural reasoning for substantive responsibility boundaries, dependency direction, use-case ownership, cross-component guarantees and change isolation. Not for routine coding or an extra delivery workflow.'
argument-hint: 'boundary, policy, dependency, system design or architecture review'
---

# Clean Architecture — on-demand architectural reasoning

Protect important policies from unrelated mechanisms and change. Follow the project's approved boundaries unless a change is authorised. Apply Clean Architecture principles proportionately, not as a mandate for layers, projects, adapters or patterns. This is a reference skill, **not** an additional eight-step process or independent approval gate.

Use when the task involves consequential dependency direction, component ownership, use-case boundaries, integration contracts, durable state/consistency or system evolution. For local structural decisions use [design](../clean-design/references/design.md) or [abstraction decisions](../clean-design/references/abstraction-decisions.md); for implementation quality use the matching [clean-code reference](../clean-code/SKILL.md) only if the concern is not already known. Neither requires a separate architecture pass within stable boundaries.

## A focused architectural question

Identify the affected policy and consumers, actual dependencies, change drivers, state/failure semantics and concrete constraints. Test the proposed boundary against those facts. Present the simplest viable design, trade-offs and evidence needed to validate claims. A material review should look for counterexamples and failure modes, not confirm that a named pattern appears.

Do not infer authorisation to refactor. Do not invent reliability guarantees or new scope to achieve theoretical architectural purity. Reuse existing architecture when fit for purpose. A diagram or project layout is not proof of isolation.

## Load only the matching reference

| Concern | Reference |
| --- | --- |
| Book principles, component cohesion/coupling (REP/CCP/CRP, ADP/SDP/SAP) | [Book principles](references/book-principles.md) |
| Boundary contracts, external dependency isolation and construction | [Boundaries and systems](references/architecture.md) |
| Boundaries, use cases, dependencies, composition and change drivers | [Boundaries and use cases](references/boundaries-and-use-cases.md) |
| Domain policies, state, identity and events | [Domain and events](references/domain-and-events.md) |
| Storage, transactions, concurrency, consistency | [Persistence and consistency](references/persistence-and-consistency.md) |
| External services, configuration, hosted work | [Infrastructure and workers](references/infrastructure-and-workers.md) |
| Asynchronous delivery, durable messaging, workflows | [Messaging and workflows](references/messaging-and-workflows.md) |
| Error semantics, failure handling and observation | [Errors and observability](references/errors-and-observability.md) |

These references distinguish Robert C. Martin's book principles from supplementary reliability practices; neither prescribes the project's technology stack.

## Boundaries and handoff

For local SOLID trade-offs use [SOLID](../clean-design/references/solid.md); for implementation evidence use [testing](../clean-code/references/testing.md) or [verification](../clean-code/references/verification.md) when relevant. [clean-workflow](../clean-workflow/SKILL.md) owns formal planning, handoffs and approval procedures. Existing agents own execution. Do not add parallel authorisations, documents, review loops or automatic migrations because this skill is installed. If companions are unavailable, apply existing architecture and repository policy and disclose material uncertainty.

## Context loading

Open the smallest relevant reference directly, including sibling references; read its exclusions and risk checks. Scope, policy, contracts and evidence still govern direct use. Reuse still-valid context and checks. Expand only for unresolved risk, conflicting evidence, affected boundaries or declared broad scope. Stop when sufficient.
