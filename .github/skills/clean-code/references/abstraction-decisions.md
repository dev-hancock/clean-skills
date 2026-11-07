# Responsibility separation and abstraction decisions

## Separate change drivers; justify indirection

**Prefer cohesive boundaries over a low class count.** Start by identifying independently changing policies, state/invariants, external effects, lifecycle and dependency direction. When combining them would give an owner unrelated reasons to change, separate them deliberately—even if each has only one implementation. A cohesive concrete type or module is often sufficient.

**Separation and abstraction are independent decisions.** A distinct parser, policy or coordinator does not automatically need an interface, factory, strategy, base class or new layer. Introduce indirection when it protects a real contract or dependency direction, or accommodates **approved known** variation. Do not require two implementations before an interface can be useful; equally, do not infer a future product requirement from the mere possibility of extension.

SOLID principles guide trade-offs together: SRP must not explode into ceremonial classes; OCP protects known change seams rather than fictional plugins; DIP avoids coupling consumers to volatile details without mandating `IFoo` for every `Foo`. Preserve genuine existing architectural ports even when thin.

## Existing capabilities and design justification

Before proposing a new abstraction or implementation mechanism:

- Examine relevant language, platform, framework, library and codebase capabilities, contracts and guarantees using source, documentation and tests as needed.
- Compare those capabilities with the required behaviour, including relevant failure, lifecycle and operational semantics. Established behaviour is not automatically sufficient; verify it against the actual requirements.
- Identify the concrete deficiency or architectural responsibility that warrants additional code. Where existing capabilities suffice, use them without recreating, obscuring or weakening their guarantees.
- Assess whether the proposal meaningfully improves cohesion, clarity, independence or changeability. Weigh that benefit against added complexity, maintenance obligations and behavioural risks, including changes to dependency semantics.

A new mechanism must demonstrate a meaningful engineering benefit; abstraction, encapsulation and reuse are not sufficient justifications in isolation. An existing framework's ability to perform the underlying operation does not invalidate a boundary that protects policy independence, responsibility ownership or established future requirements. Preserve such boundaries without implementing speculative functionality.

## Decision procedure

1. **Map responsibilities and change drivers.** What invariant, effect, policy, state or lifecycle does each owner protect? Which concerns evolve separately? Is the current owner already mixed?
2. **Identify consumers and direction.** Inspect actual call sites and required contracts. Would separation improve readability, independent modification, verification or resource ownership? Does it create a dependency cycle?
3. **Separate when appropriate.** Prefer a focused concrete type/function first when the responsibility has a coherent owner. Do not keep unrelated code in a monolith solely to avoid files, registrations or types.
4. **Decide whether a contract is needed.** Examine approved future/dependent work items, established variants, boundary volatility, security/trust, external effects, lifetime and public compatibility. An interface may be justified with one present implementation when it enables a **known** second source or stable consumer contract.
5. **Choose the least costly mechanism that honours the boundary.** Use the capability assessment above to compare suitable alternatives by their responsibilities, contracts and engineering consequences, not a preferred technique. Additional indirection needs real dependency, ownership or extension value; shared machinery needs repeatable evidenced cases.
6. **Weigh both costs.** Account for new public symbols, DI, navigation, testing and failure paths **and** the cost of change from mixing responsibilities. Identify what later accepted change would touch with and without the proposed seam.
7. **Record material decisions at planning time.** State the boundary, consumers, evidence, accepted downstream need and trade-off in the work item. During `implement`, follow that design unless current source disproves it. Trivial private methods need no written decision.

## Evidence supporting separation or abstraction

- Responsibilities have independent reasons to change, different lifetime/cancellation/failure policy or distinct state/invariants.
- A real trust, persistence, I/O, security or construction boundary needs a clear owner.
- A consumer needs a stable capability contract while an underlying dependency or **approved upcoming** implementation varies.
- Existing multiple implementations have one genuinely common behaviour.
- Independent tests or compatible replacement would be materially harder when concerns are intertwined.
- Shared code represents one stable **rule**, not coincidentally similar syntax.

## Warning signs

- One large class owns unrelated orchestration, parsing, external I/O, persistence and scheduling solely because it is convenient to write.
- A forwarding-only coordinator/manager/adapter has no owned decision, invariant, lifecycle or compatibility boundary.
- A factory calls a single constructor and owns no meaningful selection or construction policy.
- Interfaces exist solely for mocking, symmetry, or imagined product variants; one implementation is a **reason to ask**, not proof of waste.
- Generic frameworks, reflection, registration DSLs or inheritance hierarchies abstract one concrete case with no established need.
- DTO property-copy adapters map identical structures without a real boundary.
- An abstraction hides concrete dependencies, increases consumer navigation or creates circular ownership.
- Artificial numeric limits (class size, constructor parameter count, interface count) replace reasoning about cohesion.

## Assess the resulting structure

- Compare plausible approaches using ownership, cohesion, coupling, consumer needs, existing capabilities and the expected cost of change.
- Preserve meaningful separation even when an implementation is straightforward; do not create indirection merely to claim extensibility.
- Prefer the clearest coherent design that meets present requirements and the known approved changes, without requiring one particular technique.

## Quality check during implementation

Read resulting code from its consumers. Are responsibilities easier to find and independently change? Does each new type own substantive behaviour? Can indirection be removed **without recombining separate change drivers**? Are there avoidable circular dependencies or unbounded resource/algorithmic costs? Correct material defects during the initial implementation rather than requiring a separate refactor cycle.

## Anti-gaming

Naming a class `Strategy` or claiming “OCP” does not prove good design. Cite real consumers, current code, invariants, independent change drivers or approved future needs. A missing piece of evidence is an uncertainty to record, not permission for speculative architecture.
