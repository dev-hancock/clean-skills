# Organizing data

Select a technique only when it addresses an evidenced cause. Apply it prospectively to new code where appropriate. For existing code, follow [refactoring safety](../refactoring-decisions.md). The following is original operational guidance keyed to the standard technique names.

| Technique | Apply when / approach | Guardrail |
| --- | --- | --- |
| Change Value to Reference | Give shared mutable or identifiable concepts an authoritative identity. | Preserve aliasing, lookup, lifetime and consistency semantics. |
| Change Reference to Value | Represent identity-free immutable concepts by their contents. | Check equality, copying and shared mutation expectations. |
| Duplicate Observed Data | Maintain a separate presentation representation when a boundary needs one. | Define authority, synchronization direction and stale-data handling; avoid dual writes. |
| Self Encapsulate Field | Route access through a controlled internal accessor when useful. | Do not add trivial accessors everywhere or invoke unsafe virtual behaviour during initialization. |
| Replace Data Value with Object | Introduce a meaningful type for a value with rules or operations. | Preserve units, defaults, equality and boundary conversion. |
| Replace Array with Object | Replace positional heterogeneous data with named members. | Preserve ordering and wire format at external boundaries. |
| Change Unidirectional Association to Bidirectional | Add reverse navigation only for a real access requirement. | Maintain consistency at both ends; evaluate lifecycle and serialization cycles. |
| Change Bidirectional Association to Unidirectional | Remove unnecessary reverse navigation. | Ensure required lookups and relationship updates remain available. |
| Encapsulate Field | Constrain access to mutable representation through an appropriate API. | Protect invariants rather than replacing public fields with unrestricted setters. |
| Encapsulate Collection | Control collection mutation through meaningful operations. | Avoid exposing a mutable backing collection through a read-only interface alone. |
| Replace Magic Number with Symbolic Constant | Name a stable, non-obvious quantity or rule. | Include units; prefer configuration for genuinely variable settings. |
| Replace Type Code with Class | Use a meaningful type for a discriminator or constrained value. | A simple enum may suffice; preserve unknown-value handling. |
| Replace Type Code with Subclasses | Represent stable variants with distinct substitutable behaviour. | Avoid for frequently changing states or orthogonal dimensions. |
| Replace Type Code with State/Strategy | Delegate varying behaviour to composed policies or states. | Ensure variation is real and transitions remain explicit. |
| Replace Subclass with Fields | Collapse variants that differ only by data into a single representation. | Retain invariants and genuinely different behaviour. |

Catalogue source: [Refactoring.Guru — Organizing data](https://refactoring.guru/refactoring/techniques/organizing-data).
