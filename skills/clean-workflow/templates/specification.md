# Specification template

Use one document per capability. Keep the structure compact and easy to scan:
purpose first, an optional intent only where context is needed, a numbered
contract, concise acceptance criteria, then open decisions. Never add status,
dates, test results or implementation walkthroughs. Apply the
[specification principles](../references/specifications.md).

```markdown
# <PREFIX>-001: <Capability named by its result>

**Purpose:** <Why the capability exists and the outcome consumers need.>

## Intent

<Optional context explaining why the contract matters. Omit when Purpose is sufficient.>

## Contract

<Actor or system> SHALL:

1. <Observable functional, quality, safety, or compatibility obligation.>
2. <Another obligation; state explicit prohibitions as "SHALL NOT".>
3. <A deliberate non-guarantee only when it is contractually important.>

## Acceptance Criteria

- **AC-001:** <A concise, falsifiable observable outcome that proves the contract.>
- **AC-002:** <Another independent outcome, including relevant failure behaviour.>

## Open Decisions

- <Decision in plain language>: [GAP-001](GAPS.md#gap-001).
```

## INDEX.md entry

```markdown
| ID | Capability | Specification |
| --- | --- | --- |
| <PREFIX>-001 | <Capability> | [<file>](<file>.md) |
```

## GAPS.md entry

```markdown
### GAP-nn — <Decision in plain language>
- **Why it matters:** <Consequence for consumers, compatibility, safety or operations.>
- **Established facts:** <With sources.>
- **Options:** <Credible alternatives.>
- **Recommendation:** <Option and reason.>
- **Affects:** <Specification and criterion IDs.>
```

`GAPS.md` contains only outstanding decisions. When the owner decides, add the
resulting requirement to the specification and remove the resolved gap entry.
