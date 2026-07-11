<#
Engineering Documentation Framework documentation migration planner.

Safety guarantee:
- Read-only.
- Does not create, delete, overwrite, rename, move, or modify files.
- Does not modify an existing documents/ folder.

Usage:
.\scripts\plan_documentation_migration.ps1 -ProjectRoot "D:\Projects\Existing Project"
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

function Get-RelativePath {
    param([string] $FullPath)
    return ($FullPath.Substring($ProjectRootFull.Length).TrimStart(
        [System.IO.Path]::DirectorySeparatorChar,
        [System.IO.Path]::AltDirectorySeparatorChar
    ) -replace "\\", "/")
}

function Test-CanonicalMarkdownLocation {
    param([string] $RelativePath)

    return (
        $RelativePath -like "docs/*" -or
        $RelativePath -like "archive/*" -or
        $RelativePath -like "tasks/*" -or
        $RelativePath -eq "README.md" -or
        $RelativePath -eq "PROJECT_INDEX.md" -or
        $RelativePath -eq "PROJECT_CHARTER.md" -or
        $RelativePath -eq "ARCHITECTURE_DECISIONS.md" -or
        $RelativePath -eq "CHANGELOG.md" -or
        $RelativePath -eq "ENGINEERING_DOCUMENTATION_FRAMEWORK.md"
    )
}

function Get-Recommendation {
    param([string] $RelativePath)

    $fileName = Split-Path -Path $RelativePath -Leaf
    $lower = $RelativePath.ToLowerInvariant()

    if ($lower -match "ai[_-]workflow\.md$") {
        return @{
            Destination = "SPLIT: docs/AI/ (begin with docs/AI/README.md)"
            Reason = "Legacy monolithic AI workflow document; review and split content across the modular AI handbook rather than moving it unchanged."
        }
    }
    if ($lower -match "adr|architecture-decision|architecture_decision") {
        return @{ Destination = "docs/Architecture/ADRs/$fileName"; Reason = "Filename suggests an Architecture Decision Record." }
    }
    if ($lower -match "architecture|design|system|stack|technical") {
        return @{ Destination = "docs/Architecture/$fileName"; Reason = "Filename suggests architecture or system design content." }
    }
    if ($lower -match "api|endpoint|rest|graphql|contract") {
        return @{ Destination = "docs/API/$fileName"; Reason = "Filename suggests API contract or interface documentation." }
    }
    if ($lower -match "database|schema|migration|data-model|data_model|sql|postgres") {
        return @{ Destination = "docs/Database/$fileName"; Reason = "Filename suggests database, schema, migration, or persistence content." }
    }
    if ($lower -match "deploy|release|environment|cicd|ci-cd|ops|runbook") {
        return @{ Destination = "docs/Deployment/$fileName"; Reason = "Filename suggests deployment, operations, release, or runbook content." }
    }
    if ($lower -match "spec|requirement|feature|story|acceptance") {
        return @{ Destination = "docs/Specifications/$fileName"; Reason = "Filename suggests requirements, feature, or specification content." }
    }
    if ($lower -match "developer|development|coding|git|test|debug|setup|contributor") {
        return @{ Destination = "docs/Developer_Handbook/$fileName"; Reason = "Filename suggests developer handbook content: setup, workflow, coding, testing, or contributor guidance." }
    }
    if ($lower -match "ai|prompt|cursor|continue|ollama|claude|gpt|copilot|model") {
        return @{ Destination = "docs/AI/$fileName"; Reason = "Filename suggests AI workflow or AI engineering guidance." }
    }
    if ($lower -match "user|guide|manual|tutorial|walkthrough|troubleshoot") {
        return @{ Destination = "docs/User_Guides/$fileName"; Reason = "Filename suggests end-user guide or tutorial content." }
    }
    if ($lower -match "glossary|reference|terminology|standard|links") {
        return @{ Destination = "docs/Reference/$fileName"; Reason = "Filename suggests reference material." }
    }
    if ($lower -match "template") {
        return @{ Destination = "docs/Templates/$fileName"; Reason = "Filename suggests reusable template content." }
    }
    if ($lower -match "task|todo|roadmap|backlog") {
        return @{ Destination = "tasks/$fileName"; Reason = "Filename suggests task planning or roadmap content." }
    }

    return @{
        Destination = "docs/Reference/$fileName"
        Reason = "No strong filename match found; review manually. Reference is the safest default recommendation."
    }
}

$projectName = Split-Path -Path $ProjectRootFull -Leaf
$candidates = [System.Collections.Generic.List[string]]::new()

Get-ChildItem -LiteralPath $ProjectRootFull -Recurse -File -Include *.md, *.markdown |
    Sort-Object FullName |
    ForEach-Object {
        $relativePath = Get-RelativePath -FullPath $_.FullName
        if (-not (Test-CanonicalMarkdownLocation -RelativePath $relativePath)) {
            $candidates.Add($relativePath)
        }
    }

Write-Host "Engineering Documentation Framework Migration Plan"
Write-Host "=================================================="
Write-Host ""
Write-Host "Project root: $ProjectRootFull"
Write-Host "Project name: $projectName"
Write-Host ""
Write-Host "This report is read-only."
Write-Host "No files or folders were created, modified, moved, renamed, or deleted."
Write-Host ""

if ($candidates.Count -eq 0) {
    Write-Host "No Markdown migration candidates found outside canonical documentation locations."
    exit 0
}

Write-Host "Migration candidates found: $($candidates.Count)"
Write-Host ""

$index = 1
foreach ($candidate in $candidates) {
    $recommendation = Get-Recommendation -RelativePath $candidate

    Write-Host "$index. $candidate"
    Write-Host "   Recommended destination: $($recommendation.Destination)"
    Write-Host "   Reason: $($recommendation.Reason)"
    Write-Host "   Action: Review manually before migrating. Do not move automatically."
    Write-Host ""
    $index++
}

Write-Host "Recommended next steps:"
Write-Host "1. Review each recommendation."
Write-Host "2. Split legacy AI_WORKFLOW.md content across docs/AI/ when encountered."
Write-Host "3. Move only documents whose purpose is clear."
Write-Host "4. Add or update links from README.md and PROJECT_INDEX.md."
Write-Host "5. Archive obsolete or superseded documents with a short migration note."
Write-Host "6. Re-run the analysis and migration scripts after each cleanup pass."
