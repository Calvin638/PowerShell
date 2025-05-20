# Chemin du fichier à lire
$fichier = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice6\MarkTwain1.txt"

# Lire, filtrer, puis compter
$count = Get-Content $fichier |
    ForEach-Object { $_ -split '\s+' } |
    Where-Object { $_ -match "sc" } |
    Measure-Object | Select-Object -ExpandProperty Count

Write-Output "Nombre de mots contenant 'sc' : $count"