# EDF profile resolution helper for PowerShell adoption scripts.

function Get-EdfCoreDirs {
    return @(
        "docs",
        "docs/Architecture",
        "docs/Architecture/ADRs",
        "docs/AI",
        "docs/Development",
        "docs/Governance",
        "docs/Specifications",
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

function Resolve-EdfProfile {
    param(
        [string] $ProjectRoot,
        [string] $CliProfile = ""
    )

    $profile = $CliProfile
    if ([string]::IsNullOrWhiteSpace($profile)) {
        $yamlProfile = Read-EdfProfileFromYaml -ProjectRoot $ProjectRoot
        if ($yamlProfile) {
            $profile = $yamlProfile
        }
        else {
            $profile = "software-engineering"
        }
    }

    switch ($profile) {
        "core" {
            $script:EdfProfile = "core"
            $script:EdfRequiredDirs = Get-EdfCoreDirs
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
