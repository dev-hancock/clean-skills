# Readability: naming, functions, comments, formatting

## Names that communicate rather than decorate

- Use vocabulary from the domain and existing ubiquitous language. One concept gets one name; different concepts get different names. Distinguish `messageId`, `claimId` and `correlationId` rather than `id` in ambiguous scopes.
- Name operations for their **observable** behaviour. `Get` should not persist, publish or mutate; `TryClaim` should specify failure semantics; `Calculate` shouldn't do IO.
- Prefer pronounceable, searchable, non-misleading words. Avoid anonymous numbers, generic `data`, `thing`, `manager`, `utils`, `temp`, and near-synonyms with no meaningful distinction.
- Add only disambiguating context; avoid repeatedly encoding the same context in a name. Follow applicable language and repository naming conventions.
- Avoid encoding type or scope into names. A `List<T>` might later become a collection; avoid naming it `customerList` unless list semantics matter.
- Choose positive and domain-accurate predicates (`CanRetry`); don't invert twice (`!isNotAvailable`). Never misrepresent a costly query as a cheap property.
- Public APIs should expose stable intent, not transport framing or transient implementation details.

## Functions: one meaningful level of intention

- The method should accomplish one coherent task and read at a consistent conceptual altitude. Distinguish orchestration from parsing strings, writing SQL, or building HTTP responses, unless locality genuinely makes it clearer.
- Minimise hidden side effects. Surface significant mutations/IO in names, structure or interfaces. A command may change state; a query should not unexpectedly mutate it.
- Prefer cohesive arguments; a named command/value object is justified for parameters that form a real concept, not merely to hide a long signature. Avoid output parameters when returning a result is clearer.
- Prefer early returns when they simplify branching. Avoid duplicated branches, deep nesting, unexplained `break`/`continue`, and dense LINQ that hides material work.
- Abstract a subroutine only if it names a real concept, removes consequential duplication or improves comprehension. One-line wrappers often obscure reading order.
- Use enums/domain types for boolean flags selecting independently named operations, but don't ban every boolean: `includeArchived` can be legitimate when the meaning is obvious.
- Keep branch cases exhaustive where correctness requires it. Pattern-matching or polymorphism is a means, not a requirement.
- Avoid magic domain limits, units and time values. Use named concepts/units where mixing them would be harmful; don't wrap `0` or `1` without a reason.

## Expression complexity and abstraction levels

- Keep the main path of an orchestrating function at a consistent level of abstraction: name retrieval, decisions, effects and substantial transformations rather than exposing every detail inline.
- During initial implementation, extract a meaningful transformation when a selector or expression combines nested projections, object construction, filtering and branching or representation conversion. Prefer a readable named operation and meaningful intermediate values to a dense expression.
- A query handler should make selection/retrieval and result transformation apparent. Keep a trivial projection inline; separate substantial projection details from the handler. A private function is sufficient for a small local transformation; use [abstraction decisions](../../clean-design/references/abstraction-decisions.md#deterministic-transformations) when the transformation warrants its own owner.
- Do not optimise for minimum lines, arbitrary nesting limits or maximum method count. Extract only operations that communicate a real concept; preserve straightforward local control flow and avoid pass-through helpers.
- Preserve evaluation order, short-circuiting, effects, failure behaviour and collection semantics when restructuring existing expressions. Use the applicable language skill for idiomatic techniques and runtime-specific risks.

## Duplication

- Eliminate repeated **business knowledge** whose copies must stay in sync; centralize rules at the right owner.
- Two identical-looking fragments may represent different policies with different rates of change. Extracting them together may create wrong coupling.
- Look for repeated conditionals, contradictory defaults or parallel collections as stronger signals than mere textual similarity.

## Comments

- Explain non-obvious **why**: constraints, trade-offs, protocol specifics, concurrency assumptions, surprising framework behaviour, rationale for awkward code.
- Replace comments compensating for bad names or muddled control flow with clearer code. Remove stale, diary-style, commented-out code and redundant XML summaries.
- Document public contracts, required ordering, units, nullability and interoperability where they are not obvious. Comments must stay true after changes.
- TODO requires owner/context when it represents important missing behaviour; don't label intentionally unimplemented functionality as complete.

## Formatting and source organization

- Follow configured formatting, existing file structure and applicable language conventions; automated formatting is preferable to arbitrary personal style.
- Organise source to support a reader's flow; keep related implementation near usage where the repository style permits.
- Avoid huge classes with unrelated responsibilities, but do not split purely to satisfy a line count.
- No gratuitous whitespace-only rewrites inside a targeted behavioural change; noisy diffs hide regressions.

## Review prompts

Could a new maintainer identify the main path and the exact side effects quickly? Would a name become false if storage or transport changed? Does understanding a simple behaviour require opening four forwarding classes? Which comments would become wrong after the next refactor?
