# C# coding style and language standards

These skill conventions apply to new and modified C# code within the requested scope, subject to controlling repository policy. They are language guidance, not requirements from the book or an application architecture.

## Authority and core requirements

- MUST preserve existing behaviour and public contracts unless the requirement intentionally changes them.
- Prioritise maintainability, readability and correctness over brevity. Prefer explicit code over clever code and statically typed solutions over reflection-based or magic frameworks.
- MUST honour repository analysers, nullable settings, `.editorconfig` and build rules. Treat warnings as errors; do not suppress warnings merely to satisfy compilation.
- MUST NOT upgrade frameworks, packages or language versions solely for style. Check actual framework/API support before using modern features.
- Use the [skill's order of authority](../../../SKILL.md#operating-rules). Report conflicts with controlling repository instructions rather than silently weakening an approved rule or changing unrelated code.
- MUST denotes a requirement within this style guide; Prefer and SHOULD allow a justified exception. Do not use language guidance to introduce domain roles or framework dependencies.

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

- All asynchronous methods MUST use the `Async` suffix, subject to externally fixed interface/override names that must be reported rather than broken.
- Use positive, meaningful boolean names such as `IsActive`, `HasLicenses`, `CanDelete` and `ShouldRetry`.
- Use plural collection names such as `Devices`, `Licenses` and `Specifications`.
- Use domain terminology and names that disclose significant effects. Preserve externally defined names unless their contract is intentionally changed.

## File layout and formatting

- MUST use file-scoped namespaces.
- Place `using` directives at the top of the file, ordered: System namespaces, third-party namespaces, project namespaces.
- MUST use tabs for indentation; do not mix tabs and spaces for indentation.
- Maximum source line length: 120 characters.
- MUST use Allman braces. Braces are mandatory for `if`/`else`, `for`, `foreach`, `while`, `do`/`while`, `lock` and `using` statements.
- Avoid `this.` unless required by framework conventions or to disambiguate.
- Follow configured modifier ordering. The approved draft does not prescribe a separate modifier sequence.
- Use expression-bodied members only where they improve readability and agree with repository conventions. Do not turn a preference into a new mandatory formatting rule.

## Member ordering

1. Constants.
2. Static fields.
3. Instance fields.
4. Constructors.
5. Events.
6. Properties.
7. Methods.
8. Nested types.

## Type choice and immutability

- Prefer immutable DTOs and contracts. Use records, classes or structs according to equality, identity, copying and consumer requirements, not a mandatory role-to-type table.
- Use `init`, `readonly` and constructor initialisation where appropriate. A record does not by itself make a referenced mutable collection immutable.
- Make conversions explicit when implicit conversion would hide validation, information loss or surprising semantics.
- Seal classes by default unless they are designed for inheritance; preserve intentional framework and public extension points.
- Prefer the narrowest appropriate accessibility. Constructors and transitions must preserve required state and invariants.
- Use [design guidance](../../../../clean-design/references/design.md) for objects versus data, cohesion and encapsulation. DDD modelling belongs to a separate skill.

## Nullability

- MUST honour nullable reference types and their contracts.
- MUST NOT suppress unresolved nullability problems or use `!` to bypass a genuine null-state problem.
- Prefer `required`, init-only members and constructors where supported and appropriate to real initialisation requirements.
- Framework-specific construction paths must not permit invalid public construction.

## Expressions, strings and lambdas

- Prefer string interpolation over concatenation for ordinary string construction. Preserve the repository's structured logging conventions for diagnostics.
- Use `var` when the type is obvious, for example construction with an explicit type. Use an explicit type when inference would reduce clarity.
- Prefer switch expressions, property patterns, relational patterns and list patterns when they improve readability and the configured language version supports them.
- Use lambdas when they improve readability: LINQ, delegates, event handlers and simple projections. Prefer named methods when the logic becomes substantial.
- Keep straightforward control flow and cohesive functions. Do not extract pass-through helpers or introduce a feature merely to demonstrate modern syntax.

## API collections

- Accept the least demanding appropriate abstraction, including `IEnumerable<T>`, `IReadOnlyList<T>` and `IReadOnlyDictionary<TKey, TValue>`.
- Return read-only collections and avoid exposing mutable backing collections.
- Select the abstraction for actual consumer requirements; a read-only interface alone does not freeze externally shared mutable state.

## XML documentation

Follow the repository's public-API documentation policy. Document non-obvious contractual information that cannot be inferred reliably from names and types, particularly constraints, units, effects, failure and cancellation semantics. Keep existing public documentation accurate when contracts change.

Avoid comments that merely paraphrase the declaration. Do not generate boilerplate XML documentation for every public symbol unless the repository explicitly requires it.

## Related owners

- [Language safety](dotnet.md): asynchronous code, cancellation and resources.
- [Boundary translation](../../../../clean-architecture/references/architecture.md#contracts-and-translation): clear semantics without prescribed implementation mechanisms.
- [Examples](examples.md): illustrative code only.
- [Verification](verification.md): existing build, tests, analysers and formatting.
