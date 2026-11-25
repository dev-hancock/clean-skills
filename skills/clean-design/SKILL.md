---
name: clean-design
description: 'Implementation-level software design: responsibility allocation, SOLID, cohesion, coupling, abstraction, composition, object and data modelling, code smell prevention and diagnosis, technical debt and behaviour-preserving refactoring techniques. Use for structural decisions before and during coding or when improving existing design.'
argument-hint: 'design, smell, abstraction or refactoring decision'
---

# Clean Design

Produce cohesive code that is economical to understand and change. Prevent design defects during initial implementation; a smell is evidence to investigate, not an automatic instruction to transform code.

## Design judgement

Identify the owner of each decision, invariant and effect. Separate independent change drivers, then justify any indirection separately. Examine existing language, framework and repository capabilities before inventing mechanisms. Prefer the simplest structure that meets actual requirements and approved known variation. Preserve meaningful boundaries, even if thin.

For existing code, identify the symptom, root cause, consumers and concrete cost. Compare remedies against the whole design, not line counts or pattern names. Preserve observable contracts, including errors and effects; distinguish feature changes and bug fixes from refactoring. Apply prevention while generating code; correct introduced problems within scope instead of creating a ritual follow-up refactor.

## Foundations

| Concern | Reference |
| --- | --- |
| SOLID and shared trade-offs | [SOLID](references/solid.md) |
| Objects, data, class design and composition | [Design principles](references/design.md) |
| Responsibility separation and existing capabilities | [Abstraction decisions](references/abstraction-decisions.md) |
| Preventative choices and competing smells | [Preventative design](references/preventative-design.md) |
| Successive refinement and stop criteria | [Emergent design](references/emergent-design.md) |
| Technical debt and safe transformations | [Refactoring decisions](references/refactoring-decisions.md) |
| Supplementary practical diagnostics | [Additional diagnostics](references/additional-diagnostics.md) |
| Structural-change risk | [Structural verification](references/verification.md) |
| Optional language illustrations | [C# examples](references/csharp-examples.md) |

## Reference routing

Choose the matching smell category, then read only a technique group that contains the selected remedy if further detail is needed. If the technique is already known, open its group directly; do not load every group named in a row. Foundation references are alternatives selected by concern, not mandatory prerequisites. Each reference is self-contained; source links are for provenance, not required reading at execution time.

| Signal | Smell guidance | Technique guidance |
| --- | --- | --- |
| Oversized methods/classes, primitive modelling, parameter friction | [Bloaters](references/smells/bloaters.md) | [Methods](references/techniques/composing-methods.md), [Data](references/techniques/organizing-data.md), [Calls](references/techniques/simplifying-method-calls.md) |
| Repeated type decisions, invalid inheritance, conditional state | [Object orientation](references/smells/oo-abusers.md) | [Conditionals](references/techniques/simplifying-conditional-expressions.md), [Generalization](references/techniques/dealing-with-generalization.md) |
| Scattered changes, mixed reasons to change, linked hierarchies | [Change preventers](references/smells/change-preventers.md) | [Moving features](references/techniques/moving-features-between-objects.md), [Generalization](references/techniques/dealing-with-generalization.md) |
| Duplication, unnecessary classes, redundant comments or unused code | [Dispensables](references/smells/dispensables.md) | [Methods](references/techniques/composing-methods.md), [Moving features](references/techniques/moving-features-between-objects.md) |
| Leaky ownership, navigation chains, forwarding layers | [Couplers](references/smells/couplers.md) | [Moving features](references/techniques/moving-features-between-objects.md), [Data](references/techniques/organizing-data.md) |
| Missing library capability | [Other smells](references/smells/other.md) | [Moving features](references/techniques/moving-features-between-objects.md) |

## Boundaries

[Architectural boundaries](../clean-architecture/references/boundaries-and-use-cases.md) govern cross-component policy and dependency direction. For language standards use applicable installed language skills; for correctness use [reliability](../clean-code/references/reliability.md), [testing](../clean-code/references/testing.md), [verification](../clean-code/references/verification.md) or [review classifications](../clean-code/references/review-standards.md) according to the concern. [clean-workflow](../clean-workflow/SKILL.md) owns formal review/refactor procedures, reports and handoffs. Do not create a second workflow or severity system. Design advice alone never authorises edits or changed behaviour.

Load only the matching guidance, including during ordinary implementation. If a sibling is unavailable, preserve contracts, follow repository rules and disclose material limits. Finish when the design meets requirements and any residual trade-off is justified; use relevant verification, not a mandatory all-smells audit.

## Context loading

Open the smallest relevant reference directly, including sibling references; read its exclusions and risk checks. Scope, policy, contracts and evidence still govern direct use. Reuse still-valid context and checks. Expand only for unresolved risk, conflicting evidence, affected boundaries or declared broad scope. Stop when sufficient.
