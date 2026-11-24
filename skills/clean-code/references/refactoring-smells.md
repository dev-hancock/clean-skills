# Diagnostic catalogue: implementation smells, evidence, and responses

Original Clean Code-informed diagnostic questions, not a reproduction of Chapter 17. For structural issues see [design diagnostics](../../clean-design/references/additional-diagnostics.md) and the [design skill](../../clean-design/SKILL.md). A signal is a hypothesis, not a defect.

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
| Branches deeply nested | Use guards, simpler predicates, or an explicit state transition. |
| `Get` mutates or IO unexpectedly | Align behaviour and naming; isolate side effects. |
| Magic domain thresholds | Name policy values and units; avoid wrapping every ordinary numeric literal. |
| Hidden catch/continue | Specify recovery or propagate failure. |
| Dead/unreachable/disabled code | Confirm safety, remove it and update tests. |
| Callback chain obscures control flow | Prefer direct synchronous/async calls or a clear explicit registry. |

## Comments, structure and consistency

| Signal | What to inspect / preferred response |
| --- | --- |
| Comment repeats code | Delete or explain genuine rationale and constraints. |
| Misleading/stale comment | Correct immediately or remove. |
| TODO represents required behaviour | Implement it or disclose missing scope; no false completion. |
| Different errors handled inconsistently | Define owner and shared failure mapping policy. |
| Gratuitous formatting churn | Narrow diff to behavioural task; use formatter separately. |

## Tests, boundaries and operational behaviour

| Signal | What to inspect / preferred response |
| --- | --- |
| Test asserts only no exception | Assert actual result/state/side effect. |
| Test mirrors every implementation step | Switch to observable contract except where interaction *is* the contract. |
| Test includes sleeps or real clock | Inject controlled time / explicit synchronization. |
| Tests substitute a materially different dependency | Verify dependency-specific claims with evidence capable of establishing them. |
| Public contract changed under internal rename | Restore compatibility or design migration. |
| Cancellation ignored or swallowed | Propagate the platform's cancellation mechanism and preserve its documented semantics. |
| Repeated execution has unclear effects | Clarify the observable repeat/failure contract; follow repository conventions for retry mechanisms. |
| Compound state update is not atomic | Establish the required guarantee and test relevant interleavings before choosing a mechanism. |
| Ambiguous concurrent ownership | Establish the required guarantee; protocol choices follow repository conventions. |
| Log-only error handling | Require an explicit failure or meaningful recovery outcome. |
| Unbounded background work | Establish lifecycle, concurrency cap, backpressure and shutdown behaviour. |

## How to use the catalogue

Locate the actual instance, impact and consumers; compare the least intrusive remedy. For structural edits use [refactoring safety](../../clean-design/references/refactoring-decisions.md); for verification use [verification](verification.md) and [review gates](review-gates.md). Review does not authorise edits.
