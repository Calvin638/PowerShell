# Définir un chemin vers un fichier qui n'existe pas
$fichier = "C:\chemin\inexistant\fichier.txt"

try {
    # Tenter d'accéder au fichier
    Write-Host "Tentative de lecture du fichier : $fichier"
    $contenu = Get-Content -Path $fichier -ErrorAction Stop

    # Si le fichier est trouvé, on affiche son contenu
    Write-Host "Contenu du fichier :"
    Write-Host $contenu
}
catch {
    # En cas d'erreur, on affiche un message clair
    Write-Warning "Une erreur est survenue lors de la lecture du fichier."
    Write-Output "Détail technique : $($_.Exception.Message)"
}
finally {
    # Bloc toujours exécuté
    Write-Host "`nNettoyage terminé. Le script s'est exécuté jusqu'au bout."
}
