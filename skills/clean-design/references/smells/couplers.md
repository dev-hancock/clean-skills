# Couplers

Use when the evidence matches this category. These are diagnostic signals, not mandatory transformations. Technique names refer to the [catalogue](https://refactoring.guru/refactoring/techniques) and the local technique links in the Resolve entries. Open only the guide containing the selected remedy if details are needed.

## Feature Envy

- **Recognise and diagnose:** A component repeatedly reads another owner’s internals to make a decision that belongs with that owner.
- **Prevent:** Place a decision with the component that owns its meaning and invariants; expose intent-level operations.
- **Resolve:** [Move Method](../techniques/moving-features-between-objects.md) or [Extract Method](../techniques/composing-methods.md) followed by [Move Method](../techniques/moving-features-between-objects.md).
- **Guardrails and verification:** Mapping, formatting, queries and orchestration legitimately use foreign data. Do not move these across architectural boundaries merely to increase local cohesion.

Source: [Refactoring.Guru — Feature Envy](https://refactoring.guru/smells/feature-envy).

## Inappropriate Intimacy

- **Recognise and diagnose:** Components depend on each other’s internal representation, lifecycle or mutation details, making independent changes difficult.
- **Prevent:** Keep internals private, establish explicit contracts and avoid unnecessary reciprocal dependencies.
- **Resolve:** [Move Method](../techniques/moving-features-between-objects.md)/Field, [Extract Class](../techniques/moving-features-between-objects.md), [Encapsulate Field](../techniques/organizing-data.md), [Change Bidirectional Association to Unidirectional](../techniques/organizing-data.md).
- **Guardrails and verification:** Tightly cohesive internal collaborators may share knowledge deliberately. Check invariants and boundary ownership; do not hide dependencies behind global state.

Source: [Refactoring.Guru — Inappropriate Intimacy](https://refactoring.guru/smells/inappropriate-intimacy).

## Message Chains

- **Recognise and diagnose:** Clients navigate several objects to reach a decision or action, depending on the structure of each intermediate owner.
- **Prevent:** Expose meaningful operations or query projections at the right boundary; minimise knowledge of internal topology.
- **Resolve:** [Hide Delegate](../techniques/moving-features-between-objects.md) or [Extract Method](../techniques/composing-methods.md) and [Move Method](../techniques/moving-features-between-objects.md) to the responsible owner.
- **Guardrails and verification:** Fluent pipelines, query builders and transparent immutable data traversal may be fine. Do not add a forwarding method at every level; check null and lazy-loading semantics.

Source: [Refactoring.Guru — Message Chains](https://refactoring.guru/smells/message-chains).

## Middle Man

- **Recognise and diagnose:** A component only mirrors another API without translating, protecting or reducing meaningful coupling.
- **Prevent:** Make the purpose of each wrapper explicit: boundary, policy, lifecycle, translation or other concrete benefit.
- **Resolve:** [Remove Middle Man](../techniques/moving-features-between-objects.md), [Inline Class](../techniques/moving-features-between-objects.md) or call an appropriate dependency directly.
- **Guardrails and verification:** Ports, proxies, decorators, facades and anti-corruption layers may legitimately delegate. Do not remove an architectural seam or expose vendor types where independence is required.

Source: [Refactoring.Guru — Middle Man](https://refactoring.guru/smells/middle-man).

Category source: https://refactoring.guru/refactoring/smells/couplers
