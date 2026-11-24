# Implementation Summary template

Return in chat at the end of `implement`, and record status and evidence on the work item. Report only checks that actually ran. See the [work-item lifecycle](../references/work-items.md) and the Engineer agent.

```markdown
## Implementation Summary — WI-nnn <Title>

**Outcome:** <Behaviour delivered.> Status: QA pending | blocked

### Files modified

| File | Change |
| --- | --- |
| <Path> | <Purpose of the change> |

### Acceptance-criteria coverage

| Criterion | Evidence | Result |
| --- | --- | --- |
| <PREFIX>-001-AC-01 | <Test or check that actually ran> | Met / Unmet / Not verified |

### Design adherence and critical checks
- <Planned boundaries upheld, or documented justified deviations>
- <Material Architect / Engineer design findings addressed; QA findings handled after independent review>

### Verification
- `<Command>` — <Result, including discovered and executed test counts>
- Not run: <Check and reason, or None>

### Risks
- <Remaining risk or limitation, or None>

### Documentation updates
- <File and change, or none needed>

### Next action
<Independent QA review, or Analyst review if requirements must change.>
```
