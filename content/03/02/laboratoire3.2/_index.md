---
title: "Laboratoire 3.2"
description: "linux"
raft: false
weight: 4
---

## Laboratoire 3.2 - Gestion de fichiers à partir de la ligne de commande

Dans ce laboratoire, vous allez créer, déplacer et supprimer des fichiers et des répertoires de manière efficace en utilisant le shell et diverses techniques de correspondance de noms de fichiers.

Vous devez pouvoir réaliser les tâches suivantes :

- Utiliser des caractères génériques pour localiser et manipuler des fichiers. 

1. Avant de créer des fichiers de projet, utilisez la commande `mkdir` pour créer le répertoire de planification de projet`/home/&lt;e1234567&gt;/Documents/project_plans`. ( Conseil : si `~/Documents` n'existe pas, l'option `-p` pour la commande `mkdir` le crée.)

Utilisez la commande `touch` avec expansion par accolades pour créez deux fichiers vides dans le répertoire `~/Documents/project_plans` : `season1_project_plan.odf` et `season2_project_plan.odf`.

2. Créez des ensembles de fichiers vides à utiliser au cours de l'atelier. Utilisez la saisie semi-automatique par tabulation du shell pour trouver facilement le nom du chemin d'accès aux fichiers.

Créez un total de 12 fichiers appelés `tv_seasonX_episodeY.ogg`. Remplacez X par le numéro de la saison et Y par le numéro de l'épisode, pour deux saisons de six épisodes chacune.

3. En tant qu'auteur d'une série de romans policiers à succès, les chapitres de votre prochain bestseller sont en cours d'édition avant publication. Créez un total de huit fichiers appelés `mystery_chapterX.odf`. Remplacez X par les chiffres de 1 à 8.

4. Utilisez la commande unique pour créer deux sous-répertoires nommés `season1` et `season2` dans le répertoire `Videos` pour organiser les épisodes télévisés.

5. Déplacez les épisodes télévisés appropriés vers les sous-répertoires des saisons. N'utilisez que deux commandes qui spécifient les destinations avec une syntaxe relative.

6. Créez une hiérarchie de répertoires à deux niveaux avec une seule commande pour organiser les chapitres du roman policier. Créez `my_bestseller` sous le répertoire `Documents`, et `chapters` sous le nouveau répertoire `my_bestseller`.

7. Créez trois sous-répertoires supplémentaires directement dans le répertoire `my_bestseller` en utilisant une seule commande. Nommez ces sous-répertoires `editor`, `changes` et `vacation`. L'option `-p` (create parents) est inutile, puisque le répertoire parent my_bestseller existe déjà.

8. Choisissez le répertoire chapters. En utilisant le raccourci vers le répertoire personnel tilde (`~`) pour spécifier les fichiers sources, déplacez tous les chapitres du livre dans le répertoire chapters, qui est désormais votre répertoire courant. Quelle est la syntaxe la plus simple pour spécifier le répertoire de destination ?

9. Vous avez envoyé les deux premiers chapitres à l'éditeur pour révision. Déplacez uniquement ces deux chapitres dans le répertoire `editor` pour éviter de les modifier lors de la révision. À partir du sous-répertoire `chapters`, utilisez l'extension par accolades avec une plage pour spécifier les noms de fichiers de chapitres à déplacer et un chemin relatif pour le répertoire de destination.

10. Lors de vos congés, vous avez l'intention d'écrire les chapitres 7 et 8. Utilisez une seule commande pour déplacer les fichiers du répertoire chapters dans le répertoire vacation. Spécifiez les noms de fichiers de chapitres en utilisant l'extension par accolades avec une liste de chaînes et sans utiliser de caractères génériques.

11. Choisissez le répertoire de travail `~/Videos/season2`, puis copiez le premier épisode de la saison dans le répertoire vacation.

12. Utilisez la commande cd unique pour changer votre répertoire de travail par le répertoire `~/Documents/my_bestseller/vacation`. Listez ses fichiers. Utilisez l'argument du répertoire de travail précédent pour revenir au répertoire season2. ( Cette action fonctionnera si le dernier changement de répertoire avec la commande `cd` a été accompli avec une commande plutôt que plusieurs commandes `cd`.) À partir du répertoire `season2`, copiez le fichier de l'épisode 2 dans le répertoire vacation. Utilisez à nouveau le raccourci pour revenir au répertoire vacation.

13. Les auteurs des chapitres 5 et 6 veulent expérimenter d'éventuels changements. Copiez les deux fichiers du répertoire `~/Documents/my_bestseller/chapters` dans le répertoire `~/Documents/my_bestseller/changes` pour éviter que ces changements ne modifient les fichiers d'origine. Accédez au répertoire `~/Documents/my_bestseller`. Utilisez le filtrage par motif entre crochets pour spécifier les numéros de chapitre à rechercher dans l'argument de nom de fichier de la commande `cp`.

14. Changez le répertoire courant par le répertoire `changes`.

Utilisez la commande `date +%F` avec substitution de commande pour copier `mystery_chapter5.odf` dans un nouveau fichier qui inclut la date complète. Le nom doit avoir la forme `mystery_chapter5_YYYY-MM-DD.odf`.

Effectuez une autre copie de `mystery_chapter5.odf` et ajoutez l'horodatage actuel (sous la forme du nombre de secondes écoulées depuis l'époque, 1970-01-01 00:00 UTC) pour garantir un nom de fichier unique. Utilisez la substitution de commande avec la commande date `+%s` pour accomplir cela.

15. Après un examen plus approfondi, vous décidez que les modifications de l'intrigue ne sont pas nécessaires. Supprimez le répertoire `changes`.

Si nécessaire, accédez au répertoire `changes` et supprimez tous les fichiers du répertoire. Vous ne pouvez pas supprimer un répertoire tant qu'il s'agit du répertoire de travail actuel. Choisissez le répertoire parent du répertoire changes. Essayez de supprimer le répertoire vide en utilisant la commande `rm` sans l'option récursive `-r`. Cette tentative devrait échoue. Enfin, utilisez la commande rmdir pour supprimer le répertoire vide, ce qui doit fonctionner.

16. Une fois les vacances terminées, le répertoire vacation devient inutile. Supprimez-le en utilisant la commande `rm` avec l'option récursive.

Une fois l'opération terminée, revenez au répertoire personnel de l'utilisateur.


