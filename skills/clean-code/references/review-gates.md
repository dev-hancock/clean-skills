# Clean Code review gates

These are concise, original review questions derived from *Clean Code* (2008), not a checklist formally defined by the book or a reproduction of its text.

| Gate | Pass condition | Book basis |
| --- | --- | --- |
| Meaningful names | Names reveal intent and responsibilities, distinguish concepts and do not unnecessarily expose implementation mechanics or mislead about effects. | Chapter 2 |
| Focused functions | Each function expresses one coherent task at a consistent conceptual level; supporting details do not obscure higher-level intent. State changes, external interactions, failure behaviour and ordering are understandable from the contract and context. | Chapter 3 |
| Useful comments and formatting | Comments explain necessary context rather than restating or excusing code; related behaviour and information stay conceptually close, with principal behaviour understandable before supporting details. | Chapters 4–5 |
| Objects and data | Objects protect behavioural abstractions; data structures expose intentional data. Interactions use meaningful responsibilities and established contracts without unnecessary knowledge of another component's internals. Avoid hybrids that leak internals without clear benefit. | Chapter 6 |
| Clear error handling | Failures retain meaning and context; error paths do not obscure the normal flow or silently lose failures. | Chapter 7 |
| Managed boundaries | Existing capabilities and guarantees are understood and used appropriately; third-party details stay at boundaries protecting meaningful responsibilities and consumer needs. Custom mechanisms and abstractions have demonstrable value without duplicating adequate functionality or adding avoidable coupling, complexity or behavioural risk. | Chapter 8 |
| Clean tests | Tests are readable, focused, fast, independent, repeatable, self-validating and written in time to guide the change. | Chapter 9 |
| Cohesive classes and modules | Behaviour belongs with the responsibility, policy or state it serves, not scattered across unrelated components merely for reuse or convenience. Independent change drivers are separated when warranted; interfaces and dependencies support actual consumers without ceremonial indirection. | Chapter 10 |
| Separated construction and use | Composition is distinct from runtime policy; system structure supports the required concerns without needless machinery. | Chapter 11 |
| Simple emergent design | Behaviour has credible tests, duplicated knowledge is removed, and structure and interactions express intent. Extraction clarifies responsibility, improves cohesion, protects a meaningful boundary or reduces change cost; moving code alone is not improvement. Meaningful boundaries are retained and unnecessary elements eliminated. | Chapter 12 |
| Deliberate concurrency | Shared state, synchronisation, ordering and shutdown have explicit ownership and relevant tests when concurrency exists. | Chapter 13 |
| No unexplained smells | Concrete naming, function, duplication, coupling and dead-code concerns have been investigated rather than accepted mechanically. | Chapter 17 |

## Applying the gates

Use the [workflow quality checkpoint](../../clean-workflow/references/quality-checkpoint.md) for when to apply these gates. Passing build/tests or architecture checks alone does not establish implementation quality.

- Inspect evidence in the requested scope. Use changed code and necessary context for a changeset; use the full declared inventory for an explicit solution/repo review. Check whether organisation reflects meaningful responsibilities or an accumulation of loosely related operations; challenge misplaced behaviour, artificial delegation and unnecessary indirection by their readability, cohesion and maintenance consequences.
- Report a failed gate only with a location, evidence and concrete correctness, readability or change-cost impact, not merely a stylistic preference. Use [abstraction decisions](../../clean-design/references/abstraction-decisions.md) to assess capability use and boundary value. Do not enforce numeric limits for function length, arguments, classes or assertions.
- Treat a smell as a question, not proof of a defect. Respect language semantics, accepted trade-offs, documented exceptions and deliberate repository choices. Do not prescribe or prohibit language constructs, implementation techniques or design patterns; evaluate their suitability within the actual design.
- Use the [review principles catalogue](principles/index.md) (open the known family directly; use the index only for lookup) for heuristic meanings, applicability, exclusions and evidence thresholds. In a finding's **Principles** field, cite only the applicable code/concept or exact repository rule. Do not invent codes or attribute modern platform rules to the book.
- During implementation/refactor, resolve material failures within authority and scope or disclose the blocker. During review, recommend a remedy without editing.
- Severity expresses impact, not how many preferences were violated. Use the [review classifications](review-standards.md#severity-and-confidence).

Build execution, compatibility, scope protection and truthful reporting are [operational safeguards](verification.md), not additional gates claimed to come from the book. Follow [verification guidance](verification.md) for executable evidence.

## Language style and skill conventions

Load only the matching [language guide](languages/README.md). C# reviews may use the [style and safety rules](principles/csharp.md); they do not impose an application architecture.

Check whether contracts express their ownership and mutation semantics, and whether meaningful translations preserve their guarantees. Follow applicable repository and language conventions. No particular type shape or implementation technique is itself evidence of good design.

## Coverage Risk Gate

This is additional verification guidance, not a book-defined gate. Apply numeric pass/fail targets only when actual repository policy defines them; this skill sets none.

| Evidence / condition | Reviewer action |
| --- | --- |
| Changed code has complex, uncovered behaviour | Investigate concrete risk and request meaningful tests or justified simplification; a score alone is not a defect. |
| Complexity increases without a concrete justification | Compare alternatives and explain actual comprehension or change-cost impact before retaining a finding. |
| A repository defines numeric coverage or complexity targets | Cite that policy, its scope and measured evidence; account for approved exceptions. |
| Required method complexity, coverage, baseline or test evidence is missing | Mark the affected decision unverified; do not invent a score or pass. No branch points means branch coverage is N/A. |
| Untouched legacy hotspots exist | Record relevant debt separately; do not fail solely for historical scores outside the change. |

Inspect risk-relevant failure paths, state changes and externally visible effects. A low score does not waive meaningful behavioural verification.

Use the [hotspot template](../../clean-workflow/templates/hotspot-review.md) for evidence. In review mode, report without editing or unauthorised collection. Severity follows impact, not a metric alone. Prefer tests and local simplification, not an architecture rewrite solely because of CRAP.
