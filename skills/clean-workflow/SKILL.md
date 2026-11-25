---
name: clean-workflow
description: 'Engineering delivery procedures for specification and acceptance criteria, technical planning, work items, implementation handoffs, read-only code reviews, authorised refactors, legacy intent recovery, quality checkpoints and completion evidence. Use for formal delivery or explicit review/refactor/recover procedures; not a replacement for delivery agents or routine engineering guidance.'
argument-hint: 'review [scope] | refactor [target] | recover [target] | specification | plan | implement | handoff'
---

# Clean Workflow

Coordinate the *procedure* for the requested work, not a new delivery system. The repository's agents own role selection, approvals, execution and work-item lifecycle. This skill supplies reusable contracts, playbooks and templates. Do not role-play missing agents or introduce extra mandatory documents, approval loops or stages. For routine implementation without a formal work item, use focused engineering guidance and scoped verification.

## Select the requested procedure

Select one matching row, not all rows. Read procedure guidance before acting; load an applicable template when preparing its required artifact, not to investigate code. Existing approved artifacts do not need regeneration.

| Task | Read only the relevant reference |
| --- | --- |
| Specification / acceptance criteria | [Specification principles](references/specifications.md), [specification template](templates/specification.md) |
| Planning and dependencies | [Work items](references/work-items.md), [technical design](references/technical-design.md), [work-item template](templates/work-item.md) |
| Initialising an approved formal plan | [Plan template](templates/work-items/plan.md), [status template](templates/work-items/status.md) — only when missing |
| Challenging specification or plan | [Challenge report](templates/challenge-report.md), applicable specification or technical design guidance |
| Implementing approved work | [Implementation and handoff](references/implementation.md), [quality checkpoint](references/quality-checkpoint.md) |
| Read-only review | [Review playbook](commands/review.md) and [review report](templates/review-report.md) |
| Authorised structural edits | [Refactor playbook](commands/refactor.md) and [refactor summary](templates/refactor-summary.md) |
| Legacy intent recovery | [Recover playbook](commands/recover.md) |
| Coverage hotspot report | [Hotspot review](templates/hotspot-review.md), only for relevant coverage evidence |

`commands/` files are reference playbooks, not automatic command registrations. Explicit `/clean-workflow review`, `refactor` and `recover` may be used where the host supports skill invocation. `specification`, `plan`, `implement` and `handoff` select guidance, not new agents or competing stage executors. Legacy `/clean-code review`, `refactor` and `recover` route here through the clean-code entry point.

## Authority and scope

Reviews and recovery are read-only unless a separate write is explicitly authorised. Refactor only the requested scope, preserving observable behaviour. Requirements changes need the appropriate owner decision. Formal work follows the repository's agreed lifecycle and active role; do not invent approval. Do not initialise a formal plan simply because this skill was loaded. Keep status in its single ledger; archive completed work only through the authorised delivery process.

## Engineering guidance (on demand)

- Significant boundaries: [architecture](../clean-architecture/references/architecture.md); storage/transaction guarantees: [persistence and consistency](../clean-architecture/references/persistence-and-consistency.md); other concerns: [architecture routing](../clean-architecture/SKILL.md).
- Implementation design: [design](../clean-design/references/design.md); interfaces and ownership: [abstraction decisions](../clean-design/references/abstraction-decisions.md); smell/technique not known: [design routing](../clean-design/SKILL.md).
- Code quality: [readability](../clean-code/references/readability.md), applicable installed language skills, [review classifications](../clean-code/references/review-standards.md), [verification](../clean-code/references/verification.md); other concerns: [code routing](../clean-code/SKILL.md).

Load only the relevant concern, not all skills or catalogues at each stage. Reuse still-valid evidence; recheck changes and invalidated assumptions. Report genuine blockers, unrun checks and outstanding decisions. If companion guidance is unavailable, follow repository policy and disclose material gaps; do not manufacture rules or claim compliance.

## Context loading

Open the smallest relevant reference directly, including sibling references; read its exclusions and risk checks. Scope, policy, contracts and evidence still govern direct use. Reuse still-valid context and checks. Expand only for unresolved risk, conflicting evidence, affected boundaries or declared broad scope. Stop when sufficient.
