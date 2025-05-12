#Affichage des logiciels installés avec nom, éditeur et version 
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* ,
                 HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
Where-Object { $_.DisplayName } |
Select-Object DisplayName, Publisher, DisplayVersion |
Sort-Object DisplayName |
Format-Table -AutoSize