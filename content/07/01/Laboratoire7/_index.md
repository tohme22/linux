---
title: "Laboratoire 7"
description: "linux"
draft: false
weight: 2
---

## Laboratoire 7 - Gestion des permissions du système de fichiers

> **Note : Le laboratoire 6.2 est prérequis pour ce laboratoire.**

Connectez-vous à la VM.

##### Étape 1: 

Création d'un repértoire partagé par le groupe **admins** :

1. Basculez vers l'utilisateur **root** en utilisant **420!lnp4ss** comme mot de passe.

2. Créez le répertoire **/home/admins**.

3. Transférez la propriété du groupe du répertoire **/home/admins** au groupe **admins**.

4. Vérifiez que le groupe **admins** est devenu le groupe propriétaire sur le répertoire **/home/admins**.

5. Ajoutez la permission d'écriture au groupe **admins** sur le répertoire **/home/admins**. Vérifiez que la permission est bien ajoutée.

6. Interdisez aux autres d'accéder aux fichiers du répertoire **/home/admins**. Vérifiez que les permissions sont bien modifiées.


##### Étape 2: 

Test l'accès au nouveau repértoire par les membres du groupe **admins** :

7. Quittez le shell root et basculez vers l'utilisateur **admin1**. Le mot de passe est **redhat**.

8. Accédez au répertoire **/home/admins** et créez un fichier appelé **admin1.txt**.

9. Listez le propriétaire et le groupe propriétaire de ce nouveau fichier **admin1.txt**.

10. Basculez vers l'utilisateur **admin2**. Le mot de passe est **redhat**.

11. Accéder au répertoire **/home/admins**. Utilisez la commande **echo** pour ajouter du texte au fichier **admin1.txt**.

12. Listez le contenu du fichier **admin1.txt** pour vérifier que le texte a été ajouté.

13. Est-ce que **admin2** est capable d'ajouter du texte dans ce fichier, et pourquoi?

14. Quittez le shell.
