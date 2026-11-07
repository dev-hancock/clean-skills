# External mechanisms and hosted work

This is supplemental engineering guidance, not an architectural requirement to use dependency injection frameworks, options objects, a particular host or worker design.

## Mechanism ownership

- Keep external technologies, transport, data mapping, driver details, environment configuration and runtime lifecycle outside the policy they serve.
- Give the higher-level consumer authority over the *meaning* of the capability; allow the mechanism to own its protocol, retries, connections and resource details.
- Use translation where external representations differ from policy concepts or where their independent evolution must be insulated.
- Keep composition at an outer boundary that may know concrete implementations. Construction choices must not silently become business policy.
- Do not introduce adapters or wrappers that add no protective boundary or behaviour.

## Configuration and environment

- Distinguish business policy from replaceable operational settings and host prerequisites.
- Determine required configuration, safe defaults and validation according to their real impact. Fail early when invalid required configuration makes safe execution impossible.
- Protect secrets and sensitive settings; avoid disclosing effective connection strings or credentials in diagnostics.
- Match configuration lifetime and change behaviour to the consuming operation. Do not promise dynamic updates if the mechanism only reads startup values.

## Background and recurring operations

- Background execution is a delivery mechanism. The business capability it invokes should remain understandable and verifiable independently of the host loop.
- Choose triggering, scheduling and state persistence based on actual recurrence, recovery and availability requirements.
- Make resource ownership, startup prerequisites, shutdown, cancellation, overlapping execution and retry policy explicit where relevant.
- Define what happens when work succeeds, fails, is interrupted, or is repeated after a restart. Never equate a timer or running process with durable execution.
- Isolate work at the smallest safe consistency/failure boundary; do not automatically retry non-idempotent operations whose prior outcome is unknown.
- Avoid overwhelming dependencies through unbounded retries, concurrency or input size; decide proportionate limits from expected load.
- Do not adopt a scheduler, job framework or service topology merely because the capability runs in the background.

## Verification

- Exercise independent policy through its use case and real mechanism behaviour through appropriate integration evidence.
- Test the lifecycle conditions that matter: configuration validity, startup dependencies, cancellation, repetition, recovery, resource disposal and any stated concurrency guarantees.
- Inspect actual wiring and permissions; neither successful registration nor an application starting proves that an external capability works.
