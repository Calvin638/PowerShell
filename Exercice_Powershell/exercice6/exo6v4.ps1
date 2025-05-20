# Chemin du fichier
$fichier = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice6\pays0.txt"

# Vérification
if (-not (Test-Path $fichier)) {
    Write-Error "Fichier non trouvé."
    exit
}

# Transformation du flux
Get-Content $fichier | ForEach-Object {
    $_ -replace ';', ' ' -replace "`t", "`n"
}
