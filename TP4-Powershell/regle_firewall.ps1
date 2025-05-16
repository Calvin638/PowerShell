# Affiche les règles de pare-feu existante
Get-NetFirewallRule | Format-Table

# Règle de pare-feu qui bloque le port 80
New-NetFirewallRule -DisplayName "Bloquer le port 80" -Description "Blocage du port" -Direction Outbound -RemotePort 80 -Protocol TCP -Action Block

# Vérifie que la règle est bien créée
Get-NetFirewallRule -DisplayName "Bloquer le port 80"

# Supprime la règle 
Remove-NetFirewallRule -DisplayName "Bloquer le port 80"