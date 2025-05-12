#Devices.ps1
# Liste des imprimantes installées
"Imprimantes Installées :"
Get-WmiObject -Class Win32_Printer | Select-Object Name, DeviceID | Format-Table -AutoSize

# Liste des périphériques USB actuellement connectés
"Périphériques USB Connectés :"
Get-WmiObject -Query "SELECT * FROM Win32_USBHub" | Select-Object DeviceID, PNPDeviceID, Description | Format-Table -AutoSize

#Event.ps1
# Afficher les 20 dernières erreurs dans le journal d'événements système
Get-WinEvent -LogName System -ErrorAction SilentlyContinue | Where-Object { $_.Level -eq 2 } | Select-Object -First 20 TimeCreated, Message | Format-Table -AutoSize

#Hardware.ps1
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


#Network.ps1
# Adresse IP, passerelle, DNS
$network = Get-NetIPAddress -AddressFamily IPv4 | Select-Object -First 1
"Adresse IP : $($network.IPAddress)"
$gateway = Get-NetRoute -DestinationPrefix 0.0.0.0/0 | Select-Object -First 1
"Passerelle : $($gateway.NextHop)"
$dnsList = Get-DnsClientServerAddress | Where-Object { $_.ServerAddresses -match '\d{1,3}(\.\d{1,3}){3}' } | Select-Object -ExpandProperty ServerAddresses
"Serveur DNS (IPv4) : $($dnsList -join ', ')"


# Nom d'hôte
"Nom d'hôte : $env:COMPUTERNAME"

# Adaptateurs réseau
Get-NetAdapter | Select-Object Name, Status | Format-Table -AutoSize


#OS.ps1
# Informations sur le système d'exploitation
"Système d'exploitation :"

# Version de Windows
$osVersion = (Get-WmiObject -Class Win32_OperatingSystem).Caption
"Version de Windows : $osVersion"

# Date de démarrage (Uptime)
$uptime = (Get-WmiObject -Class Win32_OperatingSystem).LastBootUpTime
$uptimeFormatted = [System.Management.ManagementDateTimeConverter]::ToDateTime($uptime).ToString("yyyy-MM-dd HH:mm:ss")
"Date de démarrage (Uptime) : $uptimeFormatted"

# Architecture (32 ou 64 bits)
$architecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture
"Architecture : $architecture"


#Performance.ps1
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


#Security.ps1
# Statut du pare-feu Windows
"Pare-feu Windows :"
(Get-NetFirewallProfile | Select-Object -First 1).Enabled

# Statut de Windows Defender
"Windows Defender :"
(Get-MpComputerStatus).RealTimeProtectionEnabled


#Software.ps1
#Affichage des logiciels installés avec nom, éditeur et version 
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* ,
                 HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
Where-Object { $_.DisplayName } |
Select-Object DisplayName, Publisher, DisplayVersion |
Sort-Object DisplayName |
Format-Table -AutoSize


#Users.ps1
# Liste des utilisateurs locaux
"Utilisateurs locaux : "
Get-LocalUser | Select-Object Name, Enabled | Format-Table -AutoSize

# Liste des groupes locaux
"Groupes locaux : "
Get-LocalGroup | Select-Object Name | Format-Table -AutoSize