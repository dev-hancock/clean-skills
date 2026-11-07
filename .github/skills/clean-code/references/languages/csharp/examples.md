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

Use [abstraction decisions](../../abstraction-decisions.md) to identify shared knowledge, not just repeated arithmetic.

## Cancellation propagation

```csharp
public async Task ProcessAsync(CancellationToken cancellationToken = default)
{
	var input = await _source.ReadAsync(cancellationToken);
	await _processor.ProcessAsync(input, cancellationToken);
}
```

Verify success, failure and cancellation using the repository's test framework and actual observable results. No test framework or result library is selected by these examples.
