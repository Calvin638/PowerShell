1. Exécution de PowerShell en tant qu'administrateur
Le script nécessite des droits administratifs pour enregistrer une tâche planifiée et pour accéder aux informations système (comme l'espace disque). Assurez-vous donc d'exécuter PowerShell avec des privilèges d'administrateur.

2. Chemin d'accès pour le fichier rapport.ps1
Modifications possibles :

Le script crée un fichier PowerShell à l'emplacement C:\rapport.ps1. Vous devez vous assurer que l'emplacement est accessible et que vous avez les autorisations nécessaires.

Si vous souhaitez changer l'emplacement, vous pouvez modifier la ligne suivante dans le script :

$rapport | Out-File "C:\rapport.ps1"
Remplacez C:\rapport.ps1 par le chemin désiré (par exemple, D:\scripts\rapport.ps1).

3. Planification de la tâche
Le script planifie une tâche qui s'exécute tous les jours à 9h. Si vous voulez modifier cette planification, vous pouvez ajuster l'argument -At 9am dans la ligne suivante :

$trigger = New-ScheduledTaskTrigger -Daily -At 9am
Pour changer l'heure, remplacez 9am par l'heure de votre choix (par exemple, 8am ou 2:00pm).

Vous pouvez aussi changer la fréquence (quotidienne, hebdomadaire, etc.) en modifiant l'option -Daily :

-Weekly pour exécuter la tâche chaque semaine.

-At 9am pour définir une heure spécifique.

4. Utilisation de PowerShell Remoting pour une machine distante
Si vous souhaitez exécuter ce script sur une machine distante via PowerShell Remoting, voici les étapes nécessaires :

a. Activer PowerShell Remoting sur la machine distante
PowerShell Remoting doit être activé sur la machine distante. Exécutez cette commande sur la machine distante (en mode administrateur) :

Enable-PSRemoting -Force
b. Modification de l'adresse IP de la machine distante
Le script utilise 192.168.1.2 comme adresse IP pour la machine distante. Vous devez remplacer cette adresse par l'IP ou le nom d'hôte de la machine distante que vous souhaitez cibler. Modifiez la ligne suivante :

$machine = "192.168.1.2"
c. Authentification
Le script utilise Get-Credential pour saisir les identifiants de connexion à la machine distante. Lors de l'exécution du script, une fenêtre s'ouvrira pour que vous puissiez entrer vos informations d'identification (nom d'utilisateur et mot de passe). Si vous utilisez un compte d'administrateur sur la machine distante, il faudra fournir ces informations.

d. Éléments à vérifier sur la machine distante
Droits administratifs : Assurez-vous que l'utilisateur disposant des identifiants a des privilèges administratifs sur la machine distante pour enregistrer des tâches et créer des fichiers dans le répertoire racine (C:\).

Pare-feu et communication : Assurez-vous que les ports nécessaires à PowerShell Remoting (par défaut, le port 5985 pour HTTP et 5986 pour HTTPS) sont ouverts sur le pare-feu de la machine distante.

5. Accès au fichier rapport
Le script génère un fichier rapport à l'emplacement C:\rapport_disque.txt. Assurez-vous que l'emplacement C:\ est accessible et que la machine dispose des autorisations nécessaires pour y écrire.

Si vous souhaitez enregistrer le rapport à un autre emplacement, vous pouvez modifier cette ligne dans le script :

| Out-File -FilePath C:\rapport_disque.txt
6. Exécution du script
Une fois tous les paramètres configurés, vous pouvez exécuter le script. Voici ce que le script va faire :

Il génère un script PowerShell qui récupère les informations d'espace disque.

Ce script est enregistré localement sous C:\rapport.ps1.

Une tâche planifiée est créée pour exécuter ce script tous les jours à 9h00.

Si vous utilisez PowerShell Remoting, il exécutera la même série d'actions sur la machine distante.