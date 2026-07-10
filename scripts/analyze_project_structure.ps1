<#
Engineering Documentation Framework Framework Advisor.

Read-only project analysis:
- structure and AI handbook completeness
- Markdown link validation
- orphan and hierarchy navigation checks
- governance metadata validation
- lifecycle, ownership, and review validation

Usage:
.\scripts\analyze_project_structure.ps1 -ProjectRoot "D:\Projects\Existing Project"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $ProjectRoot
)

$ErrorActionPreference = "Stop"
$Stage1RulesetVersion = "2026-07-10-stage1"

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
    "docs/Governance",
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

$RecommendedRootFiles = [System.Collections.Generic.List[string]]::new()
@(
    "README.md",
    "PROJECT_INDEX.md",
    "PROJECT_CHARTER.md",
    "ARCHITECTURE_DECISIONS.md",
    "CHANGELOG.md"
) | ForEach-Object { $RecommendedRootFiles.Add($_) }

$IsEDFRepository = (
    (Test-Path -LiteralPath (Join-Path $ProjectRootFull "docs/Governance/EDF_Governance.md") -PathType Leaf) -and
    (Test-Path -LiteralPath (Join-Path $ProjectRootFull "docs/Architecture/Documentation_Information_Architecture.md") -PathType Leaf)
)

if (-not $IsEDFRepository) {
    $RecommendedRootFiles.Add("ENGINEERING_DOCUMENTATION_FRAMEWORK.md")
}

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

$GovernanceFiles = @(
    "docs/Governance/README.md",
    "docs/Governance/Governance_Overview.md",
    "docs/Governance/EDF_Governance.md",
    "docs/Governance/Document_Metadata_Standard.md",
    "docs/Governance/Document_Lifecycle.md",
    "docs/Governance/Ownership_and_Review.md",
    "docs/Governance/Change_Management.md",
    "docs/Governance/Analyzer_Compliance.md",
    "docs/Governance/Governance_Checklist.md"
)

$ValidStatuses = @("Draft", "In Review", "Approved", "Maintained", "Deprecated", "Archived")
$ReviewFrequencyDays = @{
    "Monthly" = 31
    "Quarterly" = 92
    "Semiannual" = 183
    "Annual" = 366
}

$MissingDirs = [System.Collections.Generic.List[string]]::new()
$MissingRootFiles = [System.Collections.Generic.List[string]]::new()
$MissingAIFiles = [System.Collections.Generic.List[string]]::new()
$MissingGovernanceFiles = [System.Collections.Generic.List[string]]::new()
$Warnings = [System.Collections.Generic.List[string]]::new()
$Recommendations = [System.Collections.Generic.List[string]]::new()
$MarkdownOutsideDocs = [System.Collections.Generic.List[string]]::new()
$BrokenLinks = [System.Collections.Generic.List[string]]::new()
$OrphanDocuments = [System.Collections.Generic.List[string]]::new()
$NavigationIssues = [System.Collections.Generic.List[string]]::new()
$MetadataIssues = [System.Collections.Generic.List[string]]::new()
$ReviewIssues = [System.Collections.Generic.List[string]]::new()
$AuthoritativeDocs = [System.Collections.Generic.List[string]]::new()

function Get-RelativePath {
    param([string] $FullPath)
    return $FullPath.Substring($ProjectRootFull.Length).TrimStart(
        [System.IO.Path]::DirectorySeparatorChar,
        [System.IO.Path]::AltDirectorySeparatorChar
    ) -replace "\\", "/"
}

function Write-Section {
    param([string] $Title)
    Write-Host ""
    Write-Host $Title
    Write-Host ("-" * $Title.Length)
}

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

foreach ($file in $GovernanceFiles) {
    if (-not (Test-Path -LiteralPath (Join-Path $ProjectRootFull $file) -PathType Leaf)) {
        $MissingGovernanceFiles.Add($file)
    }
}

if (Test-Path -LiteralPath (Join-Path $ProjectRootFull "AI_WORKFLOW.md") -PathType Leaf) {
    $Warnings.Add("Retired root document AI_WORKFLOW.md still exists.")
}

if (Test-Path -LiteralPath (Join-Path $ProjectRootFull "documents") -PathType Container) {
    $Warnings.Add("Existing documents/ folder found. Leave it untouched unless migration is intentional.")
}

