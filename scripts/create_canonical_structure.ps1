# This script only creates missing directories. It does not delete, overwrite, move, rename, or modify existing files.
#
# Creates the canonical Engineering Documentation Framework folder layout.
# Safe to run repeatedly — existing directories are left unchanged.
#
# Usage:
#   .\scripts\create_canonical_structure.ps1
#   .\scripts\create_canonical_structure.ps1 -Root "C:\path\to\target\repo"

[CmdletBinding()]
param(
    [Parameter(Position = 0)]
    [string] $Root
)

$ErrorActionPreference = "Stop"

# Resolve repository root: -Root parameter, otherwise parent of scripts/
if ([string]::IsNullOrWhiteSpace($Root)) {
    $Root = Split-Path -Parent $PSScriptRoot
}

if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
    Write-Error "Target path does not exist or is not a directory: $Root"
}

# Canonical folder structure (relative to repository root)
$dirs = @(
    "docs/Architecture",
    "docs/Architecture/ADRs",
    "docs/AI",
    "docs/Development",
    "docs/Specifications",
    "docs/API",
    "docs/Database",
    "docs/Deployment",
    "docs/User_Guides",
    "docs/Reference",
    "docs/Templates",
    "tasks",
    "archive",
    "scripts"
)

function New-DirectoryIfMissing {
    param(
        [string] $RelativePath
    )

    $fullPath = Join-Path -Path $Root -ChildPath $RelativePath

    if (Test-Path -LiteralPath $fullPath -PathType Container) {
        Write-Host "Exists:  $RelativePath"
    }
    elseif (Test-Path -LiteralPath $fullPath) {
        Write-Warning "Skipped: $RelativePath (path exists but is not a directory)"
        return $false
    }
    else {
        New-Item -ItemType Directory -Path $fullPath | Out-Null
        Write-Host "Created: $RelativePath"
    }

    return $true
}

Write-Host "Ensuring canonical folder structure under: $Root"
Write-Host ""

$errors = 0
foreach ($dir in $dirs) {
    if (-not (New-DirectoryIfMissing -RelativePath $dir)) {
        $errors++
    }
}

Write-Host ""
if ($errors -gt 0) {
    Write-Warning "Finished with $errors skipped path(s)."
    exit 1
}

Write-Host "Done."
