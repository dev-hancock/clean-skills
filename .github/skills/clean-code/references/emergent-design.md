# Emergent design, successive refinement and iterative refactoring

## Make the design earn its complexity

A usable order of work is: **make behaviour visible → satisfy it → remove duplicated knowledge → clarify intent → minimize unnecessary structure**. These are reinforcing concerns, not an excuse to defer correctness or remove a useful architectural boundary.

- Start with representative use cases and tests; a design that passes contrived tests may still violate real contracts.
- Identify distinct responsibilities **before first implementation**, not only during later refactoring. Separate independent change drivers early; use a direct concrete implementation where that preserves the boundary. Design meaningful extension seams for approved upcoming variations, not speculative future providers.
- Keep the solution expressive: clear names, locally understandable control flow, explicit state ownership and failure semantics.
- Reduce concepts and files **after** proving their value. Fewest classes is not the goal; fewest *unnecessary* concepts is.

The loop below applies to behaviour-preserving changes to existing code and small improvements made **during initial coding**. It is not a prescribed follow-up refactor phase for newly completed work. First-pass implementation quality is established by the plan, design adherence and completion gates.

## Successive refinement loop

1. **Characterize:** preserve current observable inputs/outputs, persistence and interaction contracts. Where not known, write an executable characterization test before changing logic.
2. **Select one smell:** identify concrete maintenance risk (duplication of a rule, invalid state, needless wrapper, hidden effects). State how success would improve the consumer's experience.
3. **Change one conceptual thing:** rename, extract, relocate, remove or simplify. Maintain a small reviewable diff; avoid simultaneous algorithm, API and formatting changes.
4. **Verify behaviour:** compile and run targeted checks. For schema/protocol/interface changes inspect all consumers and migrations; compatibility isn't proven by unit tests alone.
5. **Read from the caller:** does the new shape reduce cognitive hops, options, state and special cases? If not, revert the abstraction and try a more direct form.
6. **Repeat or stop:** stop when further improvement is speculative or materially increases risk with little benefit.

## Example: removing ceremonial dispatch machinery

Before: `Caller -> Wrapper -> Coordinator -> Operation`. Inspect each transition. Collapse a forwarding-only step when it owns no meaningful contract or independently changing responsibility. Retain a seam that protects a real policy or compatibility boundary. Validate construction and all call sites after removing it. The same reasoning applies to UI actions, library functions and backend operations.

## Refactoring in distributed/legacy systems

Refactoring is only behaviour-preserving within an agreed observable scope. Public event names, message contracts, database schema, exception semantics, timing, transactions, diagnostics relied on operationally, and cancellation can be behaviour. Treat a change to any as an explicit migration.

## Stop criteria

No unexplained new abstraction, stable tests/build, comprehensible primary flow, contracts accounted for, and no incidental code churn. Do not over-refine a completed small task merely because a theoretical design could be prettier.
