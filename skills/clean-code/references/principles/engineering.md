# Additional engineering principles

This is a targeted review reference, not a checklist or permission to edit. Use only applicable entries; inspect actual contracts, consumers and counter-evidence. A heuristic match alone is not a defect. Preserve repository policy, compatibility and scope; establish impact and classify severity/confidence using [review standards](../review-standards.md). Cite only relevant identifiers; do not count overlapping findings twice. See [catalogue index](index.md) for attribution and full usage rules.

These concerns supplement book-derived heuristics. Cite the applicable guidance or contract rather than inventing book codes for them.

| Principle | Meaning / applicability | Exclusions | Evidence threshold | Example |
| --- | --- | --- | --- | --- |
| Contract compatibility | External/public/persisted contracts must remain compatible or have an intentional migration. | Explicitly authorised breaking changes with an agreed rollout. | Inspect consumers and schemas; identify a concrete incompatible case. | An internal rename changes a persisted field without migration. |
| Failure semantics | Failure and cancellation retain meaning and have an explicit owner. | Deliberate recovery/fallback with a documented observable contract. | Trace the failing path and resulting state/response; qualify untested assumptions. | A cancelled operation returns the ordinary successful result. |
| Lifetime ownership | Resources and background work need clear lifetime, cleanup and supervision. | Ownership may intentionally be transferred or shared under an explicit protocol. | Trace creation, transfer, shutdown and failure paths. | A listener survives its owner and continues mutating retired state. |
| Concurrency guarantees | Shared/distributed work must meet its stated atomicity and recovery guarantees. | Single-owner or immutable designs may not need locks or leases. | Show competing operations and the allowed interleaving; state when provider/runtime confirmation is needed. | Two workers can both claim the same pending item. |
| Verification integrity | Verification and coverage claims must match observed evidence. | Static reasoning is valid when explicitly identified as such. | Compare the claim with commands, outputs and inspection inventory. | A successful build is reported as passing tests that were never run. |

For detailed reasoning, use [architecture](../../../clean-architecture/references/architecture.md), [reliability](../reliability.md), [concurrency](../concurrency.md) and [verification](../verification.md). These categories are aids to consistent review, not a new mandatory framework.
