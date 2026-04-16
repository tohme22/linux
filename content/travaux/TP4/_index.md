---
title: "TP4"
description: "linux"
draft: false
weight: 4
---

##### Connectez-vous à la VM.

#### Exercice 1 - Archivage et synchronisation

1. Basculez vers l'utilisateur **root** dans un **shell de connexion**, en utilisant le mot de passe **420!lnp4ss**.

2. Créez une archive compressée, nommée **/tmp/logX.gz.tar** *(où **X** est le numéro de votre ordinateur)*, et qui inclut le contenu de **/var/log** de votre machine locale.

3. Vérifiez que l'archive a été bien créée.

4. Transférez à distance cette archive tar comprésée **/tmp/logX.gz.tar** vers le répertoire **/tmp** sur le serveur **atohme_ZG4_alma**, en vous authentifiant comme **root**.

---
#### Exercice 2 - Gestion de réseaux 

1. Listez toutes vos connexions réseaux.

2. Supprimez tous les profils de conenxion liés à l'interface Ethernet **ens224**.

3. Créez un profil de connexion appelé **static** pour l'interface Ethernet **ens224** qui définit les paramètres réseau de manière **statique** et n'utilise pas DHCP.

Utilisez les paramètres du tableau suivant :

|Paramètre|Valeur|
|---|---|
|Adresse IPV4| 172.25.250.X *(où X est le numéro de votre ordinateur)*.|
|Masque de réseau|255.255.255.0|
|Passerelle|172.25.250.250|
|Serveur DNS|172.25.250.250|

4. Prouvez que vous avez bien créer le profil de connection **static**.

5. Modifiez le nom d'hôte de votre machine pour **serveurX** *(où **X** est le numéro de votre ordinateur).*

6. Configurez une adresse IPv4 supplémentaire **172.25.200.X** *(où **X** est le numéro de votre ordinateur)* avec le masque de réseau **255.255.255.0** sur la même interface **ens224** que celle qui possède les paramètres
réseau statiques existants. **Ne supprimez pas l'adresse IPv4 existante**.

7. Prouvez que l'adresse IPv4 supplémentaire a été bien ajoutée sur le profil de connection **static**.

8. Supprimer le profil de connection **static**.

---
#### Exercice 3 - Gestion du stockage

1. Supprimez toutes les partitions existantes sur le disque **/dev/sdb**.

2. Créez une nouvelle partition de **3 Go**.

3. Formatez cette nouvelle partition avec le système de fichiers **ext4**.

4. Montez manuellement cette partition au repértoire **/mnt/**.

5. Prouvez que la partition a été bien créée, formatée et montée.


---
#### Exercice 4 - Installation de logiciels

1. En utilisant l'utilitaire **dnf**, vérifiez si l'application **gparted** est disponible pour être installée.

2. Installez l'outil **gparted** pour visualiser l’espace disque utilisé.

3. Une fois installée, ouvrez l'utilitaire **gparted** et vérifiez que la partition créé à l'exercice 3 est bien créée.

4. En utilisant le mot clé **ifconfig**, trouvez le paquet qui contient ce mot clé et **isstallez-le**.

5. Vérifiez que ce paquet, de l'étape 4, est bien installé.

6. Supprimmez ce paquet.












