# Other smells

Use when the evidence matches this category. These are diagnostic signals, not mandatory transformations. Technique names refer to the [catalogue](https://refactoring.guru/refactoring/techniques) and the local technique links in the Resolve entries. Open only the guide containing the selected remedy if details are needed.

## Incomplete Library Class

- **Recognise and diagnose:** A required capability is unavailable through an existing dependency, leading to repeated workarounds or attempts to recreate the dependency.
- **Prevent:** Confirm supported APIs, extension points, versions and existing repository utilities before implementing anything custom.
- **Resolve:** [Introduce Foreign Method](../techniques/moving-features-between-objects.md) for a narrow operation or [Introduce Local Extension](../techniques/moving-features-between-objects.md) for a coherent adapter; consider an upgrade when justified and authorised.
- **Guardrails and verification:** Avoid monkey patching, broad wrappers and needless forks. Verify the extension’s contract, dependency upgrades, failure behaviour and maintenance cost.

Source: [Refactoring.Guru — Incomplete Library Class](https://refactoring.guru/smells/incomplete-library-class).

Category source: https://refactoring.guru/refactoring/smells/other
