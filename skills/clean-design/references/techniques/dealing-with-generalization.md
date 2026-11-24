# Dealing with generalization

Select a technique only when it addresses an evidenced cause. Apply it prospectively to new code where appropriate. For existing code, follow [refactoring safety](../refactoring-decisions.md). The following is original operational guidance keyed to the standard technique names.

| Technique | Apply when / approach | Guardrail |
| --- | --- | --- |
| Pull Up Field | Unify genuinely common state in a valid base type. | Do not merge fields with different meanings, lifetimes or constraints. |
| Pull Up Method | Place shared equivalent behaviour in a valid base type. | Check subtype contracts and avoid virtual hooks solely for reuse. |
| Pull Up Constructor Body | Consolidate common initialization in the base constructor. | Preserve initialization order and avoid calling overridable methods prematurely. |
| Push Down Field | Move state needed by only particular variants to those variants. | Check base contract, serialization and lifecycle. |
| Push Down Method | Move variant-specific operations out of the general contract. | Verify callers do not depend on the removed base member. |
| Extract Subclass | Isolate a stable, substitutable variant with distinct behaviour. | Prefer composition when variations are independent or change at runtime. |
| Extract Superclass | Share a genuine common abstraction between types. | Do not build inheritance only to remove similar text. |
| Extract Interface | Express a narrow contract required by clients or an architectural boundary. | Avoid mechanically mirroring the concrete type. |
| Collapse Hierarchy | Merge levels that no longer represent distinct responsibilities or variants. | Preserve dispatch, public types and runtime registrations. |
| Form Template Method | Share a stable algorithm skeleton with meaningful variant steps. | Compare composition; do not hide changing control flow behind many hooks. |
| Replace Inheritance with Delegation | Compose the behaviour needed from a type without claiming its full contract. | Preserve identity, lifecycle and compatibility where required. |
| Replace Delegation with Inheritance | Use a true subtype relationship if forwarding is unnecessary and the full base contract applies. | Rarely appropriate for reuse alone; verify substitutability and coupling. |

Catalogue source: [Refactoring.Guru — Dealing with generalization](https://refactoring.guru/refactoring/techniques/dealing-with-generalization).
