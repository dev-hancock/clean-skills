# C# execution and resource safety

These are modern language/platform safeguards, not additional design prescriptions from the 2008 book. Apply only to matching C# code and actual target-framework capabilities.

## Asynchronous implementation

- Await asynchronous calls end to end when callers need completion, results or failures. Avoid `async void` except required event handlers; returning an existing task directly is valid when no local await is needed.
- Avoid synchronously blocking pending asynchronous work through `.Result`, `.Wait()` or `.GetAwaiter().GetResult()`; a genuine synchronous boundary requires explicit justification and an assessment of deadlock and thread-pool starvation.
- Preserve supported cancellation contracts and propagate the received `CancellationToken` to the operations that use it.
- Preserve cancellation as cancellation; do not disguise it as ordinary success or a different failure.
- Do not discard tasks without an established owner for execution and failures.
- Do not add `Task.Run` around naturally asynchronous IO without a concrete reason.
- Follow repository policy for `ConfigureAwait`; do not mechanically add or remove it.
- Use `Task` or `ValueTask` according to the existing contract and actual consumption/performance requirements. Do not repeatedly await or concurrently consume a `ValueTask` unless its backing contract permits it.

- Async methods are not inherently concurrent or thread-safe. Use explicit coordination where state is shared; do not hold a monitor lock across an await.
- Respect the cancellation and ownership contract of asynchronous streams; dispose enumerators and propagate cancellation where supported.

## Resources and contracts

- Use `using` or `await using` for resources the operation owns where the type supports it.
- Do not dispose borrowed resources or hide the original failure during cleanup. In DI-managed code, distinguish container-owned services from instances created and owned by the operation. Do not capture a shorter-lived service in a longer-lived owner without a valid lifetime boundary.
- Make mutable shared state and resource lifetimes clear.
- Preserve public signatures and observable error behaviour unless their change is authorised.
- Use the repository's established outcome, exception and diagnostic conventions.

See [reliability](../../clean-code/references/reliability.md) and [concurrency](../../clean-code/references/concurrency.md) for general reasoning. Hosting, DI containers, database contexts, logging APIs and transport mappings follow actual repository decisions; use appropriate platform knowledge without choosing an application architecture.
