# Evidence-driven verification and repair

These are execution safeguards, not gates attributed to the book.

## Source inspection

- Establish the investigation scope and questions before retrieval. Start with relevant entry points, responsibilities and dependencies; expand when evidence exposes affected callers, contracts, tests, composition or runtime constraints.
- Reuse reliable findings and unchanged source already available in the current task. Prefer targeted symbol/relationship queries and source ranges when sufficient; read broader context when necessary, without a fixed file limit.
- Inspect current source before changing behaviour or relying on critical architectural or behavioural guarantees. Recheck evidence affected by source changes or new constraints, rather than rediscovering the whole repository.

### Optional graph-assisted discovery

For substantial planning, implementation, architectural assessment or review, prefer focused queries against an existing, current codebase knowledge graph when relationships, consumers or change impact are not already known and graph discovery is more efficient than direct inspection.

- Graphifyy is an optional discovery aid, not an architectural authority or required dependency. Inspect its installed version and supported commands before relying on version-specific syntax; if unavailable or ineffective, continue ordinary inspection without treating that as a task failure.
- Retrieve only relevant relationships to select source files; distinguish observed/extracted evidence from inferred or ambiguous relationships. Verify material conclusions against current source and account for graph staleness.
- Do not run graph operations for every task or build/refresh merely because a command was invoked. Use incremental refresh only when staleness affects discovery and the benefit warrants the work. Refreshes must respect command permissions; read-only stages require explicit authorisation for writes or external effects.
- Avoid generating or reading large reports or dumping full graph output. For small changes, known relationships or absent graphs, direct source inspection is usually simpler.

## Before running tools

1. Use the applicable language or platform skill, if available, and established tooling findings; inspect missing or changed manifests, runtime requirements, test configuration and documented CI commands.
2. Choose the smallest meaningful test/build/type/lint target and its infrastructure prerequisites; combine related selectors in one run when practical.
3. Check working-tree state. Do not overwrite user changes or modify unrelated configuration.
4. Inspect command effects. In read-only review, do not run commands that write files/caches or mutate external state unless explicitly authorised.

## Verification loop

1. Run existing repository commands focused on affected behaviour for tests, compilation/type checks and configured analyser/format checks. Reuse executed results only while their source, configuration, dependencies and environment remain applicable; do not repeat unchanged checks without a reason. Do not assume one check substitutes for another.
2. Verify test discovery and execution; zero discovered tests is not a test pass.
3. Capture failures and determine whether they are introduced, pre-existing or environmental. Inspect the dependency path rather than assuming a failure is unrelated.
4. Repair introduced failures within scope. Do not weaken assertions, skip tests or change dependency versions solely to obtain a pass.
5. After a correction, rerun the failing check and other checks invalidated by that change. Expand for affected shared components, integration boundaries or broader risk.
6. Before completion, ensure executed evidence covers the work item, repository requirements and change risk, including required integration/behavioural tests. Honour required fresh completion runs; otherwise retain still-valid results. If blocked, identify the exact prerequisite and unverified behaviour; never imply success for unexecuted commands.

## Reporting

State exact commands, concise outcomes, test counts where available, skipped checks and remaining risks, not full successful logs. Static review is not an executed build or test run. Passing tooling cannot prove architectural quality, absence of races or correct recovery.

## Coverage verification

1. Inspect the repository's runner, collector, report format, filters and approved targets. Obtain authorisation for execution in review mode; use existing artifacts otherwise.
2. Execute the risk-relevant tests with coverage through the actual runner. Verify discovery, exit status, fresh raw output, source/revision mapping and non-empty production coverage.
3. Generate reports with the repository's configured reporting tool. Preserve raw inputs; a successful report command cannot replace a failed test run or supply missing complexity/branch data.
4. Review changed-method hotspots against comparable baseline complexity and meaningful line/branch evidence. Apply [CRAP analysis](testing.md#crap-analysis) only when the required method inputs exist.
5. Use the [Coverage Risk Gate](review-gates.md#coverage-risk-gate) and [hotspot template](../../clean-workflow/templates/hotspot-review.md). Record tests added, risky paths, before/after metrics, gate decisions, exceptions and unconfirmed concerns; count each finding once.
6. Recollect coverage when relevant changes invalidate it or a fresh run is required. Report the exact population and limitations rather than claiming whole-repository coverage from targeted tests or an assembly average.

All projects retain their own test runners, collectors and numeric targets. Untouched legacy debt alone is not a reason to fail a change; unavailable required evidence is unverified, not passing.

## Review and approval

- Map acceptance criteria and applicable approved standards to evidence, not merely to files that were edited.
- Use the [review principles catalogue](principles/index.md) (open the known family directly; use the index only for lookup) and [review gates](review-gates.md) proportionately. A documented-standard violation and a behavioural defect are different findings; severity follows impact.
- Obtain the relevant owner decision before breaking a public/persisted/protocol contract, making a consequential unapproved architectural deviation or introducing a migration. Routine local decisions and evidence-based technical corrections follow the active command's authority; do not reopen an approved design without contradictory evidence. A standards update does not authorise retroactive cleanup outside the requested scope.
- Record deliberate exceptions with their scope and rationale. Disclose missing evidence, baseline failures and unresolved conflicts; do not weaken the approved rule to describe an unverified result as compliant.

Platform commands and optional verification scripts belong to the applicable independent language skill, not the language-agnostic core.
