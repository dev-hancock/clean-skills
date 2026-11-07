---
name: clean-code
description: 'Selective Clean Code and .NET engineering guidance for scoped implementation, maintainability review, refactoring and behavioural verification. Not a delivery orchestrator or mandatory all-principles audit.'
argument-hint: 'review [target] | refactor [target] | focused implementation task'
---

# Clean Code — on-demand engineering guidance

Maintain observable correctness, cohesion, clarity and change safety. Follow approved requirements and repository conventions; patterns and abstractions must earn their cost. Do not impose a specific architecture, testing library, framework or code style against project decisions.

## Minimal use

1. Determine the authorised task and affected contract. Reviews are read-only unless editing is explicitly requested.
2. Inspect the named scope, direct callers and relevant tests. Expand only when evidence warrants it.
3. Apply **only relevant** guidance below; never load all standards or every chapter heuristic to satisfy a routine task.
4. Implement or recommend the smallest cohesive change. Verify using focused tests/builds, broadening for actual integration risk.
5. Report actual evidence, deviations and remaining risks. Do not invent verification.

## Select references by concern

| Task | Begin with | If warranted |
| --- | --- | --- |
| C#/.NET implementation | [C# standards](references/languages/csharp/coding-standards.md) | [C#/.NET guidance](references/languages/csharp/dotnet.md), [design](references/design.md) |
| Behaviour/tests | [Testing](references/testing.md) | [verification](references/verification.md), [reliability](references/reliability.md) |
| Targeted review | [Review playbook](commands/review.md) | [review gates](references/review-gates.md), topic-specific references |
| Refactor | [Refactor playbook](commands/refactor.md) | [smells](references/refactoring-smells.md), [abstraction decisions](references/abstraction-decisions.md) |
| Concurrency | [Concurrency](references/concurrency.md) | [reliability](references/reliability.md) |
| Specifications/work-item format | [Specifications](references/specifications.md) or [work items](references/work-items.md) | Corresponding template only |

The [66-heuristic catalogue](references/review-principles-catalogue.md) is **lookup material**, not a default checklist. Open matching sections only for specific findings or an explicitly requested exhaustive review. Never load unrelated language references.

## Skill boundaries

`.github/agents/` owns role selection, approvals, specification → design → implementation → QA handoffs, and work-item lifecycle. This skill supplies implementation and review practices, not another process or role-play loop. The sibling [`clean-architecture`](../clean-architecture/SKILL.md) skill is for significant responsibility, dependency direction, cross-boundary consistency and other architectural questions. It is not required for work contained within stable boundaries.

Explicit `/clean-code review` and `/clean-code refactor` may use the corresponding on-demand playbooks. `commands/` files are reference procedures, not automatically registered slash commands.
