
### MODULE 1 : MAINTENANCE SYSTÈME ###
function SousMenu-MaintenanceSysteme {
    do {
        Clear-Host
        Write-Host "--- MAINTENANCE SYSTÈME ---" -ForegroundColor Green
        Write-Host "1. Vérifier l’espace disque"
        Write-Host "2. Supprimer les fichiers temporaires"
        Write-Host "3. Scanner les mises à jour Windows"
        Write-Host "4. Retour menu principal"
        $choix = Read-Host "Choix"

        switch ($choix) {
            '1' { Get-PSDrive C | Select-Object Name, Free, Used, @{Name='Free(GB)';Expression={[math]::Round($_.Free / 1GB, 2)}} | Format-List }
            '2' { Remove-Item -Path "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue; Write-Host "Fichiers temporaires supprimés." -ForegroundColor Yellow }
            '3' { Get-WindowsUpdate -ErrorAction SilentlyContinue } 
            '4' { return }
            default { Write-Host "Choix invalide." -ForegroundColor Red }
        }

        if ($choix -ne '4') {
            Pause
        }
    } while ($choix -ne '4')
}


### MODULE 2 : GESTION UTILISATEUR ###
function SousMenu-GestionUtilisateur {
    do {
        Clear-Host
        Write-Host "--- GESTION UTILISATEUR ---" -ForegroundColor Green
        Write-Host "1. Ajouter un utilisateur (Nom + Email)"
        Write-Host "2. Afficher tous les utilisateurs"
        Write-Host "3. Supprimer un utilisateur"
        Write-Host "4. Retour menu principal"
        $choix = Read-Host "Choix"

        switch ($choix) {
            '1' {
                $nom = Read-Host "Nom de l'utilisateur"
                $email = Read-Host "Email"
                Write-Host "Utilisateur $nom ($email) ajouté (simulation)." -ForegroundColor Yellow
            }
            '2' { Get-LocalUser | Format-Table Name, Enabled, LastLogon }
            '3' {
                $nom = Read-Host "Nom de l'utilisateur à supprimer"
                Write-Host "Suppression de l'utilisateur $nom (simulation)." -ForegroundColor Red
            }
            '4' { return }
            default { Write-Host "Choix invalide." -ForegroundColor Red }
        }

        if ($choix -ne '4') {
            Pause
        }
    } while ($choix -ne '4')
}


### MODULE 3 : SERVICES WINDOWS ###
function SousMenu-ServicesWindows {
    do {
        Clear-Host
        Write-Host "--- SERVICES WINDOWS ---" -ForegroundColor Green
        Write-Host "1. Afficher l’état des services critiques"
        Write-Host "2. Démarrer un service"
        Write-Host "3. Arrêter un service"
        Write-Host "4. Retour menu principal"
        $choix = Read-Host "Choix"

        switch ($choix) {
            '1' { Get-Service | Where-Object {$_.Status -ne 'Running'} | Format-Table Name, Status }
            '2' {
                $nom = Read-Host "Nom du service à démarrer"
                Start-Service -Name $nom -ErrorAction SilentlyContinue
                Write-Host "Service $nom démarré (si existant)." -ForegroundColor Yellow
            }
            '3' {
                $nom = Read-Host "Nom du service à arrêter"
                Stop-Service -Name $nom -ErrorAction SilentlyContinue
                Write-Host "Service $nom arrêté (si existant)." -ForegroundColor Red
            }
            '4' { return }
            default { Write-Host "Choix invalide." -ForegroundColor Red }
        }

        if ($choix -ne '4') {
            Pause
        }
    } while ($choix -ne '4')
}


### MODULE 4 : REGISTRE WINDOWS ###
function SousMenu-GestionRegistre {
    $chemin = "HKCU:\Software\TPFinal"
    do {
        Clear-Host
        Write-Host "--- GESTION DU REGISTRE ---" -ForegroundColor Green
        Write-Host "1. Créer une clé ($chemin)"
        Write-Host "2. Ajouter/modifier une valeur (String)"
        Write-Host "3. Lire une valeur existante"
        Write-Host "4. Supprimer la clé"
        Write-Host "5. Retour menu principal"
        $choix = Read-Host "Choix"

        switch ($choix) {
            '1' { New-Item -Path $chemin -Force | Out-Null; Write-Host "Clé créée." -ForegroundColor Yellow }
            '2' {
                $nom = Read-Host "Nom de la valeur"
                $valeur = Read-Host "Contenu de la valeur"
                New-ItemProperty -Path $chemin -Name $nom -Value $valeur -PropertyType String -Force | Out-Null
                Write-Host "Valeur $nom ajoutée/modifiée." -ForegroundColor Yellow
            }
            '3' {
                $nom = Read-Host "Nom de la valeur"
                Get-ItemProperty -Path $chemin -Name $nom
            }
            '4' {
                Remove-Item -Path $chemin -Recurse -Force -ErrorAction SilentlyContinue
                Write-Host "Clé supprimée." -ForegroundColor Red
            }
            '5' { return }
            default { Write-Host "Choix invalide." -ForegroundColor Red }
        }

        if ($choix -ne '5') {
            Pause
        }
    } while ($choix -ne '5')
}


### MODULE 5 : JOURNALISATION ET RAPPORTS ###
function SousMenu-RapportJournalisation {
    $rapport = "logs\rapport.txt"
    if (-not (Test-Path "logs")) { New-Item -ItemType Directory -Path "logs" | Out-Null }

    do {
        Clear-Host
        Write-Host "--- RAPPORT ET JOURNALISATION ---" -ForegroundColor Green
        Write-Host "1. Générer un rapport système"
        Write-Host "2. Lire le journal d’activité"
        Write-Host "3. Exporter le rapport dans $rapport"
        Write-Host "4. Retour menu principal"
        $choix = Read-Host "Choix"

        switch ($choix) {
            '1' {
                $info = Get-ComputerInfo | Out-String
                Write-Host $info
            }
            '2' {
                Get-EventLog -LogName System -Newest 10 | Format-Table TimeGenerated, EntryType, Source, EventID, Message -Wrap
            }
            '3' {
                Get-ComputerInfo | Out-File -FilePath $rapport
                Write-Host "Rapport exporté dans $rapport" -ForegroundColor Yellow
            }
            '4' { return }
            default { Write-Host "Choix invalide." -ForegroundColor Red }
        }

        if ($choix -ne '4') {
            Pause
        }
    } while ($choix -ne '4')
}
