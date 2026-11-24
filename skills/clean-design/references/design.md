# Objects, data, cohesion and class design

Apply within authorised scope and controlling repository policy. Preserve observable contracts and approved architectural boundaries; advice is not permission to change them.

## Objects and data serve different purposes

- Objects hide representation behind meaningful behaviour. Keep state and the operations governing it together when that protects the object's contract.
- Data structures intentionally communicate values. Do not give every data carrier a behavioural hierarchy.
- Avoid hybrids that expose mutable internals while pretending to enforce an abstraction.
- Encapsulation is more than private fields with unrestricted accessors. Consider whether callers can bypass the rules the object promises.
- Avoid navigating deep collaborator internals to make another object's decisions. Ordinary access to intentional data is not automatically a Law of Demeter violation.
- Choose behaviour versus data from how consumers use it; neither choice requires DDD entities, value objects or aggregates.

These are practical interpretations of Chapter 6. Make mutation and ownership semantics explicit; exposing values or a read-only view does not necessarily prevent shared state from changing. Choose language-specific representations using the applicable guide and real consumer needs.

## Cohesion and reasons to change

- **Identify responsibility and change drivers before coding**, not only in a corrective refactor. For substantial work, map owners, consumers, invariants, external effects and independently changing concerns before implementation.
- A class has one coherent responsibility or reason to change, not necessarily one method.
- Inspect unrelated field groups, independently used operations and policies that change for different reasons. **Prefer explicit separation when a combined owner would change for unrelated reasons**, even if each new component has only one implementation; choose whether an interface is needed separately.
- Keep the public surface narrow and intentional. Avoid exposing state that permits invalid operations.
- Prefer composition for reuse; inheritance must provide meaningful substitutability, not just shared code.
- Make dependencies visible and keep construction separate from ordinary use.
- Many constructor parameters can reveal mixed responsibilities; hiding them in a parameter bag does not reduce coupling.
- Represent meaningful state and transitions clearly rather than relying on loosely related flags. Do not require a state-machine framework.

## Dependency and extension principles

- Group related policy and behaviour around a reason to change.
- Support **existing or explicitly approved future** variation with intentional extension points; do not speculate about possible providers or features. OCP is a design trade-off informed by known change, not a mandate for generic extensibility.
- A subtype must preserve its consumers' behavioural expectations.
- Give consumers cohesive interfaces, not an interface for every method or concrete type.
- Reduce coupling to volatile details where it materially helps; an interface alone does not make a design better.

These principles draw on the book's discussions of class responsibility, cohesion, change and dependencies, especially Chapter 10. They do not prescribe layers, folders or a domain model.

## Design review

Ask what state is protected, which operations use it, what consumers need and what changes independently. Separation may be the clearest design even when it adds types; assess the actual cost of future change as well as the cost of added structure. For input-processing or I/O work, consider realistic data sizes, repeated searches/round trips, and resource limits before the first implementation.

For substantial plans, make structural dependencies and important interactions or states unambiguous. Use Mermaid diagrams only where clearer than concise bullets; no interface per box or fixed class count follows. For formal delivery, see [technical design](../../clean-workflow/references/technical-design.md).

Use [abstraction decisions](abstraction-decisions.md) as the authority for justifying separation, indirection and new mechanisms (including pass-through interfaces, trivial factories and speculative base hierarchies). For scattered type switches use [OO smells](smells/oo-abusers.md); for deep collaborator navigation use [couplers](smells/couplers.md); trace hidden side effects using actual consumer contracts.
