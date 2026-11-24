# SOLID: responsibility and dependency design

Original guidance based on Robert C. Martin, *Clean Architecture* (2017), Chapters 7–11. These principles apply to local implementation as well as component boundaries.

## Principles

| Principle | Design question |
| --- | --- |
| Single Responsibility (SRP) | Do responsibilities change for the same actor/reason, or are distinct change drivers coupled? |
| Open–Closed (OCP) | Can important stable policy accommodate evidenced variation without recurring invasive edits? |
| Liskov Substitution (LSP) | Can a consumer rely on the same behavioural promises across substitutable implementations? |
| Interface Segregation (ISP) | Does a consumer depend only on capabilities relevant to its needs and change drivers? |
| Dependency Inversion (DIP) | Does high-level policy control its dependency contracts rather than depending upon volatile mechanism details? |

Apply SOLID **holistically**. No principle is a mandate for a particular number of classes, interfaces, extension points or layers. The cost of a boundary is part of the design decision.


For local trade-offs, use [objects and cohesion](design.md) and [abstraction decisions](abstraction-decisions.md). For cross-component dependency direction, use the [architecture principles](../../clean-architecture/references/book-principles.md).
