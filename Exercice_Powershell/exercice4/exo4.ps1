# Définir les chemins source et destination
$source = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice4\Dossier1"
$destination = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice4\Dossier2"

# Vérifier que les dossiers existent
if (-not (Test-Path $source)) {
    Write-Error "Le répertoire source n'existe pas : $source"
    exit
}
if (-not (Test-Path $destination)) {
    Write-Output "Le répertoire destination n'existe pas, création en cours..."
    New-Item -ItemType Directory -Path $destination | Out-Null
}

# Parcourir tous les fichiers du répertoire source
Get-ChildItem -Path $source -File | ForEach-Object {
    $fichierSource = $_
    $fichierDestination = Join-Path $destination $fichierSource.Name

    # Vérifier si le fichier destination existe
    if (Test-Path $fichierDestination) {
        # Comparer les dates de modification
        $dateSource = $fichierSource.LastWriteTime
        $dateDest = (Get-Item $fichierDestination).LastWriteTime

        if ($dateSource -gt $dateDest) {
            # Copier si source est plus récente
            Copy-Item -Path $fichierSource.FullName -Destination $fichierDestination -Force
            Write-Output "Copié (mise à jour) : $($fichierSource.Name)"
        } else {
            Write-Output "Ignoré (destination plus récente) : $($fichierSource.Name)"
        }
    } else {
        # Copier si fichier destination n'existe pas
        Copy-Item -Path $fichierSource.FullName -Destination $fichierDestination
        Write-Output "Copié (nouveau fichier) : $($fichierSource.Name)"
    }
}

Write-Host "Avec Linux/Unix on utiliserait : rsync -auv /chemin/source/ /chemin/destination/"