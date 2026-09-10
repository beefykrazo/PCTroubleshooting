# Collect-System-Baseline.ps1
# Safe baseline information collection.
# Run PowerShell as Administrator.

$stamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$base = "$env:USERPROFILE\Desktop\PC-Diagnostics"
$out = "$base\Baseline\Baseline-$stamp"

New-Item -ItemType Directory -Path $out -Force | Out-Null
New-Item -ItemType Directory -Path "$base\Incidents" -Force | Out-Null
New-Item -ItemType Directory -Path "$base\HWiNFO" -Force | Out-Null
New-Item -ItemType Directory -Path "$base\Screenshots" -Force | Out-Null

# Windows/system details
Get-ComputerInfo |
    Out-File "$out\ComputerInfo.txt" -Width 300

Get-CimInstance Win32_BIOS |
    Format-List * |
    Out-File "$out\BIOS.txt" -Width 300

Get-CimInstance Win32_Processor |
    Format-List Name, Manufacturer, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed |
    Out-File "$out\CPU.txt" -Width 300

Get-CimInstance Win32_PhysicalMemory |
    Format-Table Manufacturer, PartNumber, Capacity, Speed, ConfiguredClockSpeed, DeviceLocator -AutoSize |
    Out-File "$out\Memory.txt" -Width 300

Get-CimInstance Win32_VideoController |
    Format-List Name, DriverVersion, AdapterRAM, VideoProcessor |
    Out-File "$out\GPU.txt" -Width 300

Get-PhysicalDisk -ErrorAction SilentlyContinue |
    Format-Table FriendlyName, MediaType, HealthStatus, OperationalStatus, Size -AutoSize |
    Out-File "$out\PhysicalDisks.txt" -Width 300

# Power plan
powercfg /getactivescheme |
    Out-File "$out\Active-Power-Scheme.txt"

# Drivers
driverquery /v /fo csv |
    Out-File "$out\DriverQuery.csv" -Encoding utf8

# Native event logs
wevtutil epl System "$out\System-Baseline.evtx"
wevtutil epl Application "$out\Application-Baseline.evtx"

# Recent reliability records
Get-CimInstance Win32_ReliabilityRecords -ErrorAction SilentlyContinue |
    Sort-Object TimeGenerated |
    Select-Object -Last 250 |
    Format-List TimeGenerated, SourceName, ProductName, EventIdentifier, Message |
    Out-File "$out\Reliability-Recent.txt" -Width 300

# System Information and DxDiag
Start-Process msinfo32.exe `
    -ArgumentList "/nfo `"$out\MSInfo32.nfo`"" `
    -Wait

Start-Process dxdiag.exe `
    -ArgumentList "/t `"$out\DxDiag.txt`"" `
    -Wait

$zip = "$base\Baseline\Baseline-$stamp.zip"
Compress-Archive -Path "$out\*" -DestinationPath $zip -Force

Write-Host ""
Write-Host "Baseline collection finished."
Write-Host $zip
