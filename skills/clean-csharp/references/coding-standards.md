# C# coding style and language standards

Apply language correctness rules within the requested scope. Naming, formatting and ordering below are fallback style defaults when the repository has no established convention; configured rules and existing public contracts take precedence. They are not behavioural defects or requirements from the book.

## Authority and core requirements

- MUST preserve existing behaviour and public contracts unless the requirement intentionally changes them.
- Prioritise maintainability, readability and correctness over brevity. Prefer explicit code over clever code and statically typed solutions over reflection-based or magic frameworks.
- MUST honour repository analysers, nullable settings, `.editorconfig` and build rules. Apply warnings-as-errors when configured or explicitly required; investigate diagnostics rather than suppressing them merely to pass.
- MUST NOT upgrade frameworks, packages or language versions solely for style. Check actual framework/API support before using modern features.
- Use the [operating rules](../SKILL.md#operating-rules). Report conflicts with controlling repository instructions rather than silently weakening an approved rule or changing unrelated code.
- MUST denotes correctness, compatibility or controlling policy requirements; style defaults allow justified exceptions. Do not use language guidance to introduce domain roles or framework dependencies.

## Naming

| Element | Convention |
| --- | --- |
| Namespace | `PascalCase`, dot separated |
| Class, record, struct | `PascalCase` |
| Interface | `I` + `PascalCase` |
| Method, property, event | `PascalCase` |
| Enum and enum member | `PascalCase` |
| Parameter and local variable | `camelCase` |
| Constant | `PascalCase` |
| Private and protected field | `_camelCase` |
| Type parameter | `T`, `TValue`, `TKey` or another descriptive `T`-prefixed name |

- Prefer the `Async` suffix for task-returning asynchronous operations; preserve externally fixed interface, override and framework names. Follow established conventions for asynchronous streams and event handlers.
- Use positive, meaningful boolean names such as `IsActive`, `HasLicenses`, `CanDelete` and `ShouldRetry`.
- Use plural collection names such as `Devices`, `Licenses` and `Specifications`.
- Use domain terminology and names that disclose significant effects. Preserve externally defined names unless their contract is intentionally changed.

## File layout and formatting

Use repository formatting configuration where present. The following are defaults for otherwise unconstrained code; do not reformat unrelated files.

- Prefer file-scoped namespaces where supported.
- Place `using` directives at the top of the file, ordered: System namespaces, third-party namespaces, project namespaces.
- Prefer tabs for indentation when no repository convention is defined; do not mix indentation styles.
- Aim for a source line length of 120 characters where readable.
- Prefer Allman braces. Use braces for `if`/`else`, `for`, `foreach`, `while`, `do`/`while`, `lock` and `using` statements.
- Avoid `this.` unless required by framework conventions or to disambiguate.
- Follow configured modifier ordering. Do not impose an additional sequence.
- Use expression-bodied members only where they improve readability and agree with repository conventions. Do not turn a preference into a new mandatory formatting rule.

## Member ordering

Fallback order when no repository convention applies:

1. Constants.
2. Static fields.
3. Instance fields.
4. Constructors.
5. Events.
6. Properties.
7. Methods.
8. Nested types.

## Type choice and immutability

- Prefer simple positional records for read models, DTOs and other data representations that own no behaviour or invariants. Choose records, classes or structs according to equality, identity, copying and consumer requirements.
- Use `init`, `readonly` and constructor initialisation where appropriate. Require immutability only to the extent justified by the contract, ownership and consumer requirements.
- Do not introduce custom constructors, accessors, backing fields, validation or defensive copying without an identifiable requirement or correctness risk.
- Preserve meaningful enum and value object types within internal contracts where dependency boundaries permit. Do not convert them to primitives merely for convenient serialisation.
- Introduce distinct summary and detail representations when consumers require different information. Do not create speculative representations or force unrelated use cases to share a model.
- Make conversions explicit when implicit conversion would hide validation, information loss or surprising semantics.
- Seal classes by default unless they are designed for inheritance; preserve intentional framework and public extension points.
- Prefer the narrowest appropriate accessibility. Constructors and transitions must preserve required state and invariants.
- Use [design guidance](../../clean-design/references/design.md) for objects versus data, cohesion and encapsulation. DDD modelling belongs to a separate skill.

## Equality and value semantics

- Records supply generated value equality, not deep immutability or deep collection equality. Check equality and hash-code behaviour before using a type as a dictionary key or set member.
- Use structs for intentional value semantics; account for copying, default values and boxing. Avoid mutable structs unless their specific usage warrants them.
- Keep numeric units, range and precision explicit. Use `decimal` where decimal precision is required, floating-point types where appropriate, and checked arithmetic where overflow must fail rather than wrap.

## Nullability

- MUST honour the repository's nullable reference type settings and actual nullability contracts.
- MUST NOT suppress unresolved nullability problems or use `!` to bypass a genuine null-state problem; a narrow suppression requires a proven invariant the compiler cannot express.
- Prefer `required`, init-only members and constructors where supported and appropriate to real initialisation requirements.
- Framework-specific construction paths must not permit invalid public construction.

## Expressions, strings and lambdas

- Prefer string interpolation over concatenation for ordinary string construction. Preserve the repository's structured logging conventions for diagnostics.
- Use `var` when the type is obvious, for example construction with an explicit type. Use an explicit type when inference would reduce clarity.
- Prefer switch expressions, property patterns, relational patterns and list patterns when they improve readability and the configured language version supports them.
- Use lambdas when they improve readability: LINQ, delegates, event handlers and simple projections. Prefer named methods when the logic becomes substantial.
- Keep straightforward control flow and cohesive functions. Do not extract pass-through helpers or introduce a feature merely to demonstrate modern syntax.

## LINQ and mapping

- Prefer clear declarative LINQ for collection operations. Keep inline predicates and selectors simple. When an in-memory projection combines nested constructors, collection filtering/projection and switch-based conversions, extract named transformations before writing the handler; use intermediate values for distinct concepts.
- For substantial, stateless mapping, prefer a feature-local `internal static` mapper with descriptive operations such as `ToView`, `ToDto`, `ToRequest` or `ToResponse`. Use private static helpers for a smaller local transformation or for component/representation conversions; keep trivial projections inline. A dedicated type needs a cohesive responsibility, not an arbitrary complexity threshold.
- Prefer method groups (`items.Select(ItemMapper.ToView)`) when an existing named method expresses the transformation and delegate semantics are equivalent. A simple lambda is equally suitable when clearer; do not extract one-line forwarding methods just to use a method group.
- Keep mapping deterministic and free of I/O, hidden state or unrelated domain decisions. Do not introduce DI or interfaces for a dependency-free transformation. Reuse established mapping capabilities where appropriate. See [deterministic transformations](../../clean-design/references/abstraction-decisions.md#deterministic-transformations).
- Distinguish LINQ to Objects from `IQueryable<T>` and expression trees. Do not replace provider-translated projections with arbitrary mapping methods or force client-side execution/materialisation merely for style. Keep server-side filtering, projection and limits where required; verify provider translation and query shape when changed.
- Preserve filtering, ordering, null and unknown-value handling, evaluation order and snapshot/materialisation semantics. Keep the existing read model and external representation unless contract changes are authorised. See [projection examples](examples.md#separate-substantial-projections-from-orchestration).
- Materialise collections at the appropriate ownership boundary. Avoid repeated materialisation or defensive copying across the mapper, read model and consumer unless each operation provides a distinct required guarantee.
- Keep destination models proportionate to their purpose. Do not turn simple query results into invariant-enforcing domain objects.

## API collections

- Select collection types according to actual consumer requirements, including enumeration, indexing, lookup, ownership and mutation semantics.
- Prefer read-only collection interfaces for consumers that do not require mutation. `IReadOnlyList<T>` and `IReadOnlyDictionary<TKey, TValue>` restrict access through the interface; they do not guarantee immutability.
- Distinguish exposing an owner's mutable internal state from returning a newly materialised collection whose ownership is transferred to the consumer.
- When a mapper materialises a fresh collection and transfers ownership, do not defensively copy it again without an identifiable ownership, mutation or concurrency risk.
- Use defensive copies, read-only wrappers or immutable collections when required by actual ownership, sharing, lifetime, concurrency or contract guarantees.
- Prefer existing collection capabilities over custom collection-copying helpers or abstractions.
- LINQ queries may be deferred. Avoid unintended repeated enumeration, repeated side effects, or executing a query after its resource owner has been disposed. Materialise only where snapshot semantics, ownership or repeated enumeration require it.
- Choose ordinal or culture-aware string comparison according to the meaning of the text; identifiers and protocol tokens are not natural-language display strings.

## XML documentation

Follow the repository's public-API documentation policy. Document non-obvious contractual information that cannot be inferred reliably from names and types, particularly constraints, units, effects, failure and cancellation semantics. Keep existing public documentation accurate when contracts change.

Avoid comments that merely paraphrase the declaration. Do not generate boilerplate XML documentation for every public symbol unless the repository explicitly requires it.

Establish the actual meaning of a type, member or operation from its authoritative contracts, implementation and domain semantics before documenting it. Do not infer behaviour solely from its name. Distinguish current state from historical events, capability from availability, and observed state from verified outcomes.

When semantics are uncertain, investigate rather than inventing a plausible description.

## Related owners

- [Language safety](dotnet.md): asynchronous code, cancellation and resources.
- [Boundary translation](../../clean-architecture/references/architecture.md#contracts-and-translation): clear semantics without prescribed implementation mechanisms.
- [Examples](examples.md): illustrative code only.
- [Verification](verification.md): existing build, tests, analysers and formatting.