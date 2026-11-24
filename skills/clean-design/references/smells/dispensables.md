# Dispensables

Use when the evidence matches this category. These are diagnostic signals, not mandatory transformations. Technique names refer to the [catalogue](https://refactoring.guru/refactoring/techniques) and the local technique links in the Resolve entries. Open only the guide containing the selected remedy if details are needed.

## Comments

- **Recognise and diagnose:** Narration explains confusing control flow or names, or repeats what the code says; it may become stale.
- **Prevent:** Make intent visible through names, types and structure; document constraints, rationale and surprising external behaviour.
- **Resolve:** [Extract Variable](../techniques/composing-methods.md), [Extract Method](../techniques/composing-methods.md), [Rename Method](../techniques/simplifying-method-calls.md), or express an invariant in executable validation where appropriate.
- **Guardrails and verification:** Retain useful why-comments, public contract documentation and legal notices. Do not turn explanatory comments into misleading or redundant names.

Source: [Refactoring.Guru — Comments](https://refactoring.guru/smells/comments).

## Duplicate Code

- **Recognise and diagnose:** The same rule is implemented more than once, even with different syntax, so edits risk inconsistent behaviour.
- **Prevent:** Search for existing owners; share semantic knowledge, not accidental text similarity.
- **Resolve:** [Extract Method](../techniques/composing-methods.md), [Move Method](../techniques/moving-features-between-objects.md), [Parameterize Method](../techniques/simplifying-method-calls.md), or [Form Template Method](../techniques/dealing-with-generalization.md) for a truly shared algorithm.
- **Guardrails and verification:** Independent rules that happen to look alike should remain independent. Compare edge cases and expected evolution before consolidating.

Source: [Refactoring.Guru — Duplicate Code](https://refactoring.guru/smells/duplicate-code).

## Lazy Class

- **Recognise and diagnose:** A type contributes no meaningful policy, contract, identity or isolation and increases navigation cost.
- **Prevent:** Create types for present responsibilities, not a target class count or hypothetical reuse.
- **Resolve:** [Inline Class](../techniques/moving-features-between-objects.md), [Inline Method](../techniques/composing-methods.md) or [Collapse Hierarchy](../techniques/dealing-with-generalization.md).
- **Guardrails and verification:** Small value objects, boundary adapters, handlers and narrow policies can be essential. Judge purpose rather than size; preserve DI and public contracts.

Source: [Refactoring.Guru — Lazy Class](https://refactoring.guru/smells/lazy-class).

## Data Class

- **Recognise and diagnose:** Domain state can be modified freely while its invariant enforcement or associated decisions are scattered in callers.
- **Prevent:** Assign invariant enforcement and domain operations to the appropriate owner; expose narrow mutation paths.
- **Resolve:** [Encapsulate Field](../techniques/organizing-data.md)/Collection, [Remove Setting Method](../techniques/simplifying-method-calls.md) and [Move Method](../techniques/moving-features-between-objects.md).
- **Guardrails and verification:** DTOs, commands, events, read models and projections intentionally carry data. Do not inject infrastructure or orchestration into domain state; preserve serialization needs.

Source: [Refactoring.Guru — Data Class](https://refactoring.guru/smells/data-class).

## Dead Code

- **Recognise and diagnose:** Unreachable branches or obsolete symbols remain after a requirement or implementation changed.
- **Prevent:** Remove superseded implementations and obsolete options in the same scoped change when safe.
- **Resolve:** Delete confirmed unused code; [Remove Parameter](../techniques/simplifying-method-calls.md), [Inline Class](../techniques/moving-features-between-objects.md) or [Collapse Hierarchy](../techniques/dealing-with-generalization.md) as necessary.
- **Guardrails and verification:** Static references alone are insufficient: check reflection, configuration, DI, generated code, serialization, plugins and external consumers.

Source: [Refactoring.Guru — Dead Code](https://refactoring.guru/smells/dead-code).

## Speculative Generality

- **Recognise and diagnose:** Extension points, configuration and generic layers exist only for hypothetical future needs, making current behaviour harder to follow.
- **Prevent:** Implement current requirements with a direct design. Introduce variation points only for established needs, architecture or a defined contract.
- **Resolve:** [Collapse Hierarchy](../techniques/dealing-with-generalization.md), [Inline Class](../techniques/moving-features-between-objects.md)/Method, [Remove Parameter](../techniques/simplifying-method-calls.md) or remove unused branches and interfaces.
- **Guardrails and verification:** Public library extension contracts, genuine architectural seams and mandated testability may justify a single implementation. Check consumers before deleting.

Source: [Refactoring.Guru — Speculative Generality](https://refactoring.guru/smells/speculative-generality).

Category source: https://refactoring.guru/refactoring/smells/dispensables
