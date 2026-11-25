# Repository-specific standards

This is a targeted review reference, not a checklist or permission to edit. Use only applicable entries; inspect actual contracts, consumers and counter-evidence. A heuristic match alone is not a defect. Preserve repository policy, compatibility and scope; establish impact and classify severity/confidence using [review standards](../review-standards.md). Cite only relevant identifiers; do not count overlapping findings twice. See [catalogue index](index.md) for attribution and full usage rules.

These are areas to investigate, not pre-existing team policies or book codes. An actual finding must cite the repository's exact rule and source; never infer a policy from these examples.

| Area | Meaning / applicability | Exclusions | Evidence threshold | Example |
| --- | --- | --- | --- | --- |
| Documented conventions | A documented naming, formatting, documentation or test convention is violated. | Approved exceptions, generated code and superseded policy. | Cite the rule, affected location and exception check. Distinguish standard deviation from a defect. | A required public-contract annotation is absent. |
| Architecture decisions | Implementation has drifted from an applicable, accepted architecture decision. | A superseding decision or authorised migration may permit the difference. | Cite the decision and show the actual dependency or ownership mismatch. | A domain module imports an adapter contrary to the repository's dependency rule. |
| Required verification | A required repository verification or quality check is missing or failing. | A check may not apply to the changed scope, or may have an approved waiver. | Cite the requirement and actual result, or explicitly state it was not run. | A mandatory contract test has no recorded execution. |

Select the applicable installed language skill, if needed, and inspect repository instructions, configuration and decisions for the controlling policy.
