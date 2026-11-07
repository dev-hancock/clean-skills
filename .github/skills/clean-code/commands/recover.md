# `/clean-code recover` — recover intent before modernising legacy code

This is a read-only investigative task except when the user explicitly authorises writing draft specifications. Inspect actual consumers, tests, public contracts, persistence, operational behaviour and existing documentation. Separate established intent from incidental legacy implementation.

Return: known guarantees with evidence, observed but unauthorised behaviour, gaps needing a Analyst decision, compatibility risks and proposed falsifiable acceptance criteria. Do not convert current bugs into desired policy. Pass the report to **Analyst** for specification decisions, **Architect** for later agreed planning and **Engineer** for an authorised fix.

Load [specification guidance](../references/specifications.md), [verification](../references/verification.md) and relevant reliability/architecture references **only where useful**. Never perform a whole-codebase Clean Code audit as a hidden prerequisite.
