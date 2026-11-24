# Object-orientation abusers

Use when the evidence matches this category. These are diagnostic signals, not mandatory transformations. Technique names refer to the [catalogue](https://refactoring.guru/refactoring/techniques) and the local technique links in the Resolve entries. Open only the guide containing the selected remedy if details are needed.

## Switch Statements

- **Recognise and diagnose:** A type discriminator is repeatedly interpreted or branches grow independently, spreading the rules for variants.
- **Prevent:** Centralise closed-set decisions; use composition or polymorphism when behaviour actually varies independently.
- **Resolve:** [Extract Method](../techniques/composing-methods.md), [Move Method](../techniques/moving-features-between-objects.md), [Replace Conditional with Polymorphism](../techniques/simplifying-conditional-expressions.md), or [Replace Type Code with State/Strategy](../techniques/organizing-data.md).
- **Guardrails and verification:** Simple exhaustive switches, parsing and boundary mapping may be clearest as written. Preserve defaults, unknown values and short-circuiting.

Source: [Refactoring.Guru — Switch Statements](https://refactoring.guru/smells/switch-statements).

## Temporary Field

- **Recognise and diagnose:** An instance stores scratch data or members valid only while one operation runs, introducing temporal coupling.
- **Prevent:** Keep per-call state local, or use an operation-scoped object when several steps share it. Model real lifecycle states explicitly.
- **Resolve:** [Extract Class](../techniques/moving-features-between-objects.md) or [Replace Method with Method Object](../techniques/composing-methods.md); [Introduce Null Object](../techniques/simplifying-conditional-expressions.md) only for a genuine neutral behaviour.
- **Guardrails and verification:** Optional domain data is not inherently a smell. Verify reentrancy, concurrency and lifecycle semantics; avoid replacing legitimate absence with fabricated values.

Source: [Refactoring.Guru — Temporary Field](https://refactoring.guru/smells/temporary-field).

## Refused Bequest

- **Recognise and diagnose:** A subtype rejects inherited operations, requires special cases or weakens the base contract because inheritance was used for reuse.
- **Prevent:** Inherit only where the subtype honours the whole relevant contract; compose reusable behaviour otherwise.
- **Resolve:** [Replace Inheritance with Delegation](../techniques/dealing-with-generalization.md), [Extract Superclass](../techniques/dealing-with-generalization.md) or [Push Down Method](../techniques/dealing-with-generalization.md)/Field.
- **Guardrails and verification:** Framework hooks with documented defaults may be valid. Verify substitutability, exceptions, dispatch and compatibility.

Source: [Refactoring.Guru — Refused Bequest](https://refactoring.guru/smells/refused-bequest).

## Alternative Classes with Different Interfaces

- **Recognise and diagnose:** Equivalent capabilities require incompatible calling conventions, usually from separately evolved implementations.
- **Prevent:** Search existing capabilities first; establish shared terminology and semantics when callers truly need interchangeability.
- **Resolve:** [Rename Method](../techniques/simplifying-method-calls.md), [Parameterize Method](../techniques/simplifying-method-calls.md), [Extract Interface](../techniques/dealing-with-generalization.md) or use a focused adapter; consolidate actual duplicates.
- **Guardrails and verification:** Different domains or failure contracts may require different APIs despite similar signatures. Do not force a lowest-common-denominator interface.

Source: [Refactoring.Guru — Alternative Classes with Different Interfaces](https://refactoring.guru/smells/alternative-classes-with-different-interfaces).

Category source: https://refactoring.guru/refactoring/smells/oo-abusers
