# Messaging and work across boundaries

Messaging, event buses, durable workflows and related reliability patterns are **optional mechanisms**, not requirements of *Clean Architecture*. Use this reference only if the problem actually involves asynchronous delivery or coordination across time, processes or transactions.

## Clarify the contract and ownership

- Identify the meaning of the request or fact, the intended consumers and who owns the stable contract.
- Keep business policy independent of a broker, topic, queue, envelope or transport SDK.
- Translate external representations at the boundary rather than letting transport shape drive the domain model.
- Distinguish message identity, logical operation identity and correlation; consumers may rely on different guarantees for each.
- Decide whether the interaction requires ordering, acknowledgement, replay, eventual completion or synchronous response, and state which guarantees the mechanism actually provides.

## Delivery and durable effects

- Assume delivery may be duplicated or interrupted unless a stronger mechanism is demonstrated.
- Separate a completed business fact from the technical record used to deliver it.
- Where state change and later publication must survive crashes together, consider an appropriate atomic durability boundary; never claim it from independent writes alone.
- Place duplicate protection with the side effect it protects. Message redelivery, business idempotency and downstream external effects are distinct problems.
- Be precise about ambiguous outcomes: failed acknowledgement does not prove that an earlier effect did not occur.

## Workflows spanning time

- Identify durable state, transition ownership, correlation, timeouts, recovery and terminal outcomes before choosing a coordination pattern.
- Do not embed extended workflow policy in delivery callbacks or require an event-driven pattern for a simple synchronous operation.
- Treat restarts and replays as first-class design conditions when the workflow claims to survive them.
- Avoid a generic orchestration framework for a narrowly scoped coordination problem unless reuse/variation justifies its complexity.

## Verification

- Verify real delivery semantics and policy separately, then cover the boundary between them.
- Where guarantees are claimed, test relevant duplicate delivery, crash/restart, ordering, timeout, ambiguous outcome and recovery cases.
- Report partial or unverified guarantees rather than equating a library choice with correctness.
