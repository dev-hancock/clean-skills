# Business policy, state and events

**Scope:** architectural ownership of business rules, state and facts. Specific domain-modelling techniques and event mechanisms are supplementary choices, not requirements of *Clean Architecture*.

## Business meaning and invariants

- Identify rules that remain true regardless of UI, database, delivery channel or hosting technology. Give those rules cohesive ownership at the appropriate policy level.
- Model identity, valid state and transitions according to the problem. Protect invariants at the place that controls the relevant state; do not rely solely on caller validation.
- Prefer meaningful state transitions over unrestricted mutation when that makes the rules explicit.
- Distinguish a general business rule from the application-specific coordination that invokes it.
- Where multiple business concepts collaborate, decide which invariants require one consistency boundary and which interactions belong to a coordinating use case.
- Design should communicate the domain's purpose and language; avoid infrastructure terminology contaminating business meaning.
- Use the simplest modelling form that accurately expresses the rules. The book's **entities** are not a mandate for DDD aggregates, inheritance, object-only models or an ORM entity type.

## Optional richer domain modelling

Where the repository adopts these concepts:

- **Entity:** identity matters across change.
- **Value object:** meaning and equality arise from values, with constraints appropriate to the domain.
- **Aggregate:** coordinates a meaningful consistency boundary; it is not equivalent to a database table.
- **Domain service:** owns genuine business policy not naturally placed with an entity/value, rather than becoming a catch-all for workflow or I/O.
- **Factory or construction policy:** use when creating valid state involves decisions or invariants substantial enough to deserve dedicated ownership, not for symmetry.

Respect established models and contracts; do not introduce a whole domain-modelling vocabulary merely because the skill is loaded.

## Facts, intent and events

- Distinguish **intent** (an operation requested) from **fact** (something that actually occurred). Do not describe an event as completed before the state transition is committed or otherwise known to have occurred.
- Domain facts express business meaning. External messages and durable delivery records may represent the same occurrence but have different contracts and lifecycles.
- If the system uses events, keep business meaning independent of brokers, serialisation, acknowledgements and retry bookkeeping.
- Preserve the identity and relevant information of a logical fact across translation or redelivery where consumers rely on it.
- Do not introduce events simply to avoid a direct call or to make every use case asynchronous. Domain events do not imply event sourcing.
- Decide independently who reacts, what ordering guarantees are required, and when effects may occur relative to commit.

## Verification

- Exercise valid and invalid transitions, invariant preservation and identity semantics without external infrastructure wherever possible.
- Where events are used, verify timing, factual meaning, duplicate handling and relevant consistency boundaries using the appropriate integration evidence.
- Confirm external formats, delivery identifiers and technical state have not become accidental business-policy dependencies.
