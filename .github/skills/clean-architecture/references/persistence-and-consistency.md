# Persistence and consistency

Persistence is a mechanism relative to business policy, but durability, identity and consistency are **requirements** that may strongly shape architecture. This is supplemental guidance, not a prescription for databases, repositories, specifications, unit-of-work implementations or event storage.

## Policy and persistence boundaries

- Identify which decisions are business policy and which are storage/query mechanics.
- Express externally required capabilities in terms the consuming policy understands; do not leak provider objects, query engines or schema details into stable policy.
- Read/query behaviour may have a different shape from write/consistency behaviour. Separate only where this improves cohesion or protects an actual change boundary.
- Choose storage, access patterns and materialisation according to requirements; a generic repository is not automatically simpler than focused operations.
- Distinguish a logical design boundary from an enforceable persistence boundary. Folder placement does not isolate a transaction or object lifetime.

## Consistency and failure semantics

- Decide which state changes must commit together and which effects may occur later. Define the observable result of partial failure.
- Verify the actual behaviour of persistence operations before assuming a multi-write transaction; sequential successful saves are not necessarily atomic.
- A transaction does not automatically encompass remote services, message publication or other separate resources.
- Consider concurrency, uniqueness, lost updates and isolation where they affect invariants.
- Treat ambiguous commit outcomes honestly. An unknown outcome is not evidence that the operation rolled back; replay may be unsafe.
- Keep implementation-specific transaction, connection and retry mechanics in the owning outer boundary while preserving the policy's required guarantees.
- Define resource lifetime according to real execution and concurrency patterns, and do not allow deferred storage work to escape a disposed operation.

## Repetition, events and reliable effects

- Identify the logical operation when duplicate execution can cause incorrect effects. Equal payloads need not represent the same operation.
- Prefer naturally repeatable behaviour where it fits the use case; introduce durable duplicate protection when real effects require it.
- If business state and a record of work to publish must commit together, preserve their atomicity using a mechanism that genuinely supports it.
- Delivery after local commit may still be repeated. Consider downstream idempotency or reconciliation for duplicate-sensitive consumers.
- Do not introduce inbox, outbox, saga or other infrastructure merely to demonstrate an architectural pattern.

## Performance and resource considerations

- Consider expected data volume and workload when designing query responsibilities, batching, indexing and resource use.
- Avoid making higher-level policy depend on provider-specific optimisations unless their coupling is an explicit trade-off.
- Bound resource consumption where an external input or workload can exceed expected limits.

## Verification

- Test business policy independently of persistence when feasible; use real storage/integration tests to prove transactions, constraints, concurrency, mappings and lifetime guarantees.
- Validate rollback, idempotency and recovery assertions with observable evidence—not just mocked calls.
- Do not impose a preferred testing library or database provider through this skill.
