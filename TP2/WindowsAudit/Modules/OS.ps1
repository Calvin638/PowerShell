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
