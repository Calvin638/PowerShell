
Remove-Item "$env:TEMP\*" -Recurse -Force -ErrorAction SilentlyContinue


Get-ChildItem "$env:USERPROFILE\Downloads" -File | Where-Object {
    $_.LastWriteTime -lt (Get-Date).AddDays(-30)
} | Remove-Item -Force


Get-ChildItem "$env:USERPROFILE" -Filter *.log -Recurse -ErrorAction SilentlyContinue | Where-Object {
    $_.Length -gt 5MB
} | Remove-Item -Force 

