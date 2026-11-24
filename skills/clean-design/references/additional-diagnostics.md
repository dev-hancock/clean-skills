# Additional design diagnostics

Supplementary Clean Code-informed signals retained from the original clean-code diagnostic catalogue. Use the [canonical smell families](../SKILL.md) for named smells and techniques; this quick lookup preserves complementary practical signals.

## Functions, branching and effects

| Signal | What to inspect / preferred response |
| --- | --- |
| Multiple levels of abstraction | Separate orchestration from low-level parsing/storage details when comprehension improves. |
| Boolean controls unrelated behaviours | Prefer separate named operations or domain mode where distinction is meaningful. |
| Output parameters or temporal call requirements | Return explicit results / encapsulate required sequence where appropriate. |
| Copy/pasted business policy | Centralize the knowledge at its owner; don't unify coincidental syntax. |
| Switch scattered across layers | Centralize variant-specific decisions; polymorphism only for genuine evolving variants. |
| Many one-line forwarding functions | Collapse when they own no distinct boundary/policy. |
| Excessive special cases | Find missing invariant, inappropriate abstraction, or inadequate state model. |

## Data, classes, modules

| Signal | What to inspect / preferred response |
| --- | --- |
| Public setters violate state rules | Keep state changes behind meaningful operations on the responsible object. |
| Passive data carrier given a needless behavioural hierarchy | Preserve its intended data semantics without invented responsibilities. |
| Parallel mutable collections | Group related state in a cohesive concept; preserve invariant. |
| Primitive obsession | Create a value type when an invariant/unit prevents actual bugs. |
| Value object explosion | Return to direct values when wrappers carry no meaningful semantics. |
| Large class with disjoint collaborators | Identify reasons to change; split along actual policy ownership. |
| Type with only one trivial client and no invariant | Inline if doing so simplifies reading and doesn't remove a real boundary. |
| Cyclic dependency / import tangle | Change responsibilities or ports so dependency direction is intelligible. |
| Hidden service locator, singleton mutable state | Make capabilities and lifetimes explicit. |
| Constructor parameter bag | Inspect cohesion; don't conceal the problem inside a `Dependencies` record. |
| Feature envy / chain into collaborator internals | Relocate decision if another type actually owns the relevant invariant. |
| Speculative generic base class | Replace with explicit implementations until stable variation is demonstrated. |
| Disconnected DTO mapper layers | Keep mapping at real trust/compatibility boundaries; remove ceremony. |
| Incoherent interface | Split by consumer capability; don't atomize coherent interfaces. |
| Inheritance breaks behavioural contract | Favour composition or fix substitutability and exception semantics. |

## Comments, structure and consistency

| Signal | What to inspect / preferred response |
| --- | --- |
| Arbitrary file splitting or huge mixed files | Organise for comprehensible responsibility and navigation. |
| Repeated condition that should be invariant | Enforce rule at state owner rather than every call site. |
| “Improve” via hypothetical future plugin/configuration | Require demonstrated use case and compare direct design. |

## Tests, boundaries and operational behaviour

| Signal | What to inspect / preferred response |
| --- | --- |
| Excessive mocks | Inspect coupling, replace with real deterministic collaborators or integration tests. |

See [implementation diagnostics](../../clean-code/references/refactoring-smells.md) for naming, errors, testing and operational concerns. Verify impact and choose a proportionate remedy.
