# Refactor Summary template

Return in chat at the end of `refactor`. When a work item was used, record status and evidence on it. Report only checks that actually ran. See the [refactor procedure](../commands/refactor.md).

```markdown
## Refactor Summary — <WI-nnn Title, or scope>

**Outcome:** <Improvement delivered.> Status: complete | blocked

### Findings addressed

| Finding | Resolution |
| --- | --- |
| CC-nn | <How it was resolved, or why it was not> |

### Files modified

| File | Change |
| --- | --- |
| <Path> | <Purpose of the change> |

### Design improvements
- <Coupling, cohesion, readability or complexity improvement, with evidence>

### Behaviour preservation
- `<Command>` — <Result>
- Public contracts: <Confirmed unchanged, or the specific concern>
- Not run: <Check and reason, or None>

### Risks
- <Remaining risk, or None>

### Next action
<Next ready work item, or None.>
```
