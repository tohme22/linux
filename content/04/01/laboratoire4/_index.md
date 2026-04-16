---
title: "Laboratoire 4"
description: "linux"
draft: false
weight: 2
---
### Laboratoire 4 - Lecture des pages de manuel

Au cours de ce laboratoire, vous allez vous entraîner à utiliser le système manuel Linux man et trouver des informations utiles par la recherche et la navigation.

1. Sur votre VM, copiez le fichier **/etc/services** vers votre répertoire personnel**/home/e1234567/services**.

2. Affichez la page de manuel **gedit**. Affichez les options permettant de modifier un fichier spécifique en utilisant gedit à partir de la ligne de commande.

    Utilisez l’une des options de la page de manuel **gedit** pour ouvrir le fichier **/home/e1234567/services** en utilisant **gedit** avec le curseur à la fin du fichier.

    2.1 Affichez la page de manuel gedit.

    2.2 Dans la page de manuel **gedit**, découvrez les options permettant de modifier un fichier spécifique à partir de la ligne de commande.

     Appuyez sur q pour quitter la page de manuel.

    2.3 Utilisez la commande **gedit +** pour ouvrir le fichier **/home/e1234567/services**. Le numéro de ligne manquant à côté de l'option **+** ouvre un fichier passé en tant qu'argument avec le curseur à la fin de la dernière ligne.

     Confirmez que le fichier est ouvert avec le curseur à la fin du fichier de la dernière ligne du fichier. Appuyez sur **Ctrl+q** pour fermer l'application. 

3. Lisez la page de manuel **su(1)**.

   Quand **user** est omis, la commande **su** suppose que l'utilisateur est root. Si la commande **su** est suivie d'un tiret unique **(-)**, il commence un shell de connexion enfant. Sans le tiret simple, un shell enfant sans connexion est créé, correspondant à l'environnement actuel de l'utilisateur.

   Appuyez sur **q** pour quitter la page de manuel.

4. La commande **man** dispose également de ses propres pages de manuel.

    Appuyez sur **q** pour quitter la page de manuel.

5. Toutes les pages de manuel sont situées dans **/usr/share/man**. Localisez les pages binaires, source et de manuel situées dans le répertoire **/usr/share/man** à l'aide de la commande **whereis**.

6. Tapez la commande **sudo mandb -c** pour générer un index des recherches par mot-clé.

7. Utilisez la commande **man -k zip** pour lister des informations détaillées sur une archive Zip.

8. Utilisez la commande **man -k boot** pour lister la page de manuel contenant une liste des paramètres qui peuvent être transmis au noyau lors du démarrage.

9. Utilisez **man -k ext4** pour recherche la commande utilisée pour ajuster les paramètres du système de fichiers ext4.

