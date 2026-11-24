# Preventative design

Apply within authorised scope and controlling repository policy. Preserve observable contracts and approved architectural boundaries; advice is not permission to change them.

Use for nontrivial implementation and design decisions. Apply these questions to the design before creating types, methods or interfaces.

## Identify ownership

Use [objects, data and cohesion](design.md) and [abstraction decisions](abstraction-decisions.md) for the ownership, invariants, change drivers and dependency assessment. The matrix below is a compact decision aid, not an alternative set of principles.

## Choose the smallest useful structure

| Proposed design | Evidence that justifies it | Avoid when |
| --- | --- | --- |
| Named method | A meaningful operation, hidden detail, independently understandable policy, or shared rule | It just renames an already obvious expression or forces excessive parameter plumbing |
| New class | A distinct responsibility, lifetime, invariant or substantial independent behaviour | It merely forwards work or holds unrelated parameters |
| Value object | A concept with identity-free equality, validation or operations, or easily confused values | A well-named primitive is sufficient and no invariant or ambiguity exists |
| Interface | An actual architectural boundary, meaningful substitutability, or required contract | A duplicate of one concrete class without a reason to separate contract and implementation |
| Strategy / state | Real independent policy variation or behaviour depending on state | A small, stable conditional is simpler and more exhaustive |
| Shared abstraction | Same knowledge, same semantics, same expected reason to change | Similar syntax represents different rules or independent owners |
| Library adapter | Translation, capability gap, ownership or dependency boundary, or operational semantics | It is a parallel copy of a library's entire API without isolation benefit |

For new mechanisms and interfaces, [existing capabilities and design justification](abstraction-decisions.md#existing-capabilities-and-design-justification) is authoritative: prefer sufficient existing capabilities and preserve meaningful boundaries, including single-implementation ones. Independence does not require reimplementing a dependency behind a wrapper. Avoid coupling unrelated modules just to share a few lines.

## Resolve competing smells

- **Long method vs. fragmented flow:** extract conceptual steps, not arbitrary line ranges. Keep the operation understandable at the call site.
- **Large class vs. shotgun surgery:** split distinct responsibilities, but keep one policy's knowledge together.
- **Long parameter list vs. hidden dependencies:** group cohesive values, not unrelated services. Do not inject a service locator or a catch-all context to hide dependencies.
- **Primitive obsession vs. type proliferation:** introduce types where correctness or clarity materially improves; reuse appropriate built-in types.
- **Duplication vs. speculative generality:** unify known shared rules; tolerate coincidental repetition until the common concept is established. Do not wait for a third occurrence of an already established critical invariant.
- **Message chains vs. middle men:** introduce a meaningful operation or a stable boundary, not one forwarding member for every nested property.
- **Switch statements vs. inheritance:** prefer an explicit exhaustive branch for a closed set; use composition when independently varying behaviour is real. Avoid class-per-enum-value designs without benefit.
- **Data class vs. separation of concerns:** domain behaviour belongs with its owner, while transport contracts, read models and immutable projections can intentionally remain data-only.

## Implementation checkpoint

Before writing a new component, identify what it owns, why it exists and what it depends on. Before extending an existing one, ask whether the addition shares its reason to change. Before adding a type or interface, name the concrete benefit. Before completing a change, inspect actual callers and verify that complexity has not been displaced. Do not create planning documents for these checks unless requested.
