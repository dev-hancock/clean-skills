$ErrorActionPreference = 'Stop'

$destination = Join-Path $HOME '.copilot'

foreach ($directory in @('agents', 'skills')) {
    $source = Join-Path $PSScriptRoot $directory
    $target = Join-Path $destination $directory

    New-Item -ItemType Directory -Path $target -Force | Out-Null

    Copy-Item -Path "$source\*" -Destination $target -Recurse -Force
}

Write-Host 'Copilot agents and skills installed.'