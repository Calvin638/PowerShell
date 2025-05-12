# Utilisation CPU
$cpuUsage = (Get-CimInstance Win32_Processor).LoadPercentage
"Utilisation CPU : $cpuUsage %"

# Utilisation RAM
$ram = Get-CimInstance Win32_OperatingSystem
$ramUsage = [math]::Round((($ram.TotalVisibleMemorySize - $ram.FreePhysicalMemory) / $ram.TotalVisibleMemorySize) * 100, 2)
"Utilisation RAM : $ramUsage %"

# Utilisation Disques
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    $diskUsage = [math]::Round((($_.Size - $_.FreeSpace) / $_.Size) * 100, 2)
    "Disque $($_.DeviceID) : $diskUsage % utilisé"
}
