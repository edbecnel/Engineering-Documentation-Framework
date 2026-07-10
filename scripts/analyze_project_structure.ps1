<#
Engineering Documentation Framework project analysis tool.

This script inspects an existing project and reports how closely it follows
the Engineering Documentation Framework.

Safety guarantee:
- Read-only.
- Does not create, delete, overwrite, rename, move, or modify files.

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

$ProjectRootFull = (Resolve-Path -LiteralPath $ProjectRoot).Path.TrimEnd(
    [System.IO.Path]::DirectorySeparatorChar,
    [System.IO.Path]::AltDirectorySeparatorChar
)

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

$RecommendedRootFiles = @(
    "README.md",
    "PROJECT_INDEX.md",
    "PROJECT_CHARTER.md",
    "ARCHITECTURE_DECISIONS.md",
    "CHANGELOG.md",
    "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
)

$AIHandbookFiles = @(
    "docs/AI/README.md",
    "docs/AI/AI_Philosophy.md",
    "docs/AI/AI_Roles.md",
    "docs/AI/AI_Decision_Matrix.md",
    "docs/AI/Cost_Optimization.md",
    "docs/AI/Prompting_Guide.md",
    "docs/AI/Context_Checklist.md",
    "docs/AI/Verification.md",
    "docs/AI/Security.md",
    "docs/AI/Governance.md"
)

$MissingDirs = [System.Collections.Generic.List[string]]::new()
$MissingRootFiles = [System.Collections.Generic.List[string]]::new()
$MissingAIFiles = [System.Collections.Generic.List[string]]::new()
$Warnings = [System.Collections.Generic.List[string]]::new()
$Recommendations = [System.Collections.Generic.List[string]]::new()
$MarkdownOutsideDocs = [System.Collections.Generic.List[string]]::new()

foreach ($dir in $RequiredDirs) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRootFull $dir) -PathType Container)) {
        $MissingDirs.Add($dir)
    }
}

foreach ($file in $RecommendedRootFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRootFull $file) -PathType Leaf)) {
        $MissingRootFiles.Add($file)
    }
}

foreach ($file in $AIHandbookFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRootFull $file) -PathType Leaf)) {
        $MissingAIFiles.Add($file)
    }
}

if (Test-Path -LiteralPath (Join-Path $ProjectRootFull "AI_WORKFLOW.md") -PathType Leaf) {
    $Warnings.Add("Retired root document AI_WORKFLOW.md still exists. Migrate any unique content to docs/AI/ and remove it after verifying links.")
}

if (Test-Path -LiteralPath (Join-Path $ProjectRootFull "documents") -PathType Container) {
    $Warnings.Add("Existing documents/ folder found. Leave it untouched unless you intentionally migrate content into docs/.")
}

$readmePath = Join-Path $ProjectRootFull "README.md"
$projectIndexPath = Join-Path $ProjectRootFull "PROJECT_INDEX.md"

if ((Test-Path -LiteralPath $readmePath -PathType Leaf) -and
    (Test-Path -LiteralPath $projectIndexPath -PathType Leaf)) {
    $readmeContent = Get-Content -LiteralPath $readmePath -Raw
    if ($readmeContent -notmatch "PROJECT_INDEX\.md") {
        $Warnings.Add("README.md exists but does not appear to reference PROJECT_INDEX.md.")
    }
    if ($readmeContent -notmatch "docs/AI") {
        $Warnings.Add("README.md does not appear to reference the modular AI handbook under docs/AI/.")
    }
}

Get-ChildItem -LiteralPath $ProjectRootFull -Recurse -File -Include *.md, *.markdown |
    ForEach-Object {
        $relativePath = $_.FullName.Substring($ProjectRootFull.Length).TrimStart(
            [System.IO.Path]::DirectorySeparatorChar,
            [System.IO.Path]::AltDirectorySeparatorChar
        ) -replace "\\", "/"

        $isCanonical = (
            $relativePath -like "docs/*" -or
            $relativePath -like "archive/*" -or
            $relativePath -like "tasks/*" -or
            $relativePath -eq "README.md" -or
            $relativePath -eq "PROJECT_INDEX.md" -or
            $relativePath -eq "PROJECT_CHARTER.md" -or
            $relativePath -eq "ARCHITECTURE_DECISIONS.md" -or
            $relativePath -eq "CHANGELOG.md" -or
            $relativePath -eq "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
        )

        if (-not $isCanonical) {
            $MarkdownOutsideDocs.Add($relativePath)
        }
    }

if ($MarkdownOutsideDocs.Count -gt 0) {
    $Warnings.Add("$($MarkdownOutsideDocs.Count) Markdown file(s) found outside canonical documentation locations.")
    $Recommendations.Add("Audit Markdown files outside canonical locations and decide whether each should migrate, remain project-specific, or be archived.")
}

if ($MissingAIFiles.Count -gt 0) {
    $Recommendations.Add("Complete the modular AI Engineering Handbook under docs/AI/.")
}

if (-not (Test-Path -LiteralPath (Join-Path $ProjectRootFull "docs/Architecture/ADRs") -PathType Container)) {
    $Recommendations.Add("Create docs/Architecture/ADRs for individual Architecture Decision Records.")
}

$score = 100
$score -= ($MissingDirs.Count * 4)
$score -= ($MissingRootFiles.Count * 3)
$score -= ($MissingAIFiles.Count * 2)
$score -= ($Warnings.Count * 2)
if ($score -lt 0) { $score = 0 }

$aiPresent = $AIHandbookFiles.Count - $MissingAIFiles.Count
$aiPercent = [math]::Floor(($aiPresent * 100) / $AIHandbookFiles.Count)
$projectName = Split-Path -Path $ProjectRootFull -Leaf

function Write-Section {
    param([string] $Title)
    Write-Host ""
    Write-Host $Title
    Write-Host ("-" * $Title.Length)
}

Write-Host "Engineering Documentation Framework Analysis"
Write-Host "============================================"
Write-Host ""
Write-Host "Project root: $ProjectRootFull"
Write-Host "Project name: $projectName"
Write-Host "Estimated compliance score: $score%"
Write-Host "AI handbook completeness: $aiPresent/$($AIHandbookFiles.Count) files ($aiPercent%)"
Write-Host ""
Write-Host "This report is read-only."
Write-Host "No files or folders were created, modified, moved, renamed, or deleted."

Write-Section "Missing required directories"
if ($MissingDirs.Count -eq 0) { Write-Host "None." }
else { $MissingDirs | ForEach-Object { Write-Host "- $_" } }

Write-Section "Missing recommended root files"
if ($MissingRootFiles.Count -eq 0) { Write-Host "None." }
else { $MissingRootFiles | ForEach-Object { Write-Host "- $_" } }

Write-Section "AI handbook completeness"
foreach ($file in $AIHandbookFiles) {
    if (Test-Path -LiteralPath (Join-Path $ProjectRootFull $file) -PathType Leaf) {
        Write-Host "[OK]      $file"
    } else {
        Write-Host "[MISSING] $file"
    }
}

Write-Section "Warnings"
if ($Warnings.Count -eq 0) { Write-Host "None." }
else { $Warnings | ForEach-Object { Write-Host "- $_" } }

Write-Section "Markdown files outside canonical documentation locations"
if ($MarkdownOutsideDocs.Count -eq 0) { Write-Host "None." }
else { $MarkdownOutsideDocs | ForEach-Object { Write-Host "- $_" } }

Write-Section "Recommendations"
if ($Recommendations.Count -eq 0) { Write-Host "None." }
else { $Recommendations | ForEach-Object { Write-Host "- $_" } }

Write-Host ""
