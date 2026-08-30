param([string]$GameDir = '')

$ErrorActionPreference = 'Stop'
$originalSha256 = 'EBF7D8BD1175DC6A7C1338057499F9CA589A3CA10E70644DE4A18B4FC15A6BBB'

function Find-SteamGameDir {
    $steamRoots = @(
        (Get-ItemPropertyValue -Path 'HKCU:\Software\Valve\Steam' -Name SteamPath -ErrorAction SilentlyContinue),
        (Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\WOW6432Node\Valve\Steam' -Name InstallPath -ErrorAction SilentlyContinue),
        "${env:ProgramFiles(x86)}\Steam",
        "$env:ProgramFiles\Steam"
    ) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | Select-Object -Unique

    $libraries = [Collections.Generic.List[string]]::new()
    foreach ($steamRoot in $steamRoots) {
        $libraries.Add([IO.Path]::GetFullPath($steamRoot))
        $vdf = Join-Path $steamRoot 'steamapps\libraryfolders.vdf'
        if (Test-Path -LiteralPath $vdf -PathType Leaf) {
            $vdfText = Get-Content -LiteralPath $vdf -Raw
            foreach ($match in [regex]::Matches($vdfText, '"path"\s+"([^"]+)"')) {
                $libraries.Add($match.Groups[1].Value.Replace('\\', '\'))
            }
        }
    }

    foreach ($library in ($libraries | Select-Object -Unique)) {
        $candidate = Join-Path $library 'steamapps\common\わたしをそとにつれてって'
        if (Test-Path -LiteralPath (Join-Path $candidate 'resources\app.asar') -PathType Leaf) {
            return $candidate
        }
    }
    return ''
}

if ([string]::IsNullOrWhiteSpace($GameDir)) {
    $detectedGameDir = Find-SteamGameDir
    if ([string]::IsNullOrWhiteSpace($detectedGameDir)) {
        $GameDir = (Read-Host 'The game was not found automatically. Enter the full path to the game folder').Trim().Trim('"')
    } else {
        $enteredDir = Read-Host "Game found: $detectedGameDir`nPress Enter to restore or enter another path"
        $GameDir = if ([string]::IsNullOrWhiteSpace($enteredDir)) { $detectedGameDir } else { $enteredDir.Trim().Trim('"') }
    }
}

if ([string]::IsNullOrWhiteSpace($GameDir)) { throw 'No game-folder path was provided.' }

$GameDir = [IO.Path]::GetFullPath($GameDir)
$target = Join-Path $GameDir 'resources\app.asar'
$originalBackup = Join-Path $GameDir 'resources\app.asar.original'
if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { throw "Game file not found: $target" }
if (-not (Test-Path -LiteralPath $originalBackup -PathType Leaf)) { throw "Original backup not found: $originalBackup" }
if ((Get-FileHash -LiteralPath $originalBackup -Algorithm SHA256).Hash -ne $originalSha256) { throw 'Original-backup checksum mismatch.' }

$backup = "$target.backup-before-restore-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
Copy-Item -LiteralPath $target -Destination $backup
Copy-Item -LiteralPath $originalBackup -Destination $target -Force
if ((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash -ne $originalSha256) { throw 'Restored-file verification failed.' }
Write-Host 'Original Japanese version restored.' -ForegroundColor Green
Write-Host "Backup of replaced version: $backup"
