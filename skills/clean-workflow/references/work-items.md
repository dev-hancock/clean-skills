# Work-item contracts and lifecycle

These are delivery rules, not coding-style rules. Read on planning, handoff, status transitions or closure; do not preload during ordinary implementation.

## Initialisation

The default templates live at `../templates/work-items/plan.md` and `../templates/work-items/status.md` within this skill. On the **first approved planning task only**, initialise a missing ledger from them under the repository's existing `work-items/` or `docs/work-items/` location (default `docs/work-items/` for a new repository). Never overwrite project state or create a second board; migrate an existing `INDEX.md` first. Normal tasks read the project ledger, **not** the templates. Small fixes need no ledger.

## Two management files, one source of truth each

- `work-items/plan.md` — **why and in what order**: milestones, dependencies between capabilities, deferred criteria/decisions, references to relevant specs. No Kanban status list.
- `work-items/status.md` — **what is happening now**: one compact row per active work item, with area, state, readiness/blocker and owner/next action. No duplicate design text, complete backlog catalogue or history of closed items.
- `work-items/<area>/WI-nnn-short-title.md` — **how to do one open task**: its acceptance references, scope, technical design, dependencies, review and implementation evidence. Open only a named item and necessary neighbours.
- `work-items/done/<area>/WI-nnn-short-title.md` — **what was done**: content frozen on completion; use Git history and original acceptance baseline for provenance.

`plan.md` and `status.md` are not indexes of every Markdown file. Never create an `INDEX.md` to mirror them. Keep globally unique `WI-nnn` IDs, independent of paths. Organise area folders only when two or more work items warrant grouping; don't create empty areas. Never make a separate Markdown file just to store a review that fits in a concise handoff.

## Work-item quality

- One observable outcome / vertical slice, not one per technical layer. Reference specification ID + `AC-nnn` obligations without copy-pasting full criteria.
- Explicit type `feature | refactor | change-request`; scope, non-goals, source baseline (Git commit or revision when available), dependencies, estimate `S | M | L`, and independently verifiable checks.
- Enough grounded design to guide a competent engineer: meaningful owners, boundaries, contracts, failure/lifecycle constraints, tests, tradeoffs; avoid routine class/method blueprints.
- Every agreed criterion belongs to exactly one work item, or `plan.md` explicitly records its deferral. A selected review finding likewise belongs to one refactor item.
- Unresolved product-policy changes go back to the Analyst. Unknown architecture cannot be declared implementation-ready.

## Kanban states

`Backlog → Ready → In Progress → In Review → Done`. `Blocked` is a temporary hold that records a concrete blocker and previous state. State is recorded **only** in `status.md`; do not duplicate in each work item. `Ready` requires owner-agreed requirements, complete prerequisite items and a reviewed, implementable work-item design. `In Review` means Engineer's code/tests/evidence are ready for QA. `Done` means QA passed and the last evidence was recorded.

## Frozen completion and change requests

1. When QA passes, finalise delivery evidence *while item is still open*. Move once to `work-items/done/<area>/`, preserve the filename and content, then remove its active row from `status.md` (optional short recent-completions pointer).
2. Never edit archived content, including status fields, cross-references and acceptance text. Git history is the audit record.
3. If a delivered contract changes, Analyst revises its living specification and identifies the changed criteria. Architect creates a **new** `change-request` work item referencing the old ID, specification baseline/change and migration/regression impact. Never reopen, modify or replace the archived work item.
4. An error in an archived item is corrected by an explicit new erratum/change work item or accompanying Git history, not silent modification.

## Review boundaries

Use independent review where it establishes meaningful confidence in an agreed outcome.

- Review cohesive implementation increments against their acceptance criteria and affected guarantees.
- Independently challenge significant architectural designs and uncertain requirements. Do not require architectural approval for ordinary implementation decisions.
- Correct defects within the current authorised work item. Do not create separate work items for every defect, failed test or design refinement discovered during delivery.
- A completed work item's historical record remains frozen. This does not prohibit correcting an implementation defect within another currently authorised scope.
- Distinguish blocking findings from non-blocking improvements. Severity alone does not establish release-blocking impact; relate the finding to the agreed completion conditions.
- Recheck corrections and affected regression risks without repeating the entire review.
- Do not reopen previously accepted decisions or passed scopes without concrete new evidence or relevant changes.
- Follow the orchestrator's termination conditions. Do not independently initiate another delivery cycle.

Owner approval governs product outcomes and consequential decisions, not routine engineering choices.
