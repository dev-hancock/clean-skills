# Moving features between objects

Select a technique only when it addresses an evidenced cause. Apply it prospectively to new code where appropriate. For existing code, follow [refactoring safety](../refactoring-decisions.md). The following is original operational guidance keyed to the standard technique names.

| Technique | Apply when / approach | Guardrail |
| --- | --- | --- |
| Move Method | Relocate behaviour to its semantic owner. | Do not reverse architecture dependencies or broaden visibility unnecessarily. |
| Move Field | Relocate state to the component responsible for it. | Preserve initialization, identity, persistence and lifetime. |
| Extract Class | Separate a coherent responsibility or independently managed state. | Keep invariants atomic; avoid fragments with chatty coordination. |
| Inline Class | Absorb a type with no independent reason to exist into its owner. | Check boundary contracts and runtime activation. |
| Hide Delegate | Expose a meaningful capability instead of leaking a collaborator graph. | Do not mirror every member of the delegate. |
| Remove Middle Man | Bypass a redundant forwarding layer when clients may depend on the real owner. | Keep meaningful ports, decorators and translations. |
| Introduce Foreign Method | Implement a small missing operation near its usage or as an extension. | Check native APIs first; avoid vendor internals. |
| Introduce Local Extension | Provide a narrow local wrapper or extension for a coherent capability. | Prefer composition; avoid cloning a whole library API. |

Catalogue source: [Refactoring.Guru — Moving features between objects](https://refactoring.guru/refactoring/techniques/moving-features-between-objects).
