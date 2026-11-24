# C# coverage evidence

Use existing repository tooling to investigate uncovered behaviour and complexity. Coverage metrics are additional engineering evidence, not requirements from the book.

## Collection and interpretation

- Inspect the repository's test runner, collector, report format, source filters and documented targets.
- Do not select a framework, install a collector or copy configuration from a different project.
- Obtain authorisation before running output-producing checks in review mode.
- Verify test discovery, revision/source mapping and non-empty relevant production coverage.
- Distinguish line, branch and method evidence. A report without method complexity or coverage cannot establish CRAP.
- Calculate CRAP only from verified inputs using the [standard formula](../../testing.md#crap-analysis).
- Apply numeric pass/fail targets only when actual repository policy defines them.
- Treat missing data as unverified, not zero risk or a pass.
- Do not fail a change solely for untouched historical debt or prescribe an architectural rewrite to lower a score.

## Calculation examples

These are illustrative inputs, not executed measurements or acceptance thresholds.

| Method / scenario | Complexity | Coverage | CRAP | Interpretation |
| --- | --- | --- | --- | --- |
| Parser before error-path tests | 10 | 50% | 22.5 | Inspect uncovered behaviour. |
| Formatter before boundary tests | 12 | 40% | 43.104 | Prioritise meaningful additional tests. |
| Formatter after boundary tests | 12 | 80% | 13.152 | Reduced metric risk does not prove assertion quality. |
| Simple conversion with no execution evidence | 2 | 0% | 6 | Low complexity does not establish correctness. |
| Fully exercised branching method | 30 | 100% | 30 | Remaining complexity still merits investigation. |

Record actual evidence and repository-specific decisions in the [hotspot template](../../../../clean-workflow/templates/hotspot-review.md). Frameworks, fixtures, collector commands and mandatory targets follow repository policy.
