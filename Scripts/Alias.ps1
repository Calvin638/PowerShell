$Alias = Get-Alias

$Alias | ConvertTo-Json | Out-File -FilePath "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Alias.json"