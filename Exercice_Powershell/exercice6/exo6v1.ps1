# Chemin du fichier à lire
$fichier = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice6\MarkTwain1.txt"

# Vérifier que le fichier existe
if (-not (Test-Path $fichier)) {
    Write-Error "Fichier non trouvé."
    exit
}

# Lire le contenu, extraire les mots contenant 'sc'
Get-Content $fichier |
    ForEach-Object { $_ -split '\s+' } |
    Where-Object { $_ -match "sc" } |
    Sort-Object -Unique
