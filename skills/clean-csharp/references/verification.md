# C#/.NET verification

Apply the core [verification loop](../../clean-code/references/verification.md) using the actual repository's tooling, not a skill-owned backend profile.

## Inspect

- Identify project/solution entry points, SDK and target frameworks, test runner, `.editorconfig`, analysers and documented CI commands.
- Inspect [coding standards](coding-standards.md) or [language safety](dotnet.md) only when relevant to the verification question.
- Check tooling and external prerequisites without automatically installing them.

## Execute when authorised

- Prefer documented repository commands over helpers. Match the actual test platform and SDK; do not assume VSTest filter syntax works with every runner.
- A build using stale reference assemblies or skipped project references is diagnostic evidence only, not a full current-source build.
- Run the existing narrow build, tests and analyser checks relevant to the change.
- Respect the repository's warning policy, including warnings-as-errors when configured or explicitly required. Do not suppress diagnostics merely to pass; distinguish introduced diagnostics from baseline issues.
- Verify tests were discovered and executed; compilation alone does not establish behavioural correctness.
- Use formatting verification only where it matches repository policy; avoid unrelated formatting changes.
- Verify public contracts, nullability, owned resources and relevant asynchronous/cancellation paths.
- Use the existing test framework and meaningful assertions on observable behaviour.
- When a claim depends on an external tool or provider, use evidence capable of establishing that claim; a substitute cannot automatically prove equivalent behaviour.
- Use [coverage evidence](../../clean-code/references/verification.md#coverage-verification) only with the repository's actual collection tools and adopted targets.

## Reporting

Record commands, results, diagnostics, discovery counts and unrun checks. Read-only review does not authorise output-producing commands.

The optional [PowerShell](../scripts/verify-dotnet.ps1) and [bash](../scripts/verify-dotnet.sh) helpers invoke a build, tests and optional format verification; warnings-as-errors can be explicitly enabled (`-WarningsAsErrors` in PowerShell or `--warnings-as-errors` in bash). Use them only when their commands and test runner match the repository. They may restore packages or produce build/test outputs; obtain appropriate permission. They do not select an application architecture or install tools.
