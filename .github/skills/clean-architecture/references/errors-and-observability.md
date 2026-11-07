# Errors and observability

Supplementary reliability and operational guidance. The *Clean Architecture* book establishes boundaries and independent policy; it does not prescribe a specific error/result library, logger or observability framework.

## Error meaning and ownership

- Distinguish expected business outcomes from unexpected execution failures using established caller contracts.
- Keep error meaning consistent across a boundary while allowing the outer layer to translate it into delivery-specific responses or operational diagnostics.
- An adapter can translate a provider-specific failure into a meaningful policy outcome when doing so is justified. Policy must not inspect implementation-specific exception details.
- Do not silently convert a failed operation into apparent success, nor mask the primary failure with a secondary cleanup/logging failure.
- Define ownership for retry and recovery. Blind replay may duplicate externally visible effects or repeat non-idempotent decisions.
- Cancellation is a distinct outcome from genuine failure when the caller or host requested it; propagate it through cancellable work.

## Operational visibility

- Observe meaningful transitions, failures, degraded capacity and recovery at the boundary that knows their meaning.
- Keep diagnostic details in mechanisms while reporting business-safe outcomes to the caller.
- Preserve useful correlation across an operation where it matters without leaking credentials, personal data or sensitive payloads.
- Avoid logs or metrics that simply repeat each method call; prefer signals that help diagnose an actual operational problem.
- An audit record represents a business or operational fact; ensure its timing, outcome and failure policy are truthful.

## Verification

- Cover expected rejection, unexpected failure, cancellation, and failure during cleanup/auditing where those outcomes are relevant.
- Verify translation at real adapters and check that diagnostic behaviour does not change the business result.
- Test retry/replay only where the implementation genuinely supports it, including ambiguous completion and duplicate effects.
