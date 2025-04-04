$SystemInfo = Get-ComputerInfo

$SystemInfo | ConvertTo-Json | Out-File -FilePath "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Audit.json"




