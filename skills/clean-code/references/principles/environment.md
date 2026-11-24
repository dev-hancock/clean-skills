# Environment heuristics

This is a targeted review reference, not a checklist or permission to edit. Use only applicable entries; inspect actual contracts, consumers and counter-evidence. A heuristic match alone is not a defect. Preserve repository policy, compatibility and scope; establish impact and classify severity/confidence using [review standards](../review-standards.md). Cite only relevant identifiers; do not count overlapping findings twice. See [catalogue index](index.md) for attribution and full usage rules.

These concern repeatable developer feedback, not permission to run builds/tests in read-only review.

| Code | Meaning | Applies when | Exclusions / counter-evidence | Evidence threshold | Example |
| --- | --- | --- | --- | --- | --- |
| E1 | Building should have a dependable, documented entry point rather than remembered manual choreography. | An ordinary build depends on hidden ordering, hand-edited files or undocumented preparation. | Explicit provisioning, separate pipeline stages and deliberate release approvals may be legitimate. | Inspect documented commands and identify a reproducible missing step; do not infer a failure without execution evidence. | A developer must manually copy a generated contract before the documented build can compile. |
| E2 | Relevant tests should be discoverable and runnable through a repeatable workflow. | Developers must assemble an undocumented sequence or manually select required tests to obtain meaningful feedback. | Different test levels may require separate commands, infrastructure and authorisation. | Compare the documented entry points with actual discovery and prerequisites; identify the omitted suite or manual dependency. | The advertised test command silently omits the integration project that checks persistence. |
