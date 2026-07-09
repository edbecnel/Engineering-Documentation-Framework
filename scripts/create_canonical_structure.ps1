# This script only creates missing directories. It does not delete, overwrite, move, rename, or modify existing files.
#
# Creates the canonical Engineering Documentation Framework folder layout inside an
# existing software project's root directory.
# Safe to run repeatedly — existing directories are left unchanged.
#
# Usage:
#   .\scripts\create_canonical_structure.ps1 -ProjectRoot "D:\Projects\The Recipe Vault"
#
# Example:
#   .\scripts\create_canonical_structure.ps1 -ProjectRoot "D:\Projects\The Recipe Vault"

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $ProjectRoot
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $ProjectRoot -PathType Container)) {
    Write-Error "Project root does not exist or is not a directory: $ProjectRoot"
}

# Canonical folder structure (relative to project root)
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

    $fullPath = Join-Path -Path $ProjectRoot -ChildPath $RelativePath

    if (Test-Path -LiteralPath $fullPath -PathType Container) {
        Write-Host "Exists:  $RelativePath"
    }
    elseif (Test-Path -LiteralPath $fullPath) {
        Write-Warning "Skipped: $RelativePath (path exists but is not a directory)"
        return $false
    }
    else {
        New-Item -ItemType Directory -LiteralPath $fullPath | Out-Null
        Write-Host "Created: $RelativePath"
    }

    return $true
}

Write-Host "Ensuring canonical folder structure under: $ProjectRoot"
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
