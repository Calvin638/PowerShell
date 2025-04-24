Get-LocalUser

$UserName = "user1"      # Nom de l'utilisateur
$Password = "P@ssw0rd"          # Mot de passe
New-LocalUser -Name $UserName -Password (ConvertTo-SecureString $Password -AsPlainText -Force)

$UserToDelete = "user1"  

Disable-LocalUser -Name $UserToDelete
