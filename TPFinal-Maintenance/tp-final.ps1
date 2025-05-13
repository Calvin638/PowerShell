
# Chargement des fonctions
. .\fonctions.ps1

function Afficher-MenuPrincipal {
    Clear-Host
    Write-Host "========= MENU PRINCIPAL =========" -ForegroundColor Cyan
    Write-Host "1. Maintenance système"
    Write-Host "2. Gestion utilisateur"
    Write-Host "3. Services Windows"
    Write-Host "4. Gestion du registre"
    Write-Host "5. Rapport et journalisation"
    Write-Host "6. Quitter"
}

do {
    Afficher-MenuPrincipal
    $choix = Read-Host "`nVeuillez choisir une option (1 à 6)"

    switch ($choix) {
        '1' { SousMenu-MaintenanceSysteme }
        '2' { SousMenu-GestionUtilisateur }
        '3' { SousMenu-ServicesWindows }
        '4' { SousMenu-GestionRegistre }
        '5' { SousMenu-RapportJournalisation }
        '6' {
            Write-Host "Fermeture du programme..." -ForegroundColor Yellow
            break
        }
        default {
            Write-Host "Choix invalide. Veuillez entrer un chiffre entre 1 et 6." -ForegroundColor Red
            Start-Sleep -Seconds 2
        }
    }

    if ($choix -ne '6') {
        Write-Host "`nAppuyez sur une touche pour revenir au menu principal..."
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    }

} while ($choix -ne '6')
