# C# execution and resource safety

These are modern language/platform safeguards, not additional design prescriptions from the 2008 book. Apply only to matching C# code and actual target-framework capabilities.

## Asynchronous implementation

- Await asynchronous calls end to end. Avoid `async void` except required event handlers.
- Do not synchronously block pending asynchronous work through `.Result`, `.Wait()` or `.GetAwaiter().GetResult()`.
- Preserve supported cancellation contracts and propagate the received `CancellationToken` to the operations that use it.
- Preserve cancellation as cancellation; do not disguise it as ordinary success or a different failure.
- Do not discard tasks without an established owner for execution and failures.
- Do not add `Task.Run` around naturally asynchronous IO without a concrete reason.
- Follow repository policy for `ConfigureAwait`; do not mechanically add or remove it.
- Use `Task` or `ValueTask` according to the existing contract and actual consumption/performance requirements.

## Resources and contracts

- Use `using` or `await using` for resources the operation owns where the type supports it.
- Do not dispose borrowed resources or hide the original failure during cleanup.
- Make mutable shared state and resource lifetimes clear.
- Preserve public signatures and observable error behaviour unless their change is authorised.
- Use the repository's established outcome, exception and diagnostic conventions.

See [reliability](../../reliability.md) and [concurrency](../../concurrency.md) for general reasoning. Hosting, DI containers, database contexts, logging APIs and transport mappings are outside this skill's scope; follow actual repository decisions.
