param([string]$GameDir = '')

$ErrorActionPreference = 'Stop'
$originalSha256 = 'EBF7D8BD1175DC6A7C1338057499F9CA589A3CA10E70644DE4A18B4FC15A6BBB'
$localizedSha256 = 'E64861EF43DBEF5E4711B628B55F21DC30736A0308824AE816E2D4754F528514'

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
        if (Test-Path -LiteralPath (Join-Path $candidate 'resources\app.asar') -PathType Leaf) { return $candidate }
    }
    return ''
}

if ([string]::IsNullOrWhiteSpace($GameDir)) {
    $detectedGameDir = Find-SteamGameDir
    if ([string]::IsNullOrWhiteSpace($detectedGameDir)) {
        $GameDir = (Read-Host 'Не удалось найти игру автоматически. Введите полный путь к папке игры').Trim().Trim('"')
    } else {
        $enteredDir = Read-Host "Найдена игра: $detectedGameDir`nНажмите Enter для установки или введите другой путь"
        $GameDir = if ([string]::IsNullOrWhiteSpace($enteredDir)) { $detectedGameDir } else { $enteredDir.Trim().Trim('"') }
    }
}
if ([string]::IsNullOrWhiteSpace($GameDir)) { throw 'Путь к игре не указан.' }

$GameDir = [IO.Path]::GetFullPath($GameDir)
$resourcesDir = Join-Path $GameDir 'resources'
$target = Join-Path $resourcesDir 'app.asar'
$originalBackup = Join-Path $resourcesDir 'app.asar.original'
$patchDir = Join-Path $PSScriptRoot 'patch_files'
$runner = Join-Path $PSScriptRoot 'apply_patch.js'
$electronExe = Join-Path $GameDir 'watashiwo_sotoni_turetette.exe'

if (-not (Test-Path -LiteralPath $target -PathType Leaf)) { throw "Не найден файл игры: $target" }
if (-not (Test-Path -LiteralPath $patchDir -PathType Container)) { throw "Не найдены файлы русификатора: $patchDir" }
if (-not (Test-Path -LiteralPath $runner -PathType Leaf)) { throw "Не найден сборщик: $runner" }
if (-not (Test-Path -LiteralPath $electronExe -PathType Leaf)) { throw "Не найден исполняемый файл игры: $electronExe" }

$running = Get-CimInstance Win32_Process | Where-Object {
    $_.ExecutablePath -and $_.ExecutablePath.StartsWith($GameDir, [StringComparison]::OrdinalIgnoreCase)
}
if ($running) { throw 'Игра запущена. Полностью закройте её и повторите установку.' }

$cleanSource = $null
foreach ($candidate in @($originalBackup, $target)) {
    if (Test-Path -LiteralPath $candidate -PathType Leaf) {
        if ((Get-FileHash -LiteralPath $candidate -Algorithm SHA256).Hash -eq $originalSha256) {
            $cleanSource = $candidate
            break
        }
    }
}
if (-not $cleanSource) {
    $cleanSource = Get-ChildItem -LiteralPath $resourcesDir -File |
        Where-Object { $_.Name -like 'app.asar.backup-*' } |
        Where-Object { (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash -eq $originalSha256 } |
        Select-Object -First 1 -ExpandProperty FullName
}
if (-not $cleanSource) {
    throw 'Не найдена чистая оригинальная app.asar. В Steam выполните «Проверить целостность файлов», затем повторите установку.'
}
if (-not (Test-Path -LiteralPath $originalBackup -PathType Leaf)) {
    Copy-Item -LiteralPath $cleanSource -Destination $originalBackup
}

$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$sessionBackup = "$target.backup-$stamp"
Copy-Item -LiteralPath $target -Destination $sessionBackup

$tempRoot = Join-Path $resourcesDir ('.localization-build-' + [guid]::NewGuid().ToString('N'))
$resolvedResources = [IO.Path]::GetFullPath($resourcesDir).TrimEnd('\') + '\'
$resolvedTemp = [IO.Path]::GetFullPath($tempRoot)
if (-not $resolvedTemp.StartsWith($resolvedResources, [StringComparison]::OrdinalIgnoreCase)) {
    throw 'Некорректный путь временной папки.'
}

try {
    $workDir = Join-Path $tempRoot 'app'
    $newAsar = Join-Path $tempRoot 'app.localized.asar'
    New-Item -ItemType Directory -Path $tempRoot | Out-Null
    $startInfo = [Diagnostics.ProcessStartInfo]::new()
    $startInfo.FileName = $electronExe
    $startInfo.UseShellExecute = $false
    $startInfo.CreateNoWindow = $true
    $startInfo.Environment['ELECTRON_RUN_AS_NODE'] = '1'
    foreach ($argument in @($runner, $cleanSource, $patchDir, $newAsar, $workDir, $target)) {
        [void]$startInfo.ArgumentList.Add($argument)
    }
    $builder = [Diagnostics.Process]::Start($startInfo)
    $builder.WaitForExit()
    if ($builder.ExitCode -ne 0) { throw "Сборщик завершился с кодом $($builder.ExitCode)." }
    if (-not (Test-Path -LiteralPath $newAsar -PathType Leaf)) { throw 'Локализованный архив не был создан.' }
    if ((Get-FileHash -LiteralPath $newAsar -Algorithm SHA256).Hash -ne $localizedSha256) {
        throw 'Проверка собранного русификатора не пройдена. Возможно, версия игры несовместима.'
    }
    Copy-Item -LiteralPath $newAsar -Destination $target -Force
} finally {
    if (Test-Path -LiteralPath $tempRoot) { Remove-Item -LiteralPath $tempRoot -Recurse -Force }
}

if ((Get-FileHash -LiteralPath $target -Algorithm SHA256).Hash -ne $localizedSha256) { throw 'Проверка установленного файла не пройдена.' }
Write-Host 'Русификатор установлен и проверен.' -ForegroundColor Green
Write-Host "Папка игры: $GameDir"
Write-Host "Постоянная копия оригинала: $originalBackup"
Write-Host "Копия предыдущей версии: $sessionBackup"
