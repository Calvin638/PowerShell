# 1. Crée un script qui génère un rapport d'espace disque
$rapport = @"
Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Used, Free, @{Name='Taille(GB)';Expression={"{0:N2}" -f ($_.Used + $_.Free)/1GB}}, @{Name='Libre(%)';Expression={"{0:N2}" -f ($_.Free / ($_.Used + $_.Free) * 100)}} | Out-File -FilePath C:\rapport_disque.txt
"@
$rapport | Out-File "C:\rapport.ps1"

# 2. Planifie une tâche tous les jours à 9h pour générer ce rapport
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\rapport.ps1"
$trigger = New-ScheduledTaskTrigger -Daily -At 9am
Register-ScheduledTask -TaskName "RapportDisque" -Trigger $trigger -Action $action -RunLevel Highest -User "SYSTEM"


# Avec PS-Remoting
# Adresse IP ou nom de la machine distante
$machine = "192.168.1.2"

# Saisir les identifiants pour la machine distante
$creds = Get-Credential

# Créer le script distant pour générer un rapport disque
Invoke-Command -ComputerName $machine -Credential $creds -ScriptBlock {
    $script = @"
Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, Used, Free, @{Name='Taille(GB)';Expression={"{0:N2}" -f ($_.Used + $_.Free)/1GB}}, @{Name='Libre(%)';Expression={"{0:N2}" -f ($_.Free / ($_.Used + $_.Free) * 100)}} | Out-File -FilePath C:\rapport_disque.txt
"@
    $script | Out-File "C:\rapport.ps1"
}

# Créer et enregistrer la tâche planifiée à distance
Invoke-Command -ComputerName $machine -Credential $creds -ScriptBlock {
    $action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File C:\rapport.ps1"
    $trigger = New-ScheduledTaskTrigger -Daily -At 9am
    Register-ScheduledTask -TaskName "RapportDisque" -Trigger $trigger -Action $action -RunLevel Highest -User "SYSTEM"
}
