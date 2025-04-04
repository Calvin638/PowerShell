function Show-Menu {
    Clear-Host
    Write-Host "1. Audit système local"
    Write-Host "2. Nettoyage automatique"
    Write-Host "3. Surveillance des processus"
    Write-Host "4. Sauvegarde de documents"
    Write-Host "5. Gestion des utilisateurs locaux"
    Write-Host "6. Planification de tâches"
    $choice = Read-Host "Choisissez une option (1-6)"
    
    switch ($choice) {
        1 { Audit }
        2 { Nettoyage }
        3 { Processus }
        4 { Sauvegarde }
        5 { Utilisateurs }
        6 { Planification }
        default { Write-Host "Choix invalide. Essayez encore." -ForegroundColor Red; Show-Menu }
    }
}


function Audit {

$SystemInfo = Get-ComputerInfo

$SystemInfo | ConvertTo-Json | Out-File -FilePath "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Audit.json"

}



function Nettoyage {

Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue


Get-ChildItem "$env:USERPROFILE\Downloads" -File | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-30)
} | Remove-Item -Force


Get-ChildItem "$env:USERPROFILE" -Filter *.log -Recurse -ErrorAction SilentlyContinue | Where-Object {
    $_.Length -gt 5MB
} | Remove-Item -Force 

}

function Processus {
    
$processus = Get-Process

$BigProcessus = $processus | Where-Object { $_.WorkingSet64 -gt 100MB }

$BigProcessus | ConvertTo-csv | Select-Object Name, Id, CPU, @{Name="RAM(Mo)";Expression={[math]::Round($_.WorkingSet64 / 1MB, 2)}} | Out-File -FilePath "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Processus_ram.csv"

}


function Sauvegarde {

$source = "$env:USERPROFILE\Documents"

$destination = "C:\Backup"

if (-not (Test-Path $destination)) { New-Item -ItemType Directory -Path $destination }

Get-ChildItem -Path $source -Recurse -Include "*.docx", "*.pdf", "*.txt" | Copy-Item -Destination $destination -Force

}


function Utilisateurs {

Get-LocalUser

$UserName = "user1"      # Nom de l'utilisateur
$Password = "P@ssw0rd"          # Mot de passe
New-LocalUser -Name $UserName -Password (ConvertTo-SecureString $Password -AsPlainText -Force)

$UserToDelete = "user1"  

Disable-LocalUser -Name $UserToDelete

}


function Planification {

$scriptPath = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Planification.json"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $scriptPath"
$trigger = New-ScheduledTaskTrigger -Daily -At "10:00AM"
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "AuditScriptTask"

Get-ScheduledTask

}


Show-Menu