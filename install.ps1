# install.ps1 — install the CC-STARTUP-SKILL skills into %USERPROFILE%\.claude\skills\
# Usage:
#   irm https://raw.githubusercontent.com/OnCeUponTry/CC-STARTUP-SKILL/main/install.ps1 | iex
#
# Or, if you already cloned the repo:
#   .\install.ps1

$ErrorActionPreference = 'Stop'

$Repo = 'OnCeUponTry/CC-STARTUP-SKILL'
$Branch = 'main'
$SkillsDir = Join-Path $env:USERPROFILE '.claude\skills'

# Detect whether we're running from inside the cloned repo or from an iex pipe.
$PluginPath = 'plugins\cc-startup\skills'
$ScriptDir = if ($PSScriptRoot) { $PSScriptRoot } else { $null }
if ($ScriptDir -and (Test-Path (Join-Path $ScriptDir $PluginPath))) {
    $SourceDir = Join-Path $ScriptDir $PluginPath
    $TempRoot = $null
} else {
    $TempRoot = New-Item -ItemType Directory -Path (Join-Path $env:TEMP "cc-startup-$([guid]::NewGuid())")
    Write-Host "-> Downloading $Repo (branch $Branch)..."
    $Tarball = Join-Path $TempRoot.FullName 'repo.tar.gz'
    Invoke-WebRequest -Uri "https://github.com/$Repo/archive/refs/heads/$Branch.tar.gz" -OutFile $Tarball
    tar -xzf $Tarball -C $TempRoot.FullName
    $SourceDir = Join-Path $TempRoot.FullName "CC-STARTUP-SKILL-$Branch\$PluginPath"
}

try {
    if (-not (Test-Path $SourceDir)) {
        throw "Source directory not found: $SourceDir"
    }

    if (-not (Test-Path $SkillsDir)) {
        New-Item -ItemType Directory -Force -Path $SkillsDir | Out-Null
    }

    $Installed = @()
    Get-ChildItem -Directory -Path $SourceDir | ForEach-Object {
        $name = $_.Name
        $dest = Join-Path $SkillsDir $name
        if (Test-Path $dest) {
            Write-Host "-> Updating existing skill: $name"
            Remove-Item -Recurse -Force $dest
        } else {
            Write-Host "-> Installing skill: $name"
        }
        Copy-Item -Recurse -Path $_.FullName -Destination $SkillsDir
        $Installed += $name
    }

    Write-Host ''
    Write-Host "OK Installed $($Installed.Count) skill(s) to $SkillsDir\"
    foreach ($n in $Installed) { Write-Host "   - $n" }
    Write-Host ''
    Write-Host "Verify: open Claude Code and ask 'What skills are available?'"
    Write-Host "Invoke directly with /<skill-name>, e.g.:"
    foreach ($n in $Installed) { Write-Host "   /$n" }
}
finally {
    if ($TempRoot -and (Test-Path $TempRoot.FullName)) {
        Remove-Item -Recurse -Force $TempRoot.FullName
    }
}
