# `/clean-workflow refactor` — behaviour-preserving engineering change

Refactor only an explicitly selected scope or Ready refactor work item. For a work item, read `work-items/status.md`, the named item and its cited findings/criteria; do not read every work item. If there is no formal item, use the explicit symbol, file or changeset boundary.

1. Establish observed behaviour, public contracts and important failure semantics. Add or identify focused characterisation tests when risk warrants them.
2. Load only applicable [design](../../clean-design/references/design.md), [design smell catalogue](../../clean-design/SKILL.md) and [refactoring safety](../../clean-design/references/refactoring-decisions.md), [testing](../../clean-code/references/testing.md) and [language guidance](../../clean-code/references/languages/README.md). The full principles catalogue is **not** a mandatory execution pass.
3. Make the smallest coherent improvement that addresses the selected findings, without feature changes, speculative frameworks or unrelated formatting.
4. Follow [verification guidance](../../clean-code/references/verification.md); run focused relevant checks and broader checks where affected contracts demand them. Report actual results and gaps.
5. Return changed files, behaviour preservation evidence and remaining risk. For a formal work item, add evidence while it is open and hand off for QA; only the orchestrator archives after QA passes.

A behaviour or requirement change is not a refactor. It needs an Analyst decision and new feature/change-request item; never mutate completed work items.
