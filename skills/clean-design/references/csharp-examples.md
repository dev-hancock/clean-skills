# C# examples

Optional .NET illustrations of the design decisions in this skill. They are original, deliberately small examples, not repository-specific conventions or standalone applications. Adapt to existing contracts, error conventions and language version. Types in the snippets are illustrative unless defined.

## Primitive obsession and data clumps

When a date range is a real domain concept, passing independent dates encourages repeated validation and invalid combinations.

Before:

```csharp
bool Overlaps(DateOnly start, DateOnly end, DateOnly otherStart, DateOnly otherEnd)
    => start <= otherEnd && otherStart <= end;
```

Possible design for a domain with inclusive, ordered dates:

```csharp
public sealed record DateRange
{
    public DateRange(DateOnly start, DateOnly end)
    {
        if (end < start)
            throw new ArgumentOutOfRangeException(nameof(end));

        Start = start;
        End = end;
    }

    public DateOnly Start { get; }
    public DateOnly End { get; }

    public bool Overlaps(DateRange other)
        => Start <= other.End && other.Start <= End;
}
```

The type owns the invariant and the operation. Introducing validation where none existed is an intentional behaviour change unless invalid inputs were already rejected by the original contract. For an actual refactor, migrate existing validation and preserve the failure convention, endpoints and serialization contract. Do not introduce a wrapper for every primitive.

## Long method and feature envy: separate policy from orchestration

Before:

```csharp
if (order.Status != OrderStatus.Pending || order.Lines.Count == 0)
    return false;

order.Status = OrderStatus.Confirmed;
await repository.SaveAsync(order, cancellationToken);
return true;
```

Possible design when confirmation belongs to the order:

```csharp
if (!order.TryConfirm())
    return false;

await repository.SaveAsync(order, cancellationToken);
return true;
```

The order owns the transition and checks. The use case still owns persistence orchestration. Move only the domain decision, not the repository dependency. Verify rejected transitions do not mutate state or save, and successful transitions do. Keep simple orchestration visible rather than extracting every line.

## Switch statements: do not force polymorphism

A closed-set mapping may be clearer as a switch:

```csharp
string FormatStatus(OrderStatus status) => status switch
{
    OrderStatus.Pending => "Pending",
    OrderStatus.Confirmed => "Confirmed",
    _ => throw new ArgumentOutOfRangeException(nameof(status))
};
```

Do not create a class for each label. If independent pricing policies genuinely vary and the same selection is repeated across calculations, a focused strategy may instead own that variation:

```csharp
public interface IPricingPolicy
{
    decimal Calculate(decimal subtotal);
}
```

Select the appropriate strategy once at an existing composition or use-case boundary. Keep simple alternatives direct and avoid inventing a registry or factory when it offers no benefit. Verify all variants and unknown inputs against the existing contract.

## Duplicate code: share knowledge, not appearance

Two separate limits may coincidentally have the same number:

```csharp
const int MaximumLoginAttempts = 5;
const int MaximumItemsPerOrder = 5;
```

Do not consolidate them into `MaximumAllowed`. They are independent policies. Conversely, two implementations of the same eligibility rule should normally be unified at the rule's owner, even if their syntax differs.

## Temporary field: avoid operation state on long-lived objects

Before:

```csharp
private decimal _subtotal;

public decimal Calculate(IReadOnlyList<decimal> amounts)
{
    _subtotal = amounts.Sum();
    return _subtotal * 1.2m;
}
```

After:

```csharp
public decimal Calculate(IReadOnlyList<decimal> amounts)
{
    var subtotal = amounts.Sum();
    return subtotal * 1.2m;
}
```

Local state avoids cross-call interference if the field was not part of any other observable behaviour. If the multiplier is an authoritative business rule, give it a meaningful name or obtain it from its owner; do not invent a configurable tax system solely to extract a literal.

## Middle man: retain only justified delegation

```csharp
public sealed class ForwardingStore(Store store)
{
    public Task SaveAsync(Item item, CancellationToken ct)
        => store.SaveAsync(item, ct);
}
```

If it is only a same-layer duplicate of `Store`, use the actual owner rather than creating this wrapper. If it is an adapter that implements an application-owned port and shields callers from a vendor dependency, keep the boundary even when the current implementation delegates. Judge the architectural role, not the number of lines.

## Data class: distinguish domain models from messages

A request or event can deliberately be an immutable data contract:

```csharp
public sealed record ConfirmOrder(Guid OrderId);
```

Do not add behaviour merely to avoid a data class. A domain order whose public setters allow callers to bypass state transitions, however, should expose controlled operations that enforce its invariants. Transport validation and domain validation serve different responsibilities.

## Guard clauses: preserve failure precedence

Before:

```csharp
if (request is not null)
{
    if (request.IsValid)
        return Process(request);

    return Invalid();
}

return Missing();
```

After:

```csharp
if (request is null)
    return Missing();

if (!request.IsValid)
    return Invalid();

return Process(request);
```

The main path is visible and the original outcomes and evaluation order remain unchanged. Verify missing, invalid and valid inputs; do not combine conditions if the failure distinctions matter.
