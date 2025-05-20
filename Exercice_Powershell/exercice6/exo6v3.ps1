param (
    [string]$fichier = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exercice_Powershell\exercice6\MarkTwain1.txt",
    [string]$motif = "sc"
)

if (-not (Test-Path $fichier)) {
    Write-Error "Fichier non trouvé."
    exit
}

$count = Get-Content $fichier |
    ForEach-Object { $_ -split '\s+' } |
    Where-Object { $_ -match $motif } |
    Measure-Object | Select-Object -ExpandProperty Count

Write-Output "Motif : '$motif'"
Write-Output "Nombre de mots dans $fichier contenant '$motif' : $count"
