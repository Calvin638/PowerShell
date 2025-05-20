# --- Liste des mois valides ---
$moisValides = @("Janvier","Février","Mars","Avril","Mai","Juin","Juillet","Août","Septembre","Octobre","Novembre","Décembre")

# --- Fonction pour convertir un mois texte en numéro ---
function Get-MoisNumero {
    param([string]$mois)
    return ($moisValides.IndexOf($mois) + 1)
}

# --- Boucle pour obtenir une date valide ---
do {
    # --- Jour ---
    do {
        $jour = Read-Host "Entrez un jour (1 à 31)"
        $jourValide = $jour -match '^\d+$' -and [int]$jour -ge 1 -and [int]$jour -le 31
        if (-not $jourValide) {
            Write-Output "Jour invalide. Veuillez réessayer."
        }
    } until ($jourValide)

    # --- Mois ---
    do {
        $mois = Read-Host "Entrez un mois (ex: Janvier)"
        $moisValide = $moisValides -contains $mois
        if (-not $moisValide) {
            Write-Output "Mois invalide. Veuillez réessayer."
        }
    } until ($moisValide)

    # --- Année ---
    do {
        $annee = Read-Host "Entrez une année (ex: 2025)"
        $anneeValide = $annee -match '^\d+$' -and [int]$annee -ge 1
        if (-not $anneeValide) {
            Write-Output "Année invalide. Veuillez réessayer."
        }
    } until ($anneeValide)

    # --- Tentative de construction de la date ---
    $dateValide = $false
    try {
        $moisNum = Get-MoisNumero $mois  # ← Appel propre ici
        $dateStr = "$jour/$moisNum/$annee"
        $null = [datetime]::ParseExact($dateStr, 'd/M/yyyy', $null)
        $dateValide = $true
    } catch {
        Write-Output "La combinaison jour/mois/année ne correspond pas à une date valide."
    }

} until ($dateValide)

# --- Affichage final ---
Write-Output "`n✅ Date valide : $jour $mois $annee"
