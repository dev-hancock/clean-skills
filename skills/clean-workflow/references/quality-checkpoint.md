# First-pass quality checkpoint

### First-pass design quality (operational application, not a separate book-defined gate)

For formal technical planning, the Architect applies relevant gates to the proposed design; the Engineer then independently challenges material assumptions before it becomes Ready. Do not run every gate as a mandatory checklist.

During `implement`, check **actual changed code** against the approved design and the [review gates](../../clean-code/references/review-gates.md), not by repeating planning. Reuse established evidence; investigate drift, unverified guarantees and new constraints. Repair material design errors **inside the initial implementation**, not in a deferred refactor.

Correctness, passing tests/build and architectural compliance alone do **not** establish implementation quality. Evaluate conceptual integrity across the implementation: individually small, well-named methods cannot compensate for fragmented responsibilities or unnecessarily complex interactions. Keep the check proportional and avoid imaginary role debates, fixed class counts or mandatory review documents.


Use [clean-design](../../clean-design/SKILL.md) for actual design choices and [clean-code](../../clean-code/SKILL.md) for implementation standards and verification. A direct task needs only the relevant checks, not a formal plan or independent handoff.
