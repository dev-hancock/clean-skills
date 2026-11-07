# Coverage hotspot review

Use only when coverage/complexity evidence is available or explicitly required but missing. Include this block in the main review or link an explicitly requested saved supporting report. Do not create a report file without permission. This is verification evidence, not an architecture assessment.

## Evidence and scope

- **Revision/base:** {Reviewed revision and comparable baseline, or unavailable}
- **Scope:** {New/modified methods; production population; exclusions; untouched debt listed separately}
- **Tools and execution:** {Exact commands, versions, test discovery/execution counts and results, or not run}
- **Inputs:** {Raw reports, collection time, settings, module filters and source/symbol mapping}
- **Coverage basis:** {Line/sequence/block basis for CRAP; separate branch data and complexity definition}
- **Integrity:** {Fresh artifacts, non-empty production data, compatible revisions, missing metrics/licence limitations}

## Changed-code hotspots

| Method / location | New or modified | Complexity before -> after | Line / branch coverage | CRAP before -> after | Uncovered behaviour / relevant added tests | Gate decision / finding |
| --- | --- | --- | --- | --- | --- | --- |
| {Linked method} | {New / modified} | {Measured values, or unavailable} | {Values and population, or unavailable / N/A} | {Measured/calculated values and basis, or unavailable} | {Concrete risk and tests proving outcomes} | {Pass / fail / unverified / approved exception; existing CC ID if any} |

## Decision and follow-up

- **Applicable targets:** {Actual repository policy and scope, or no numeric targets defined; measured evidence or unverified}
- **Changed-code risk:** {Uncovered behaviour, relevant tests and justification for complexity; no requirement to erase all legacy debt}
- **Behavioural verification:** {Observable results, failure paths, state changes and relevant side effects}
- **Remedy:** {Tests, simpler logic, reduced branching or cohesive extraction; no architecture rewrite solely for scores}
- **Exceptions:** {Owner, scope, rationale, approval and follow-up, or None}
- **Untouched debt:** {Separately identified historical hotspots, or None inspected; not a change blocker solely due to age/score}
- **Limitations:** {Missing baseline, branch/complexity data, tests or tool capability; never convert missing evidence into a pass}

Apply the [Coverage Risk Gate](../references/review-gates.md#coverage-risk-gate) and actual repository policy. A hotspot is not automatically a finding; when a finding is justified, retain the main report's evidence, impact, remedy and confidence and count its CC ID only once.
