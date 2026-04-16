---
title: "TP3"
description: "linux"
draft: false
weight: 3
---

#### Exercice 1 - Gestion des utilisateurs et des groupes 

Connectez-vous à la VM.

1. Basculez vers l'utilisateur **root** dans un **shell de connexion**, en utilisant le mot de passe **420!lnp4ss**.

2. Créez les 5 utilisateurs suivants:
   
   - Nom de l'utilsiateur : **dev1**, UID **3001**, description **Developpeur 1** avec shell de connexion **/bin/sh**.
   - Nom de l'utilsiateur : **dev2**, UID **3002**, description **Developpeur 2** avec shell de connexion **/bin/sh**.
   - Nom de l'utilsiateur : **sysadmin1**, UID **4001**, description **Systeme Admin 1** avec shell de connexion **/bin/bash**.
   - Nom de l'utilsiateur : **sysadmin2**, UID **4002**, description **Systeme Admin 2** avec shell de connexion **/bin/bash**.
   - Nom de l'utilsiateur : **test2**, UID **4003**.
      
3. Vérifiez que les 5 utilisateurs sont bien créés.

4. Donnez-leur le mot de passe **redhat**.

5. Supprimez l'utilsiateur **test2** ainsi que ***son répertoire personnel***.
   
6. Créez les 3 groupes suivants:
   
   - Nom du groupe : **groupedev** avec GID **2021**.
   - Nom du groupe : **groupesysadmin** avec GID **2022**.
   - Nom du groupe : **groupeTI** avec GID **2023**.

7. Vérifiez que les 3 groupes sont bien créés.

8. Ajoutez les utilisateurs **dev1** et **dev2** dans le groupe **groupdev** (comme groupe ***principal***), et dans le groupe **groupeTI** (comme groupe ***supplémentaire***).

9. Vérifiez que les 2 utilisateurs **dev1** et **dev2** ont le groupe **groupdev** comme groupe ***principal***, et le groupe **groupeTI** comme groupe ***supplémentaire***.

10. Ajoutez les utilisateurs **sysadmin1** et **sysadmin2** dans le groupe **groupdsysadmin** (comme groupe ***principal***), et dans le groupe **groupeTI** (comme groupe ***supplémentaire***).

11. Vérifiez que les 2 utilisateurs **sysadmin1** et **sysadmin2** ont le groupe **groupdsysadmin** comme groupe ***principal***, et le groupe **groupeTI** comme groupe ***supplémentaire***.

---
#### Exercice 2 - Gestion des permissions du système de fichiers

1. En restant toujours connecter avec l'utilisateur **root**, créez les **repértoires** suivants et assignez les **propriétaires** et les **permissions** comme définis dans le tableau suivant :

|Nom du répertoire|Utilisateur propriétaire|Permissions|Groupe propriétaire|Permissions|Permissions des autres|
|---|---|---|---|---|---|
|**/TI**|root|r w x|groupeTI|r - x|- - -|
|**/TI/dev/**|root|r w x|groupedev|r w x|- - -|
|**/TI/sysadmin/**|root|r w x|groupesysadmin|r w x|- - -|
|**/TI/general/**|root|r w x|groupeTI|r w x|r - x|
 
2. Listez le contenu du repértoire **/TI** pour vérifier que les groupes propriétaires et les permissions sont bien définis.

3. Basculez vers l'utilisateur **dev1**. Pourquoi le système ne vous demande pas de saisir votre mot de passe ?

4. Essayez de créer le fichier **programme1.js** dans le repértoire **/TI/sysadmin/**. Êtes-vous capable ? Pourquoi ?

5. Essayez de créer le fichier **programme1.js** dans le repértoire **/TI/dev/**. Êtes-vous capable ? Pourquoi ?

6. Essayez de créer le fichier **programme1.js** dans le repértoire **/TI/general/**. Êtes-vous capable ? Pourquoi ?

7. Basculez vers l'utilisateur **sysadmin1**. 

8. Essayez de créer le fichier **script1.sh** dans le repértoire **/TI/sysadmin/**. Êtes-vous capable ? Pourquoi ?

9. Essayez de créer le fichier **script1.sh** dans le repértoire **/TI/dev/**. Êtes-vous capable ? Pourquoi ?

10. Essayez de créer le fichier **script1.sh** dans le repértoire **/TI/general/**. Êtes-vous capable ? Pourquoi ?

11. Basculez vers l'utilisateur **dev2**. 

12. Essayez de supprimer le fichier **programme1.js** dans le repértoire **/TI/dev/**. Êtes-vous capable ? Pourquoi ?

13. Essayez de supprimer le fichier **script1.sh** dans le repértoire **/TI/sysadmin/**. Êtes-vous capable ? Pourquoi ?

14. Essayez de créer le sous-repértoire **/TI/Outils/**.  Êtes-vous capable ? Pourquoi ?

15. Essayez de créer le sous-repértoire **/TI/general/Outils/**.  Êtes-vous capable ? Pourquoi ?

16. En utilisant une seule commande, modifiez le propriétaire du sous-repértoire **/TI/general/Outils/** pour **root** et le groupe propriétaire pour **groupeTI**. Êtes-vous capable ? Pourquoi ?

---
#### Exercice 3 - Exécution de commandes avec Sudo

1. Fermez le terminal shell et ouvrez un nouveau.

2. Basculez vers l'utilisateur **sysadmin1** en utilisant son mot de passe **redhat**.

3. Essayez d'exécuter la comamnde **sudo cat /etc/shadow**. Êtes-vous capable ? Pourquoi ?

4. Basculez vers l'utilisateur **root** en utilisant le mot de passe **420!lnp4ss**.

5. Attribuez au groupe **groupesysadmin** le pouvoir d'utiliser la comamnde **sudo**.

6. Basculez encore une fois vers l'utilisateur **sysadmin1**.

7. Essayez d'exécuter la comamnde **sudo cat /etc/shadow**. Vous devez réussir maintenant d'exécuter cette comamnde.

