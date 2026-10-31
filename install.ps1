$ErrorActionPreference = "Stop"
$Repo = "https://github.com/yassine-aitmohamed/VanoNote"
$Dir = if ($env:VANONOTE_DIR) { $env:VANONOTE_DIR } else { Join-Path $HOME "VanoNote" }

function Find-Python {
  foreach ($c in @("py", "python", "python3")) {
    $cmd = Get-Command $c -ErrorAction SilentlyContinue
    if ($cmd) {
      $a = if ($c -eq "py") { @("-3", "--version") } else { @("--version") }
      try { & $c @a *> $null; if ($LASTEXITCODE -eq 0) { return $c } } catch {}
    }
  }
  return $null
}

$Py = Find-Python
if (-not $Py) {
  Write-Host "Installing Python 3 with winget ..."
  winget install -e --id Python.Python.3.12 --accept-package-agreements --accept-source-agreements
  $env:Path = [Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [Environment]::GetEnvironmentVariable("Path", "User")
  $Py = Find-Python
  if (-not $Py) { Write-Host "Please install Python 3 from https://www.python.org/downloads/ and run this command again."; exit 1 }
}
$PyArgs = if ($Py -eq "py") { @("-3") } else { @() }

$Local = $PSScriptRoot -and (Test-Path (Join-Path $PSScriptRoot "vanonote.py"))
if (-not $Local) {
  Write-Host "Downloading VanoNote to $Dir ..."
  $Tmp = Join-Path $env:TEMP ("vanonote_" + [guid]::NewGuid())
  New-Item -ItemType Directory -Path $Tmp | Out-Null
  Invoke-WebRequest "$Repo/archive/refs/heads/main.zip" -OutFile "$Tmp\vanonote.zip"
  Expand-Archive "$Tmp\vanonote.zip" -DestinationPath $Tmp
  New-Item -ItemType Directory -Force -Path $Dir | Out-Null
  Copy-Item -Recurse -Force "$Tmp\VanoNote-main\*" $Dir
  Remove-Item -Recurse -Force $Tmp
} else {
  $Dir = $PSScriptRoot
}

Write-Host "Setting up VanoNote ..."
& $Py @PyArgs -m venv "$Dir\.venv"
& "$Dir\.venv\Scripts\python.exe" -m pip install -q --upgrade pip
try { & "$Dir\.venv\Scripts\python.exe" -m pip install -q -r "$Dir\requirements.txt" } catch { Write-Host "PyMuPDF was not installed: PDF import will be limited. Run install.bat again later." }

$Desktop = [Environment]::GetFolderPath("Desktop")
$Shell = New-Object -ComObject WScript.Shell
$Link = $Shell.CreateShortcut((Join-Path $Desktop "VanoNote.lnk"))
$Link.TargetPath = Join-Path $Dir "start.bat"
$Link.WorkingDirectory = $Dir
$Link.Save()
Write-Host "Shortcut created on the Desktop: VanoNote"
if (-not (Get-Command soffice -ErrorAction SilentlyContinue)) { Write-Host "Tip: install LibreOffice to import Word and PowerPoint files." }
Write-Host "VanoNote is installed in $Dir. Starting ..."
Start-Process -FilePath (Join-Path $Dir "start.bat") -WorkingDirectory $Dir
