<#
Runs Framework Advisor conformance analysis against an adopting project and
writes a timestamped report under <project-root>/reports/conformance/.

Usage:
  .\scripts\run_conformance_validation.ps1 -ProjectRoot "D:\Projects\Adopting Project"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory = $true, Position = 0)]
    [string] $ProjectRoot
)

$ErrorActionPreference = "Stop"

$ScriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$Analyzer = Join-Path $ScriptDirectory "analyze_project_structure.ps1"

function Get-ScoreFromReport {
    param(
        [string] $Label,
        [string] $ReportPath
    )

    $pattern = "^${Label}: (\d+%)$"
    $match = Select-String -Path $ReportPath -Pattern $pattern |
        Select-Object -Last 1

    if ($match) {
        return $match.Matches.Groups[1].Value
    }

    return "Not reported"
}

function Get-RecommendationsFromReport {
    param(
        [string] $ReportPath
    )

    $lines = Get-Content -LiteralPath $ReportPath
    $inRecommendations = $false
    $found = $false
    $recommendations = New-Object System.Collections.Generic.List[string]

    foreach ($line in $lines) {
        if ($line -eq "Recommendations") {
            $inRecommendations = $true
            continue
        }

        if ($inRecommendations -and $line -match '^- ') {
            $recommendations.Add($line)
            $found = $true
            continue
        }

        if ($inRecommendations -and $found -and $line -notmatch '^- ') {
            break
        }
    }

    if ($recommendations.Count -gt 0) {
        return $recommendations
    }

    return @("- No recommendations reported.")
}

function Write-ConformanceSummary {
    param(
        [string] $ReportPath,
        [string] $TargetRoot
    )

    $relativeReport = $ReportPath
    if ($ReportPath.StartsWith($TargetRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
        $relativeReport = $ReportPath.Substring($TargetRoot.Length).TrimStart(
            [System.IO.Path]::DirectorySeparatorChar,
            [System.IO.Path]::AltDirectorySeparatorChar
        )
    }

    $overall = Get-ScoreFromReport -Label "Overall compliance" -ReportPath $ReportPath
    $structure = Get-ScoreFromReport -Label "Structure score" -ReportPath $ReportPath
    $ai = Get-ScoreFromReport -Label "AI score" -ReportPath $ReportPath
    $navigation = Get-ScoreFromReport -Label "Navigation score" -ReportPath $ReportPath
    $governance = Get-ScoreFromReport -Label "Governance score" -ReportPath $ReportPath
    $recommendations = Get-RecommendationsFromReport -ReportPath $ReportPath

    $summary = @(
        "",
        "============================================================",
        "Conformance validation completed successfully.",
        "",
        "Report:",
        $relativeReport,
        "",
        "Compliance scores:",
        "- Overall: $overall",
        "- Structure: $structure",
        "- AI: $ai",
        "- Navigation: $navigation",
        "- Governance: $governance",
        "",
        "Next recommended actions:"
    ) + $recommendations + @(
        "============================================================"
    )

    return ($summary -join [Environment]::NewLine)
}

if (-not (Test-Path -LiteralPath $ProjectRoot -PathType Container)) {
    throw "Project root does not exist or is not a directory: $ProjectRoot"
}

if (-not (Test-Path -LiteralPath $Analyzer -PathType Leaf)) {
    throw "Framework Advisor not found: $Analyzer"
}

$TargetRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path.TrimEnd(
    [System.IO.Path]::DirectorySeparatorChar,
    [System.IO.Path]::AltDirectorySeparatorChar
)

$ReportDirectory = Join-Path $TargetRoot "reports/conformance"
New-Item -ItemType Directory -Path $ReportDirectory -Force | Out-Null

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$ReportPath = Join-Path $ReportDirectory "framework-advisor-$Timestamp.txt"

$header = @(
    "Engineering Documentation Framework Adoption Conformance Validation",
    "===================================================================",
    "",
    "Project root: $TargetRoot",
    "Started: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')",
    "",
    "Framework Advisor conformance analysis",
    "--------------------------------------"
)

$header | Tee-Object -FilePath $ReportPath

& $Analyzer -ProjectRoot $TargetRoot 2>&1 |
    Tee-Object -FilePath $ReportPath -Append

if ($LASTEXITCODE -ne 0) {
    $failure = @(
        "",
        "Conformance validation failed.",
        "Review the captured report:",
        $ReportPath
    ) -join [Environment]::NewLine

    Add-Content -LiteralPath $ReportPath -Value $failure
    throw $failure
}

$footer = @(
    "",
    "Validation completed: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss zzz')"
) -join [Environment]::NewLine

$footer | Tee-Object -FilePath $ReportPath -Append

$summary = Write-ConformanceSummary -ReportPath $ReportPath -TargetRoot $TargetRoot
$summary | Tee-Object -FilePath $ReportPath -Append
