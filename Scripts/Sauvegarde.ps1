
$source = "$env:USERPROFILE\Documents"

$destination = "C:\Backup"

if (-not (Test-Path $destination)) { New-Item -ItemType Directory -Path $destination }

Get-ChildItem -Path $source -Recurse -Include "*.docx", "*.pdf", "*.txt" | Copy-Item -Destination $destination -Force
