# Afficher les 20 dernières erreurs dans le journal d'événements système
Get-WinEvent -LogName System -ErrorAction SilentlyContinue | Where-Object { $_.Level -eq 2 } | Select-Object -First 20 TimeCreated, Message | Format-Table -AutoSize
