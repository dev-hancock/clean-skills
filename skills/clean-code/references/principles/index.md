# Review principles index

Use this reviewer reference to investigate technical debt, inconsistencies, design drift, hidden complexity and probable defects. Guidance is language-agnostic. Principles support reasoning; they do not establish defects or severity by themselves.

## Source and attribution


Book identifiers refer to Robert C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship* (2008), Chapter 17. The [publisher's contents](https://www.informit.com/store/clean-code-a-handbook-of-agile-software-craftsmanship-9780132350884) identifies the chapters and heuristic families. The explanations, evidence thresholds, exclusions and examples below are original practical interpretations, not quotations or a replacement for the book.

This catalogue covers the 63 language-independent Chapter 17 identifiers with original interpretations, not a reproduction of the chapter or an exhaustive index of every idea or example in the book. Language-specific heuristics are excluded. Repository and modern engineering entries are explicitly separate and are not assigned book heuristic codes. Language-specific implementation details belong to independently installed language skills.

## Identifier coverage and navigation

| Family | Identifiers | Entries | Reference |
| --- | --- | --- | --- |
| Comments | C1-C5 | 5 | [Comments](comments.md) |
| Environment | E1-E2 | 2 | [Environment](environment.md) |
| Functions | F1-F4 | 4 | [Functions](functions.md) |
| General | G1-G36 | 36 | [G1–G12](general-01-12.md), [G13–G24](general-13-24.md), [G25–G36](general-25-36.md) |
| Names | N1-N7 | 7 | [Naming](naming.md) |
| Tests | T1-T9 | 9 | [Tests](testing.md) |
| Repository policy | Not book codes | 3 | [Repository](repository.md) |
| Engineering | Not book codes | 5 | [Engineering](engineering.md) |

Use the identifiers as stable lookup keys, not as a requirement to apply every principle to every review. Language-specific review identifiers and additional engineering principles are outside this book-identifier inventory. If a family or ID is known, go directly to its reference without reading this index. Otherwise scan the lookup below and open only matching references. The lookup is not sufficient evidence: read the entry with applicability, exclusions and evidence threshold before citing it.

## How to use


1. Observe a specific instance in the declared review scope and inspect actual consumers, contracts and tests.
2. Select only relevant principles. Check the applicability and exclusions before retaining a candidate finding.
3. Establish concrete impact or a documented project-standard violation. A principle match alone is insufficient; measurements are useful but unsupported numbers are not evidence.
4. Account for accepted trade-offs, documented exceptions, compatibility and the cost of the proposed remedy.
5. In the report's **Principles** field, cite the code/concept with a short topic, or the exact repository rule and source. Keep detailed definitions here; put instance-specific evidence, impact and remedy in the report.
6. Assign severity from impact and confidence from evidence, using the [review standards](../review-standards.md#severity-and-confidence). A static observation can be certain while its predicted runtime consequence remains unconfirmed.
7. Check the identifier's meaning and family before citing it. Do not invent missing numbers or assign new meanings to existing identifiers.
8. Use the smallest set of principles that explains a finding. Overlapping entries are alternative reasoning aids, not separate defects to count repeatedly.
9. Treat book-era advice as context-sensitive guidance. Repository contracts, language semantics and accepted decisions can provide counter-evidence; never mandate new abstractions, wildcard imports or API breaks merely to match a heuristic.

## Identifier lookup

| ID | Meaning (routing only) | Reference |
| --- | --- | --- |
| C1 | Comments carry information better owned elsewhere. | [comments](comments.md) |
| C2 | A comment no longer describes the implementation. | [comments](comments.md) |
| C3 | A comment merely repeats obvious code. | [comments](comments.md) |
| C4 | A comment is too unclear to support its purpose. | [comments](comments.md) |
| C5 | Disabled source is retained as comments. | [comments](comments.md) |
| E1 | Building should have a dependable, documented entry point rather than remembered manual choreography. | [environment](environment.md) |
| E2 | Relevant tests should be discoverable and runnable through a repeatable workflow. | [environment](environment.md) |
| F1 | A parameter list can obscure a function's concept and make correct calls difficult. | [functions](functions.md) |
| F2 | Results communicated through mutated arguments can hide a function's contract. | [functions](functions.md) |
| F3 | A flag can combine distinct operations behind one deceptively simple name. | [functions](functions.md) |
| F4 | Functions without a supported caller or purpose should not remain as misleading alternatives. | [functions](functions.md) |
| G1 | Mixing languages can make a source unit harder to understand and maintain. | [general-01-12](general-01-12.md) |
| G2 | An abstraction should implement the ordinary behaviour its contract leads consumers to expect. | [general-01-12](general-01-12.md) |
| G3 | Correctness must hold at the edges of the supported input and state space. | [general-01-12](general-01-12.md) |
| G4 | Bypassing a safety mechanism needs a supported reason, not convenience. | [general-01-12](general-01-12.md) |
| G5 | Duplicated knowledge creates multiple change points. | [general-01-12](general-01-12.md) |
| G6 | Code should belong to the abstraction level that owns its meaning. | [general-01-12](general-01-12.md) |
| G7 | A base abstraction should not depend on the concrete descendants it is meant to support. | [general-01-12](general-01-12.md) |
| G8 | Expose the information consumers need without making internal machinery part of the contract. | [general-01-12](general-01-12.md) |
| G9 | Unused or unreachable code adds misleading alternatives. | [general-01-12](general-01-12.md) |
| G10 | Source organisation should keep closely related declarations easy to find together. | [general-01-12](general-01-12.md) |
| G11 | Equivalent concepts follow conflicting conventions or semantics. | [general-01-12](general-01-12.md) |
| G12 | Incidental material obscures the useful implementation. | [general-01-12](general-01-12.md) |
| G13 | Unrelated concepts should not acquire a dependency merely because they share convenient code or placement. | [general-13-24](general-13-24.md) |
| G14 | Behaviour that repeatedly manipulates another object's internals may belong with that object's knowledge. | [general-13-24](general-13-24.md) |
| G15 | Arguments that select unrelated operations can conceal separate responsibilities. | [general-13-24](general-13-24.md) |
| G16 | Intent is hidden by the expression of the code. | [general-13-24](general-13-24.md) |
| G17 | A decision is owned by the wrong collaborator. | [general-13-24](general-13-24.md) |
| G18 | A static operation should not freeze a responsibility that needs instance-specific behaviour or dependencies. | [general-13-24](general-13-24.md) |
| G19 | A meaningful intermediate name can make a complex expression understandable. | [general-13-24](general-13-24.md) |
| G20 | A function's name should describe the operation it actually performs. | [general-13-24](general-13-24.md) |
| G21 | An algorithm needs a clear correctness argument, not changes made by trial and error. | [general-13-24](general-13-24.md) |
| G22 | Dependencies assumed by an operation should be explicit in its inputs or owned structure. | [general-13-24](general-13-24.md) |
| G23 | Repeated type-based branching can indicate behaviour that belongs with the varying implementation. | [general-13-24](general-13-24.md) |
| G24 | Established conventions should make routine code predictable. | [general-13-24](general-13-24.md) |
| G25 | Unexplained literals conceal policy, units or assumptions. | [general-25-36](general-25-36.md) |
| G26 | Imprecise behaviour or terminology hides an important distinction. | [general-25-36](general-25-36.md) |
| G27 | Important constraints are safer when enforced by structure than by remembered conventions alone. | [general-25-36](general-25-36.md) |
| G28 | A complex condition can be clearer when expressed as a named domain question. | [general-25-36](general-25-36.md) |
| G29 | Prefer a directly stated condition when negation makes the decision harder to follow. | [general-25-36](general-25-36.md) |
| G30 | A function combines independently meaningful tasks. | [general-25-36](general-25-36.md) |
| G31 | Required call ordering is hidden in the API. | [general-25-36](general-25-36.md) |
| G32 | Structural choices should have a coherent reason rather than reflect incidental placement. | [general-25-36](general-25-36.md) |
| G33 | Boundary conventions should be explicit and owned rather than scattered through arithmetic adjustments. | [general-25-36](general-25-36.md) |
| G34 | A function descends through several abstraction levels at once. | [general-25-36](general-25-36.md) |
| G35 | Configurable policy should be selected by an appropriate high-level owner and supplied to lower-level work. | [general-25-36](general-25-36.md) |
| G36 | Consumers navigate through collaborators' internals. | [general-25-36](general-25-36.md) |
| N1 | Names should describe the actual concept or operation. | [naming](naming.md) |
| N2 | Names should match the abstraction exposed to callers. | [naming](naming.md) |
| N3 | Established domain or technical vocabulary aids understanding. | [naming](naming.md) |
| N4 | Names should distinguish meanings unambiguously. | [naming](naming.md) |
| N5 | Naming context should suit the scope of use. | [naming](naming.md) |
| N6 | Names should not preserve unnecessary implementation encodings. | [naming](naming.md) |
| N7 | Operation names should disclose significant effects. | [naming](naming.md) |
| T1 | Tests leave important behaviour unexamined. | [testing](testing.md) |
| T2 | Coverage information can reveal missed execution paths. | [testing](testing.md) |
| T3 | Apparently simple behaviour can still need tests. | [testing](testing.md) |
| T4 | Disabled tests can signal unresolved behavioural ambiguity. | [testing](testing.md) |
| T5 | Boundaries deserve deliberate test inputs. | [testing](testing.md) |
| T6 | A discovered defect warrants checking nearby cases. | [testing](testing.md) |
| T7 | Related test failures can expose a shared cause. | [testing](testing.md) |
| T8 | Coverage patterns can expose structural blind spots. | [testing](testing.md) |
| T9 | Test feedback should be fast enough for its intended loop. | [testing](testing.md) |

[Chapter references](chapters.md) — original book chapter-to-guidance map.

## Catalogue maintenance


- Add a principle only when it resolves a recurring review decision. Keep meaning, applicability, exclusions, evidence threshold and an original example together.
- Preserve book identifiers; do not attach a new meaning to an existing code. Separate any unverified attribution from established catalogue entries.
- Keep repository policy at its authoritative source and language-specific prescriptions in independent language skills.
- Amend an entry when counter-evidence exposes overreach. A report should capture the actual accepted trade-off rather than hiding it behind a rule citation.
