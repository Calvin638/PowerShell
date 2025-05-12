$scriptPath = "C:\Users\calvi\Documents\Irfa\AIS\Informatique\PowerShell\Projet\PowerShell\Exports\Planification.json"

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-File $scriptPath"
$trigger = New-ScheduledTaskTrigger -Daily -At "10:00AM"
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount

Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName "AuditScriptTask"

Get-ScheduledTask
