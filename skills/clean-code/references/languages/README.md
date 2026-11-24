# Language-guide registry

The core skill is language-agnostic. These guides are optional extensions selected by the languages actually present in the requested scope, not independent commands or executable plug-ins.

## Selection

1. Inspect scoped files and relevant manifests; do not choose a guide from the repository name alone.
2. Apply the matching guide and required standards before implementation, review or refactor. If the language and guide are already known, open them directly; do not reread this registry. Load only task-relevant platform references.
3. Apply each guide only to its language. Shared build/composition work may need more than one guide.
4. For an unlisted language, use the core and verified repository conventions. Report the missing bundled guide; do not borrow another language's syntax or tools.

## Supported guides

| Language / evidence | Guide | Required standards |
| --- | --- | --- |
| C# / `.cs`, `.csproj` | [C#/.NET](csharp/README.md) | [C# style and language standards](csharp/coding-standards.md) |

JSON, Markdown and other supporting files alone do not select a language guide. A .NET manifest does not make non-C# source subject to C# rules.

## Adding a language

- Add a language subfolder with a `README.md` entry point and register its file extensions/manifests in the table.
- State applicability, required standards, do/don't guidance and verification using existing repository tools.
- Link detailed standards or examples rather than duplicating core Clean Code principles.
- Keep guides about language expression and safety, not a particular application architecture, provider, result library or test framework.
- Keep that language's standards, framework notes, examples and verification guidance in its subfolder; add supporting files only when needed. No new mode, runtime loader or dependency is required.
- After adding or changing language guidance, check its local links and run the repository’s own verification commands; this v2 package does not ship the previous package-specific checker.
