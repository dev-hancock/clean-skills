# Refactoring decisions and safety

Sources: [Clean code](https://refactoring.guru/refactoring/what-is-refactoring), [Technical debt](https://refactoring.guru/refactoring/technical-debt), [When to refactor](https://refactoring.guru/refactoring/when), [How to refactor](https://refactoring.guru/refactoring/how-to).

## Decide whether to change

Refactoring changes internal structure without intentionally changing externally observable behaviour. New implementation is not refactoring; apply the same design judgement prospectively without manufacturing a before state. Bug fixes and feature additions intentionally change behaviour and must be distinguishable from structural edits.

Refactor when a structural obstacle makes the requested change risky, when review identifies a meaningful defect in maintainability, or when a scoped debt-reduction task is authorised. Leave unrelated code alone unless a necessary prerequisite is identified. Prefer small local improvements during delivery to a speculative redesign.

Assess debt by consequence: change frequency, failure risk, duplication of authoritative knowledge, lack of feedback, dependency friction and cost of remediation. Prioritise recurring or high-impact debt over superficial style. Record significant deferred debt with location, impact and a sensible next action; do not invent tickets or files. A conscious short-term compromise should have a reason and a feasible exit, not just a TODO.

## Establish the behavioural baseline

- Read call sites, tests, public contracts and the affected lifecycle. Identify the behaviours that must remain unchanged, including errors, ordering, mutation, I/O, resource ownership and persistence.
- Run relevant existing checks where possible. If coverage is inadequate, add targeted characterisation tests at stable boundaries before changing internals. Do not bake a suspected bug into a newly intended contract without distinguishing it as existing behaviour.
- If tests already fail or cannot be run, disclose it and avoid expansive changes. For risky unverified changes, provide a proposal instead of claiming safe completion.

## Apply controlled transformations

1. Select a remedy based on the cause, not the smell's name. Prefer reversible IDE/compiler-assisted changes where available.
2. Make one coherent structural transformation at a time. Preserve existing entry points or introduce a compatibility bridge where necessary; avoid temporary dead paths in the finished code.
3. Compile and run targeted tests after meaningful steps; inspect callers and the resulting dependencies. Stop or correct regressions before continuing.
4. Keep intentional behaviour changes distinguishable in the diff. Do not silently change validation, nullability, exception/result conventions, concurrency or performance-sensitive semantics as part of a refactor.
5. Evaluate the resulting design against the original problem. If it is harder to understand or change, choose a simpler alternative. Do not discard unrelated user edits.

## Compatibility and scope

Public API changes, persisted shape changes, message schema changes, plugin/DI registrations, reflection-based activation, binary compatibility and cross-module dependencies can make a seemingly local refactor breaking. Preserve compatibility or explicitly separate and obtain authorisation for the breaking change. Do not remove external extension points based only on repository call sites. Do not change framework, dependencies, architecture or persistence technology as a default remedy.

When review-only, report evidence and remediation rather than applying it. When explicitly asked to refactor, make the requested scoped changes and summarise the actual verification. When implementing a feature, resolve newly introduced smells in the code you generate, without reporting a separate refactoring exercise unless it matters.