$allMarkdown = Get-ChildItem -LiteralPath $ProjectRootFull -Recurse -File -Include *.md, *.markdown
$allRelative = @{}
foreach ($item in $allMarkdown) {
    $relativePath = Get-RelativePath $item.FullName
    $allRelative[$relativePath.ToLowerInvariant()] = $true

    $isCanonical = (
        $relativePath -like "docs/*" -or
        $relativePath -like "archive/*" -or
        $relativePath -like "tasks/*" -or
        $relativePath -eq "scripts/README.md" -or
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

$inboundLinks = @{}
foreach ($item in $allMarkdown) {
    $relativePath = Get-RelativePath $item.FullName
    $content = Get-Content -LiteralPath $item.FullName -Raw
    $baseDir = Split-Path -Parent $item.FullName
    $isTemplateSource = (
        ($relativePath -like "docs/Templates/*.md") -and
        ($relativePath -ne "docs/Templates/README.md")
    )

    $linkMatches = [regex]::Matches($content, '(?<!\!)\[[^\]]+\]\(([^)]+)\)')
    foreach ($match in $linkMatches) {
        $target = $match.Groups[1].Value.Trim()
        if ($target -match '^(https?://|mailto:|#)') { continue }
        if ($target -match '^(url|path|example|placeholder)$') { continue }
        if ($isTemplateSource) { continue }

        $targetPath = ($target -split '#')[0]
        if ([string]::IsNullOrWhiteSpace($targetPath)) { continue }

        try {
            $resolvedTarget = [System.IO.Path]::GetFullPath((Join-Path $baseDir $targetPath))
        } catch {
            $BrokenLinks.Add("$relativePath -> $target")
            continue
        }

        if (-not (Test-Path -LiteralPath $resolvedTarget)) {
            $BrokenLinks.Add("$relativePath -> $target")
        } else {
            if ((Test-Path -LiteralPath $resolvedTarget -PathType Leaf) -and
                ([System.IO.Path]::GetExtension($resolvedTarget) -match '^\.(md|markdown)$')) {
                $targetRelative = Get-RelativePath $resolvedTarget
                if (-not $inboundLinks.ContainsKey($targetRelative.ToLowerInvariant())) {
                    $inboundLinks[$targetRelative.ToLowerInvariant()] = 0
                }
                $inboundLinks[$targetRelative.ToLowerInvariant()]++
            }
        }
    }

    if (($relativePath -like "docs/*") -and (-not $isTemplateSource)) {
        $hasBreadcrumb = ($content -match '\[Home\]\(' -and $content -match '\[Project Index\]\(')
        if (-not $hasBreadcrumb) {
            $NavigationIssues.Add("$relativePath: missing breadcrumb navigation.")
        }

        $domainRelative = $relativePath.Substring(5)
        $domainName = ($domainRelative -split '/')[0]
        if ($relativePath -notmatch '/README\.md$') {
            $expectedReadme = "docs/$domainName/README.md"
            if ($content -notmatch [regex]::Escape("README.md")) {
                $NavigationIssues.Add("$relativePath: missing parent domain README link.")
            }
        }
    }

    if ($content -match '> \*\*Authoritative:\*\*\s*Yes') {
        $AuthoritativeDocs.Add($relativePath)
    }

    $metadataPresent = ($content -match '> \*\*Status:\*\*')
    if ($metadataPresent) {
        $statusMatch = [regex]::Match($content, '> \*\*Status:\*\*\s*(.+)')
        $ownerMatch = [regex]::Match($content, '> \*\*Owner:\*\*\s*(.+)')
        $appliesMatch = [regex]::Match($content, '> \*\*Applies To:\*\*\s*(.+)')
        $reviewedMatch = [regex]::Match($content, '> \*\*Last Reviewed:\*\*\s*(\d{4}-\d{2}-\d{2})')
        $frequencyMatch = [regex]::Match($content, '> \*\*Review Frequency:\*\*\s*(.+)')

        if (-not $statusMatch.Success -or $ValidStatuses -notcontains $statusMatch.Groups[1].Value.Trim()) {
            $MetadataIssues.Add("$relativePath: missing or invalid Status.")
        }
        if (-not $ownerMatch.Success -or [string]::IsNullOrWhiteSpace($ownerMatch.Groups[1].Value.Trim())) {
            $MetadataIssues.Add("$relativePath: missing Owner.")
        }
        if (-not $appliesMatch.Success -or [string]::IsNullOrWhiteSpace($appliesMatch.Groups[1].Value.Trim())) {
            $MetadataIssues.Add("$relativePath: missing Applies To.")
        }

        $status = if ($statusMatch.Success) { $statusMatch.Groups[1].Value.Trim() } else { "" }
        if ($status -in @("Approved", "Maintained")) {
            if (-not $reviewedMatch.Success) {
                $MetadataIssues.Add("$relativePath: approved or maintained document is missing Last Reviewed.")
            }
            if (-not $frequencyMatch.Success) {
                $MetadataIssues.Add("$relativePath: approved or maintained document is missing Review Frequency.")
            }
        }

        if ($content -match '> \*\*Authoritative:\*\*\s*Yes' -and $status -in @("Draft", "Archived")) {
            $MetadataIssues.Add("$relativePath: authoritative document cannot be Draft or Archived.")
        }

        if ($reviewedMatch.Success -and $frequencyMatch.Success) {
            $frequency = $frequencyMatch.Groups[1].Value.Trim()
            if ($ReviewFrequencyDays.ContainsKey($frequency)) {
                $lastReviewed = [datetime]::ParseExact(
                    $reviewedMatch.Groups[1].Value,
                    "yyyy-MM-dd",
                    [System.Globalization.CultureInfo]::InvariantCulture
                )
                if ($lastReviewed.AddDays($ReviewFrequencyDays[$frequency]) -lt (Get-Date)) {
                    $ReviewIssues.Add("$relativePath: review is overdue ($frequency; last reviewed $($lastReviewed.ToString('yyyy-MM-dd'))).")
                }
            }
        }

        if ($status -eq "Deprecated" -and
            $content -notmatch '> \*\*Superseded By:\*\*' -and
            $content -notmatch 'no replacement') {
            $MetadataIssues.Add("$relativePath: deprecated document does not identify a replacement or state that none exists.")
        }
    }
}

foreach ($item in $allMarkdown) {
    $relativePath = Get-RelativePath $item.FullName
    if ($relativePath -in @("README.md", "PROJECT_INDEX.md", "CHANGELOG.md", "ARCHITECTURE_DECISIONS.md", "scripts/README.md")) {
        continue
    }
    if ($relativePath -like "archive/*") { continue }
    if (($relativePath -like "docs/Templates/*.md") -and ($relativePath -ne "docs/Templates/README.md")) {
        continue
    }

    if (-not $inboundLinks.ContainsKey($relativePath.ToLowerInvariant())) {
        $OrphanDocuments.Add($relativePath)
    }
}

if ($MarkdownOutsideDocs.Count -gt 0) {
    $Recommendations.Add("Audit Markdown files outside canonical locations.")
}
if ($MissingAIFiles.Count -gt 0) {
    $Recommendations.Add("Complete the modular AI Engineering Handbook under docs/AI/.")
}
if ($MissingGovernanceFiles.Count -gt 0) {
    $Recommendations.Add("Complete the Governance documentation domain.")
}
if ($BrokenLinks.Count -gt 0) {
    $Recommendations.Add("Repair broken relative Markdown links.")
}
if ($OrphanDocuments.Count -gt 0) {
    $Recommendations.Add("Link orphan documents from PROJECT_INDEX.md, a domain README, or a related document.")
}
if ($NavigationIssues.Count -gt 0) {
    $Recommendations.Add("Add required breadcrumb and parent navigation.")
}
if ($MetadataIssues.Count -gt 0) {
    $Recommendations.Add("Correct governance metadata and lifecycle issues.")
}
if ($ReviewIssues.Count -gt 0) {
    $Recommendations.Add("Review overdue governed documents and update Last Reviewed.")
}

$structureScore = 100 - ($MissingDirs.Count * 4) - ($MissingRootFiles.Count * 3)
$aiScore = [math]::Floor((($AIHandbookFiles.Count - $MissingAIFiles.Count) * 100) / $AIHandbookFiles.Count)
$governanceScore = 100 - ($MissingGovernanceFiles.Count * 5) - ($MetadataIssues.Count * 3) - ($ReviewIssues.Count * 2)
$navigationScore = 100 - ($BrokenLinks.Count * 3) - ($OrphanDocuments.Count * 2) - ($NavigationIssues.Count * 2)

foreach ($name in @("structureScore", "governanceScore", "navigationScore")) {
    if ((Get-Variable $name).Value -lt 0) { Set-Variable $name 0 }
    if ((Get-Variable $name).Value -gt 100) { Set-Variable $name 100 }
}

$overallScore = [math]::Floor(($structureScore + $aiScore + $governanceScore + $navigationScore) / 4)
$projectName = Split-Path -Path $ProjectRootFull -Leaf

Write-Host "Engineering Documentation Framework Advisor"
Write-Host "Ruleset: $Stage1RulesetVersion"
Write-Host "==========================================="
Write-Host ""
Write-Host "Project root: $ProjectRootFull"
Write-Host "Project name: $projectName"
if ($IsEDFRepository) {
    Write-Host "Repository mode: EDF framework repository"
} else {
    Write-Host "Repository mode: EDF adopting project"
}
Write-Host "Overall compliance: $overallScore%"
Write-Host "Structure score: $structureScore%"
Write-Host "AI score: $aiScore%"
Write-Host "Navigation score: $navigationScore%"
Write-Host "Governance score: $governanceScore%"
Write-Host ""
Write-Host "This report is read-only."
Write-Host "No files or folders were created, modified, moved, renamed, or deleted."

$sections = @(
    @{Title="Missing required directories"; Items=$MissingDirs},
    @{Title="Missing recommended root files"; Items=$MissingRootFiles},
    @{Title="Missing AI handbook files"; Items=$MissingAIFiles},
    @{Title="Missing Governance files"; Items=$MissingGovernanceFiles},
    @{Title="Broken links"; Items=$BrokenLinks},
    @{Title="Orphan documents"; Items=$OrphanDocuments},
    @{Title="Navigation issues"; Items=$NavigationIssues},
    @{Title="Governance metadata and lifecycle issues"; Items=$MetadataIssues},
    @{Title="Overdue reviews"; Items=$ReviewIssues},
    @{Title="Markdown outside canonical locations"; Items=$MarkdownOutsideDocs},
    @{Title="Warnings"; Items=$Warnings},
    @{Title="Recommendations"; Items=$Recommendations}
)

foreach ($section in $sections) {
    Write-Section $section.Title
    if ($section.Items.Count -eq 0) {
        Write-Host "None."
    } else {
        $section.Items | ForEach-Object { Write-Host "- $_" }
    }
}
Write-Host ""
