# Specification principles

Specify **what a capability must guarantee and why**. A specification is a durable behavioural contract, not a walkthrough of current code, an implementation plan or a progress report.

## Intent precedes implementation

Never infer that behaviour is required merely because it is implemented. For each capability, reason in this order:

1. **Purpose:** who relies on it, which problem it solves and why the outcome matters.
2. **Contract:** what callers, users, operators or adjacent systems can rely on.
3. **Invariants and boundaries:** what must always hold, including failure, retry, concurrency, cancellation, recovery and compatibility where relevant.
4. **Acceptance criteria:** which observable scenarios would falsify the guarantees.
5. **Implementation comparison:** whether the current system appears to satisfy the contract. Report mismatches separately; never rewrite a requirement to match the code.

Code can inform questions, edge cases and feasibility. It must not choose the answer to an unresolved policy question.

## Sources and authority

Search proportionately, most authoritative first: the owner's explicit intent and decisions; existing specifications, decision records and published contracts; historical discussion and consumer expectations; current code, tests and runtime behaviour; then recommendations.

| Kind | Meaning | Handling |
| --- | --- | --- |
| Established | Explicitly agreed behaviour or a documented contract | Write normatively |
| Recommended | A plausible guarantee the owner has not stated | Label as a recommendation until the owner accepts it |
| Observed | What the code currently does | Use to find mismatches and compatibility risks; never copy into requirements as such |
| Inferred | A plausible interpretation without adequate authority | Verify it, or turn it into a question |
| Open decision | Several defensible outcomes, or unclear authority | Record in `GAPS.md` with options and a recommendation |

Published behaviour can create compatibility obligations even when its rationale is unknown; changing it needs a deliberate decision.

## Required versus incidental detail

Ask: **would consumers care if this changed while the promised capability remained correct?**

- **No:** it is an implementation detail; leave it out.
- **Yes:** state the guarantee, preferably without binding it to today's algorithm.
- **Uncertain:** assess compatibility and record a decision.

| Implementation observation | Potential specification intent |
| --- | --- |
| A query selects items due at or before now | Work due exactly at its deadline is eligible, **if that boundary is intended** |
| An attempt counter increases when work is acquired | Retry accounting has a defined meaning; **decide** whether acquisition, execution or settlement consumes an attempt |
| A lease expiry time is stored | An obsolete owner cannot complete work it no longer owns |
| A failed transaction is retried automatically | Retried execution preserves the documented consistency guarantees |

Technical precision is legitimate when it is contractual, such as a library's ownership or retry semantics. The problem is detail with no contract reason beyond matching the implementation.

## Writing a specification

1. Name the capability by its result or guarantee, not by a class or method.
2. State its purpose in one scannable paragraph. Add an `Intent` section only when
   context beyond the purpose is useful.
3. Write the contract as a numbered list of normative `SHALL` or `SHALL NOT`
   statements. Include functional, quality, and deliberate non-guarantees when
   contractually important.
4. Put boundaries, exclusions, dependencies, preconditions, and assumptions in the
   contract only when consumers need to rely on them.
5. Derive concise acceptance criteria from the contract.
6. Keep undecided semantics out of the criteria; record them as open decisions.

Describe what to build, not how. Name internal types, methods, storage or algorithms only when they form part of an external contract. Use the [specification template](../templates/specification.md).

## Acceptance criteria

Each criterion is:

- **Normative:** states intended behaviour, not merely observed behaviour.
- **Falsifiable:** states a concrete observable outcome that would prove or disprove
  the contract; do not use Given/When/Then prose.
- **Cohesive:** proves one meaningful guarantee; several related assertions may prove it together.
- **Implementation-resilient:** survives a refactor that preserves the contract.
- **Authority-aware:** backed by established intent, or held back as an open decision.

Consider these scenarios proportionately, rather than generating them mechanically: normal paths and relevant invalid input; boundaries that change consumer-visible semantics; duplicates and identity; concurrency, ownership loss and recovery; atomicity, crash points and external side effects; permanent and retryable failures; ordering, compatibility, retention and deliberate non-guarantees.

Do not create one criterion per branch, method, configuration value or test assertion.

> **Good — AC-001, exclusive acquisition:** Two processors racing to acquire the same eligible work item result in at most one valid owner.
>
> **Weak — AC-001, storage predicate:** Acquiring a row with an empty claim column increments the attempt counter.

The weak version mirrors internals and embeds an unresolved policy choice about attempts.

## Identity and traceability

- Capability IDs use a short, meaningful prefix (`WORK-001`). Acceptance criteria
  use a document-local `AC-nnn` ID (`AC-002`).
- Keep an ID only while its obligation is unchanged. Rewording is fine; reusing an ID for a different obligation is not. Report merges, splits, removals and changes of meaning, with the tests they affect.
- Tests link to criteria through the repository's traceability convention, such as test metadata naming the criterion ID. A link provides traceability, not proof.

## Organisation

- Store specifications in `/docs/specifications`, organised by capability, unless repository instructions define another location.
- Keep criteria inside their owning specification; never create a folder per criterion.
- `INDEX.md` is a navigational catalogue. `GAPS.md` holds only material
  outstanding decisions with options, a recommendation and the affected IDs.

## Specifications are not progress reports

Never add Draft, Approved, Verified or Not tested labels, review dates, test counts, coverage or run results to specifications or `INDEX.md`. `GAPS.md` records only unresolved decisions. When the owner resolves a gap, incorporate the decision into the relevant specification and remove the gap entry. Agreement and progress live on work items, and run results belong to test output and summaries.

Change a specification only when its intended contract changes through an explicit decision, or to correct a documentation mistake.

## Efficient owner review

- Ask only questions whose answers change observable behaviour, safety, security, data durability or compatibility. Leave internal choices with equivalent outcomes to implementation.
- Group related uncertainties into one decision, with a plain-language consequence, a recommendation and the affected IDs.
- Continue with unambiguous material while decisions are pending.
- Accepting one recommendation settles only that recommendation. Agreeing a specification requires explicit agreement to its complete scope.

## Quality checklist

- [ ] Purpose and consumer value are explained.
- [ ] Each guarantee has authority beyond the current code, or awaits a decision.
- [ ] No criterion exists only because a branch, field or quirk exists.
- [ ] Recommendations and observations are not presented as requirements.
- [ ] Technical boundaries appear only where they are contractual.
- [ ] Criteria are observable and falsifiable.
- [ ] Failure, concurrency, recovery and compatibility are covered in proportion to risk.
- [ ] Non-guarantees do not hide undecided requirements.
- [ ] Outstanding decisions are in `GAPS.md` with recommendations and affected IDs.
- [ ] Resolved decisions are incorporated into specifications and removed from `GAPS.md`.
- [ ] IDs are stable where meaning is stable, and changes are reported.
- [ ] No status, run results or implementation walkthroughs are present.
