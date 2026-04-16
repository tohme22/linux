---
title: "Laboratoire 3.1"
description: "linux"
draft: false
weight: 2
---
## Laboratoire 3.1 -  Gestion des fichiers à l'aide des outils de ligne de commande

### Liste de contrôle des performances

Dans ce laboratoire, vous allez créer, organiser, copier et supprimer des fichiers et des répertoires.

### Résultats

Vous devez pouvoir créer, organiser, copier et supprimer des fichiers et des répertoires.

1. À partir du répertoire personnel de votre utilisateur, vérifiez que vous avez ces trois répertoires:`Music, Pictures et Videos`, si non, utilisez la commande `mkdir` pour les créez.

2. Toujours dans le répertoire personnel de votre utilisateur, utilisez la commande `touch` pour créer des ensembles de fichiers d'exercices pratiques vides à utiliser pendant ce laboratoire.

- Créez six fichiers avec des noms du type `songX.mp3`.

- Créez six fichiers avec des noms du type `snapX.jpg`.

- Créez six fichiers avec des noms du type `filmX.avi`.

Dans chaque ensemble, remplacez X par les chiffres de 1 à 6.

3. Toujours à partir du répertoire personnel de votre utilisateur, déplacez les fichiers de musique dans le sous-répertoire Music, les fichiers de captures d’écran dans le sous-répertoire Pictures et les fichiers de films dans le sous-répertoire Videos.

Lorsque vous organisez des fichiers depuis un emplacement unique vers plusieurs emplacements, commencez par ouvrir le répertoire qui contient les fichiers sources. Utilisez la syntaxe de chemin la plus simple, absolue ou relative, pour atteindre la destination de chaque tâche de gestion de fichiers.

4. Dans le répertoire personnel de votre utilisateur créez deux sous-répertoires `friends` et `family` pour organiser vos fichiers en projets.

Utilisez une seule commande pour créer les deux sous-répertoires en même temps.

5. Copiez les fichiers (tous types) contenant les numéros 1 et 2 dans le sous-répertoire `friends`. Copiez les fichiers (tous types) contenant les numéros 3 et 4 dans le sous-répertoire `family`. Pour chaque projet, commencez par ouvrir le répertoire du projet, puis copiez les fichiers sources dans ce répertoire. N'oubliez pas que vous effectuez des copies. Par conséquent, les fichiers d'origine resteront dans leur emplacement d'origine une fois les fichiers copiés dans les répertoires de projets.

6. Vos tâches de projets sont maintenant terminées et il est temps de nettoyer les projets.

Ouvrez le répertoire personnel de votre utilisateur. Essayez de supprimer les projets `family` et `friends` avec une seule commande `rmdir`.

L'utilisation de la commande rmdir doit échouer, car les deux sous-répertoires contiennent des fichiers.

7. Utilisez la commande `rm -r` pour supprimer de manière récursive les sous-répertoires family et friends, et leur contenu.