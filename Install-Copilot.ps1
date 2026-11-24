# Install the engineering agents and skills from this cloned repository.
# Compatible with Windows PowerShell 5.1 and PowerShell 7+ (no external modules).
[CmdletBinding()]
param(
    [string]$CopilotHome = (Join-Path $HOME '.copilot')
)

$ErrorActionPreference = 'Stop'
$agents = @('lead', 'analyst', 'architect', 'engineer', 'reviewer')
$skills = @('clean-workflow', 'clean-architecture', 'clean-design', 'clean-code')
$legacyAgents = @('delivery', 'delivery-orchestrator', 'product-owner', 'qa-reviewer')
$legacySkills = @('clean-refactoring')

$agentSource = Join-Path $PSScriptRoot 'agents'
$skillSource = Join-Path $PSScriptRoot 'skills'
$root = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($CopilotHome)
$agentRoot = Join-Path $root 'agents'
$skillRoot = Join-Path $root 'skills'
$prefix = $skillRoot.Replace('\', '/') + '/'
$backup = Join-Path $root ('engineering-backups/' + (Get-Date -Format 'yyyyMMdd-HHmmss') + '-' + [guid]::NewGuid().ToString('N').Substring(0, 8))
$stage = Join-Path $backup 'staged'
$encoding = [System.Text.UTF8Encoding]::new($false)

# Validate all inputs before replacing any installed files.
$profiles = @{}
foreach ($name in $skills) {
    $entry = Join-Path $skillSource "$name/SKILL.md"
    if (-not (Test-Path -LiteralPath $entry -PathType Leaf)) {
        throw "Missing skill entry point: $entry"
    }
}
foreach ($name in $agents) {
    $file = Join-Path $agentSource "$name.agent.md"
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) {
        throw "Missing agent: $file"
    }
    $body = Get-Content -LiteralPath $file -Raw -Encoding UTF8
    if ($body -notmatch '(?s)\A\s*---\r?\n.+?\r?\n---(?:\r?\n|$)') {
        throw "Missing YAML frontmatter: $file"
    }
    foreach ($match in [regex]::Matches($body, '`\.github/skills/([^`]+)`')) {
        $reference = $match.Groups[1].Value
        if (-not (Test-Path -LiteralPath (Join-Path $skillSource $reference))) {
            throw "Missing skill reference in ${name}: $reference"
        }
    }
    $profiles[$name] = $body.Replace('.github/skills/', $prefix)
}

# Prevent overwriting the source tree if a custom destination points at the clone.
$sourceRoot = [IO.Path]::GetFullPath($PSScriptRoot).TrimEnd([char[]]@('/', '\'))
$destinationRoot = [IO.Path]::GetFullPath($root).TrimEnd([char[]]@('/', '\'))
if ($sourceRoot.Equals($destinationRoot, [StringComparison]::OrdinalIgnoreCase) -or
    $destinationRoot.StartsWith($sourceRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase) -or
    $sourceRoot.StartsWith($destinationRoot + [IO.Path]::DirectorySeparatorChar, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'The installation root and source repository must be separate, non-nested directories.'
}

$backedUp = @()
$installed = @()
try {
    foreach ($dir in @($agentRoot, $skillRoot, (Join-Path $backup 'agents'), (Join-Path $backup 'skills'), (Join-Path $stage 'agents'), (Join-Path $stage 'skills'))) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    # Stage complete copies first; never modify the tracked source files.
    foreach ($name in $skills) {
        Copy-Item -LiteralPath (Join-Path $skillSource $name) -Destination (Join-Path $stage "skills/$name") -Recurse -Force
    }
    foreach ($name in $agents) {
        [IO.File]::WriteAllText((Join-Path $stage "agents/$name.agent.md"), $profiles[$name], $encoding)
    }

    # Replace only managed names, including obsolete names from earlier releases.
    foreach ($name in ($agents + $legacyAgents)) {
        $path = Join-Path $agentRoot "$name.agent.md"
        if (Test-Path -LiteralPath $path) {
            $saved = Join-Path $backup "agents/$name.agent.md"
            Move-Item -LiteralPath $path -Destination $saved
            $backedUp += @{ Original = $path; Saved = $saved }
        }
    }
    foreach ($name in ($skills + $legacySkills)) {
        $path = Join-Path $skillRoot $name
        if (Test-Path -LiteralPath $path) {
            $saved = Join-Path $backup "skills/$name"
            Move-Item -LiteralPath $path -Destination $saved
            $backedUp += @{ Original = $path; Saved = $saved }
        }
    }

    foreach ($name in $skills) {
        $path = Join-Path $skillRoot $name
        Move-Item -LiteralPath (Join-Path $stage "skills/$name") -Destination $path
        $installed += $path
    }
    foreach ($name in $agents) {
        $path = Join-Path $agentRoot "$name.agent.md"
        Move-Item -LiteralPath (Join-Path $stage "agents/$name.agent.md") -Destination $path
        $installed += $path
    }
    foreach ($name in $skills) {
        if (-not (Test-Path -LiteralPath (Join-Path $skillRoot "$name/SKILL.md") -PathType Leaf)) {
            throw "Installed skill missing: $name"
        }
    }
    foreach ($name in $agents) {
        $actual = Get-Content -LiteralPath (Join-Path $agentRoot "$name.agent.md") -Raw -Encoding UTF8
        if ($actual -cne $profiles[$name]) { throw "Installed agent content mismatch: $name" }
    }
}
catch {
    # Best-effort rollback. Never overwrite a file created by another process.
    $failure = $_
    foreach ($path in $installed) {
        try { Remove-Item -LiteralPath $path -Recurse -Force -ErrorAction Stop }
        catch { Write-Warning "Could not remove installed copy: $path. $_" }
    }
    foreach ($item in $backedUp) {
        try {
            if (Test-Path -LiteralPath $item.Original) {
                throw "Restore destination already exists: $($item.Original)"
            }
            Move-Item -LiteralPath $item.Saved -Destination $item.Original -ErrorAction Stop
        }
        catch { Write-Warning "Could not restore $($item.Original): $_" }
    }
    Write-Warning "Installation failed. Inspect the backup at $backup before retrying."
    throw $failure
}
finally {
    if (Test-Path -LiteralPath $stage) {
        Remove-Item -LiteralPath $stage -Recurse -Force -ErrorAction SilentlyContinue
    }
}

Write-Host "Installed $($agents.Count) agents: $agentRoot"
Write-Host "Installed $($skills.Count) skills: $skillRoot"
Write-Host "Backup of replaced definitions: $backup"
Write-Host 'Start a fresh Copilot session and run the README smoke test.'
Write-Host 'Check for duplicate definitions in other user roots and existing repositories.'
