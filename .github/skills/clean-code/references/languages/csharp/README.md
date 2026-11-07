# C#/.NET guide

Apply Clean Code principles through readable C# and safe language usage, without selecting a backend stack or application architecture.

## Required context

- Read [coding standards](coding-standards.md) for C# naming, formatting, nullability, immutability, collections and public documentation.
- Inspect target frameworks, language versions, repository instructions, `.editorconfig` and analyser settings.
- Load [language safety](dotnet.md) for asynchronous code and resource ownership where relevant.
- Use [examples](examples.md) as illustrations, not required application structure.
- Use the repository's existing tests, diagnostics and build commands. This guide does not select a test framework, result type, persistence library or mapping framework.
- Do not apply C# syntax, type choices or tooling to other languages.
- Honour controlling repository policy and public contracts; disclose material conflicts rather than silently replacing them.

## Do / don't

| Do | Don't |
| --- | --- |
| Preserve nullable contracts and initialise required state deliberately. | Hide unresolved state problems with `!` or unnecessary casts. |
| Prefer immutable DTOs/contracts and choose types from their semantics. | Require all contracts to be records or infer DDD roles from declarations. |
| Keep conversions explicit where meanings, validation or information loss matter. | Introduce conversion machinery that adds no meaningful responsibility or guarantees. |
| Await work, propagate supported cancellation and respect owned resources. | Block asynchronous completion or discard failures. |
| Preserve established dependency contracts. | Add or remove architecture merely to match a generic rule. |
| Verify through existing repository tools and behavioural tests. | Install a test framework, collector or quality gate solely for this skill. |

## References

- [Coding standards](coding-standards.md): language style and expression.
- [Language safety](dotnet.md): asynchronous execution and resources.
- [Examples](examples.md): project-independent C# illustrations.
- [Verification](verification.md): existing build, tests and diagnostics.
- [Coverage evidence](crap-analysis.md): optional metrics using repository policy, not mandatory targets.
