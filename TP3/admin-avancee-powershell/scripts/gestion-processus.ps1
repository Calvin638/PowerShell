# Dossier de sortie
$outputPath = "$PSScriptRoot\resultat.txt"

# Lancer une tâche en arrière-plan
$job = Start-Job -ScriptBlock {
    # Simuler une tâche longue
    Start-Sleep -Seconds 10

    # Écrire un résultat dans un fichier 
    $outputFile = "$using:PSScriptRoot\resultat.txt"
    "La tâche de fond est terminée à $(Get-Date)" | Out-File -FilePath $outputFile -Encoding UTF8 -Append
}

# Afficher l'ID de la tâche pour information
Write-Host "Tâche lancée en arrière-plan avec l'ID $($job.Id)"

# Vérifier l'état des tâches
$jobs = Get-Job

foreach ($job in $jobs) {
    Write-Host "Tâche ID $($job.Id) - État : $($job.State)"

    if ($job.State -eq 'Completed') {
        Receive-Job -Id $job.Id
        Remove-Job -Id $job.Id
    }
}