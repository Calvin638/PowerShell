function Import-EnvFile {
    param ([string]$Path = ".env")
    if (-Not (Test-Path $Path)) {
        Write-Error "Le fichier $Path n'existe pas."
        exit 1
    }
 
    Get-Content $Path | ForEach-Object {
        if ($_ -match "^\s*([^#][^=]+)=(.+)$") {
            $name = $matches[1].Trim()
            $value = $matches[2].Trim()
            Set-Item -Path "Env:$name" -Value $value
        }
    }
}
 
Import-EnvFile
 
Write-Host "Connexion et exécution d'une requête test..."
 
# Ne pas passer le mot de passe dans les arguments
$args = @(
    "-a", $env:account,
    "-u", $env:user,
    "-r", $env:role,
    "-w", $env:warehouse,
    "-d", $env:database,
    "-s", $env:schema,
    "-q", "SELECT CURRENT_DATE(), CURRENT_USER();"
)
 
try {
    & snowsql @args
    Write-Host "✅ Connexion et requête réussies !"
} catch {
    Write-Error "❌ Échec de la connexion ou de la requête.`nErreur: $_"
}