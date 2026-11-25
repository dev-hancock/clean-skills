# C# examples

Illustrate [language style](coding-standards.md) and general design principles, not an application architecture. Fragments omit imports, surrounding types and public XML documentation where they are not the subject.

## Immutable contracts

A record can express value equality:

```csharp
public sealed record DisplaySettings(string Title, bool ShowLineNumbers);
```

An immutable class is also valid when reference identity is appropriate:

```csharp
public sealed class DocumentSnapshot
{
	public DocumentSnapshot(string title, IEnumerable<string> lines)
	{
		Title = title;
		Lines = Array.AsReadOnly(lines.ToArray());
	}

	public string Title { get; }

	public IReadOnlyList<string> Lines { get; }
}
```

The defensive copy prevents later changes to the caller's collection from changing the snapshot. No DDD role or mandatory type form follows from either example.

## Boundary translation

When two representations have different meanings, make that translation and its constraints explicit. Select an implementation mechanism appropriate to the consumer; neither the language nor this skill requires a particular mapping style. Do not add conversion machinery merely because a boundary exists.

## Separate substantial projections from orchestration

The following fragments illustrate an in-memory inventory query. Assume the repository returns a materialised collection and the existing view constructors accept the shown fields. Presence filtering and status tokens are part of the established view contract; the example does not redefine domain eligibility or change the public shape.

Avoid mixing query orchestration with nested projection details:

```csharp
var orders = await repository.ListAsync(specification, cancellationToken);

return orders
	.Select(order => new OrderView(
		order.Id,
		order.Status switch
		{
			OrderStatus.Pending => "pending",
			OrderStatus.Confirmed => "confirmed",
			_ => "unknown"
		},
		order.Items
			.Where(item => item.IsVisible)
			.Select(item => new ItemView(item.Id, item.Name))
			.ToArray()))
	.ToArray();
```

Prefer a named, cohesive transformation for this multi-level projection. The query still selects the source, the handler coordinates retrieval and transformation, and the mapper owns the view representation:

```csharp
var orders = await repository.ListAsync(specification, cancellationToken);

return orders.Select(OrderMapper.ToView).ToArray();
```

```csharp
internal static class OrderMapper
{
	public static OrderView ToView(Order order)
	{
		var items = order.Items
			.Where(item => item.IsVisible)
			.Select(ToView)
			.ToArray();

		return new OrderView(order.Id, ToStatus(order.Status), items);
	}

	private static ItemView ToView(OrderItem item)
	{
		return new ItemView(item.Id, item.Name);
	}

	private static string ToStatus(OrderStatus status)
	{
		return status switch
		{
			OrderStatus.Pending => "pending",
			OrderStatus.Confirmed => "confirmed",
			_ => "unknown"
		};
	}
}
```

Co-locate the mapper with the query/view feature. It needs no interface or DI registration. A trivial in-memory projection such as `orders.Select(order => order.Id).ToArray()` does not need a mapper. A small local projection may only need a private static method. These are examples of judgement, not a mandated file layout or abstraction.

Verify observable view content, status tokens (including the fallback), visible-item filtering, empty collections, ordering and snapshot behaviour against existing requirements. Preserve provider translation for `IQueryable<T>`; these method-group examples are for LINQ to Objects. A separate, authorised contract design may retain typed status in internal views and perform string conversion at an external boundary; that is not part of this refactor.

## Callback state

Unnecessary deferred mutation can obscure a simple choice:

```csharp
private Action? _apply;

public FormatBuilder AsCsv()
{
	_apply = () => _options.Format = OutputFormat.Csv;
	return this;
}

public void Apply() => _apply?.Invoke();
```

If staging is unnecessary, a direct operation is clearer:

```csharp
public void SetFormat(OutputFormat format)
{
	_options.Format = format;
}
```

If staging is part of the actual contract, store the selected value explicitly and reject incomplete state. Do not remove required behaviour merely to reduce type count.

## Cohesion and independent policies

Do not merge independently changing rules because their syntax is similar:

```csharp
var invoiceAmount = decimal.Round(netAmount * taxRate, 2, MidpointRounding.ToEven);
var displayAmount = decimal.Round(value * scale, 2, MidpointRounding.AwayFromZero);
```

Use [abstraction decisions](../../clean-design/references/abstraction-decisions.md) to identify shared knowledge, not just repeated arithmetic.

## Cancellation propagation

```csharp
public async Task ProcessAsync(CancellationToken cancellationToken = default)
{
	var input = await _source.ReadAsync(cancellationToken);
	await _processor.ProcessAsync(input, cancellationToken);
}
```

Verify success, failure and cancellation using the repository's test framework and actual observable results. No test framework or result library is selected by these examples.
