# Bloaters

Use when the evidence matches this category. These are diagnostic signals, not mandatory transformations. Technique names refer to the [catalogue](https://refactoring.guru/refactoring/techniques) and the local technique links in the Resolve entries. Open only the guide containing the selected remedy if details are needed.

## Long Method

- **Recognise and diagnose:** Multiple levels of abstraction, phases, branching or mutable intermediates obscure an operation. Incremental additions often hide separate decisions.
- **Prevent:** Keep orchestration visible; express cohesive calculations and decisions as named operations. Prefer locals with a single meaning.
- **Resolve:** [Extract Method](../techniques/composing-methods.md), [Extract Variable](../techniques/composing-methods.md), [Decompose Conditional](../techniques/simplifying-conditional-expressions.md) or [Replace Method with Method Object](../techniques/composing-methods.md) when local state is genuinely intertwined.
- **Guardrails and verification:** Do not extract arbitrary blocks to meet a line limit; preserve evaluation order, early exits and side effects. A linear cohesive operation may be long.

Source: [Refactoring.Guru — Long Method](https://refactoring.guru/smells/long-method).

## Large Class

- **Recognise and diagnose:** Unrelated clusters of fields and methods, or independent reasons for change, indicate misplaced responsibilities.
- **Prevent:** Identify owners before adding members; separate independent policies from coordination and I/O.
- **Resolve:** [Extract Class](../techniques/moving-features-between-objects.md), [Move Method](../techniques/moving-features-between-objects.md), [Move Field](../techniques/moving-features-between-objects.md); consider [Extract Interface](../techniques/dealing-with-generalization.md) for genuinely distinct client contracts.
- **Guardrails and verification:** Size alone is not proof. Keep cohesive state and invariants together; splitting an aggregate into collaborating fragments can weaken correctness.

Source: [Refactoring.Guru — Large Class](https://refactoring.guru/smells/large-class).

## Primitive Obsession

- **Recognise and diagnose:** Values with distinct units, constraints or meanings share interchangeable primitive types; validation and conversion recur.
- **Prevent:** Model significant concepts with appropriate existing types or value objects; make invalid combinations difficult to express.
- **Resolve:** [Replace Data Value with Object](../techniques/organizing-data.md), [Replace Type Code with Class](../techniques/organizing-data.md), or use a named constant for a stable literal.
- **Guardrails and verification:** Retain primitives for simple values and boundary representations. Preserve equality, defaults, units, serialization and conversion behaviour.

Source: [Refactoring.Guru — Primitive Obsession](https://refactoring.guru/smells/primitive-obsession).

## Long Parameter List

- **Recognise and diagnose:** Callers struggle to supply ordered arguments, multiple flags or recurring groups; the operation may be doing unrelated work.
- **Prevent:** Accept cohesive inputs, keep required dependencies explicit and avoid flags selecting unrelated operations.
- **Resolve:** [Introduce Parameter Object](../techniques/simplifying-method-calls.md), [Preserve Whole Object](../techniques/simplifying-method-calls.md), [Remove Parameter](../techniques/simplifying-method-calls.md) or [Replace Parameter with Explicit Methods](../techniques/simplifying-method-calls.md).
- **Guardrails and verification:** Do not bundle unrelated services or pass an oversized object merely to reduce arity. Explicit independent dependencies and cancellation parameters are legitimate.

Source: [Refactoring.Guru — Long Parameter List](https://refactoring.guru/smells/long-parameter-list).

## Data Clumps

- **Recognise and diagnose:** The same related values travel through several signatures, fields or operations, losing their shared meaning.
- **Prevent:** Represent a stable concept as a named value with only the fields that belong together.
- **Resolve:** [Introduce Parameter Object](../techniques/simplifying-method-calls.md), [Extract Class](../techniques/moving-features-between-objects.md), [Preserve Whole Object](../techniques/simplifying-method-calls.md); move related validation or calculations with the new concept.
- **Guardrails and verification:** Coincidental proximity is insufficient. Avoid sharing transport DTOs between unrelated boundaries; test invariants and equality.

Source: [Refactoring.Guru — Data Clumps](https://refactoring.guru/smells/data-clumps).

Category source: https://refactoring.guru/refactoring/smells/bloaters
