# Demande à l'utilisateur de saisir deux chaînes
$chaine1 = Read-Host "Entrez la première chaîne"
$chaine2 = Read-Host "Entrez la deuxième chaîne"

# Détermination de la longueur maximale
$maxLen = [Math]::Max($chaine1.Length, $chaine2.Length)

# Fusion imbriquée caractère par caractère
$resultat = ""
for ($i = 0; $i -lt $maxLen; $i++) {
    if ($i -lt $chaine1.Length) { $resultat += $chaine1[$i] }
    if ($i -lt $chaine2.Length) { $resultat += $chaine2[$i] }
}

# Affichage du résultat
Write-Output "`n Fusion : $resultat"
