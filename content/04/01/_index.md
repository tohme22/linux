---
title: "Aide dans Linux"
description: "linux"
draft: false
weight: 1
---
## Lecture des pages de manuel

### Présentation de la commande du manuel

Parmi les sources de documentation généralement disponibles sur le système local figurent les pages de manuel du système ou pages de manuel. Ces pages font partie des packages logiciels pour lesquels elles fournissent de la documentation. Vous pouvez y accéder à partir de la ligne de commande à l'aide de la commande `man`.

Le manuel historique du programmeur Linux, duquel proviennent les pages de manuel, était suffisamment épais pour constituer plusieurs parties. Chaque section contient des informations sur un sujet particulier.

|Section|Type de contenu|
|---|---|
|1|Commandes de l'utilisateur (programmes exécutables et shell)|
|2|Appels au système (routines du noyau appelées depuis l'espace utilisateur)|
|3|Fonctions des bibliothèques (fournies par les bibliothèques des programmes)|
|4|Fichiers spéciaux (tels que les fichiers de périphérique)|
|5|Formats de fichier (pour de nombreux fichiers et structures de configuration)|
|6|Jeux (section historique pour les programmes de divertissement)|
|7|Conventions, normes et divers (protocoles, systèmes de fichiers)|
|8|Administration du système et commandes privilégiées (tâches de maintenance)|
|9|API du noyau Linux (appels internes au noyau)|

Afin de distinguer des noms de rubriques identiques dans des sections différentes, les références de pages de manuel sont suivies du numéro de section entre parenthèses après la rubrique. Par exemple, `passwd(1)` décrit la commande pour modifier les mots de passe, tandis que `passwd(5)` explique le format du fichier `/etc/passwd` qui stocke les comptes d'utilisateurs locaux.

Pour afficher des pages de manuel spécifiques, utilisez la commande `man topic`. Le contenu s'affiche écran par écran. La commande `man` recherche les sections du manuel par ordre alphanumérique. Par exemple, la commande `man passwd` affiche `passwd(1)` par défaut. Pour afficher la rubrique de la page de manuel d'une section spécifique, ajoutez en argument le numéro de section : `man 5 passwd` affiche `passwd(5)`.

### Navigation et recherche dans les pages de manuel

La capacité à rechercher efficacement des rubriques et à naviguer dans les pages du manuel est une compétence administrative essentielle. Les outils d'interface graphique facilitent la configuration des ressources système courantes, mais l'interface de ligne de commande est encore plus efficace. Pour naviguer efficacement dans la ligne de commande, vous devez pouvoir trouver les informations dont vous avez besoin dans les pages de manuel.

Le tableau suivant liste les commandes de navigation basiques lors de la visualisation des pages de manuel :

|Commande|	Résultat|
|---|---|
|`Barre d'espace`|	Faire défiler d'un écran (vers le bas)|
|`Page suivante`|	Faire défiler d'un écran (vers le bas)|
|`Page précédente`|	Faire défiler d'un écran (vers le haut)|
|`Flèche vers le bas`|	Faire défiler d'une ligne (vers le bas)|
|`Flèche vers le haut`|	Revenir à la ligne précédente (vers le haut)|
|`D`|	Faire défiler d'un demi-écran (vers le bas)|
|`U`|	Revenir au demi-écran précédent (vers le haut)|
|`/chaîne de caractères`|	Rechercher (vers le bas) la chaîne de caractères suivante dans la page de manuel|
|`N`|	Répéter la recherche précédente vers l'avant (vers le bas) dans la page de manuel|
|`Maj+N`|	Répéter la recherche précédente vers l'arrière (vers le haut) de la page de manuel|
|`G`|	Aller au début de la page de manuel|
|`Maj+G`|	Aller à la fin de la page de manuel|
|`Q`|	Quitter man et revenir à l'invite du shell de commande|

> **Important** : Pendant les recherches, la chaîne de caractères autorise la syntaxe des expressions régulières. Alors qu'un texte simple (tel que `passwd`) fonctionne comme on pourrait s'y attendre, les expressions régulières utilisent des métacaractères (comme `$`, `\*`, `.` et `^`) pour un filtrage par motif plus sophistiqué. Par conséquent, la recherche de chaînes de caractères qui peuvent inclure des métacaractères d'expressions de programme, comme `make $$$`, peut renvoyer des résultats inattendus.


### Lecture des pages de manuel

Chaque rubrique est séparée en plusieurs parties. La plupart des rubriques partagent les mêmes titres et sont présentées dans le même ordre. Généralement, une rubrique ne comporte pas tous les titres, car tous ne s'appliquent pas à toutes les rubriques.

Les titres courants sont :

|Titre	|Description|
|---|---|
|NAME	|Nom du sujet. Généralement, une commande ou un nom de fichier. Description très brève.|
|SYNOPSIS	|Résumé de la syntaxe de la commande.|
|DESCRIPTION	|Description détaillée permettant d'offrir une connaissance basique du sujet.|
|OPTIONS	|Explication des options d'exécution de la commande.|
|EXAMPLES	|Exemples d'utilisation de la commande, de la fonction ou du fichier.|
|FILES	|Liste de fichiers et de répertoires liés à la page de manuel.|
|SEE ALSO	|Informations connexes, généralement d'autres rubriques de pages de manuel.|
|BUGS	|Bogues connus dans le logiciel.|
|AUTHOR	|Informations sur les personnes ayant contribué au développement de la rubrique.|

### Recherche dans les pages de manuel par mot-clé

On lance une recherche par mot-clé dans les pages de manuel avec `man -k keyword` qui affiche une liste de rubriques de pages de manuel correspondant au mot-clé avec leurs numéros de section.

```cmd
[student@desktopX ~]$ man -k passwd
checkPasswdAccess (3) - query the SELinux policy database in the kernel.
chpasswd (8)          - update passwords in batch mode
ckpasswd (8)          - nnrpd password authenticator
fgetpwent_r (3)       - get passwd file entry reentrantly
getpwent_r (3)        - get passwd file entry reentrantly
...
passwd (1)            - update user's authentication tokens
sslpasswd (1ssl)      - compute password hashes
passwd (5)            - password file
passwd.nntp (5)       - Passwords for connecting to remote NNTP servers
passwd2des (3)        - RFS password encryption
...
```

Les rubriques d'administration du système les plus populaires se trouvent dans les sections 1 (commandes utilisateur), 5 (formats de fichiers) et 8 (commandes administratives). Les administrateurs qui utilisent certains outils de résolution de problème utilisent également la section 2 (appels système). Les sections restantes sont généralement des références pour les programmeurs ou pour une administration avancée.

> **Note** : Les recherches par mot-clé s'appuient sur un index généré par la commande `mandb(8)` qui doit être exécutée en tant que root. La commande est lancée quotidiennement via le fichier `cron.daily` ou par `anacrontab` dans l'heure qui suit le démarrage si le fichier est obsolète.

> **Important**: L'option `-K` (majuscule) de la commande man effectue une recherche par page en texte intégral, et non pas sur les seuls titres et descriptions comme l'option `-k`. Une recherche en texte intégral utilise plus de ressources système et prend plus de temps.