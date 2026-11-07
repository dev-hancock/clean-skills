# Tests as specifications and design feedback

## Test from behaviour, not implementation

- Enumerate acceptance criteria, valid/invalid states, boundaries, failure paths and observable effects *before* writing assertions. A test should be able to expose a defect, not merely execute a method.
- A practical test suite is focused, independently runnable, deterministic, readable and self-checking. Time and external resources must be controllable. Clean up shared state.
- Tests MUST verify the observable behaviour, relevant failure paths, side effects and state changes promised by the contract. Assertion-free tests are not valid verification.
- Conceptually Arrange → Act → Assert. Multiple assertions are appropriate when collectively describing one behavioural outcome; avoid assertion-free or “does not throw” tests when state/result should be verified.
- A regression test ideally fails before the fix and passes after it. Never weaken assertions or disable tests just to get a green build.
- Tests are clients of your public design. Excessive mock setup, reflection/private-field injection or testing internal steps often points to bad seams; don't create interfaces solely to make every method mockable.

## Select the right test level

- Pure calculation or local rule → focused unit tests using deterministic collaborators.
- Behaviour dependent on external components → integration/contract tests capable of establishing the relevant guarantee; a substitute cannot automatically prove equivalent behaviour.
- End-to-end flows → small, purposeful number of expensive tests for critical behaviour; avoid using them for every branch.
- For asynchronous processing, verify the promised ordering, cancellation, failures and resulting state when relevant.

Framework selection, fixture infrastructure and detailed integration protocols follow repository policy.

## Repository and language conventions

- Use the test framework and assertion conventions already present. Do not add a new assertion package simply for stylistic consistency.
- Follow existing test naming conventions; names should describe the circumstance and expected observable outcome.
- Prefer actual domain objects and small hand-written fakes to mock-heavy internals. Use fixture scope appropriately and avoid incidental shared mutable state.
- Use the selected [language guide](languages/README.md) for test tooling and controllable time. Avoid real sleeps, external network dependencies in unit tests and nondeterministic ordering.
- Assertions should prove the persisted/returned/published outcome or an explicitly guaranteed interaction contract.
- Check both functional and negative cases; not every method needs every permutation, but each risk-significant invariant should have evidence.

## Before declaring success

- Confirm the test was discovered and executed; a clean compile does not establish tests ran.
- Distinguish newly added tests, existing tests run, skipped/filtered tests and integration tests blocked by environment.
- Follow the [verification loop](verification.md#verification-loop): start with affected behaviour, expand for shared/integration impact and required completion checks, and retain still-valid results rather than repeating unchanged runs. Investigate failures; don't call known unrelated failures “passes.”
- Review test code for duplication of the implementation, assertions against mocks rather than outcomes, arbitrary timing and names inconsistent with behaviour.

## CRAP analysis

CRAP (Change Risk Anti-Patterns) combines method cyclomatic complexity, `C`, with coverage, `c`, expressed as a fraction from 0 to 1:

```text
CRAP = C^2 * (1 - c)^3 + C
```

This is a modern risk metric, not a rule defined by Clean Code. State the tool's coverage basis and complexity definition. A report lacking method complexity or coverage cannot establish a score. The alternative `C * (1 - c)^2` is not standard CRAP.

| Score | Meaning |
| --- | --- |
| < 5 | Low risk |
| 5-30 inclusive | Medium risk |
| > 30 | High risk |

- Prioritise tests for changed high-complexity methods with uncovered meaningful branches, not easy lines that merely raise an average. Consider consequence and change frequency alongside the score.
- Reduce test debt when touching existing code: add behavioural/failure-path evidence and simplify logic where practical. Do not demand cleanup of unrelated historical debt.
- Verify observable outcomes; execution alone cannot establish assertion quality. A low score does not waive tests for an important invariant or boundary.
- Use actual repository policy for numeric coverage targets and gates; this skill sets none. The [C# evidence guide](languages/csharp/crap-analysis.md) explains how to interpret existing reports without selecting collection tools.
- Prefer tests, simpler conditions, reduced branching and cohesive extraction. CRAP alone does not justify architectural rewrites or new abstractions.
