# --- Boucle pour demander un jour valide ---
do {
    $jour = Read-Host "Entrez un jour (entre 1 et 31)"
    $jourValide = ($jour -match '^\d+$') -and ([int]$jour -ge 1) -and ([int]$jour -le 31)

    if (-not $jourValide) {
        Write-Output "Jour invalide. Veuillez réessayer."
    }
} until ($jourValide)
Write-Output "Jour correct : $jour"

# --- Boucle pour demander un mois valide ---
$moisValides = @("Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre")
do {
    $mois = Read-Host "Entrez un mois (ex: Janvier)"
    $moisValide = $moisValides -contains $mois

    if (-not $moisValide) {
        Write-Output "Mois invalide. Veuillez réessayer."
    }
} until ($moisValide)
Write-Output "Mois correct : $mois"

# --- Boucle pour demander une année valide ---
do {
    $annee = Read-Host "Entrez une année (ex: 2025)"
    $anneeValide = ($annee -match '^\d+$') -and ([int]$annee -ge 1)

    if (-not $anneeValide) {
        Write-Output "Année invalide. Veuillez réessayer."
    }
} until ($anneeValide)
Write-Output "Année correcte : $annee"

# --- Résumé final ---
Write-Output "`n Saisie complète : $jour $mois $annee"
