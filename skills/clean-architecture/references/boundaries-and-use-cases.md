# Boundaries and use cases

Apply within authorised scope and controlling repository policy. Preserve observable contracts and approved architectural boundaries; advice is not permission to change them.

Apply the [book's policy levels and Dependency Rule](book-principles.md#screaming-architecture-and-the-dependency-rule-chapters-2122). This reference concerns architectural decisions, not prescribed project layouts, service patterns or framework registrations.

## Find ownership in the actual system

- Identify the actor or stakeholder whose goal a capability serves, the policy being enforced, and which decisions may change independently.
- Distinguish general business policy, application-specific coordination, interaction/presentation policy, and external implementation details. These are **logical responsibilities**, not mandatory assemblies.
- Place an operation where its meaning and required decisions belong; do not infer ownership from the current class/folder name.
- Determine what callers actually need and what representation belongs on each side of a boundary.
- Check both sides of a proposed abstraction: who owns the contract, who consumes it, and which policy it protects.

## Dependency direction and change isolation

- Source dependencies should point to stable, higher-level policy. An outer mechanism may implement a contract owned nearer its policy consumer.
- An outward runtime call is not a violation when the higher-level policy does not depend on the implementation.
- Translation at a meaningful boundary protects each side's representation; avoid passing provider or delivery-specific shapes inward as policy types.
- Avoid dependency cycles between components. Correct responsibilities and contracts before adding a general shared component.
- Separation should reflect change drivers and clear ownership, not class counts or a fixed list of allowed techniques.

## Use-case interactions

- A use case owns application-specific choices: what information is required, which business behaviour is invoked, what result the actor receives, and what external capabilities are needed.
- Keep important business decisions out of UI/transport handlers, storage implementations and framework callbacks.
- Interface/delivery code translates external interaction into system intent and translates outcomes into the form expected by the caller.
- Do not create a meaningless forwarding layer simply to satisfy a naming convention. If a direct entry point already owns the use-case decisions and preserves the Dependency Rule, evaluate the actual architecture rather than requiring a ceremonial wrapper.
- Keep deferred, mutable or externally owned data from escaping a context whose lifetime or representation rules the consumer does not control.
- Protect state invariants at the owning policy boundary; input validation nearer the caller is complementary.

A conceptual interaction, **not a required naming or folder scheme**:

```text
External interaction -> use-case policy -> business policy
                            |
                            +-> policy-owned capability contract
                                             ^
                                             |
                                  external implementation
```

### Capability and use-case organisation

- Organise application source around cohesive capabilities, business concepts and use cases rather than technical implementation categories.
- Keep artefacts that change together near their owning use case.
- Do not separate related operations solely because they use different request, dispatch or execution mechanisms.
- Introduce structural hierarchy only where it improves cohesion, ownership or navigation.
- Technical categorisation is appropriate where it reflects a genuine technical responsibility or architectural boundary.
- CQRS separates read and write responsibilities; it does not require separate source directories.
- Respect established repository organisation and naming conventions.

## Composition and runtime ownership

- Construct and connect concrete mechanisms at an appropriate outer composition boundary. The composition mechanism can know implementation details without giving them authority over policy.
- Define where a request/operation begins and ends, who owns resources, and when state or external effects become visible.
- Choose synchronous or asynchronous collaboration according to guarantees, cost and user experience—not as an architectural purity test.
- Where coordination spans multiple commits or systems, identify recovery and state-ownership requirements explicitly.

## Known change and architectural alternatives

- Inspect the actual consumers and relevant *approved* downstream requirements before selecting a boundary.
- Keep high-impact choices changeable when a concrete anticipated change justifies the cost. Avoid both premature full frameworks and shortcuts that disregard known variation.
- Compare credible alternatives by cohesion, coupling, change impact, execution guarantees, operational complexity and understandability.
- Make intentional trade-offs explicit; do not pretend all SOLID and component principles can be maximised at once.

For formal delivery, use the [technical-design work-item guidance](../../clean-workflow/references/technical-design.md); this reference does not require a work item.

## Verification

- Trace a real entry point through policy and out to mechanisms; inspect source dependencies, not just the diagram.
- Check who decides behaviour, what can change independently, and whether boundary data leaks implementation concerns.
- Test policy without unnecessary mechanism setup; test real integrations where behaviour depends on them.
- Disclose unverified assumptions, especially if relevant source code, consumers or deployment configuration were not inspected.
