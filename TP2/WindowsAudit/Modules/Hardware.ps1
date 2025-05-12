# Nom du PC
"Nom du PC : $env:COMPUTERNAME"

# Fabricant et modèle
$cs = Get-CimInstance Win32_ComputerSystem
"Fabricant : $($cs.Manufacturer)"
"Modèle : $($cs.Model)"

# RAM en Go
"RAM installée : {0} Go" -f ([math]::Round($cs.TotalPhysicalMemory / 1GB))

# Type de RAM
$ram = Get-CimInstance Win32_PhysicalMemory | Select-Object -First 1
switch ($ram.SMBIOSMemoryType) {
    26 { "Type de RAM : DDR4" }
}

# Processeur
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
"Processeur : $($cpu.Name)"

# Disques
Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3" | ForEach-Object {
    "Disque $($_.DeviceID) - Total: {0} Go | Libre: {1} Go" -f ([math]::Round($_.Size / 1GB)), ([math]::Round($_.FreeSpace / 1GB))
}
