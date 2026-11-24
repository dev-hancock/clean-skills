# C#/.NET verification

Apply the core [verification loop](../../verification.md) using the actual repository's tooling, not a skill-owned backend profile.

## Inspect

- Identify project/solution entry points, SDK and target frameworks, test runner, `.editorconfig`, analysers and documented CI commands.
- Read [coding standards](coding-standards.md) and relevant [language safety](dotnet.md).
- Check tooling and external prerequisites without automatically installing them.

## Execute when authorised

- Run the existing narrow build, tests and analyser checks relevant to the change.
- Treat warnings as errors, as required by the [coding standards](coding-standards.md#authority-and-core-requirements). Do not suppress diagnostics merely to pass; distinguish introduced diagnostics from baseline issues.
- Verify tests were discovered and executed; compilation alone does not establish behavioural correctness.
- Use formatting verification only where it matches repository policy; avoid unrelated formatting changes.
- Verify public contracts, nullability, owned resources and relevant asynchronous/cancellation paths.
- Use the existing test framework and meaningful assertions on observable behaviour.
- When a claim depends on an external tool or provider, use evidence capable of establishing that claim; a substitute cannot automatically prove equivalent behaviour.
- Use [coverage evidence](crap-analysis.md) only with the repository's actual collection tools and adopted targets.

## Reporting

Record commands, results, diagnostics, discovery counts and unrun checks. Read-only review does not authorise output-producing commands.

The optional [PowerShell](../../../scripts/verify-dotnet.ps1) and [bash](../../../scripts/verify-dotnet.sh) helpers invoke a warnings-as-errors build, tests and optional format verification. Use them only when their commands and test runner match the repository. They do not select an application architecture or install tools.
