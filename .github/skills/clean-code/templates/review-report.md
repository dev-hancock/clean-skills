# Review report template

Use the structure below for review output. Replace placeholders with verified facts; do not copy facts from an earlier review. Preserve the metadata, summary counts, finding fields and coverage section. Use "None" or "Not applicable" for empty sections. Repeat the finding block only where findings exist; IDs remain unique across sections.

Consult only relevant entries in the [review principles catalogue](../references/review-principles-catalogue.md) when a concrete finding or an explicitly broad review warrants them. Cite only the identifiers/concepts that actually support a finding; keep their detailed applicability, exclusions and examples in the catalogue rather than repeating them in every report.

When coverage/complexity evidence is available or required but missing, use the [hotspot review block](hotspot-review.md) within Coverage and limitations. Keep inspection coverage distinct from measured test coverage. Do not fabricate metrics, create an unrequested supporting file or count a hotspot and its existing CC finding twice.

The layout follows the supplied `CLEAN-CODE-REVIEW.md` example. It does not import that project's findings, conventions, counts or version label. For chat output, link locations to workspace files; for a saved report, use paths relative to that report. Saving requires an explicit request.

---

# {Subject}: Clean Code review

Last updated: `{date and time, including timezone}`

| Item | Value |
| --- | --- |
| Revision reviewed | {Commit/range/base and relevant local changes, or unavailable} |
| Standard | {Applicable review-principle sources used during the review, including Clean Code heuristics, repository standards and any additional language or engineering guidance} |
| Mode | {Read-only static review by default; exact authorised verification, if any} |
| Document revisions | {Initial review, or actual re-review history} |
| Scope | {Selector, target, included areas and exclusions; use measured counts only} |

## How to read this document

- **Severity:** P1 correctness/reliability or serious maintainability defect; P2 material readability/change-cost/robustness concern; P3 minor issue or consistency point.
- **Principles:** review heuristics that support a finding. They may originate from Clean Code, repository standards, language guidance or modern engineering practice. Principles are evidence aids, not automatic defects.
- **Confidence:** High for directly verified evidence; Medium for a reasoned conclusion with an unverified assumption; Low where confirmation needs a test, benchmark or measurement.
- **Caveat:** principles are not numeric rules. Findings require concrete impact and must account for deliberate repository choices, accepted trade-offs and documented exceptions.

## Review principles

Findings should identify maintainability, readability, correctness, robustness, consistency or change-cost concerns that create a demonstrable burden for future modification or a concrete implementation risk.

Report preference-based observations only when a documented project standard is violated or a concrete maintenance, reliability or correctness impact exists. Identify the exact standard and any applicable exception; do not promote a preference into a universal requirement.

The objective is to identify potential technical debt, implementation risks, inconsistency, design drift, hidden complexity and probable defects, not to perform a conformance audit against a fixed set of stylistic rules. Explain the burden with evidence; use measurements where available, never invented metrics.

## Summary

{Overall assessment, highest-impact concerns and important uncertainty. If no findings exist, state that no findings were identified within the reviewed scope without implying the absence of all defects.}

| Severity | Count |
| --- | --- |
| P1 | {count} |
| P2 | {count} |
| P3 | {count} |

## Production code findings

### CC-01 (P2): {Concrete issue}

- **Principles:**
  - {Applicable catalogue principle, for example G9 (Dead Code) or G12 (Clutter)}
  - {Applicable repository rule with source, language guidance or engineering principle, if any; identify its origin}
- **Location:** {Linked file and line/symbol; avoid unsupported line claims}
- **Evidence:** {Minimal relevant code excerpt or precise observed behaviour; clearly separate direct observation from inference}
- **Impact:** {Actual consequence, affected consumers and triggering conditions}
- **Remedy:** {Smallest justified correction; preserve contracts and identify required approval}
- **Confidence:** {High / Medium / Low, including evidence and any unverified assumptions}
- **Re-review note:** {Only when this finding changed; otherwise omit this field}

## Test code findings

{Repeat the finding block with unique CC IDs, or state None / Not applicable.}

## Samples, test host and documentation

{Repeat the finding block with unique CC IDs, or state None / Not applicable. Include equivalent supporting material for the reviewed stack.}

## Design patterns and implementation

{Repeat the finding block for cross-cutting design concerns, or state None / Not applicable. Do not duplicate findings already counted above.}

## Candidate findings checked and rejected

| Claim | Outcome |
| --- | --- |
| {Specific candidate actually investigated, or None} | {Counter-evidence and reason for rejection; no speculative checklist entries} |

## Strengths worth keeping

{Brief, evidence-backed design choices that should constrain future changes and influence remedies; otherwise None observed within this scope.}

## Coverage and limitations

| Area | Coverage |
| --- | --- |
| {Area in declared scope} | {Full read / partial read / search only / not inspected; describe the actual extent} |

- **Verification:** {Exact commands and results, or explicit statement that no build/test/analyser/formatter was run}
- **Unconfirmed concerns:** {Finding IDs needing tests, benchmarks, measurements or runtime verification, or None}
- **Compatibility/approval:** {Remedies needing owner approval, migration strategy, public API review or compatibility assessment, or None}
- **Limits:** {Missing context, unavailable tooling, exclusions and uninspected areas; never imply complete coverage from a sample}
- **Coverage risk:** {Include the hotspot block when applicable: changed-code metrics, test evidence, gate decisions, untouched debt and exceptions; otherwise Not assessed / Not applicable with reason}

## Changes from the re-review

{Include only for an actual re-review. Preserve CC IDs. Record corrected findings, withdrawn findings, severity changes, new evidence, updated reasoning and remaining unverified concerns.}
