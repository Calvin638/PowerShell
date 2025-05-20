# Afficher le contenu du dossier utilisateur
Get-ChildItem ~


# Afficher uniquement les fichiers (pas les dossiers)
Write-Host "`nUniquement les fichiers : "
Get-ChildItem ~ -File

# Encore une méthode en filtrant sur le nom
#Get-Command | Where-Object { $_.Name -like "*move*" }

# Vérifier la stratégie d'exécution des scripts
Get-ExecutionPolicy