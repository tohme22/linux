---
title: "Laboratoire 5.1"
description: "linux"
draft: false
weight: 2
---
### Laboratoire 5.1 - Redirection de la sortie vers un fichier

Dans ce laboratoire, vous allez réaliser les tâches suivantes :
- Rediriger de la sortie vers un fichier.
- Construire de pipelines.
- Utiliser la commande tee.

Connectez-vous à la VM.

1. Comptez le nombre de lignes du fichier **/etc/passwd** de deux manières : en utilisant une seule commande qui prend le nom du fichier en argument, puis en utilisant deux commandes avec le pipe. Que constatez-vous ?

2. Utilisez la commande **echo** pour créer le fichier **/tmp/ficecho** et écrire quelques mots dedans.

3. Utilisez la commande **echo**  pour ajouter quelques mots au fichier **/tmp/ficecho** existant.

4. Utilisez la commande **cat** pour concaténer le contenu des fichiers **/tmp/ficecho** et **/etc/hosts** dans le fichier **/tmp/ficcat**.

5. Allez dans le répertoire **/etc** et redirigez la sortie de la commande **ls** dans le fichier **/tmp/ls.out**. Que contient ce fichier ?

6. Comptez le nombre de fichiers présents dans le répertoire **/etc** en utilisant deux commandes avec le pipe.

7. En employant un pipe, comptez de nouveau le nombre de fichiers présents dans le répertoire **/etc**, tout en écrivant le résultat de la commande dans le fichier **/tmp/ls.out** et l’affichant aussi sur la sortie standard.

8. Exécutez la commande **ls /etc/passwd glop** en redirigeant les sorties dans le fichier **/tmp/ls.out** et les messages d’erreur dans le fichier **/tmp/ls.err**. *Le répertoire **glob** n’existe pas et vous n’êtes pas tenu de le créer*

9. Exécutez la commande **ls /etc/passwd glop**  en redirigeant les sorties dans le fichier **/tmp/ls.out** et en supprimant les messages d’erreur.

10. Exécutez la commande **ls /etc/passwd glop**  en redirigeant les sorties et les messages d’erreur dans le fichier **/tmp/ls.out**.

11. Affichez **uniquement** le nombre de fichiers nommés **passwd** qui existent dans l’arborescence de **/etc**. 
