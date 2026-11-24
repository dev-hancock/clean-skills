# Simplifying method calls

Select a technique only when it addresses an evidenced cause. Apply it prospectively to new code where appropriate. For existing code, follow [refactoring safety](../refactoring-decisions.md). The following is original operational guidance keyed to the standard technique names.

| Technique | Apply when / approach | Guardrail |
| --- | --- | --- |
| Add Parameter | Expose a genuinely required input instead of relying on hidden state. | Consider compatibility and whether the input belongs to the receiver. |
| Remove Parameter | Eliminate an input that has no contract or behavioural purpose. | Check external callers, overload resolution and reflection. |
| Rename Method | Choose a name communicating intent and observable effects. | Preserve public compatibility or explicitly coordinate the rename. |
| Separate Query from Modifier | Separate obtaining information from changing state when this clarifies the contract. | Atomic operations may need to return a result; do not introduce race windows. |
| Parameterize Method | Combine equivalent operations that vary along one meaningful input. | Do not accumulate flags or merge independent rules. |
| Introduce Parameter Object | Group inputs representing a cohesive concept. | Do not hide dependencies or wrap arbitrary parameters together. |
| Preserve Whole Object | Accept an existing cohesive object rather than unpacking and repacking its fields. | Do not widen dependencies across boundaries unnecessarily. |
| Remove Setting Method | Restrict mutation to construction or meaningful operations. | Preserve required framework materialization and domain transitions. |
| Replace Parameter with Explicit Methods | Give materially different actions distinct names instead of mode flags. | Retain a parameter when it represents one genuine varying value. |
| Replace Parameter with Method Call | Obtain a value from an already available owner when the caller need not supply it. | Do not introduce hidden I/O, clock reads or global dependencies. |
| Hide Method | Reduce visibility to the smallest legitimate contract. | Check interfaces, reflection and external consumers. |
| Replace Constructor with Factory Method | Name meaningful creation alternatives or encapsulate complex creation. | Keep simple constructors when sufficient; preserve construction guarantees. |
| Replace Error Code with Exception | Use exceptions when an exceptional failure fits the established API contract. | Do not replace expected domain failures/results with exceptions automatically; this may be a contract change. |
| Replace Exception with Test | Avoid exceptions for a predictable outcome when a safe try/check API exists. | Avoid check-then-act races; preserve failure information and unexpected exceptions. |

Catalogue source: [Refactoring.Guru — Simplifying method calls](https://refactoring.guru/refactoring/techniques/simplifying-method-calls).
