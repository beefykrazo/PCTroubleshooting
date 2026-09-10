# Collect-BlackScreen-Diagnostics.ps1
# Run AFTER rebooting from a black-screen/freeze incident.
# Run PowerShell as Administrator.

$stamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$base = "$env:USERPROFILE\Desktop\PC-Diagnostics"
$out = "$base\Incidents\BlackScreen-$stamp"

New-Item -ItemType Directory -Path $out -Force | Out-Null

$start = (Get-Date).AddHours(-12)

# Native Windows event logs
wevtutil epl System "$out\System.evtx"
wevtutil epl Application "$out\Application.evtx"

# Human-readable System events from the previous 12 hours
Get-WinEvent -FilterHashtable @{
    LogName   = 'System'
    StartTime = $start
} -ErrorAction SilentlyContinue |
    Sort-Object TimeCreated |
    Format-List TimeCreated, Id, LevelDisplayName, ProviderName, Message |
    Out-File "$out\System-Last12Hours.txt" -Width 300

# Providers especially interesting for black-screen / hardware failures
Get-WinEvent -FilterHashtable @{
    LogName   = 'System'
    StartTime = $start
} -ErrorAction SilentlyContinue |
    Where-Object {
        $_.ProviderName -match 'WHEA|nvlddmkm|Display|Kernel-Power|BugCheck|WER-SystemErrorReporting|stornvme|disk'
    } |
    Sort-Object TimeCreated |
    Format-List TimeCreated, Id, LevelDisplayName, ProviderName, Message |
    Out-File "$out\Interesting-System-Events.txt" -Width 300

# Reliability Monitor records
Get-CimInstance Win32_ReliabilityRecords -ErrorAction SilentlyContinue |
    Where-Object { $_.TimeGenerated -ge $start } |
    Sort-Object TimeGenerated |
    Format-List TimeGenerated, SourceName, ProductName, EventIdentifier, Message |
    Out-File "$out\Reliability-Last12Hours.txt" -Width 300

# System information
Start-Process msinfo32.exe `
    -ArgumentList "/nfo `"$out\MSInfo32.nfo`"" `
    -Wait

# DirectX / GPU information
Start-Process dxdiag.exe `
    -ArgumentList "/t `"$out\DxDiag.txt`"" `
    -Wait

# Minidumps
if (Test-Path "C:\Windows\Minidump") {
    Copy-Item "C:\Windows\Minidump" `
        "$out\Minidump" `
        -Recurse -Force `
        -ErrorAction SilentlyContinue
}

# Live kernel reports
if (Test-Path "C:\Windows\LiveKernelReports") {
    Copy-Item "C:\Windows\LiveKernelReports" `
        "$out\LiveKernelReports" `
        -Recurse -Force `
        -ErrorAction SilentlyContinue
}

# Record full dump metadata without copying a potentially multi-GB file
if (Test-Path "C:\Windows\MEMORY.DMP") {
    Get-Item "C:\Windows\MEMORY.DMP" |
        Format-List FullName, Length, CreationTime, LastWriteTime |
        Out-File "$out\MEMORY-DMP-Info.txt"
}

# Basic power / driver context
powercfg /getactivescheme | Out-File "$out\Active-Power-Scheme.txt"
driverquery /v /fo csv | Out-File "$out\DriverQuery.csv" -Encoding utf8

# Zip incident package
$zip = "$base\Incidents\BlackScreen-$stamp.zip"
Compress-Archive `
    -Path "$out\*" `
    -DestinationPath $zip `
    -Force

Write-Host ""
Write-Host "Finished."
Write-Host "Diagnostic package:"
Write-Host $zip
Write-Host ""
Write-Host "Send the ZIP together with the incident journal notes and the HWiNFO CSV if one was running."
