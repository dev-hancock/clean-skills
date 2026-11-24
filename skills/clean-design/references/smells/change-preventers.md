# Change preventers

Use when the evidence matches this category. These are diagnostic signals, not mandatory transformations. Technique names refer to the [catalogue](https://refactoring.guru/refactoring/techniques) and the local technique links in the Resolve entries. Open only the guide containing the selected remedy if details are needed.

## Divergent Change

- **Recognise and diagnose:** One component is repeatedly modified for unrelated policy, storage, presentation or integration changes.
- **Prevent:** Group code by its actual reason to change and maintain a clear owner for each policy.
- **Resolve:** [Extract Class](../techniques/moving-features-between-objects.md), [Move Method](../techniques/moving-features-between-objects.md)/Field; extract a shared abstraction only where the common behaviour is real.
- **Guardrails and verification:** A use case coordinating several steps is not automatically divergent. Examine change history and responsibilities rather than counting dependencies.

Source: [Refactoring.Guru — Divergent Change](https://refactoring.guru/smells/divergent-change).

## Shotgun Surgery

- **Recognise and diagnose:** A single rule change requires coordinated edits across multiple owners because knowledge is scattered.
- **Prevent:** Make one component authoritative for each rule; let other components consume its result through appropriate boundaries.
- **Resolve:** [Move Method](../techniques/moving-features-between-objects.md), [Move Field](../techniques/moving-features-between-objects.md), [Inline Class](../techniques/moving-features-between-objects.md) or extract a coherent policy; remove repeated implementations of the rule.
- **Guardrails and verification:** A cross-cutting feature legitimately changes contracts, tests and boundary mappings. Do not centralise unrelated behaviour into a god service.

Source: [Refactoring.Guru — Shotgun Surgery](https://refactoring.guru/smells/shotgun-surgery).

## Parallel Inheritance Hierarchies

- **Recognise and diagnose:** Adding a subtype forces creation of corresponding subtypes elsewhere, with duplicated variant knowledge.
- **Prevent:** Prefer independent composition and explicit mapping where the dimensions of variation are independent.
- **Resolve:** [Move Method](../techniques/moving-features-between-objects.md)/Field, [Replace Inheritance with Delegation](../techniques/dealing-with-generalization.md), [Collapse Hierarchy](../techniques/dealing-with-generalization.md) where safe.
- **Guardrails and verification:** Separate representations across architectural boundaries may intentionally mirror concepts. Do not merge them if doing so reverses dependencies or obscures contracts.

Source: [Refactoring.Guru — Parallel Inheritance Hierarchies](https://refactoring.guru/smells/parallel-inheritance-hierarchies).

Category source: https://refactoring.guru/refactoring/smells/change-preventers
