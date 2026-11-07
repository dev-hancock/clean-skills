# Copilot Delivery v3

Five focused GitHub Copilot agents and two *on-demand* skills: **Clean Code** and **Clean Architecture**. The agents coordinate **specification → reviewed work item → implementation → independent QA**. Skills supply targeted engineering principles without duplicating that workflow.

Designed for GitHub Copilot Chat in Rider/JetBrains; the same repository conventions are supported in other compatible Copilot IDEs. JetBrains custom agents and subagents are currently in preview, so test delegation on your installed version.

## Tutorial — deliver your first feature

1. Select **Delivery** in Copilot Chat. Ask: `Specify <feature> and have Architect challenge it; do not implement.` The Analyst writes observable requirements; Architect independently tests the assumptions.
2. Review remaining product decisions. Say: `I approve the complete specification; create implementation-ready work items.` Architect creates focused work items; Engineer challenges their implementability.
3. Approve a specific item: `Implement WI-001.` Engineer implements and tests it; Reviewer independently checks the result against its criteria. Delivery archives it only after evidence and a passing review.
4. Later change? Ask for a **specification revision and a new change-request WI**. Never rewrite an archived item.

For a small bug or local refactor, ask for the change directly: Delivery uses the narrow Engineer/QA path without generating specifications and boards.

## How-to — install as a replacement

1. Extract the ZIP somewhere temporary. **Back up** your existing `.github/agents/` entries and `.github/skills/clean-code/` and `.github/skills/clean-architecture/` directories first.
2. Remove the **five installed agent files** being replaced (including their previous v3 names, if present) and those **two skill directories**. Do not delete other `.github/` content (CI workflows, unrelated agents, etc.).
3. Copy the package's `.github/` directory **into the repository root**, merging with the existing `.github/` directory. Do not nest `.github/.github/` or leave the ZIP's former `clean-architecture/` directory outside `.github/skills/`.
4. Remove any old *always-on* Copilot instruction that indiscriminately loads the Clean Code skill. Reload Copilot Chat and select **Delivery**. In Rider, inspect the agents under Copilot Chat → Configure Agents → Workspace. Enable subagents if the installed client offers the option.
5. Run the smoke test below **before** relying on autonomous end-to-end delivery.

**PowerShell, from the unpacked package directory** (`$repo` is your repository root):

```powershell
$repo = 'C:\path\to\your-repository'
# Include former v3 names so the replacement does not leave duplicate agents.
$agents = 'delivery','analyst','architect','engineer','reviewer',
          'delivery-orchestrator','product-owner','qa-reviewer'
# Back up your .github folder (for example, with Git) before removal.
foreach ($name in $agents) {
    Remove-Item (Join-Path $repo ".github/agents/$name.agent.md") -ErrorAction SilentlyContinue
}
foreach ($name in 'clean-code','clean-architecture') {
    Remove-Item (Join-Path $repo ".github/skills/$name") -Recurse -Force -ErrorAction SilentlyContinue
}
Copy-Item '.github' $repo -Recurse -Force
```

`Copy-Item` merges into `.github/` but overwrites matching names. Review your Git diff before committing. If your existing skill or agent names differ, remove their obsolete copies deliberately; don't install duplicate discoverable skills.

**No scaffold installation:** Starter `plan.md` and `status.md` are at `.github/skills/clean-code/templates/work-items/`. On the first *approved planning task*, Delivery creates project copies at the project's established work-item location, defaulting to `docs/work-items/`. Existing boards are preserved; small fixes need no files.

### Migrate an existing work-item index

If your project has `docs/work-items/INDEX.md`, ask: `Migrate the existing work-item index to plan.md and status.md; preserve all WI IDs and content; do not implement.` Review the migration before retiring `INDEX.md`. `plan.md` contains milestone order/dependencies; `status.md` is a small active-state table. Open work items belong under `work-items/<area>/`; verified complete items under `work-items/done/<area>/`, frozen thereafter. Existing specifications remain where they are.

## Reference — package layout

```text
.github/
  agents/
    delivery.agent.md
    analyst.agent.md
    architect.agent.md
    engineer.agent.md
    reviewer.agent.md
  skills/
    clean-code/
      SKILL.md
      commands/              # review, refactor and recovery
      references/            # original .NET/quality library
      scripts/               # existing verification helpers
      templates/
        specification.md
        work-item.md
        work-items/
          plan.md
          status.md
        ...                   # original report templates
    clean-architecture/
      SKILL.md
      references/            # seven topic-specific references
README.md
```

| Role | Owns | Independently challenges |
| --- | --- | --- |
| Delivery | Authorisation, routing, handoffs, status/archive | Whether a stage is ready |
| Analyst | Living specifications and criteria | Unclear or contradictory product intent |
| Architect | Technical designs/work items | Analyst specifications |
| Engineer | Source/test changes | Architect work-item designs |
| Reviewer | Independent evidence and verdict | Engineer's actual implementation |

**Work-item states:** `Backlog`, `Ready`, `In Progress`, `In Review`, `Blocked`; `Done` is represented by moving the evidence-complete item to `done/<area>/` and removing it from the active status table. `plan.md` changes only on plan changes, `status.md` only on transitions. IDs remain unique across all areas and history.

**When to load a skill:** Routine coding/refactoring → `clean-code`, selected references only. Boundary, policy, use-case, coupling, consistency or architecture decision → `clean-architecture`, selected references only. A material boundary-changing implementation may use both. Neither skill should load every reference; Analyst/Delivery normally need neither.

**Approval rules:** Owner approves product intent and authorises implementation. Reviewer reports do not count as human sign-off. Reviewer agents do not edit the prior stage's artefact. The closed work item is historical evidence, not a living specification.

## Explanation — why this is leaner

The design pays for **relevant context**, not uniform rule enforcement: two independent handoffs for substantive features, scoped tests and a narrow process for small changes. There is no automatic seven/eight-step skill-wide loop or mandatory 66-heuristic audit. `clean-architecture` retains all seven source reference files; `clean-code` retains its original topic references, scripts and targeted playbooks.

Separate agents may still increase calls/latency; isolation is not a guaranteed credit discount. In IDE subagents, model/tool inheritance and availability depend on the host. Measure credits, tool calls, elapsed duration and accepted defects against identical work items before optimising further.

### Smoke test / troubleshooting

1. `Draft a tiny specification and ask Architect to challenge it. No code changes.` Verify a **real** subagent handoff and that no author self-approves.
2. `Ask Engineer to challenge an open WI without edits.` Verify concrete objections or an evidence-based clean verdict.
3. `Have QA check a small code change.` Verify actual source/tests are inspected and the full review catalogue is **not** loaded.
4. Verify project templates create only **two** work-management files on first planned work and no existing board is overwritten.

If no delegation tool is available, select each named agent manually for the next handoff. Agent configuration cannot guarantee tool restrictions or independent verification in every Copilot client; inspect actual tool use. Keep the two skills installed even when you run agents manually.

**Product references:** [GitHub: custom agents](https://docs.github.com/en/copilot/how-tos/copilot-in-your-ide/use-copilot-agents/use-custom-agents) · [subagents](https://docs.github.com/en/copilot/how-tos/copilot-in-your-ide/use-copilot-agents/use-subagents) · [skills](https://code.visualstudio.com/docs/agent-customization/agent-skills) · [custom agent configuration](https://docs.github.com/en/enterprise-cloud@latest/copilot/reference/custom-agents-configuration).
