param(
    [string]$Nom
)

# Affiche les arguments reçus
Write-Host "Argument reçu : $Nom"

# Affiche le chemin du script
Write-Host "Chemin du script : $($MyInvocation.MyCommand.Path)"

# Point d'arrêt
Set-PSBreakpoint -Script $MyInvocation.MyCommand.Path -Line 10

# Traitement simple
Write-Host "Bonjour, $Nom ! Bienvenue dans le script de test."

# Exemple d'opération
$longueur = $Nom.Length
Write-Host "Ton nom contient $longueur caractères."
