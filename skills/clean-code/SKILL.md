---
name: clean-code
description: 'Implementation quality and correctness guidance for readable, expressive, dependable code. Use for naming, functions, comments, language conventions, C#/.NET, errors, concurrency, reliability, tests, verification and evidence-based code review standards.'
argument-hint: 'implementation quality, language guidance, testing or verification'
---

# Clean Code

Produce understandable, dependable code that honours approved behaviour and repository conventions. Apply relevant standards during implementation, not only in subsequent review. Do not prescribe a language, framework, test library or application architecture.

## Operating rules

Explicit task scope and authorised requirements govern the change; respect controlling repository instructions, established contracts and applicable language/build policy. Use skill guidance where compatible. Disclose conflicts rather than silently overriding approved requirements or repository standards. A request to review never authorises source changes.

## Apply selectively

Inspect the affected code, contracts and relevant tests. Make names, effects, state, failure semantics and control flow clear. Test observable behaviour and use evidence capable of establishing the actual guarantees. Correct material implementation defects within authorised scope before completion. Never claim unperformed verification.

| Concern | Reference |
| --- | --- |
| Naming, functions, comments and layout | [Readability](references/readability.md) |
| Language-specific standards | [Language registry](references/languages/README.md); for C#, [coding standards](references/languages/csharp/coding-standards.md) |
| Errors, recovery and dependable contracts | [Reliability](references/reliability.md) |
| Shared state, cancellation and lifecycle | [Concurrency](references/concurrency.md) |
| Test design and risk | [Testing](references/testing.md) |
| Source inspection, build/test evidence and repair | [Verification](references/verification.md) |
| Implementation smells | [Diagnostics](references/refactoring-smells.md) |
| Review standards and severity/confidence | [Review standards](references/review-standards.md), [review gates](references/review-gates.md) |
| Known book heuristic ID | [C](references/principles/comments.md), [E](references/principles/environment.md), [F](references/principles/functions.md), [G1–12](references/principles/general-01-12.md), [G13–24](references/principles/general-13-24.md), [G25–36](references/principles/general-25-36.md), [J (Java only)](references/principles/java.md), [N](references/principles/naming.md), [T](references/principles/testing.md) |
| Unknown heuristic / repository or engineering rule | [Index](references/principles/index.md), or direct [repository](references/principles/repository.md), [C#](references/principles/csharp.md), [engineering](references/principles/engineering.md) |
| C# async / disposal / cancellation | [Language safety](references/languages/csharp/dotnet.md); [concurrency](references/concurrency.md) for shared-state risk |
| C# build/test or coverage risk | [C# verification](references/languages/csharp/verification.md); [coverage analysis](references/languages/csharp/crap-analysis.md) only when relevant |

Load only the applicable language guide and references. The 66-heuristic catalogue is not a mandatory full audit; when the ID is known, open its shard directly. For C# use the existing repository's build/test commands and optional verification scripts when appropriate.

## Boundaries

- Local responsibility or abstraction: [design](../clean-design/references/design.md) or [abstraction decisions](../clean-design/references/abstraction-decisions.md). For structural smells without a known category, use [clean-design routing](../clean-design/SKILL.md).
- Significant policy boundaries and dependency direction: [boundaries and use cases](../clean-architecture/references/boundaries-and-use-cases.md); for storage guarantees use [persistence and consistency](../clean-architecture/references/persistence-and-consistency.md).
- [clean-workflow](../clean-workflow/SKILL.md): formal specifications, work items, review/refactor/recovery procedures and delivery handoffs. For legacy `/clean-code review`, `refactor` or `recover` prompts, open the corresponding [review](../clean-workflow/commands/review.md), [refactor](../clean-workflow/commands/refactor.md) or [recover](../clean-workflow/commands/recover.md) playbook if installed, without loading an additional process. Reviews remain read-only; never infer edit authority.

For a routine task use only the relevant engineering guidance. For formal delivery follow the active agent's approved process, not a second lifecycle. If a sibling is unavailable, use existing repository instructions and state any material limitation; do not invent missing policy.

## Context loading

Open the smallest relevant reference directly, including sibling references; read its exclusions and risk checks. Scope, policy, contracts and evidence still govern direct use. Reuse still-valid context and checks. Expand only for unresolved risk, conflicting evidence, affected boundaries or declared broad scope. Stop when sufficient.
