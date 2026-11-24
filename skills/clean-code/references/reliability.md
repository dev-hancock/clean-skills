# Clear errors and dependable contracts

## Error handling without obscuring intent

- Keep the main operation readable while making failure paths explicit.
- Preserve enough context to understand a failure without repeatedly wrapping it or hiding its original cause.
- Catch only where the code has a meaningful recovery, cleanup, translation or propagation responsibility.
- Do not swallow errors, return a successful-looking default after failure or use a sentinel that conceals the failed operation.
- Make optional data intentional. Do not introduce null checks everywhere to compensate for an unclear contract.
- Use the repository's established outcome and exception conventions; this skill does not choose a result library.
- Keep error-handling decisions cohesive rather than scattering the same policy through callers.

Chapter 7 discusses exceptions, context, normal flow and null-related problems. Apply those ideas with the language's semantics and existing contracts; do not treat book-era examples as a universal ban on intentional optional values.

## Operational safeguards, not additional book prescriptions

- Preserve cancellation as cancellation using the platform's established mechanism.
- Await or otherwise explicitly own asynchronous work and observe its failures.
- Release owned resources without masking the original failure.
- Preserve observable error and public-contract behaviour unless a change is requested.
- Keep diagnostics useful without exposing sensitive data or repeating the same fault at every call boundary.
- Use existing recovery and retry policy; logging an error alone does not establish recovery.

Concrete failure representations, transport mappings, logging APIs and distributed recovery protocols are outside this skill's implementation-quality scope; follow repository conventions. See [concurrency](concurrency.md).
