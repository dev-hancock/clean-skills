# Technical design for a work item

## Design content

For non-trivial work, record in the open `clean-workflow` work item:

- **Approach:** the proposed outcome and implementation direction.
- **Ownership:** key responsibilities, policy/mechanism boundaries and change drivers.
- **Dependencies:** important contracts and direction of coupling.
- **Constraints:** key invariants, lifetime, consistency and operational guarantees *that apply*.
- **Verification:** behavioural and architectural evidence needed.

Use a small Mermaid component, interaction or state diagram when it communicates a decision more clearly than bullet points. Do not use a diagram merely to claim SOLID compliance. Omit irrelevant headings and elaborate implementation minutiae.


Use [architecture](../../clean-architecture/SKILL.md) and [implementation design](../../clean-design/SKILL.md) selectively. Engineer challenges material assumptions before Ready; resolve evidence-backed objections. Do not require an independent agent or formal item for a small direct task.
