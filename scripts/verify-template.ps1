$ErrorActionPreference = "Stop"

$repoRoot = Split-Path -Parent $PSScriptRoot
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure {
  param([string]$Message)
  $failures.Add($Message) | Out-Null
}

function Test-PathRequired {
  param([string]$Path)
  $fullPath = Join-Path $repoRoot $Path
  if (-not (Test-Path -LiteralPath $fullPath)) {
    Add-Failure "Missing required path: $Path"
  }
}

$requiredPaths = @(
  "AGENTS.md",
  "SECURITY.md",
  "README.md",
  ".env.example",
  "frontend/.env.example",
  "backend/.env.example",
  "docker-compose.yml",
  "docker-compose.dev.yml",
  "docs/adr/0001-record-architecture-decisions.md",
  "docs/adr/0002-verification-command-contract.md",
  "docs/api/openapi.yml",
  "docs/guides/getting-started.md",
  "docs/guides/agentic-development.md"
)

foreach ($path in $requiredPaths) {
  Test-PathRequired $path
}

$forbiddenPatterns = @(
  "agent-runtime",
  "orchestrator",
  "specialist",
  "qa-agent",
  "validate-agent-runtime",
  "project-skeleton"
)

$scanRoots = @(
  "AGENTS.md",
  "README.md",
  "CLAUDE.md",
  "GEMINI.md",
  ".github",
  "docs",
  "docker-compose.yml",
  "docker-compose.dev.yml",
  ".env.example",
  "frontend",
  "backend"
)

$filesToScan = foreach ($root in $scanRoots) {
  $fullRoot = Join-Path $repoRoot $root
  if (-not (Test-Path -LiteralPath $fullRoot)) {
    continue
  }

  if ((Get-Item -LiteralPath $fullRoot).PSIsContainer) {
    Get-ChildItem -LiteralPath $fullRoot -Recurse -File
  } else {
    Get-Item -LiteralPath $fullRoot
  }
}

foreach ($pattern in $forbiddenPatterns) {
  $matches = $filesToScan | Select-String -Pattern $pattern -SimpleMatch
  foreach ($match in $matches) {
    Add-Failure "Forbidden template residue '$pattern' in $($match.Path):$($match.LineNumber)"
  }
}

$gitignore = Get-Content -LiteralPath (Join-Path $repoRoot ".gitignore") -Raw
foreach ($requiredEntry in @(".env", ".env.*", "!.env.example", "!.env.*.example")) {
  if ($gitignore -notmatch [regex]::Escape($requiredEntry)) {
    Add-Failure "Missing .gitignore environment rule: $requiredEntry"
  }
}

if (Get-Command docker -ErrorAction SilentlyContinue) {
  Push-Location $repoRoot
  $previousErrorActionPreference = $ErrorActionPreference
  $ErrorActionPreference = "Continue"
  try {
    $devOutput = docker compose -f docker-compose.dev.yml config 2>&1
    if ($LASTEXITCODE -ne 0) {
      Add-Failure "Docker Compose dev config validation failed: $devOutput"
    }

    $prodOutput = docker compose -f docker-compose.yml config 2>&1
    if ($LASTEXITCODE -ne 0) {
      Add-Failure "Docker Compose production config validation failed: $prodOutput"
    }
  } catch {
    Add-Failure "Docker Compose config validation failed: $($_.Exception.Message)"
  } finally {
    $ErrorActionPreference = $previousErrorActionPreference
    Pop-Location
  }
} else {
  Write-Host "Docker not found; skipping Compose validation."
}

if ($failures.Count -gt 0) {
  Write-Host "Template verification failed:"
  foreach ($failure in $failures) {
    Write-Host "- $failure"
  }
  exit 1
}

Write-Host "Template verification passed."
