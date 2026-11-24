# Composing methods

Select a technique only when it addresses an evidenced cause. Apply it prospectively to new code where appropriate. For existing code, follow [refactoring safety](../refactoring-decisions.md). The following is original operational guidance keyed to the standard technique names.

| Technique | Apply when / approach | Guardrail |
| --- | --- | --- |
| Extract Method | Name a cohesive step and pass its required inputs explicitly. | Preserve scope, side-effect order, exception boundaries and returns. |
| Inline Method | Remove a helper whose body communicates intent better than its name. | Keep polymorphic dispatch and shared contract intact. |
| Extract Variable | Name a meaningful intermediate expression. | Preserve short-circuiting and avoid eager evaluation. |
| Inline Temp | Remove an unnecessary local for a simple expression. | Do not repeat expensive, mutable or side-effectful evaluations. |
| Replace Temp with Query | Expose a reusable calculation as a focused query. | A repeated query must not accidentally change snapshot or I/O semantics. |
| Split Temporary Variable | Give independently meaningful intermediates separate names. | Retain intentional accumulators and loop state. |
| Remove Assignments to Parameters | Use an explicitly named local for transformed input. | Respect intentional ref/out and mutable-reference contracts. |
| Replace Method with Method Object | Give a complicated operation its own scoped state and steps. | Avoid shared mutable scratch state; prefer a simpler pure function if possible. |
| Substitute Algorithm | Use a simpler or better-supported equivalent algorithm. | Compare edge cases, ordering, numerical accuracy and cost. |

Catalogue source: [Refactoring.Guru — Composing methods](https://refactoring.guru/refactoring/techniques/composing-methods).
