# Simplifying conditional expressions

Select a technique only when it addresses an evidenced cause. Apply it prospectively to new code where appropriate. For existing code, follow [refactoring safety](../refactoring-decisions.md). The following is original operational guidance keyed to the standard technique names.

| Technique | Apply when / approach | Guardrail |
| --- | --- | --- |
| Consolidate Conditional Expression | Combine conditions that implement one meaningful decision. | Preserve short-circuiting, ordering and individual error reasons. |
| Consolidate Duplicate Conditional Fragments | Move truly common work outside branches. | Ensure it occurs on exactly the same paths and at the same stage. |
| Decompose Conditional | Name predicates or branch operations to expose the decision. | Avoid hiding simple tests behind opaque helpers. |
| Replace Conditional with Polymorphism | Dispatch independently varying behaviour through an appropriate contract. | Compare with an exhaustive switch; avoid speculative variants. |
| Remove Control Flag | Express loop exit or search result directly with break, return or a suitable query. | Preserve cleanup, later iterations and post-loop behaviour. |
| Replace Nested Conditional with Guard Clauses | Return or reject exceptional cases early to expose the main path. | Preserve validation precedence and finally/disposal semantics. |
| Introduce Null Object | Supply a neutral implementation for legitimate optional behaviour. | Never convert missing required data or a failed operation into silent success. |
| Introduce Assertion | Make an internal assumption visible and executable where appropriate. | Do not rely on debug-only assertions for input validation or security. |

Catalogue source: [Refactoring.Guru — Simplifying conditional expressions](https://refactoring.guru/refactoring/techniques/simplifying-conditional-expressions).
