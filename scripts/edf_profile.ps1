# EDF profile resolution helper for PowerShell adoption scripts.

function Get-EdfCoreDirs {
    return @(
        "docs",
        "docs/Architecture",
        "docs/Architecture/ADRs",
        "docs/Architecture/Watch_Items",
        "docs/AI",
        "docs/Development",
        "docs/Governance",
        "docs/Specifications",
        "docs/Program",
        "docs/Program/Gate_Reviews",
        "docs/User_Guides",
        "docs/Reference",
        "docs/Templates",
        "tasks",
        "archive",
        "scripts"
    )
}

function Get-EdfSoftwareProfileDirs {
    return @(
        "docs/Developer_Handbook",
        "docs/API",
        "docs/Database",
        "docs/Deployment"
    )
}

function Read-EdfProfileFromYaml {
    param([string] $ProjectRoot)

    $configFile = Join-Path -Path $ProjectRoot -ChildPath "edf-adoption.yaml"
    if (-not (Test-Path -LiteralPath $configFile -PathType Leaf)) {
        return $null
    }

    $line = Get-Content -LiteralPath $configFile | Where-Object { $_ -match '^\s*profile:\s*' } | Select-Object -First 1
    if (-not $line) {
        return $null
    }

    return ($line -replace '^\s*profile:\s*', '' -replace '\s+#.*$', '').Trim().Trim('"').Trim("'")
}

function Read-EdfLegacyProfileFromContext {
    param([string] $ProjectRoot)

    $contextFile = Join-Path -Path $ProjectRoot -ChildPath "edf-project-context.yaml"
    if (-not (Test-Path -LiteralPath $contextFile -PathType Leaf)) {
        return $null
    }

    $line = Get-Content -LiteralPath $contextFile | Where-Object { $_ -match '^\s*legacy_profile:\s*' } | Select-Object -First 1
    if (-not $line) {
        return $null
    }

    return ($line -replace '^\s*legacy_profile:\s*', '' -replace '\s+#.*$', '').Trim().Trim('"').Trim("'")
}

function Initialize-EdfCapabilitiesRoot {
    param([string] $ScriptDir)

    $capabilitiesRoot = Join-Path -Path $ScriptDir -ChildPath "..\capabilities"
    if (Test-Path -LiteralPath $capabilitiesRoot -PathType Container) {
        $script:EdfCapabilitiesRoot = (Resolve-Path -LiteralPath $capabilitiesRoot).Path
    }
    else {
        $script:EdfCapabilitiesRoot = $null
    }
}

function Resolve-EdfProfile {
    param(
        [string] $ProjectRoot,
        [string] $CliProfile = ""
    )

    $profile = $CliProfile
    if ([string]::IsNullOrWhiteSpace($profile)) {
        $contextProfile = Read-EdfLegacyProfileFromContext -ProjectRoot $ProjectRoot
        $yamlProfile = Read-EdfProfileFromYaml -ProjectRoot $ProjectRoot
        if ($contextProfile) {
            $profile = $contextProfile
        }
        elseif ($yamlProfile) {
            $profile = $yamlProfile
        }
        else {
            $profile = "core"
        }
    }

    switch ($profile) {
        "core" {
            $script:EdfProfile = "core"
            $script:EdfRequiredDirs = @(Get-EdfCoreDirs)
        }
        { $_ -in @("software-engineering", "software") } {
            $script:EdfProfile = "software-engineering"
            $script:EdfRequiredDirs = @(Get-EdfCoreDirs) + @(Get-EdfSoftwareProfileDirs)
        }
        default {
            throw "Unsupported profile '$profile'. Use 'core' or 'software-engineering'."
        }
    }
}
