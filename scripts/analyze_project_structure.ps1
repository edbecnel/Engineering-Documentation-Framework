<#
Engineering Documentation Framework project analysis tool.

This script inspects an existing project and reports how closely it follows
the Engineering Documentation Framework. It does not delete, overwrite, move,
rename, or modify existing files.

Usage:
  .\scripts\analyze_project_structure.ps1 -ProjectRoot "D:\Projects\Existing Project"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $ProjectRoot
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $ProjectRoot -PathType Container)) {
    Write-Error "Project root does not exist or is not a directory: $ProjectRoot"
}

$RequiredDirs = @(
    "docs",
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

$RecommendedFiles = @(
    "README.md",
    "PROJECT_INDEX.md",
    "PROJECT_CHARTER.md",
    "CHANGELOG.md",
    "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
)

$MissingDirs = New-Object System.Collections.Generic.List[string]
$MissingFiles = New-Object System.Collections.Generic.List[string]
$Warnings = New-Object System.Collections.Generic.List[string]
$Recommendations = New-Object System.Collections.Generic.List[string]

foreach ($dir in $RequiredDirs) {
    $path = Join-Path -Path $ProjectRoot -ChildPath $dir
    if (-not (Test-Path -LiteralPath $path -PathType Container)) {
        $MissingDirs.Add($dir)
    }
}

foreach ($file in $RecommendedFiles) {
    $path = Join-Path -Path $ProjectRoot -ChildPath $file
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        $MissingFiles.Add($file)
    }
}

$documentsPath = Join-Path -Path $ProjectRoot -ChildPath "documents"
if (Test-Path -LiteralPath $documentsPath -PathType Container) {
    $Warnings.Add("Existing documents/ folder found. Leave it untouched unless you intentionally migrate content into docs/.")
}

$readmePath = Join-Path -Path $ProjectRoot -ChildPath "README.md"
$projectIndexPath = Join-Path -Path $ProjectRoot -ChildPath "PROJECT_INDEX.md"
if ((Test-Path -LiteralPath $readmePath -PathType Leaf) -and (Test-Path -LiteralPath $projectIndexPath -PathType Leaf)) {
    $readmeContent = Get-Content -LiteralPath $readmePath -Raw
    if ($readmeContent -notmatch "PROJECT_INDEX\.md") {
        $Warnings.Add("README.md exists but does not appear to reference PROJECT_INDEX.md.")
    }
}

$MarkdownOutsideDocs = New-Object System.Collections.Generic.List[string]
$projectRootFull = (Resolve-Path -LiteralPath $ProjectRoot).Path.TrimEnd([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)

Get-ChildItem -LiteralPath $ProjectRoot -Recurse -File -Include *.md, *.markdown | ForEach-Object {
    $fullName = $_.FullName
    $relativePath = $fullName.Substring($projectRootFull.Length).TrimStart([System.IO.Path]::DirectorySeparatorChar, [System.IO.Path]::AltDirectorySeparatorChar)
    $relativePath = $relativePath -replace "\\", "/"

    $isCanonical = (
        $relativePath -like "docs/*" -or
        $relativePath -like "archive/*" -or
        $relativePath -eq "README.md" -or
        $relativePath -eq "PROJECT_INDEX.md" -or
        $relativePath -eq "PROJECT_CHARTER.md" -or
        $relativePath -eq "CHANGELOG.md" -or
        $relativePath -eq "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
    )

    if (-not $isCanonical) {
        $MarkdownOutsideDocs.Add($relativePath)
    }
}

if ($MarkdownOutsideDocs.Count -gt 0) {
    $Warnings.Add("$($MarkdownOutsideDocs.Count) Markdown file(s) found outside the canonical documentation locations.")
    $Recommendations.Add("Audit Markdown files outside docs/ and decide whether each should move into a framework domain, remain project-specific, or be archived.")
}

if (-not (Test-Path -LiteralPath (Join-Path -Path $ProjectRoot -ChildPath "docs/AI") -PathType Container)) {
    $Recommendations.Add("Create docs/AI for AI workflow, AI roles, prompting, cost optimization, verification, and governance guidance.")
}

if (-not (Test-Path -LiteralPath (Join-Path -Path $ProjectRoot -ChildPath "docs/Architecture/ADRs") -PathType Container)) {
    $Recommendations.Add("Create docs/Architecture/ADRs for individual Architecture Decision Records.")
}

$score = 100
$score -= ($MissingDirs.Count * 4)
$score -= ($MissingFiles.Count * 3)
$score -= ($Warnings.Count * 2)
if ($score -lt 0) { $score = 0 }

function Write-Section {
    param([string] $Title)
    Write-Host ""
    Write-Host $Title
    Write-Host (("-" * $Title.Length))
}

$projectName = Split-Path -Path $ProjectRoot -Leaf

Write-Host "Engineering Documentation Framework Analysis"
Write-Host "============================================"
Write-Host ""
Write-Host "Project root: $ProjectRoot"
Write-Host "Project name: $projectName"
Write-Host "Estimated compliance score: $score%"
Write-Host ""
Write-Host "This report is read-only. No files or folders were created, modified, moved, renamed, or deleted."

Write-Section "Missing required directories"
if ($MissingDirs.Count -eq 0) { Write-Host "None." } else { $MissingDirs | ForEach-Object { Write-Host "- $_" } }

Write-Section "Missing recommended files"
if ($MissingFiles.Count -eq 0) { Write-Host "None." } else { $MissingFiles | ForEach-Object { Write-Host "- $_" } }

Write-Section "Warnings"
if ($Warnings.Count -eq 0) { Write-Host "None." } else { $Warnings | ForEach-Object { Write-Host "- $_" } }

Write-Section "Markdown files outside canonical documentation locations"
if ($MarkdownOutsideDocs.Count -eq 0) { Write-Host "None." } else { $MarkdownOutsideDocs | ForEach-Object { Write-Host "- $_" } }

Write-Section "Recommendations"
if ($Recommendations.Count -eq 0) { Write-Host "None." } else { $Recommendations | ForEach-Object { Write-Host "- $_" } }

Write-Host ""
