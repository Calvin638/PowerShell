# Étape 1 : Sécuriser la connexion avec Get-Credential
$cred = Get-Credential

# Étape 2 : Définir l'adresse IP ou le nom de la machine distante
$remotePC = "192.168.1.2"  

# Étape 3 : Exécuter une commande distante 
Invoke-Command -ComputerName $remotePC -Credential $cred -ScriptBlock {
    # Récupérer l'espace disque de la machine distante
    Get-PSDrive -PSProvider 'FileSystem' | Select-Object Name, @{Name="Espace Total (Go)";Expression={[math]::round($_.Used/1GB,2)}}, @{Name="Espace Libre (Go)";Expression={[math]::round($_.Free/1GB,2)}}
}