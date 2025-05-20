# ================================================
# Exercice 5 - Équivalents grep / find / wc
# ================================================

# Chemin du répertoire de test
$chemin = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice5\DossierTest"

# === GREP : Rechercher un mot dans tous les fichiers .txt ===
$motRecherche = Read-Host "Entrez un mot à rechercher dans les fichiers .txt"
Write-Output "`n=== Résultats de la recherche du mot '$motRecherche' ==="
$resultats = Select-String -Path "$chemin\*.txt" -Pattern $motRecherche

if ($resultats) {
    foreach ($ligne in $resultats) {
        Write-Output "Fichier : $($ligne.Path)"
        Write-Output "    Ligne $($ligne.LineNumber) : $($ligne.Line)"
    }
} else {
    Write-Output "Aucun résultat trouvé pour '$motRecherche'."
}

# === FIND : Rechercher tous les fichiers .log (récursif) ===
Write-Output "`n=== Fichiers '.log' trouvés récursivement ==="
$logs = Get-ChildItem -Path $chemin -Recurse -Filter *.log

if ($logs) {
    foreach ($log in $logs) {
        Write-Output "$($log.FullName)"
    }
} else {
    Write-Output "Aucun fichier '.log' trouvé."
}

# === WC : Compter lignes, mots, caractères ===
$fichierAnalyse = "$chemin\testcommande.txt"
Write-Output "`n=== Analyse du fichier : $fichierAnalyse ==="

if (Test-Path $fichierAnalyse) {
    $stats = Get-Content $fichierAnalyse | Measure-Object -Line -Word -Character
    Write-Output "Lignes     : $($stats.Lines)"
    Write-Output "Mots       : $($stats.Words)"
    Write-Output "Caractères : $($stats.Characters)"
} else {
    Write-Warning "Le fichier d’analyse n’existe pas."
}

Write-Output "`nScript terminé."
