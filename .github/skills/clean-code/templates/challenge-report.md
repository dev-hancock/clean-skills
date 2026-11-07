# Challenge report template

Return in chat; save a file only when asked. Every finding cites the text or gap it concerns. A concern without evidence is a question, not a finding. Use the Architect agent for specification challenge or Engineer agent for work-item challenge.

```markdown
# Challenge: <specification or plan>

| Item | Value |
| --- | --- |
| Input | <Specification IDs and paths, or work items> |
| Type | Specification / Plan |
| Date | <Date and time, including timezone> |

## Summary
<Overall assessment and the highest-impact concerns.>

| Severity | Count |
| --- | --- |
| P1 | <n> |
| P2 | <n> |
| P3 | <n> |

## Findings

### CH-01 (P1): <Concrete issue>
- **Category:** Missing requirement | Ambiguity | Missing acceptance criteria | Security risk | Operational risk | Architectural concern | Recommended improvement
- **Perspectives:** <Perspectives that raised it>
- **Affects:** <IDs or sections>
- **Evidence:** <Quoted text, or the specific gap>
- **Recommendation:** <Smallest change that resolves it>

## Perspectives applied

| Perspective | Outcome |
| --- | --- |
| Lead developer | <Finding IDs, or no material concern> |
| Architect | <...> |
| QA engineer | <...> |
| Support engineer | <...> |
| Product owner | <...> |

## Assumptions identified
- <Unstated assumption and the related finding or question>

## Questions
- <Concern that could not be tied to evidence, or None>

## Plan checks (plan challenges only)

| Check | Result |
| --- | --- |
| Workable-unit rules | <Work items failing a rule, by rule, or none> |
| Coverage | <Criteria uncovered, duplicated or split, or none> |
| Order and dependencies | <Issues, or none> |

## Next action
<Return to the owning agent for correction, or request explicit owner agreement when unresolved product policy is involved.>
```
