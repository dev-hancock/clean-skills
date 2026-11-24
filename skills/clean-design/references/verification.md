# Structural verification

Select checks proportional to risk. Do not substitute a checklist for evidence.

| Change | Evidence to seek |
| --- | --- |
| Method extraction, renaming, inlining | Compilation, call-site consistency, equivalent result and evaluation order; no duplicated side effects |
| Moving responsibilities | Appropriate dependency direction, equivalent invariant enforcement, unchanged ownership and lifetime |
| Value types and data changes | Equality, hashing, validation, defaults, nullability, serialization and persisted representations |
| Branch simplification | All paths, boundaries, short-circuiting, exception semantics, evaluation order |
| Interface or hierarchy change | Substitutability, all implementations, DI and activation, public contract compatibility |
| Removing code | Actual callers, reflection, configuration, generated code, external consumers and runtime discovery |
| I/O, concurrency, async changes | Cancellation, retries, idempotency, ordering, thread safety, disposal, transaction boundaries |
| Algorithm substitution | Representative and edge cases, numerical precision, ordering, complexity and performance where material |

## Review the result

Check whether the original symptom has been removed or justified. Compare code paths and change locality, not merely line count. Inspect for new indirection, unnecessary state, hidden dependencies, accidental public surface, duplicated knowledge, or boundary violations. A useful change makes the affected behaviour easier to understand or modify without weakening correctness.

Use [testing](../../clean-code/references/testing.md) and [verification](../../clean-code/references/verification.md) for actual test/build execution, evidence validity, reporting and repair. Prefer behavioural tests over private layout assertions; update tests that legitimately depend on changed internals without reducing coverage.
