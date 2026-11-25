---
name: clean-csharp
description: 'C# and .NET language/platform expertise. Use when implementing, refactoring or reviewing C# source (.cs, C# in .razor), checking type semantics, nullability, idioms, async/cancellation, resource lifetimes, or using the .NET SDK, compiler, analysers and test tooling. Apply only to the relevant language/platform scope.'
---

# C# and .NET

Use idiomatic, readable C# and correct .NET runtime semantics. This skill provides language and platform expertise, not a project architecture, stack selection, delivery process or second Clean Code standard.

## Operating rules

Inspect scoped source and relevant project configuration (target framework, language version, nullable settings, `.editorconfig`, analysers, SDK/test runner). Reuse known evidence; do not inspect every manifest by default. Preserve authorised behaviour and public contracts. Follow controlling repository conventions, including formatting and tooling; disclose material conflicts. Do not upgrade versions, install packages or introduce a framework to satisfy this guide. A review does not authorise edits or commands with write effects.

Use the smallest applicable reference:

| Concern | Reference |
| --- | --- |
| C# naming, types, nullability, expressions, collections, formatting defaults and public API documentation | [Coding standards](references/coding-standards.md) |
| Async, cancellation, task ownership, disposal and resource lifetime | [Runtime and resource safety](references/dotnet.md) |
| Build, tests, compiler diagnostics, SDK and existing tooling | [.NET verification](references/verification.md) |
| CSHARP-* review identifiers and evidence thresholds | [C# review standards](references/review-standards.md) |
| Concrete language illustrations, only where helpful | [Examples](references/examples.md) |

Do not open all references merely because the project contains C#. In mixed-language repositories, apply C# language rules only to the C# portion; use .NET tooling guidance only where the actual build/test runtime applies. Unsupported API or language features require evidence of compatibility, not guesses.

## Boundaries

- [clean-code](../clean-code/SKILL.md) owns universal readability, reliability, concurrency, tests and evidence-based verification. Consult relevant references only as needed.
- [clean-design](../clean-design/SKILL.md) owns responsibility, abstraction and structural design. C# features do not justify creating new abstractions on their own.
- [clean-architecture](../clean-architecture/SKILL.md) owns architectural boundaries and cross-component guarantees.
- [clean-workflow](../clean-workflow/SKILL.md) owns formal delivery and review/refactor/recovery procedures.

These are complementary skills, not mandatory dependencies for every C# question. If one is unavailable, use repository policy and report material limitations. Do not introduce a second workflow or review severity model. Do not select a test library, outcome type, ORM, DI container or messaging framework on behalf of a repository.
