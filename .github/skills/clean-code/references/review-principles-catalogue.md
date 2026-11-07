# Review principles catalogue

Use this reviewer reference to investigate technical debt, inconsistencies, design drift, hidden complexity and probable defects. General guidance is language-agnostic; the Java and C# sections are explicitly scoped. Principles support reasoning; they do not establish defects or severity by themselves.

## Source and attribution

Book identifiers refer to Robert C. Martin, *Clean Code: A Handbook of Agile Software Craftsmanship* (2008), Chapter 17. The [publisher's contents](https://www.informit.com/store/clean-code-a-handbook-of-agile-software-craftsmanship-9780132350884) identifies the chapters and heuristic families. The explanations, evidence thresholds, exclusions and examples below are original practical interpretations, not quotations or a replacement for the book.

This catalogue covers all 66 Chapter 17 identifiers with original interpretations, not a reproduction of the chapter or an exhaustive index of every idea/example in the book. Repository and modern engineering entries are explicitly separate and are not assigned book heuristic codes. Language-specific implementation details remain in the [language guides](languages/README.md).

## Identifier coverage and navigation

| Family | Identifiers | Entries | Reference |
| --- | --- | --- | --- |
| Comments | C1-C5 | 5 | [Comment heuristics](#comment-heuristics) |
| Environment | E1-E2 | 2 | [Environment heuristics](#environment-heuristics) |
| Functions | F1-F4 | 4 | [Function heuristics](#function-heuristics) |
| General | G1-G36 | 36 | [General heuristics](#general-heuristics) |
| Java | J1-J3 | 3 | [Java-specific heuristics](#java-specific-heuristics) |
| Names | N1-N7 | 7 | [Naming heuristics](#naming-heuristics) |
| Tests | T1-T9 | 9 | [Test heuristics](#test-heuristics) |

Use the identifiers as stable lookup keys, not as a requirement to apply all 66 to every review. CSHARP-* rules and additional engineering principles below are outside this book-identifier inventory.

## How to use

1. Observe a specific instance in the declared review scope and inspect actual consumers, contracts and tests.
2. Select only relevant principles. Check the applicability and exclusions before retaining a candidate finding.
3. Establish concrete impact or a documented project-standard violation. A principle match alone is insufficient; measurements are useful but unsupported numbers are not evidence.
4. Account for accepted trade-offs, documented exceptions, compatibility and the cost of the proposed remedy.
5. In the report's **Principles** field, cite the code/concept with a short topic, or the exact repository rule and source. Keep detailed definitions here; put instance-specific evidence, impact and remedy in the report.
6. Assign severity from impact and confidence from evidence, using the [review workflow](../commands/review.md#severity-and-confidence). A static observation can be certain while its predicted runtime consequence remains unconfirmed.
7. Check the identifier's meaning and family before citing it. Do not invent missing numbers, assign new meanings to existing identifiers or cite Java-only guidance for another language.
8. Use the smallest set of principles that explains a finding. Overlapping entries are alternative reasoning aids, not separate defects to count repeatedly.
9. Treat book-era advice as context-sensitive guidance. Repository contracts, language semantics and accepted decisions can provide counter-evidence; never mandate new abstractions, wildcard imports or API breaks merely to match a heuristic.

## Chapter references

| Chapter | Review concern | Supporting guidance |
| --- | --- | --- |
| 1 | Quality as understandable, dependable code that remains economical to change | [Design](design.md), [readability](readability.md) |
| 2 | Intent and precision in names | [Readability](readability.md) |
| 3 | Function responsibility, abstraction level and effects | [Readability](readability.md) |
| 4 | Comments that remain useful and accurate | [Readability](readability.md) |
| 5 | Layout that helps navigation and comprehension | [Readability](readability.md) |
| 6 | Behavioural abstractions versus intentional data structures | [Design](design.md) |
| 7 | Clear failure semantics and error paths | [Reliability](reliability.md) |
| 8 | Consumer-facing boundaries around external dependencies | [Architecture](architecture.md) |
| 9 | Readable, focused and dependable tests | [Testing](testing.md) |
| 10 | Cohesion, responsibility and dependency design | [Design](design.md) |
| 11 | Construction, composition and system concerns | [Architecture](architecture.md) |
| 12 | Tested behaviour, expression, duplication and unnecessary structure | [Emergent design](emergent-design.md) |
| 13 | Shared state, coordination and concurrency testing | [Concurrency](concurrency.md) |
| 14 | Incremental refinement of an existing implementation while preserving behaviour | [Refactoring smells](refactoring-smells.md), [verification](verification.md) |
| 15 | Evidence-led cleanup of framework code and its tests | [Testing](testing.md), [verification](verification.md) |
| 16 | Cohesion, coupling and improving an implementation through justified changes | [Abstraction decisions](abstraction-decisions.md), [emergent design](emergent-design.md) |
| 17 | Diagnostic heuristics across code and tests | All coded entries below; [review gates](review-gates.md) provide concise questions |

Chapters 14-16 are case studies, not additional identifier families or permission to repeat their refactorings mechanically. The expanded concurrency discussion in Appendix A is supported by [concurrency guidance](concurrency.md).

## Environment heuristics

These concern repeatable developer feedback, not permission to run builds/tests in read-only review.

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| E1 | Building should have a dependable, documented entry point rather than remembered manual choreography. | An ordinary build depends on hidden ordering, hand-edited files or undocumented preparation. | Explicit provisioning, separate pipeline stages and deliberate release approvals may be legitimate. | Inspect documented commands and identify a reproducible missing step; do not infer a failure without execution evidence. | A developer must manually copy a generated contract before the documented build can compile. |
| E2 | Relevant tests should be discoverable and runnable through a repeatable workflow. | Developers must assemble an undocumented sequence or manually select required tests to obtain meaningful feedback. | Different test levels may require separate commands, infrastructure and authorisation. | Compare the documented entry points with actual discovery and prerequisites; identify the omitted suite or manual dependency. | The advertised test command silently omits the integration project that checks persistence. |

## Function heuristics

No universal parameter-count limit or automatic signature rewrite follows from these entries.

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| F1 | A parameter list can obscure a function's concept and make correct calls difficult. | Callers repeatedly supply confusing combinations or several independent responsibilities share one signature. | Cohesive inputs, fixed external signatures and language conventions can justify several parameters. | Show actual call-site ambiguity or change coupling; propose a meaningful grouping only if one exists. | Several same-typed device identifiers are repeatedly passed in the wrong order. |
| F2 | Results communicated through mutated arguments can hide a function's contract. | Callers must discover which inputs are overwritten and when results become valid. | Established Try/out idioms, explicit buffer APIs and performance-sensitive contracts may be clearer or required. | Trace mutation and caller expectations; compare a return value without assuming an authorised API change. | A validation operation unexpectedly overwrites the supplied request with its normalised output. |
| F3 | A flag can combine distinct operations behind one deceptively simple name. | Boolean arguments select substantially different responsibilities or effects. | A clearly named cohesive option, fixed protocol or framework signature may legitimately use a flag. | Compare branches and call sites; show the hidden operation rather than banning booleans. | A boolean determines whether processing merely validates a device or also persists and publishes changes. |
| F4 | Functions without a supported caller or purpose should not remain as misleading alternatives. | A function appears abandoned after replacement or feature removal. | Public APIs, reflection, generated calls, callbacks and compatibility obligations may be genuine consumers. | Inspect callers and registration paths before recommending removal; a text-search miss alone is insufficient. | An obsolete conversion function remains beside the only registered replacement. |

## General heuristics

The topic labels below are paraphrases. Apply the evidence threshold to the actual instance, not to its superficial shape.

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| G1 | Mixing languages can make a source unit harder to understand and maintain. | Substantial embedded syntax crosses semantic, escaping or tooling boundaries without a clear owner. | Templates, SQL, regular expressions and intentional interoperation may belong together; generated code is different. | Identify the concrete reading, editing or escaping risk and a justified boundary, not just two syntaxes. | A large embedded script requires repeated escaping that conceals the executed expressions. |
| G2 | An abstraction should implement the ordinary behaviour its contract leads consumers to expect. | A supported case is omitted or implemented as a surprising no-op. | Explicitly narrower contracts, capability checks and unsupported operations can be intentional. | Inspect the contract and caller expectation; name a supported input whose required behaviour is missing. | A cancellation-aware operation accepts a token but never forwards it to cancellable work. |
| G3 | Correctness must hold at the edges of the supported input and state space. | Empty, minimum, maximum, overflow or transition cases differ from ordinary inputs. | A narrower validated precondition may exclude a case; do not invent unsupported requirements. | Identify the accepted range and an exact boundary case; distinguish static reasoning from a reproduced failure. | A batch loop drops the last device when the count is an exact page multiple. |
| G4 | Bypassing a safety mechanism needs a supported reason, not convenience. | Checks, compiler diagnostics or test safeguards are disabled around questionable behaviour. | Narrow justified suppressions, controlled migration steps and approved exceptions can be valid. | Trace the disabled protection to the risk and inspect its rationale; do not demand blanket removal of suppressions. | A nullable warning is suppressed although a reachable missing-value path remains unchecked. |
| G5 | Duplicated knowledge creates multiple change points. | Copies encode the same business decision or algorithm. | Similar syntax may represent independent policies. | Identify the shared rule and the edits required to keep it consistent. | Eligibility rules copied across two entry points can drift. |
| G6 | Code should belong to the abstraction level that owns its meaning. | Generic or high-level components contain specialised implementation policy, or specialisations leak into their base. | Boundary adapters and cohesive orchestration may legitimately connect levels. | Trace ownership and reasons to change; distinguish misplaced ownership from a merely long function. | A reusable processing base class contains one device protocol's byte-decoding rules. |
| G7 | A base abstraction should not depend on the concrete descendants it is meant to support. | Base code imports, constructs or branches on specific derived implementations. | Deliberate closed hierarchies, framework constraints and documented self-referential generic patterns may justify a dependency. | Show the dependency direction and resulting change ripple before proposing a different design. | Adding a device subtype requires editing a switch in the shared base class. |
| G8 | Expose the information consumers need without making internal machinery part of the contract. | Public members or exported internals force callers to understand mutable implementation details. | Deliberate data structures, diagnostics and compatibility contracts may expose data intentionally. | Inspect real consumers and the invariants or change coupling created by the exposed surface. | A service exposes its mutable retry queue although callers only need processing status. |
| G9 | Unused or unreachable code adds misleading alternatives. | A branch, member or path has no supported execution or consumer. | Reflection, generated callers, external APIs and compatibility hooks may be genuine consumers. | Inspect reachability, registrations and known external use; absence from a text search alone is insufficient. | A retired branch still appears to define supported behaviour. |
| G10 | Source organisation should keep closely related declarations easy to find together. | A reader must repeatedly cross unrelated material to connect a value, its use or a caller and helper. | Repository layout, class organisation, language rules and generated declarations can justify separation. | Identify the actual navigation burden and a compatible layout improvement; impose no arbitrary distance limit. | A local calculation is separated from its only use by several unrelated processing blocks. |
| G11 | Equivalent concepts follow conflicting conventions or semantics. | Callers must remember differences without a meaningful domain reason. | Different contracts, migrations or lifecycle rules can justify differences. | Compare concrete usages and show confusion, divergent handling or a standard violation. | Two rejection results disagree on whether a value may be present. |
| G12 | Incidental material obscures the useful implementation. | Redundant state, scaffolding or commentary increases reading effort. | Required framework code, generated files and compatibility machinery are not automatically clutter. | Identify what can be removed safely and why comprehension improves. | A flag is assigned but never affects an observable decision. |
| G13 | Unrelated concepts should not acquire a dependency merely because they share convenient code or placement. | A utility, constant or import forces independent features to depend on each other. | Genuine shared domain meaning and approved architectural boundaries justify coupling. | Identify the unnecessary dependency and its concrete change or reuse cost; do not condemn all shared helpers. | A report formatter imports device hosting just to access a general text delimiter. |
| G14 | Behaviour that repeatedly manipulates another object's internals may belong with that object's knowledge. | A method reaches through a collaborator to make decisions about its private state. | External projections, boundary mapping and algorithms over intentional data structures may be correctly placed. | Trace the data access and rule owner; compare a cohesive operation rather than adding a forwarding wrapper. | A coordinator reads several device internals to enforce a transition the device already owns. |
| G15 | Arguments that select unrelated operations can conceal separate responsibilities. | A flag, enum or mode value changes what task a function performs rather than supplying data for one task. | Parsers, command dispatch and cohesive policy choices may legitimately select behaviour. | Compare actual modes and consumers; justify any split without creating a class per branch. | A mode parameter changes an export operation into an unrelated cleanup operation. |
| G16 | Intent is hidden by the expression of the code. | A reader must decode an indirect trick to understand the operation. | Familiar, accurate idioms may be clearer than verbose replacements. | Explain the hidden meaning and compare a direct expression. | Reading an unrelated property solely to trigger a disposal check hides its purpose. |
| G17 | A decision is owned by the wrong collaborator. | Code depends on another owner's knowledge or changes for another owner's reasons. | Boundary translation and cohesive orchestration can legitimately involve several collaborators. | Trace the rule's data, consumers and change ownership; show why relocation helps. | A generic pipeline depends on line-chart-specific parsing helpers. |
| G18 | A static operation should not freeze a responsibility that needs instance-specific behaviour or dependencies. | Static placement obstructs required variation, lifetime ownership or explicit collaborators. | Pure calculations, named constructors and stateless utilities may be appropriately static. | Identify the actual need for instance semantics; do not create interfaces merely to mock a pure function. | A static activation policy reads global mutable configuration although each tenant has distinct rules. |
| G19 | A meaningful intermediate name can make a complex expression understandable. | Repeated calculations or nested expressions hide a domain distinction. | A short familiar expression may be clearer inline; extra locals can add noise. | Explain what concept a named value exposes and preserve evaluation order and side effects. | A named remaining-capacity value makes a multi-part admission check readable. |
| G20 | A function's name should describe the operation it actually performs. | The name omits or misstates its responsibility, result or important effect. | External signatures and established protocol terminology may constrain renaming. | Compare the actual operation with caller expectations and assess compatibility before renaming. | A function named ValidateDevice also activates its licence and commits changes. |
| G21 | An algorithm needs a clear correctness argument, not changes made by trial and error. | Control flow or arithmetic cannot be related to a supported invariant or expected result. | An unfamiliar but established algorithm is not defective merely because it needs explanation. | Identify the invariant, work through representative and boundary cases, and state what remains unproved. | A retry calculation is repeatedly adjusted without checking its maximum delay or overflow behaviour. |
| G22 | Dependencies assumed by an operation should be explicit in its inputs or owned structure. | One component silently relies on another component's private limits, ordering or layout. | Stable external protocols can prescribe shared assumptions, but those assumptions still need a clear contract. | Trace the implicit assumption and the independent change that could break it; avoid adding needless layers. | A table formatter assumes the exporter always supplies a fixed number of columns instead of reading its schema. |
| G23 | Repeated type-based branching can indicate behaviour that belongs with the varying implementation. | Several consumers repeat the same type discrimination and must change together for every new variant. | Exhaustive switches over closed data, boundary translation and simple local decisions may be clearer than polymorphism. | Show repeated variation and change cost; justify dispatch only when it simplifies the actual design. | Several services duplicate protocol-specific behaviour selection for every device adapter. |
| G24 | Established conventions should make routine code predictable. | Code departs from an applicable repository or language convention without a meaningful reason. | Approved exceptions, fixed external contracts and migration boundaries may require differences. | Cite the controlling convention and actual deviation; do not invent a standard from personal preference. | One changed service uses a different cancellation-parameter convention from the documented project policy. |
| G25 | Unexplained literals conceal policy, units or assumptions. | A value's meaning or coordination with other values is not evident. | Ordinary identities, obvious indexing and self-explanatory local values need no ceremonial constants. | Identify the hidden meaning or maintenance risk, not merely a numeric literal. | A retry delay has no stated unit or policy owner. |
| G26 | Imprecise behaviour or terminology hides an important distinction. | A condition, range, conversion or error classification is ambiguous or inaccurate. | Documented approximation or tolerance can be intentional. | State the exact contract and a case where the distinction matters. | A subscriber exception is reported as a data-preparation failure. |
| G27 | Important constraints are safer when enforced by structure than by remembered conventions alone. | Valid operation depends on callers remembering an avoidable unwritten rule. | Framework constraints, compatibility and the cost of a new type may favour documented validation instead. | Show a plausible invalid use and how an existing type, guard or ownership rule can prevent it. | A required initialisation state can be enforced at construction instead of relying on every caller to invoke setup. |
| G28 | A complex condition can be clearer when expressed as a named domain question. | Repeated or intricate predicates hide the decision they implement. | A simple local condition does not need a helper; extraction must preserve evaluation and side effects. | State the condition's meaning and show how naming improves understanding without concealing relevant detail. | A repeated multi-clause predicate becomes a clearly named eligibility check on its rule owner. |
| G29 | Prefer a directly stated condition when negation makes the decision harder to follow. | Double negatives or negatively named predicates cause a reader to reverse the meaning repeatedly. | Guard clauses, explicit rejection paths and natural absence checks can be clearer with negation. | Explain the actual ambiguity and preserve branch semantics; do not ban logical negation. | A negated IsNotEligible flag makes the acceptance path difficult to distinguish from rejection. |
| G30 | A function combines independently meaningful tasks. | Responsibilities or abstraction levels are interleaved and change independently. | A cohesive orchestration function may legitimately sequence named operations. | Identify distinct tasks and their concrete change/readability cost. | One routine parses configuration, calculates prices and formats transport responses. |
| G31 | Required call ordering is hidden in the API. | Correctness depends on an unstated earlier call or lifecycle step. | Explicit protocols, guarded state machines and documented lifecycle APIs may require ordering. | Show a plausible sequence that produces invalid or surprising behaviour. | A builder silently does nothing unless a setup method was called first. |
| G32 | Structural choices should have a coherent reason rather than reflect incidental placement. | Similar responsibilities are split or combined in ways consumers cannot explain or predict. | Independent histories and deliberate bounded contexts can justify different structures. | Identify the unexplained choice and concrete navigation or change cost; do not demand visual symmetry. | One device validation rule lives in a transport mapper while equivalent domain rules live on the device. |
| G33 | Boundary conventions should be explicit and owned rather than scattered through arithmetic adjustments. | Several callers independently translate inclusive/exclusive limits or offset positions. | A single obvious local adjustment or protocol-defined representation may be sufficient. | Establish the exact boundary contract and show duplicated conversions or an edge failure. | Several callers independently subtract one from an exclusive end position before passing it onward. |
| G34 | A function descends through several abstraction levels at once. | High-level policy is mixed with low-level parsing or manipulation. | Small local details may be clearer inline; extraction must add meaning. | Locate the level changes and explain the reader's burden. | An order workflow interleaves byte offsets with approval decisions. |
| G35 | Configurable policy should be selected by an appropriate high-level owner and supplied to lower-level work. | A reusable component hardcodes deployment-specific or operational choices. | Fixed protocol constants and true domain invariants are not configuration merely because they are literals. | Identify who legitimately varies the value and how it reaches the operation; avoid a new setting for every constant. | A low-level client hardcodes an environment-specific polling interval instead of receiving the approved configuration. |
| G36 | Consumers navigate through collaborators' internals. | Chains expose another object's behavioural structure and couple callers to it. | Plain data structures and deliberate fluent APIs are not automatically violations. | Show leaked structure, displaced decisions or a plausible change ripple. | A caller reaches through several objects to mutate state that the root should govern. |

## Comment heuristics

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| C1 | Comments carry information better owned elsewhere. | Source includes change histories or administrative metadata maintained in another system. | Required licence notices, provenance and compliance annotations remain valid. | Establish the authoritative owner and the duplication or distraction. | A hand-maintained revision diary conflicts with source history. |
| C2 | A comment no longer describes the implementation. | A claim contradicts current behaviour or contracts. | Historical rationale can remain useful when clearly marked and still relevant. | Compare the comment with current code and identify the misleading conclusion. | A comment promises retries after the retry path was removed. |
| C3 | A comment merely repeats obvious code. | Prose adds no meaning beyond accurate names and operations. | Public-contract documentation and non-obvious intent can justify apparent repetition. | Show the lack of added information and resulting noise; omit trivial preference-only findings. | A comment says to increment the counter immediately above that operation. |
| C4 | A comment is too unclear to support its purpose. | Wording leaves critical assumptions, units or rationale ambiguous. | Quoted protocol text and constrained external terminology may need exact preservation. | Identify the unanswered question and its consequence. | A concurrency warning omits which state must share the same lock. |
| C5 | Disabled source is retained as comments. | Old executable fragments compete with the active implementation. | Educational examples, documented alternatives and migration guidance can be intentional. | Confirm it is abandoned implementation rather than useful documentation. | A superseded validation routine remains pasted beside its replacement. |

## Java-specific heuristics

These entries preserve the book's Java identifier mappings, not a supported Java language profile or rules for C#, JavaScript or another language. They are Java-only reference material. In particular, J1 records a book-era preference for package-wide imports, not a universal import rule or an instruction to rewrite imports. Modern repository/compiler/analyser policy controls the actual choice.

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| J1 | Java import-list verbosity involves a trade-off between package-wide imports and explicitly named dependencies. | A Java review needs to assess import noise under the repository's actual import policy. | Explicit imports can improve dependency visibility and avoid name conflicts; wildcard bans and automated import tools may be deliberate. | Cite the Java import policy and an actual ambiguity or maintenance burden; the book preference alone is not a defect. | An import-style observation is rejected because the Java analyser intentionally requires explicit imports. |
| J2 | A Java type should not acquire an inheritance relationship solely to gain access to constants. | A class implements an interface whose only purpose is sharing constants. | Real behavioural interfaces, externally fixed APIs and approved compatibility obligations are distinct cases. | Inspect the interface and consumers; show the unnecessary public type relationship before proposing a compatible alternative. | A parser implements an unrelated constants interface despite having no behavioural relationship with it. |
| J3 | Java enumerations can model a closed set of named alternatives more safely than unrelated primitive constants. | Primitive values stand for mutually exclusive named cases and permit accidental invalid combinations. | Numeric protocol values, open sets, configuration and compatibility requirements may need another representation. | Establish that the set is closed and inspect conversion/serialisation compatibility before suggesting an enum. | Several status constants are passed interchangeably with ordinary integers, allowing a nonsensical status value. |

## Naming heuristics

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| N1 | Names should describe the actual concept or operation. | Generic or misleading names obscure an important distinction. | Short names can be clear in tiny, conventional scopes. | Identify the missing meaning and a clearer domain term. | `Process` actually reserves stock and publishes a reservation. |
| N2 | Names should match the abstraction exposed to callers. | A public abstraction is named after one incidental implementation detail. | Technical adapters may intentionally expose a specific mechanism. | Compare the promised capability with actual supported implementations. | A transport-neutral delivery port is named after one broker. |
| N3 | Established domain or technical vocabulary aids understanding. | Invented synonyms hide a concept that already has a shared name. | Team/domain terminology can differ legitimately from textbook terminology. | Show the established term and the confusion caused by the alternative. | One API calls the same documented transaction a session. |
| N4 | Names should distinguish meanings unambiguously. | Similar terms can be confused at an actual use site. | Qualification or strong types may already make the distinction clear. | Show the ambiguous consumer context or likely misuse. | A parameter called `id` could mean either a message ID or a claim ID. |
| N5 | Naming context should suit the scope of use. | A terse name becomes ambiguous when used across a broad scope. | Tiny loops and conventional local calculations may need little qualification. | Identify where surrounding context is lost, not a minimum character count. | A module-wide `t` represents a timeout rather than time or a task. |
| N6 | Names should not preserve unnecessary implementation encodings. | Type/scope prefixes duplicate information or become misleading after change. | Required interface prefixes, external contracts and established repository rules take precedence. | Show stale or burdensome encoding and check applicable conventions. | A name still claims list semantics after the value became a stream. |
| N7 | Operation names should disclose significant effects. | A query-like name conceals mutation, IO or another meaningful effect. | Clearly documented protocol semantics and established APIs may constrain names. | Trace the effect and explain the caller's false expectation. | `GetCurrentSession` creates and persists a new session. |

## Test heuristics

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| T1 | Tests leave important behaviour unexamined. | A requirement, invariant or meaningful failure path has no convincing test. | A different test level may already cover the contract adequately. | Map the behaviour to the suite and identify a specific gap. | Rejection is tested, but preservation of prior state is not. |
| T2 | Coverage information can reveal missed execution paths. | Existing coverage evidence could help investigate risk or an asserted coverage claim. | A percentage alone proves neither useful assertions nor correctness; no arbitrary target is implied. | Cite actual coverage data or state that a coverage run is needed. | A changed rejection branch is absent from the coverage report. |
| T3 | Apparently simple behaviour can still need tests. | A small operation protects a nontrivial contract or boundary. | Do not demand tests for every trivial accessor or duplicate existing coverage. | Explain the plausible regression that a focused assertion would catch. | A one-line unit conversion has a rounding contract. |
| T4 | Disabled tests can signal unresolved behavioural ambiguity. | Skips/ignores conceal an uncertain or failing expectation. | Documented platform exclusions or managed quarantines may be justified. | Inspect the skip reason, ownership and intended behaviour. | An ignored test is the only specification of cancellation after commit. |
| T5 | Boundaries deserve deliberate test inputs. | Range edges, empty values or transitions change the result. | Equivalent boundary cases need not all be duplicated at every test level. | Identify the actual boundary and missing cases. | The suite tests a maximum but not just beyond it. |
| T6 | A discovered defect warrants checking nearby cases. | The same mechanism may fail around the known failing input. | Avoid combinatorial expansion without a shared risk. | Link neighbouring cases to the demonstrated defect mechanism. | An off-by-one fix is checked at the adjacent valid and invalid sizes. |
| T7 | Related test failures can expose a shared cause. | Several failing cases have a meaningful common pattern. | Infrastructure failures and independent defects may look related. | Compare actual failures and test the shared-cause hypothesis. | Several timezone-edge failures point to one conversion policy. |
| T8 | Coverage patterns can expose structural blind spots. | Untested regions cluster around a shared branch, boundary or scenario. | Uniform percentages can still hide weak assertions; generated code may distort the picture. | Identify the actual pattern and the behavioural risk it suggests. | Every error branch in one adapter is unexercised. |
| T9 | Test feedback should be fast enough for its intended loop. | Measured runtime discourages relevant tests or delays feedback materially. | Real infrastructure and end-to-end checks may legitimately be slower. | Use timings or a specific avoidable wait; do not invent duration limits. | Isolated tests spend most of their time sleeping instead of advancing controlled time. |

## Repository-specific standards

These are areas to investigate, not pre-existing team policies or book codes. An actual finding must cite the repository's exact rule and source; never infer a policy from these examples.

| Area | Meaning / applicability | Exclusions | Evidence threshold | Example |
| --- | --- | --- | --- | --- |
| Documented conventions | A documented naming, formatting, documentation or test convention is violated. | Approved exceptions, generated code and superseded policy. | Cite the rule, affected location and exception check. Distinguish standard deviation from a defect. | A required public-contract annotation is absent. |
| Architecture decisions | Implementation has drifted from an applicable, accepted architecture decision. | A superseding decision or authorised migration may permit the difference. | Cite the decision and show the actual dependency or ownership mismatch. | A domain module imports an adapter contrary to the repository's dependency rule. |
| Required verification | A required repository verification or quality check is missing or failing. | A check may not apply to the changed scope, or may have an approved waiver. | Cite the requirement and actual result, or explicitly state it was not run. | A mandatory contract test has no recorded execution. |

Use the [language registry](languages/README.md) to locate bundled standards and inspect repository instructions, configuration and decisions for the controlling policy.

## C# style and safety rules

These are language-specific skill conventions, not book identifiers or a backend project profile. Apply only to matching C# code, subject to controlling repository policy, compatibility and documented exceptions.

| Rule | Review requirement | Canonical source | Applicability / exclusions | Evidence threshold |
| --- | --- | --- | --- | --- |
| CSHARP-NAMING | Use meaningful names and applicable casing, field and Async conventions. | [Naming](languages/csharp/coding-standards.md#naming) | Preserve externally fixed names. | Cite the declaration, applicable rule and contract constraints. |
| CSHARP-LAYOUT | Verify applicable namespaces, indentation, braces, using groups and member order. | [Layout](languages/csharp/coding-standards.md#file-layout-and-formatting) | No unrelated formatting sweep; repository configuration controls. | Show the precise rule and changed location. |
| CSHARP-CLARITY | Check nullable contracts, intentional mutation, type semantics, readable expressions and accurate public documentation. | [Coding standards](languages/csharp/coding-standards.md) | No mandated DDD roles or role-to-type table. | Show the actual contract, state or readability concern. |
| CSHARP-ASYNC | Trace awaits, cancellation and ownership of tasks and resources. | [Language safety](languages/csharp/dotnet.md) | Preserve fixed signatures and documented execution contracts. | Cite a blocking call, lost failure, token path or lifetime issue. |
| CSHARP-MAPPING | Preserve meaning and contracts across representation boundaries without needless machinery. | [Boundary translation](architecture.md#contracts-and-translation) | Existing translation mechanisms may be required by compatibility or a meaningful boundary. | Show a concrete semantic, correctness or maintainability cost rather than enforcing a particular implementation form. |

Use the [Coverage Risk Gate](review-gates.md#coverage-risk-gate) and [hotspot template](../templates/hotspot-review.md) for available metrics. Numeric targets and collection tools come from the actual repository, not this catalogue. Count one verification gap once.

## Additional engineering principles

These concerns supplement book-derived heuristics. Cite the applicable guidance or contract rather than inventing book codes for them.

| Principle | Meaning / applicability | Exclusions | Evidence threshold | Example |
| --- | --- | --- | --- | --- |
| Contract compatibility | External/public/persisted contracts must remain compatible or have an intentional migration. | Explicitly authorised breaking changes with an agreed rollout. | Inspect consumers and schemas; identify a concrete incompatible case. | An internal rename changes a persisted field without migration. |
| Failure semantics | Failure and cancellation retain meaning and have an explicit owner. | Deliberate recovery/fallback with a documented observable contract. | Trace the failing path and resulting state/response; qualify untested assumptions. | A cancelled operation returns the ordinary successful result. |
| Lifetime ownership | Resources and background work need clear lifetime, cleanup and supervision. | Ownership may intentionally be transferred or shared under an explicit protocol. | Trace creation, transfer, shutdown and failure paths. | A listener survives its owner and continues mutating retired state. |
| Concurrency guarantees | Shared/distributed work must meet its stated atomicity and recovery guarantees. | Single-owner or immutable designs may not need locks or leases. | Show competing operations and the allowed interleaving; state when provider/runtime confirmation is needed. | Two workers can both claim the same pending item. |
| Verification integrity | Verification and coverage claims must match observed evidence. | Static reasoning is valid when explicitly identified as such. | Compare the claim with commands, outputs and inspection inventory. | A successful build is reported as passing tests that were never run. |

For detailed reasoning, use [architecture](architecture.md), [reliability](reliability.md), [concurrency](concurrency.md) and [verification](verification.md). These categories are aids to consistent review, not a new mandatory framework.

## Catalogue maintenance

- Add a principle only when it resolves a recurring review decision. Keep meaning, applicability, exclusions, evidence threshold and an original example together.
- Preserve book identifiers; do not attach a new meaning to an existing code. Separate any unverified attribution from established catalogue entries.
- Keep repository policy at its authoritative source and language-specific prescriptions in language guides.
- Amend an entry when counter-evidence exposes overreach. A report should capture the actual accepted trade-off rather than hiding it behind a rule citation.
