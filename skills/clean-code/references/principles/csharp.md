# C# style and safety rules

This is a targeted review reference, not a checklist or permission to edit. Use only applicable entries; inspect actual contracts, consumers and counter-evidence. A heuristic match alone is not a defect. Preserve repository policy, compatibility and scope; establish impact and classify severity/confidence using [review standards](../review-standards.md). Cite only relevant identifiers; do not count overlapping findings twice. See [catalogue index](index.md) for attribution and full usage rules.

These are language-specific skill conventions, not book identifiers or a backend project profile. Apply only to matching C# code, subject to controlling repository policy, compatibility and documented exceptions.

| Rule | Review requirement | Canonical source | Applicability / exclusions | Evidence threshold |
| --- | --- | --- | --- | --- |
| CSHARP-NAMING | Use meaningful names and applicable casing, field and Async conventions. | [Naming](../languages/csharp/coding-standards.md#naming) | Preserve externally fixed names. | Cite the declaration, applicable rule and contract constraints. |
| CSHARP-LAYOUT | Verify applicable namespaces, indentation, braces, using groups and member order. | [Layout](../languages/csharp/coding-standards.md#file-layout-and-formatting) | No unrelated formatting sweep; repository configuration controls. | Show the precise rule and changed location. |
| CSHARP-CLARITY | Check nullable contracts, intentional mutation, type semantics, readable expressions and accurate public documentation. | [Coding standards](../languages/csharp/coding-standards.md) | No mandated DDD roles or role-to-type table. | Show the actual contract, state or readability concern. |
| CSHARP-ASYNC | Trace awaits, cancellation and ownership of tasks and resources. | [Language safety](../languages/csharp/dotnet.md) | Preserve fixed signatures and documented execution contracts. | Cite a blocking call, lost failure, token path or lifetime issue. |
| CSHARP-MAPPING | Preserve meaning and contracts across representation boundaries without needless machinery. | [Boundary translation](../../../clean-architecture/references/architecture.md#contracts-and-translation) | Existing translation mechanisms may be required by compatibility or a meaningful boundary. | Show a concrete semantic, correctness or maintainability cost rather than enforcing a particular implementation form. |

Use the [Coverage Risk Gate](../review-gates.md#coverage-risk-gate) and [hotspot template](../../../clean-workflow/templates/hotspot-review.md) for available metrics. Numeric targets and collection tools come from the actual repository, not this catalogue. Count one verification gap once.
