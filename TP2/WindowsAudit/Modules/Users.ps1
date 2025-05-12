# Liste des utilisateurs locaux
"Utilisateurs locaux : "
Get-LocalUser | Select-Object Name, Enabled | Format-Table -AutoSize

# Liste des groupes locaux
"Groupes locaux : "
Get-LocalGroup | Select-Object Name | Format-Table -AutoSize