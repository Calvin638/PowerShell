# Charger les variables d'environnement (optionnel si tu utilises config snowsql)
# Ici, on suppose que la connexion est configurée dans ~/.snowsql/config sous [connections.myconnection]
 
# Liste des scripts SQL CRUD à exécuter
$scriptPaths = @(
    #"Requetes/create_table.sql",
    "Requetes/insert_table.sql"
    "Requetes/select_data.sql",
    "Requetes/update.sql"
    #"Requetes/delete.sql"
)
 
foreach ($script in $scriptPaths) {
    if (Test-Path $script) {
        Write-Host "`n🟢 Exécution : $script`n"
        # Appel snowsql avec la connexion nommée myconnection
        & snowsql -c myconnection -f $script
    }
    else {
        Write-Warning "⚠️ Le fichier $script est introuvable."
    }
}