---
title: "Laboratoire 6.1"
description: "linux"
draft: false
weight: 2
---
#### Laboratoire 6.1 - Accès en tant que super utilisateur

Dans ce laboratoire, vous allez réaliser les tâches suivantes :
- Utiliser sudo pour basculer vers root et accéder au shell interactif en tant que root sans connaître le mot de passe du super utilisateur.
- Expliquer comment su et su - peuvent affecter l'environnement shell en exécutant ou non les scripts de connexion.
- Utiliser sudo pour exécuter d'autres commandes en tant que root.

Connectez-vous à la VM.

##### Étape 1:
Dans cette étape, vous allez explorer l'environnement shell de votre utilisateur, afficher les informations relatives à l'utilisateur et au groupe, et le répertoire de travail actuel. Afficher également les variables d'environnement qui spécifient le répertoire personnel de l'utilisateur et les emplacements
des exécutables de l'utilisateur:

&nbsp; &nbsp; 1.1. Exécutez une commande pour afficher les informations sur l'utilisateur et le groupe actuels.

&nbsp; &nbsp; 1.2. Exécutez une commande pour afficher le répertoire de travail courant.

&nbsp; &nbsp; 1.3. Afficher les valeurs des variables `HOME` et `PATH` pour déterminer le chemin du répertoire personnel et des exécutables de l'utilisateur, respectivement.

##### Étape 2:
Dans cette étape, vous allez basculer vers l'utilisateur `root` dans un **shell sans connexion**, en utilisant le mot de passe `420!lnp4ss`, et explorer le nouvel environnement shell:

&nbsp; &nbsp; 2.1. Exécutez une commande à l'invite du shell pour devenir l'utilisateur `root`, dans un **shell sans connexion**.

&nbsp; &nbsp; 2.2. Exécutez une commande pour afficher les informations sur l'utilisateur et le groupe actuels.

&nbsp; &nbsp; 2.3. Exécutez une commande pour pour afficher le répertoire de travail courant.

&nbsp; &nbsp; 2.4. Afficher les valeurs des variables `HOME` et `PATH` pour déterminer le chemin du répertoire personnel et des exécutables de l'utilisateur, respectivement.

&nbsp; &nbsp; 2.5. Quittez le shell de l'utilisateur `root` pour revenir au shell de votre utilisateur.

##### Étape 3:
Dans cette étape, vous allez basculez vers `root` dans un **shell de connexion**, en utilisant le mot de passe `420!lnp4ss`, et explorer le nouvel environnement shell:

&nbsp; &nbsp; 3.1. Exécutez une commande à l'invite du shell pour devenir l'utilisateur `root`, dans un **shell de connexion**.

&nbsp; &nbsp; 3.2. Exécutez une commande pour afficher les informations sur l'utilisateur et le groupe actuels.

&nbsp; &nbsp; 3.3. Exécutez une commande pour pour afficher le répertoire de travail courant.

&nbsp; &nbsp; 3.4. Afficher les valeurs des variables `HOME` et `PATH` pour déterminer le chemin du répertoire personnel et des exécutables de l'utilisateur, respectivement.

&nbsp; &nbsp; 3.5 Quelle est la différence entre la valeur de la variable `PATH` de la question `2.4` et `3.4`? Et pourquoi?

&nbsp; &nbsp; 3.6 Quittez le shell de l'utilisateur `root` pour revenir au shell de votre utilisateur.

##### Étape 4:
Dans cette étape, vous allez apprendre à changer de compte d’utilisateur:

&nbsp; &nbsp; 4.1 À partir de votre terminal shell actuel, basculer vers le compte d'utilisateur `etudiantadmin` en utilisant le mot de passe `420!lnp4ss`.

&nbsp; &nbsp; 4.2. Essayez d'afficher les cinq dernières lignes de `/var/log/messages`. Est-ce que cette opération échoue ou réussie? Et pourquoi?

&nbsp; &nbsp; 4.3 Essayez d'afficher encore une fois les cinq dernières lignes de `/var/log/messages` avec `sudo`. Est-ce que cette opération échoue ou réussie? Et pourquoi?

&nbsp; &nbsp; 4.4. Essayez de faire une copie de `/etc/motd` comme `/etc/motdOLD`. Est-ce que cette opération échoue ou réussie? Et pourquoi?

&nbsp; &nbsp; 4.5. Essayez de faire encore une fois une copie de `/etc/motd` comme `/etc/motdOLD` avec `sudo`. Est-ce que cette opération échoue ou réussie? Et pourquoi?

&nbsp; &nbsp; 4.6. Essayez de supprimer `/etc/motdOLD`. Est-ce que cette opération échoue ou réussie? Et pourquoi?

&nbsp; &nbsp; 4.7. Essayez de supprimer encore une fois `/etc/motdOLD` avec `sudo`. Est-ce que cette opération échoue ou réussie? Et pourquoi?

&nbsp; &nbsp; 4.8. Quittez le shell de l'utilisateur `etudiantadmin` pour revenir au shell de votre utilisateur.
