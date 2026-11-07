# Concurrency: shared state and clear ownership

Apply Chapter 13's concerns about shared data, separation of responsibilities, synchronisation and testing without selecting a worker, database or messaging implementation.

## Ownership and separation

- Identify mutable shared state, who can access it and the scope of each promised atomic operation.
- Keep coordination concerns distinguishable from ordinary processing logic.
- Prefer isolated or immutable data where it reduces coordination.
- Minimise shared state and the amount of work performed under synchronisation.
- Use the language's appropriate synchronisation mechanisms; understand their scope and interactions.
- Consider interleavings rather than assuming ordinary sequential tests prove correctness.
- Do not assume one thread-safe component makes a compound operation atomic.

## Contracts and lifetime safeguards

These are modern execution safeguards, not specific mechanisms prescribed by the book.

- Preserve ordering, cancellation, cleanup and completion behaviour promised to callers.
- Make ownership of asynchronous work explicit; do not lose failures or leave work running beyond its owner's lifetime.
- Do not block the execution mechanism needed to complete pending asynchronous work.
- Distinguish in-process safety from cross-process guarantees. Do not claim a distributed guarantee from an in-memory check.
- Understand the repository's existing protocol before changing coordination.

## Verification

- Exercise meaningful competing operations and check results and resulting state.
- Use controlled coordination where possible instead of arbitrary sleeps.
- Test repeated execution and relevant shutdown/failure paths; absence of an exception is not proof of correct coordination.
- Disclose where runtime or real-dependency evidence is missing.

Database locking, claims and leases, worker scopes, retries, message delivery and idempotency mechanisms are outside this skill's implementation-quality scope; follow repository conventions and do not introduce those mechanisms merely to satisfy this reference.
