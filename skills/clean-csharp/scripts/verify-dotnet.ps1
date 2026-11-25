# Requires PowerShell 7+ or Windows PowerShell 5.1 and a compatible .NET SDK.
# Does not modify source or automatically install SDKs.
param(
    [Parameter(Mandatory = $true)][string]$Target,
    [string]$TestTarget = '',
    [ValidateSet('Release', 'Debug')][string]$Configuration = 'Release',
    [switch]$CheckFormat,
    [switch]$NoTests,
    [switch]$WarningsAsErrors
)

$ErrorActionPreference = 'Stop'
if (-not (Test-Path -LiteralPath $Target -PathType Leaf)) { throw "Target not found: $Target" }
if ([string]::IsNullOrWhiteSpace($TestTarget)) { $TestTarget = $Target }
if (-not $NoTests -and -not (Test-Path -LiteralPath $TestTarget -PathType Leaf)) {
    throw "Test target not found: $TestTarget"
}
if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) { throw 'dotnet SDK not found' }

function Invoke-Dotnet([string[]]$Arguments) {
    Write-Host ('> dotnet ' + ($Arguments -join ' '))
    & dotnet @Arguments
    if ($LASTEXITCODE -ne 0) { throw "dotnet failed with exit code $LASTEXITCODE" }
}

Invoke-Dotnet -Arguments @('--version')
$buildArguments = @('build', $Target, '--configuration', $Configuration)
if ($WarningsAsErrors) { $buildArguments += '-warnaserror' }
Invoke-Dotnet -Arguments $buildArguments
if (-not $NoTests) {
    Invoke-Dotnet -Arguments @('test', $TestTarget, '--configuration', $Configuration)
    Write-Host 'NOTE: Inspect test output; success exit code does not prove tests were discovered.'
}
if ($CheckFormat) {
    Invoke-Dotnet -Arguments @('format', $Target, '--verify-no-changes')
}
Write-Host 'DONE: invoked commands completed successfully; inspect test discovery/results separately.'
