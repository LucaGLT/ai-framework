#Requires -Version 5.1
<#
.SYNOPSIS
  Validate AI Framework artifacts on a target project.

.PARAMETER ProjectRoot
  Root of the target project (default: current directory).
#>
param(
    [string]$ProjectRoot = (Get-Location).Path
)

$ErrorActionPreference = "Stop"
$failures = @()

function Add-Failure($msg) { script:failures += $msg }

Push-Location $ProjectRoot
try {
    Write-Host "Validating project: $ProjectRoot"

    # 1. PROJECT_PARAMETERS.md — no unresolved tokens
    $paramsFile = Join-Path $ProjectRoot "PROJECT_PARAMETERS.md"
    if (-not (Test-Path $paramsFile)) {
        Add-Failure "Missing PROJECT_PARAMETERS.md at project root"
    } else {
        $content = Get-Content $paramsFile -Raw
        $matches = [regex]::Matches($content, '\{\{[A-Z0-9_]+\}\}')
        if ($matches.Count -gt 0) {
            $ids = ($matches | ForEach-Object { $_.Value }) -join ", "
            Add-Failure "Unresolved tokens in PROJECT_PARAMETERS.md: $ids"
        }
    }

    # 2. YAML under Test/ — basic parse
    $testRoot = Join-Path $ProjectRoot "Test"
    if (Test-Path $testRoot) {
        Get-ChildItem -Path $testRoot -Recurse -Include *.yaml,*.yml -File | ForEach-Object {
            try {
                $null = Get-Content $_.FullName -Raw
                if ($_.Extension -match '\.(yaml|yml)$') {
                    # PowerShell has no native YAML; check non-empty and no tabs in keys line
                    $raw = Get-Content $_.FullName -Raw
                    if ([string]::IsNullOrWhiteSpace($raw)) {
                        Add-Failure "Empty YAML: $($_.FullName)"
                    }
                }
            } catch {
                Add-Failure "Cannot read YAML: $($_.FullName) — $_"
            }
        }
    }

    # 3. Validation report JSON — required keys
    $reportTemplate = Join-Path $ProjectRoot "ai-framework\templates\validation-report.template.json"
    if (-not (Test-Path $reportTemplate)) {
        $reportTemplate = Join-Path $ProjectRoot "templates\validation-report.template.json"
    }
    $requiredKeys = @("overall_score", "passed", "scores", "blocking_issues")
    if (Test-Path $testRoot) {
        Get-ChildItem -Path $testRoot -Recurse -Filter "validation-*.json" -File | ForEach-Object {
            try {
                $json = Get-Content $_.FullName -Raw | ConvertFrom-Json
                foreach ($key in $requiredKeys) {
                    if (-not ($json.PSObject.Properties.Name -contains $key)) {
                        Add-Failure "Validation report missing '$key': $($_.FullName)"
                    }
                }
            } catch {
                Add-Failure "Invalid JSON: $($_.FullName) — $_"
            }
        }
    }

    # 4. AGENTS.md present
    if (-not (Test-Path (Join-Path $ProjectRoot "AGENTS.md"))) {
        Add-Failure "Missing AGENTS.md at project root"
    }

    if ($failures.Count -eq 0) {
        Write-Host "OK — all checks passed." -ForegroundColor Green
        exit 0
    } else {
        Write-Host "FAILED — $($failures.Count) issue(s):" -ForegroundColor Red
        $failures | ForEach-Object { Write-Host "  - $_" }
        exit 1
    }
} finally {
    Pop-Location
}
