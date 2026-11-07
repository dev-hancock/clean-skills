# `/clean-code review` — inspect and report, never modify

Use `/clean-code review [changeset | solution | repo | class | method] [target]`, or provide a named file/symbol in natural language. Slash syntax depends on the host UI.

## Scope selectors

| Selector | Target and coverage |
| --- | --- |
| `changeset [range]` | Review the specified commit range, PR diff or supplied patch. Without a range, inspect staged and unstaged working-tree changes and relevant untracked source, recording the baseline. Ask if the intended range/base is ambiguous; do not assume a branch comparison. |
| `solution [path]` | Enumerate projects in the named solution/workspace and review their relevant source, tests and composition. Use the sole identifiable solution if no path is supplied; ask when several are plausible. |
| `repo [path]` | Enumerate the requested repository's source, tests, configuration and supporting material. Exclude generated, vendored and build output unless requested or necessary; disclose exclusions. |
| `class <symbol>` | Review the class and necessary callers, dependencies, contracts and tests. Disambiguate duplicate names. |
| `method <symbol>` | Review the method and necessary caller/contract/test context. Identify its containing type/module and disambiguate overloads where needed. |
| Named file/symbol or no selector | Resolve explicit target, attached/editor context or clearly implied current changes. Ask if no target can be identified. |

An explicit `solution` or `repo` request authorises broad assessment. Do not substitute a changeset or sample without saying so. Maintain an inventory of inspected, partially inspected and uninspected areas; a search hit or directory listing is not a full read. Clearly label incomplete coverage. Whole-scope review does not authorise whole-scope edits.

## Permission boundary

- **Read-only by contract.** Inspect files, code navigation, diffs, metadata and existing test results. Do **not** edit source, tests or configuration, run automatic fixes/formatters, stage/commit changes or install packages.
- Return the report in chat by default. Write a report file only when explicitly requested; that permission covers the report, not reviewed code. Do not overwrite an existing report without permission.
- If a command could write files/caches, change dependencies, run migrations or mutate external state, do not run it unless the user explicitly authorises verification and accepts those effects. Use the selected language guide to identify suitable checks; report what was not run.
- Existing uncommitted changes are user-owned; never reset or rewrite them.

## Procedure

1. **Resolve and inventory scope.** Apply the selector above. Record revision/base and local changes, where available. For broad scope, enumerate relevant areas and track actual coverage.
2. **Discover relevant context.** Select matching [language guides](../references/languages/README.md) and required standards; use [source inspection](../references/verification.md#source-inspection) to investigate actual consumers, contracts and tests. Reuse reliable findings without reducing the declared coverage. For changesets, focus on new/regressed issues and label relevant pre-existing issues separately.
3. **Assess principles and risks.** Use [review gates](../references/review-gates.md) to focus investigation, consulting specific entries/exclusions in the [review principles catalogue](../references/review-principles-catalogue.md) only when investigating a concrete candidate issue or an explicitly exhaustive review. Identify technical debt, inconsistency, design drift, hidden complexity and probable defects; this is not stylistic rule policing. Prioritise correctness and reliability before maintainability. Distinguish book-derived principles from repository/language rules and additional engineering guidance.
4. **Validate candidate findings.** Check applicability, exclusions, actual consumers, documented semantics, accepted trade-offs and counter-evidence. Principles are evidence aids, not automatic defects. Report preference-based observations only for a documented project-standard violation or concrete maintenance, reliability or correctness impact. Reject unsupported claims and record meaningful rejected candidates. Do not turn a type count or suspected performance issue into a verified defect.
5. **Classify and recommend.** Assign severity and confidence below, give the smallest justified remedy and identify any approval needed for public/API/schema changes. Never apply the remedy in review mode.
6. **Render the report.** Use the [review report template](../templates/review-report.md), preserving its metadata, summary/counts, finding fields and coverage disclosures. Do not reuse example facts or claim broader inspection than performed.

## Severity and confidence

- **P1:** correctness or reliability defect, or serious maintainability defect; state release-blocking impact explicitly when applicable.
- **P2:** material readability, change-cost or robustness concern.
- **P3:** minor issue or consistency point supported by a documented standard violation or concrete consequence; omit unsupported preference-only noise.
- **High confidence:** directly verified in the code or reproduced, with the evidence stated.
- **Medium confidence:** reasoned from inspected code but an important assumption remains unverified.
- **Low confidence:** plausible concern needing a test, benchmark, measurement or runtime confirmation; make that condition explicit.

These are report classifications, not a severity system attributed to the book.

## Response contract

Follow the template derived from the supplied review example. Group findings into production, test, supporting-material and cross-cutting design sections as applicable; sort highest severity first within each section. Assign stable `CC-01` IDs in report order and preserve existing IDs on re-review. Count each finding once even if it spans areas.

Retain every finding's **Principles**, location, evidence, impact, remedy and confidence. Cite only applicable codes/concepts with a short topic, or exact repository rules with their source; leave full definitions in the catalogue. Keep instance-specific reasoning and impacts in the finding. Do not infer severity from a rule ID or count. Include re-review notes only when relevant. State "None" or "Not applicable" rather than inventing content; omit the re-review section for an initial review. Keep small reviews concise without losing the structure. Return illustrative snippets only where needed; never apply them. Do not claim files were changed unless a report was explicitly saved.

End with the selected findings awaiting user approval. The **Architect** can turn owner-selected findings into refactor work items; do not automatically start planning or implementation.

## References

Read task-relevant [readability](../references/readability.md), [design](../references/design.md), [architecture](../references/architecture.md), [refactoring smells](../references/refactoring-smells.md), [reliability](../references/reliability.md) and [testing](../references/testing.md) guidance as appropriate.
