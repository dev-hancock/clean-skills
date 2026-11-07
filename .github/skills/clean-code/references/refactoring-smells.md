# Diagnostic catalogue: smells, evidence, and responses

This is an **original, language-agnostic diagnostic taxonomy** informed by *Clean Code*: names, functions, comments, formatting, classes, systems, tests, boundaries, concurrency and general heuristics, with modern operational considerations. It is **not** the book's Chapter 17 reproduced or mapped one-to-one. Treat every item as a hypothesis to investigate; refactor only when impact is real.

## Names and understanding

| Signal | What to inspect / preferred response |
| --- | --- |
| Similar names for distinct things | Compare semantics; make different behaviours distinguishable. |
| Multiple synonyms for one concept | Choose consistent domain vocabulary across APIs, persistence and tests without casually breaking contracts. |
| Misleading operation name | Compare side effects to the name; rename or separate the operation. |
| Generic `Manager`, `Helper`, `Data`, `Service` | Identify the concrete decision/effect it owns; rename or absorb into correct owner. |
| Unsearchable abbreviation/encoding | Expand unless the abbreviation is established in the team/domain. |
| Unnecessary contextual repetition | Remove qualifiers that add no disambiguation. |
| Units or identifiers mixed | Use precise names/types for value, time, correlation, claim and resource IDs. |

## Functions, branching and effects

| Signal | What to inspect / preferred response |
| --- | --- |
| Multiple levels of abstraction | Separate orchestration from low-level parsing/storage details when comprehension improves. |
| Branches deeply nested | Use guards, simpler predicates, or an explicit state transition. |
| Boolean controls unrelated behaviours | Prefer separate named operations or domain mode where distinction is meaningful. |
| Output parameters or temporal call requirements | Return explicit results / encapsulate required sequence where appropriate. |
| `Get` mutates or IO unexpectedly | Align behaviour and naming; isolate side effects. |
| Magic domain thresholds | Name policy values and units; avoid wrapping every ordinary numeric literal. |
| Copy/pasted business policy | Centralize the knowledge at its owner; don't unify coincidental syntax. |
| Switch scattered across layers | Centralize variant-specific decisions; polymorphism only for genuine evolving variants. |
| Hidden catch/continue | Specify recovery or propagate failure. |
| Dead/unreachable/disabled code | Confirm safety, remove it and update tests. |
| Callback chain obscures control flow | Prefer direct synchronous/async calls or a clear explicit registry. |
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
| Comment repeats code | Delete or explain genuine rationale and constraints. |
| Misleading/stale comment | Correct immediately or remove. |
| TODO represents required behaviour | Implement it or disclose missing scope; no false completion. |
| Different errors handled inconsistently | Define owner and shared failure mapping policy. |
| Arbitrary file splitting or huge mixed files | Organise for comprehensible responsibility and navigation. |
| Gratuitous formatting churn | Narrow diff to behavioural task; use formatter separately. |
| Repeated condition that should be invariant | Enforce rule at state owner rather than every call site. |
| “Improve” via hypothetical future plugin/configuration | Require demonstrated use case and compare direct design. |

## Tests, boundaries and operational behaviour

| Signal | What to inspect / preferred response |
| --- | --- |
| Test asserts only no exception | Assert actual result/state/side effect. |
| Test mirrors every implementation step | Switch to observable contract except where interaction *is* the contract. |
| Test includes sleeps or real clock | Inject controlled time / explicit synchronization. |
| Excessive mocks | Inspect coupling, replace with real deterministic collaborators or integration tests. |
| Tests substitute a materially different dependency | Verify dependency-specific claims with evidence capable of establishing them. |
| Public contract changed under internal rename | Restore compatibility or design migration. |
| Cancellation ignored or swallowed | Propagate the platform's cancellation mechanism and preserve its documented semantics. |
| Repeated execution has unclear effects | Clarify the observable repeat/failure contract; follow repository conventions for retry mechanisms. |
| Compound state update is not atomic | Establish the required guarantee and test relevant interleavings before choosing a mechanism. |
| Ambiguous concurrent ownership | Establish the required guarantee; protocol choices follow repository conventions. |
| Log-only error handling | Require an explicit failure or meaningful recovery outcome. |
| Unbounded background work | Establish lifecycle, concurrency cap, backpressure and shutdown behaviour. |

## How to use the catalogue

1. Find a **specific instance**, identify its consequences, and locate consumers/contracts.
2. Compare the least intrusive correction with the existing design. Prefer a small measurable improvement.
3. Add or identify behavioural characterization where regression risk is nontrivial.
4. Make the change; inspect final code for worse complexity or new indirection.
5. Run verification and [review gates](review-gates.md); do not assert that a smell alone proves a defect.
