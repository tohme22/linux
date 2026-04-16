---
title: "Laboratoire 6.2"
description: "linux"
draft: false
weight: 4
---

## Laboratoire 6.2 - Gestion des utilisateurs et des groupes

Dans ce laboratoire, vous allez réaliser les tâches suivantes :
- Créer plusieurs utilisateurs sur votre système et définir des mots de passe.
- Créer des groupes, les utiliser en tant que groupes supplémentaires.

Connectez-vous à la VM.

##### Étape 1: Gestion des comptes d'utilisateur locaux:

1.1 Basculez vers l'utilisateur **root** en utilisant **sudo su -** et votre mot de passe, ce qui permet d'hériter de l'environnement complet de l'utilisateur root.

1.2 Créez l'utilisateur **admin1**.

1.3 Confirmez qu'il est bien créé.

1.4 Définissez le mot de passe de l'utilisateur **admin1**  sur **redhat**.

1.5 Créez les utilisateurs supplémentaires **admin2**  et **admin3**.

1.6 Confirmez qu'ils sont bien créés.

1.7 Définissez les mot de passe de **admin2**  et **admin3** sur **redhat**.

1.8 Mettez à jour les comptes d'utilisateur **admin1**  et **admin2**  afin d'y inclure les commentaires **Admin un**  et **Admin deux** , respectivement. 

1.9 Vérifiez que les commentaires ont été correctement ajoutés.

1.10 Supprimez l'utilisateur **admin3** ainsi que toutes ses données personnelles. 

1.11 Confirmez que l'utilisateur a bien été supprimé.

##### Étape 2: Gestion des comptes de groupes locaux:

2.1 Créez le groupe supplémentaire **admins** avec le GID « **30000** ».

2.2 Créez un autre groupe supplémentaire **directeurs**.

2.3 Vérifiez que les deux groupes **admins** et **directeurs** sont bien créés.

2.4 Ajoutez **admin1** et **admin2** à **admins**.

2.5 Confirmez que les deux utilisateurs ont bien été ajoutés au groupe.

2.6 Modifiez le fichier **visudo** de telle sorte que les membres du groupe **admins** disposent de tous les privilèges administratifs.

2.7 Basculez vers **admin1** avec la commande **su -**

2.8 Exécutez la commande **sudo cat /etc/shadow**. Est-ce que **admin1** peut exécuter cette commande, et pourquoi?

2.9 Quittez le shell de l'utilisateur **admin1** pour revenir au shell **root** de l'utilisateur.

2.10 Supprimer le groupe **directeurs**.

2.11 Quittez le shell de l'utilisateur **root** pour revenir au shell de votre utilisateur personnel.

