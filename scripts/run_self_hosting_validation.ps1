<#
Runs the EDF Framework Advisor against the EDF repository itself.

The script writes only a timestamped report under reports/self-hosting/.
#>

[CmdletBinding()]
param()

$ErrorActionPreference = "Stop"

$ScriptDirectory = Split-Path -Parent $MyInvocation.MyCommand.Path
$ProjectRoot = (Resolve-Path (Join-Path $ScriptDirectory "..")).Path
$Analyzer = Join-Path $ScriptDirectory "analyze_project_structure.ps1"
$ReportDirectory = Join-Path $ProjectRoot "reports/self-hosting"

if (-not (Test-Path -LiteralPath $Analyzer -PathType Leaf)) {
    throw "Framework Advisor not found: $Analyzer"
}

New-Item -ItemType Directory -Path $ReportDirectory -Force | Out-Null

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$ReportPath = Join-Path $ReportDirectory "framework-advisor-$Timestamp.txt"

& $Analyzer -ProjectRoot $ProjectRoot 2>&1 |
    Tee-Object -FilePath $ReportPath

if ($LASTEXITCODE -ne 0) {
    throw "Framework Advisor failed. Review: $ReportPath"
}

Write-Host ""
Write-Host "Self-hosting report written to:"
Write-Host $ReportPath
