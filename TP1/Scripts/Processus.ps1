
$processus = Get-Process 

$BigProcessus = $processus | Where-Object { $_.WorkingSet64 -gt 100MB }

$BigProcessus | ConvertTo-csv | Select-Object Name, Id, CPU, @{Name="RAM(Mo)";Expression={[math]::Round($_.WorkingSet64 / 1MB, 2)}} | Out-File -FilePath "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Processus_ram.csv"