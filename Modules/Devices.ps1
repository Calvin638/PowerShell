# Liste des imprimantes installées
"Imprimantes Installées :"
Get-WmiObject -Class Win32_Printer | Select-Object Name, DeviceID | Format-Table -AutoSize

# Liste des périphériques USB actuellement connectés
"Périphériques USB Connectés :"
Get-WmiObject -Query "SELECT * FROM Win32_USBHub" | Select-Object DeviceID, PNPDeviceID, Description | Format-Table -AutoSize