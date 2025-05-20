# Fonction récursive pour afficher l'arborescence
function Show-Tree {
    param (
        [string]$path,
        [int]$indent = 0
    )

    # Obtenir les sous-dossiers
    $dossiers = Get-ChildItem -Path $path -Directory | Sort-Object Name

    foreach ($dossier in $dossiers) {
        # Indentation
        Write-Output (" " * $indent + "|-- " + $dossier.Name)

        # Appel récursif pour afficher les sous-dossiers
        Show-Tree -path $dossier.FullName -indent ($indent + 4)
    }
}

# Répertoire de départ (par défaut : répertoire courant)
$cheminDepart = Read-Host "Entrez le chemin de départ (laisser vide pour le dossier courant)"
if (-not $cheminDepart) {
    $cheminDepart = Get-Location
}

# Vérifier si le chemin est valide
if (-not (Test-Path $cheminDepart)) {
    Write-Error "Chemin invalide."
    exit
}

# Afficher le nom du dossier racine
Write-Output "`nStructure de : $cheminDepart"
Write-Output "|"

# Lancer la fonction
Show-Tree -path $cheminDepart
