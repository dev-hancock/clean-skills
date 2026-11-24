# Review standards

## Severity and confidence

- **P1:** correctness or reliability defect, or serious maintainability defect; state release-blocking impact explicitly when applicable.
- **P2:** material readability, change-cost or robustness concern.
- **P3:** minor issue or consistency point supported by a documented standard violation or concrete consequence; omit unsupported preference-only noise.
- **High confidence:** directly verified in the code or reproduced, with the evidence stated.
- **Medium confidence:** reasoned from inspected code but an important assumption remains unverified.
- **Low confidence:** plausible concern needing a test, benchmark, measurement or runtime confirmation; make that condition explicit.

These are report classifications, not a severity system attributed to the book.


For a focused review without formal workflow, report the relevant findings concisely in chat and disclose scope and checks not run. Review is read-only. Do not require a report file.

A finding needs location, evidence, concrete impact, applicable principle or repository rule, proportionate remedy and confidence. Do not invent a finding from a metric or personal preference. See [review gates](review-gates.md) and the [principles catalogue](principles/index.md) (open the known family directly; use the index only for lookup). The [review procedure](../../clean-workflow/commands/review.md) owns scope, permissions, ordering and report format.
