# Implementation and handoff

For direct tasks, apply the requested scope and relevant engineering guidance; no formal work item is required. For formal work, follow [work-item contracts](work-items.md) and the active repository agent instructions.

## Establish authority and context

- For an open Ready item, read `work-items/status.md`, that item, its cited acceptance criteria, relevant source and prerequisites. Check the owner agreement and actual baseline. Do not read every work item or copy criteria into progress files.
- Delivery coordinates the lifecycle; Analyst owns product intent/specifications, Architect owns technical planning and design, Engineer implements and supplies evidence, QA independently checks the agreed outcome where the repository calls for formal review. The skill does not confer these roles or simulate handoffs.
- Follow the approved technical design. Engineer owns ordinary implementation decisions, local design refinements and corrections within the authorised scope. Return to the owning decision-maker only for material policy changes, invalidated architectural assumptions or consequential contract changes.
- Distinguish product requirements from execution constraints. Restrictions on development, testing, deployment or access to existing resources do not automatically become permanent application behaviour.
- Preserve authoritative contracts and required behaviour, not incidental historical implementation details. When an authorised replacement retires an implementation, do not retain compatibility machinery without an established consumer, data migration or product requirement.
- Production-intent implementation means satisfying the established operational and correctness requirements. It does not mean anticipating every conceivable future production requirement.

## Implement

- Select relevant [language and correctness guidance](../../clean-code/SKILL.md), [implementation design](../../clean-design/SKILL.md) and [architectural guidance](../../clean-architecture/SKILL.md) only where necessary. Use existing capabilities and preserve established boundaries.
- Work within scope. Preserve unrelated user edits. Use targeted source inspection and appropriate behavioural tests. Do not invent additional requirements, introduce speculative abstractions or delay material design errors until a follow-up refactor.
- Apply the [first-pass quality checkpoint](quality-checkpoint.md) to actual changed code. Follow [verification guidance](../../clean-code/references/verification.md) for test/build/analysis evidence, repairs, reruns and limitations. Broaden checks for real integration risk, not ritual.

## Handoff and completion

- Return the [implementation summary](../templates/implementation-summary.md) with actual commands, outcomes and limitations. For formal work, record evidence while the item remains open; Delivery coordinates the transition to In Review for QA. A direct task can simply report results without producing a file.
- QA checks actual acceptance criteria and relevant quality/verification evidence. Changes required return to the responsible owner; reassess affected risks, not the entire process by default.
- Only the authorised orchestrator archives after QA passes. Finalise evidence before moving an item to Done; never edit archived records. Later changes use the existing change-request lifecycle. A blocker or absent verification is not a pass.
