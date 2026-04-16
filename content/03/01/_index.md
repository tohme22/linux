---
title: "Gestion des fichiers 1/2"
description: "linux"
draft: false
weight: 1
---

## Description des concepts de hiérarchie du système de fichiers Linux 

### Hiérarchie du système de fichiers

Tous les fichiers d'un système Linux sont stockés sur des systèmes de fichiers organisés dans une arborescence de répertoires inversée unique appelée hiérarchie du système de fichiers. On dit que cette arborescence est inversée, car sa racine se trouve en haut de la hiérarchie, et les branches des répertoires et sous-répertoires s'étendent sous la racine.

![HTTP](../../images/3-1.png?height=300&classes=border,shadow,inline)

 Le répertoire ```/``` est le répertoire racine situé au sommet de la hiérarchie du système de fichiers. Le caractère ```/``` est également utilisé comme séparateur de répertoires dans les noms de fichiers. Par exemple, si etc est un sous-répertoire du répertoire ```/```, vous pouvez faire référence à ce fichier sous le nom ```/etc```. De même, si le répertoire ```/etc``` contient un fichier nommé issue, vous pouvez faire référence à ce fichier sous le nom ```/etc/issue```.

Les sous-répertoires de ```/``` sont utilisés à des fins de standardisation, pour organiser les fichiers par type et par utilisation. Cela facilite la recherche des fichiers. Par exemple, dans le répertoire racine (root), le sous-répertoire /boot est utilisé pour le stockage des fichiers nécessaires pour démarrer le système. 

Note

Les termes suivants aident à décrire le contenu du répertoire du système de fichiers :

- statique : le contenu reste inchangé jusqu'à ce qu'il soit explicitement modifié ou reconfiguré.

- dynamique ou variable : le contenu est généralement modifié ou complété par des processus actifs.

- persistant : contenu qui persiste après un redémarrage, en particulier les paramètres de configuration.

- exécution : le contenu est un contenu spécifique au processus ou au système supprimé lors d'un redémarrage. 

Le tableau ci-dessous répertorie certains des répertoires les plus importants du système par nom et par fonction. 

|Emplacement|Objectif|
|---|---|
|```/usr```|Logiciels installés, bibliothèques partagées, y compris les fichiers, et données des programmes, en lecture seule. Parmi les sous-répertoires importants figurent : <br>- ```/usr/bin``` : commandes utilisateur.<br>- ```/usr/sbin``` : commandes d'administration système. <br>- ```/usr/local``` : logiciels personnalisés localement. |
|```/etc```|Fichiers de configuration spécifiques à ce système. | 
|```/var```|Données variables spécifiques à ce système, qui doivent persister d'un démarrage à l'autre. Les fichiers qui changent de manière dynamique, tels que les bases de données, les répertoires cache, les fichiers journaux, les documents du spool d'impression, le contenu des sites Web se trouvent dans ```/var```. |
|```/run```|Données d'exécution des processus démarrés depuis le dernier démarrage. Cela comprend les fichiers d'identification et de verrouillage des processus, entre autres. Le contenu de ce répertoire est recréé au redémarrage. Ce répertoire consolide ```/var/run``` et ```/var/lock``` des versions antérieures de Red Hat Enterprise Linux.| 
|```/home```|Répertoires personnels où les utilisateurs standard stockent leurs données personnelles et leurs fichiers de configuration.|
|```/root```|Répertoire personnel du super utilisateur administratif, root.|
|```/tmp```|Espace ouvert à tous pour les fichiers temporaires. Les fichiers qui n'ont pas été ouverts, changés ou modifiés depuis 10 jours sont automatiquement supprimés de ce répertoire. Il existe un autre répertoire temporaire, ```/var/tmp```, dans lequel les fichiers qui n'ont pas été ouverts, changés ou modifiés depuis plus de 30 jours sont automatiquement supprimés.|   
|```/boot```|Fichiers nécessaires au lancement du processus de démarrage.|
|```/dev```|Contient les fichiers de périphériques spéciaux, utilisés par le système pour accéder au matériel.|  

### Quiz

<a href="https://www.menti.com">Cliquez pour faire le quiz</a>

## Spécification des fichiers par nom

### Objectifs

Après avoir terminé cette section, vous devez pouvoir spécifier l'emplacement des fichiers par rapport au répertoire de travail actuel et par emplacement absolu, déterminer et modifier le répertoire de travail et répertorier le contenu des répertoires. 

### Chemins absolus et relatifs

![HTTP](../../images/3-2.png?height=400&classes=border,shadow,inline)

 Le chemin d'un fichier ou d'un répertoire spécifie son emplacement unique au sein d'un système de fichiers. En suivant un chemin de fichier, on traverse un ou plusieurs sous-répertoires nommés, délimités par des barres obliques (/). Les répertoires, également appelés dossiers, contiennent d'autres fichiers et sous-répertoires. Ils peuvent être référencés de la même manière que les fichiers.

<div class="alert alert-warning" role=&quot;alert&quot;>
**Important**

Un caractère d'espacement est acceptable en tant que partie d'un nom de fichier Linux. Cependant, le shell utilise également des espaces pour séparer les options et les arguments sur la ligne de commande. Si vous entrez une commande qui inclut un fichier dont le nom contient un espace, le shell peut mal interpréter la commande et supposer que vous souhaitez démarrer un nouveau nom de fichier ou un autre argument sur cet espace.

Il est possible d'éviter cela en mettant les noms de fichiers entre guillemets. Toutefois, si vous n'avez pas besoin d'utiliser des espaces dans les noms de fichiers, vous pouvez simplement éviter de les utiliser.
</div>

#### Chemins absolus

Un chemin absolu est un nom complet, spécifiant l'emplacement exact des fichiers dans la hiérarchie du système de fichiers. Il commence au répertoire root (```/```) et spécifie chaque sous-répertoire à parcourir pour atteindre le fichier spécifique. Chaque fichier d'un système de fichiers possède un nom de chemin absolu unique, reconnaissable à une règle simple : un nom de chemin qui commence par une barre oblique (```/```) est un nom de chemin absolu. Par exemple, le nom de chemin absolu pour le fichier du journal des messages du système est ```/var/log/messages```. Comme les noms de chemins absolus peuvent être longs à taper, on peut aussi localiser les fichiers par rapport au répertoire de travail actuel de votre invite du shell.

#### Répertoire de travail actuel et chemins relatifs

Lorsqu'un utilisateur se connecte et ouvre une fenêtre de commande, l'emplacement initial est normalement son répertoire personnel. Les processus système ont également un répertoire initial. Les utilisateurs et les processus parcourent les répertoires au besoin ; les termes répertoire de travail ou répertoire de travail actuel font référence à leur emplacement actuel.

Tout comme un chemin absolu, un chemin relatif identifie un fichier unique, ne spécifiant que le chemin nécessaire pour atteindre le fichier depuis le répertoire de travail. L'identification des noms de chemins relatifs suit une règle simple : un nom de chemin qui commence par un caractère quelconque, autre que la barre oblique, est un nom de chemin relatif. Un utilisateur dans le répertoire ```/var``` pourrait se référer au fichier journal des messages de cette façon : ```log/messages```.

Les systèmes de fichiers Linux, y compris mais sans s'y limiter, ext4, XFS, BTRFS, GFS2 et GlusterFS, sont sensibles à la casse. Créer ```FileCase.txt``` et ```filecase.txt``` dans le même répertoire génère deux fichiers uniques.

Les systèmes de fichiers non-Linux peuvent fonctionner différemment. Par exemple, VFAT, NTFS de Microsoft et HFS+ d'Apple présentent un comportement de conservation de la casse. Bien que ces systèmes de fichiers ne soient pas sensibles à la casse, ils affichent les noms de fichiers avec la majuscule d'origine utilisée lors de la création du fichier. Par conséquent, si vous avez essayé de créer les fichiers de l'exemple précédent sur un système de fichiers VFAT, les deux noms seraient traités comme pointant vers le même fichier au lieu de deux fichiers différents.

### Chemins de navigation

La commande ```pwd``` affiche le nom de chemin complet du répertoire de travail actuel pour ce shell. Cela peut vous aider à déterminer la syntaxe pour accéder aux fichiers en utilisant des noms de chemin relatifs. La commande ls affiche la liste du contenu du répertoire spécifié ou, si aucun répertoire n'est indiqué, celle du répertoire actuel.

```cmd
[user@host ~]$ pwd
/home/user
[user@host ~]$ ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos
[user@host ~]$
```

Utilisez la commande ```cd``` pour changer le répertoire de travail actuel de votre shell. Si vous ne spécifiez aucun argument pour la commande, elle sera remplacée par votre répertoire de base.

Dans l’exemple suivant, un mélange de chemins absolus et relatifs est utilisé avec la commande cd pour modifier le répertoire de travail actuel du shell.

```cmd
[user@host ~]$ pwd
/home/user
[user@host ~]$ cd Videos
[user@host Videos]$ pwd
/home/user/Videos
[user@host Videos]$ cd /home/user/Documents
[user@host Documents]$ pwd
/home/user/Documents
[user@host Documents]$ cd
[user@host ~]$ pwd
/home/user
[user@host ~]$
```

Comme vous pouvez le voir dans l'exemple précédent, l'invite par défaut de shell affiche également le dernier composant du chemin absolu vers le répertoire de travail actuel. Par exemple, pour ```/home/user/Videos```, seul ```Videos``` est affiché. L'invite affiche le caractère tilde (```~```) lorsque votre répertoire de travail actuel est votre répertoire personnel.

Normalement, la commande ```touch``` met à jour l'horodatage d'un fichier à la date et à l'heure actuelles, sans rien y modifier. Cette commande est utile pour créer des fichiers vides, qui peuvent être utilisés pour des exercices pratiques, puisque l'exécution de la commande touch sur un nom de fichier qui n'existe pas entraîne la création de celui-ci. Dans l'exemple suivant, la commande touch crée des fichiers d'exercice pratique dans les sous-répertoires ```Documents``` et ```Videos```.

```cmd
[user@host ~]$ touch Videos/blockbuster1.ogg
[user@host ~]$ touch Videos/blockbuster2.ogg
[user@host ~]$ touch Documents/thesis_chapter1.odf
[user@host ~]$ touch Documents/thesis_chapter2.odf
[user@host ~]$
```

La commande ```ls``` comporte plusieurs options pour afficher les attributs des fichiers. Les options les plus courantes et les plus utiles sont ```-l``` (format de liste long), ```-a``` (tous les fichiers, y compris les fichiers cachés), et ```-R``` (récursif, pour inclure le contenu de tous les sous-répertoires).

```cmd
[user@host ~]$ ls -l
total 15
drwxr-xr-x.  2 user user 4096 Feb  7 14:02 Desktop
drwxr-xr-x.  2 user user 4096 Jan  9 15:00 Documents
drwxr-xr-x.  3 user user 4096 Jan  9 15:00 Downloads
drwxr-xr-x.  2 user user 4096 Jan  9 15:00 Music
drwxr-xr-x.  2 user user 4096 Jan  9 15:00 Pictures
drwxr-xr-x.  2 user user 4096 Jan  9 15:00 Public
drwxr-xr-x.  2 user user 4096 Jan  9 15:00 Templates
drwxr-xr-x.  2 user user 4096 Jan  9 15:00 Videos
[user@host ~]$ ls -la
total 15
drwx------. 16 user user   4096 Feb  8 16:15 .
drwxr-xr-x.  6 root root   4096 Feb  8 16:13 ..
-rw-------.  1 user user  22664 Feb  8 00:37 .bash_history
-rw-r--r--.  1 user user     18 Jul  9  2013 .bash_logout
-rw-r--r--.  1 user user    176 Jul  9  2013 .bash_profile
-rw-r--r--.  1 user user    124 Jul  9  2013 .bashrc
drwxr-xr-x.  4 user user   4096 Jan 20 14:02 .cache
drwxr-xr-x.  8 user user   4096 Feb  5 11:45 .config
drwxr-xr-x.  2 user user   4096 Feb  7 14:02 Desktop
drwxr-xr-x.  2 user user   4096 Jan  9 15:00 Documents
drwxr-xr-x.  3 user user   4096 Jan 25 20:48 Downloads
drwxr-xr-x. 11 user user   4096 Feb  6 13:07 .gnome2
drwx------.  2 user user   4096 Jan 20 14:02 .gnome2_private
-rw-------.  1 user user  15190 Feb  8 09:49 .ICEauthority
drwxr-xr-x.  3 user user   4096 Jan  9 15:00 .local
drwxr-xr-x.  2 user user   4096 Jan  9 15:00 Music
drwxr-xr-x.  2 user user   4096 Jan  9 15:00 Pictures
drwxr-xr-x.  2 user user   4096 Jan  9 15:00 Public
drwxr-xr-x.  2 user user   4096 Jan  9 15:00 Templates
drwxr-xr-x.  2 user user   4096 Jan  9 15:00 Videos
[user@host ~]$
```

Les deux répertoires spéciaux en début de liste font référence au répertoire courant (```.```) et au répertoire parent (```..```). Ces répertoires spéciaux existent dans chaque répertoire du système. Vous découvrirez leur utilité lorsque vous commencerez à utiliser les commandes de gestion de fichiers.

<div class="alert alert-warning" role=&quot;alert&quot;>
**Important**

Les noms de fichiers qui commencent par un point (```.```) désignent des fichiers cachés de la vue normale à l'aide de ls et d'autres commandes. Il ne s'agit pas d'une fonction de sécurité. Les fichiers cachés évitent que les fichiers de configuration nécessaires à l'utilisateur n'encombrent les répertoires personnels. De nombreuses commandes ne traitent les fichiers cachés qu'avec des options de ligne de commande, ce qui évite la copie accidentelle de la configuration d'un utilisateur vers d'autres répertoires ou utilisateurs.

Pour protéger la consultation indue du contenu d'un fichier, il faut recourir aux permissions de fichier.
</div>

```cmd
[user@host ~]$ ls -R
.:
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos

./Desktop:

./Documents:
thesis_chapter1.odf  thesis_chapter2.odf

./Downloads:

./Music:

./Pictures:

./Public:

./Templates:

./Videos:
blockbuster1.ogg  blockbuster2.ogg
[user@host ~]$
```

La commande ```cd``` comporte de nombreuses options. Quelques-unes sont suffisamment utiles pour qu'il vaille la peine de les maîtriser rapidement et les utiliser souvent. La commande ```cd -``` sert à passer du répertoire où se trouvait l'utilisateur avant au répertoire actuel. L'exemple suivant illustre ce comportement, en passant d'un répertoire à l'autre, ce qui est utile lors du traitement d'une série de tâches similaires.

```cmd
[user@host ~]$ cd Videos
[user@host Videos]$ pwd
/home/user/Videos
[user@host Videos]$ cd /home/user/Documents
[user@host Documents]$ pwd
/home/user/Documents
[user@host Documents]$ cd -
[user@host Videos]$ pwd
/home/user/Videos
[user@host Videos]$ cd -
[user@host Documents]$ pwd
/home/user/Documents
[user@host Documents]$ cd -
[user@host Videos]$ pwd
/home/user/Videos
[user@host Videos]$ cd
[user@host ~]$
```

La commande ```cd ..``` utilise le répertoire caché ```..``` pour passer au niveau supérieur, répertoire parent, sans avoir à connaître le nom exact du parent. L'autre répertoire caché (```.```) spécifie le répertoire courant pour les commandes dans lesquelles l'emplacement actuel constitue l'argument source ou de destination, ce qui évite d'avoir à saisir le nom de chemin absolu du répertoire.

```cmd
[user@host Videos]$ pwd
/home/user/Videos
[user@host Videos]$ cd .
[user@host Videos]$ pwd
/home/user/Videos
[user@host Videos]$ cd ..
[user@host ~]$ pwd
/home/user
[user@host ~]$ cd ..
[user@host home]$ pwd
/home
[user@host home]$ cd ..
[user@host /]$ pwd
/
[user@host /]$ cd
[user@host ~]$ pwd
/home/user
[user@host ~]$
```

### Quiz

<a href="https://www.menti.com">Cliquez pour faire le quiz</a>

## Gestion des fichiers à l'aide des outils de ligne de commande

### Objectifs

Après avoir terminé cette section, vous devez pouvoir créer, copier, déplacer et supprimer des fichiers et des sous-répertoires.

### Gestion des fichiers en ligne de commande

Pour gérer les fichiers, vous devez pouvoir les créer, les supprimer, les copier et les déplacer. Vous devez également les organiser logiquement dans des répertoires que vous devez également pouvoir créer, supprimer, copier et déplacer.

Le tableau suivant récapitule certaines des commandes de gestion de fichiers les plus courantes. Le reste de cette section traitera plus en détails des manières d'utiliser ces commandes.

|Activité|Syntaxe des commandes|
|---|---|
|Créer un répertoire| 	```mkdir directory```|
|Copier un fichier| 	```cp file new-file```|
|Copier un répertoire et son contenu| 	```cp -r directory new-directory```|
|Déplacer ou renommer un fichier ou un répertoire| 	```mv file new-file```|
|Supprimer un fichier| 	```rm file```|
|Supprimer un répertoire contenant des fichiers| 	```rm -r directory```|
|Supprimer un répertoire vide| 	```rmdir directory```|

#### Création de répertoires

La commande ```mkdir``` crée un ou plusieurs répertoires ou sous-répertoires. Elle prend comme arguments une liste de chemins d'accès aux répertoires que vous voulez créer.

La commande ```mkdir``` échouera avec une erreur si le répertoire existe déjà, ou si vous essayez de créer un sous-répertoire dans un répertoire qui n'existe pas. L'option ```-p``` (parent) crée les répertoires parents manquants pour la destination demandée. Utilisez la commande ```mkdir -p``` avec prudence, car des fautes de frappe accidentelles peuvent créer des répertoires non souhaités, sans pour autant générer de messages d'erreur.

Dans l’exemple suivant, supposons que vous essayez de créer un répertoire dans le répertoire Videos nommé Watched, mais que vous avez accidentellement oublié la lettre "s" dans ```Videos``` dans votre commande ```mkdir```.

```cmd
[user@host ~]$ mkdir Video/Watched
mkdir: cannot create directory 'Video/Watched': No such file or directory
```

La commande ```mkdir``` a échoué parce que le nom ```Videos``` a été mal orthographié et le répertoire Video n'existe pas. Si vous aviez utilisé la commande mkdir avec l'option ```-p```, le répertoire Video serait créé, ce qui n'était pas votre intention, et le sous-répertoire Watched serait créé dans ce répertoire incorrect.

Une fois le répertoire parent Videos correctement orthographié, la création du sous-répertoire ```Watched``` doit aboutir.

```cmd
[user@host ~]$ mkdir Videos/Watched
[user@host ~]$ ls -R Videos
Videos/:
blockbuster1.ogg  blockbuster2.ogg  Watched

Videos/Watched:

Dans l'exemple suivant, les fichiers et les répertoires sont organisés sous le répertoire /home/user/Documents. Utilisez la commande mkdir et une liste de noms de répertoire séparés par des espaces pour créer plusieurs répertoires.

[user@host ~]$ cd Documents
[user@host Documents]$ mkdir ProjectX ProjectY
[user@host Documents]$ ls
ProjectX  ProjectY
```

Utilisez la commande ```mkdir -p``` et des chemins relatifs de noms de sous-répertoires séparés par des espaces pour créer plusieurs répertoires parents contenant des sous-répertoires.

```cmd
[user@host Documents]$ mkdir -p Thesis/Chapter1 Thesis/Chapter2 Thesis/Chapter3
[user@host Documents]$ cd
[user@host ~]$ ls -R Videos Documents
Documents:
ProjectX  ProjectY  Thesis

Documents/ProjectX:

Documents/ProjectY:

Documents/Thesis:
Chapter1  Chapter2  Chapter3

Documents/Thesis/Chapter1:

Documents/Thesis/Chapter2:

Documents/Thesis/Chapter3:

Videos:
blockbuster1.ogg  blockbuster2.ogg  Watched

Videos/Watched:
```

La dernière commande ```mkdir``` a créé trois sous-répertoires ChapterN avec une seule commande. L'option ```-p``` a créé le répertoire parent manquant ```Thesis```.

#### Copie de fichiers

La commande ```cp``` copie un fichier et crée un fichier dans le répertoire actuel ou dans un répertoire spécifié. Elle peut également copier plusieurs fichiers dans un répertoire.

<div class="alert alert-danger" role=&quot;alert&quot;>
**Avertissement**

Si le fichier de destination existe déjà, la commande ```cp``` remplace le fichier.
</div>

```cmd
[user@host ~]$ cd Videos
[user@host Videos]$ cp blockbuster1.ogg blockbuster3.ogg
[user@host Videos]$ ls -l
total 0
-rw-rw-r--. 1 user user    0 Feb  8 16:23 blockbuster1.ogg
-rw-rw-r--. 1 user user    0 Feb  8 16:24 blockbuster2.ogg
-rw-rw-r--. 1 user user    0 Feb  8 16:34 blockbuster3.ogg
drwxrwxr-x. 2 user user 4096 Feb  8 16:05 Watched
[user@host Videos]$
```

Lors de la copie de plusieurs fichiers avec une seule commande, le dernier argument doit spécifier un répertoire. Les fichiers copiés conservent leur nom d'origine dans le nouveau répertoire. Si un fichier portant le même nom existe dans le répertoire cible, le fichier existant est remplacé. Par défaut, la commande ```cp``` ne copie pas les répertoires ; elle les ignore.

Dans l'exemple suivant, deux répertoires sont listés, ```Thesis``` et ```ProjectX```. Seul le dernier argument, ```ProjectX```, est valide en tant que destination. Le répertoire ```Thesis``` est ignoré.

```cmd
[user@host Videos]$ cd ../Documents
[user@host Documents]$ cp thesis_chapter1.odf thesis_chapter2.odf Thesis ProjectX
cp: omitting directory 'Thesis'
[user@host Documents]$ ls Thesis ProjectX
ProjectX:
thesis_chapter1.odf  thesis_chapter2.odf

Thesis:
Chapter1  Chapter2  Chapter3
```

Dans la première commande ```cp```, la copie du répertoire ```Thesis``` a échoué, mais la copie des fichiers ```thesis_chapter1.odf``` et ```thesis_chapter2.odf``` a fonctionné.

Si vous souhaitez copier un fichier dans le répertoire de travail actuel, vous pouvez utiliser le répertoire spécial ```.``` :

```cmd
[user@host ~]$ cp /etc/hostname .
[user@host ~]$ cat hostname
host.example.com
[user@host ~]$ 
```

Utilisez la commande de copie avec l'option ```-r``` (récursif) pour copier le répertoire Thesis et son contenu dans le répertoire ```ProjectX```.

```cmd
[user@host Documents]$ cp -r Thesis ProjectX
[user@host Documents]$ ls -R ProjectX
ProjectX:
Thesis  thesis_chapter1.odf  thesis_chapter2.odf

ProjectX/Thesis:
Chapter1  Chapter2  Chapter3

ProjectX/Thesis/Chapter1:

ProjectX/Thesis/Chapter2:
thesis_chapter2.odf

ProjectX/Thesis/Chapter3:
```

#### Déplacement des fichiers

La commande ```mv``` déplace les fichiers d'un emplacement à un autre. Si vous considérez le chemin absolu d'un fichier comme son nom complet, déplacer un fichier équivaut en fait à renommer un fichier. Le contenu du fichier reste inchangé.

Utilisez la commande ```mv``` pour renommer un fichier.

```cmd
[user@host Videos]$ cd ../Documents
[user@host Documents]$ ls -l thesis*
-rw-rw-r--. 1 user user 0 Feb  6 21:16 thesis_chapter1.odf
-rw-rw-r--. 1 user user 0 Feb  6 21:16 thesis_chapter2.odf
[user@host Documents]$ mv thesis_chapter2.odf thesis_chapter2_reviewed.odf
[user@host Documents]$ ls -l thesis*
-rw-rw-r--. 1 user user 0 Feb  6 21:16 thesis_chapter1.odf
-rw-rw-r--. 1 user user 0 Feb  6 21:16 thesis_chapter2_reviewed.odf
```

Utilisez la commande ```mv``` pour déplacer un fichier dans un répertoire différent.

```cmd
[user@host Documents]$ ls Thesis/Chapter1
[user@host Documents]$
[user@host Documents]$ mv thesis_chapter1.odf Thesis/Chapter1
[user@host Documents]$ ls Thesis/Chapter1
thesis_chapter1.odf
[user@host Documents]$ ls -l thesis*
-rw-rw-r--. 1 user user 0 Feb  6 21:16 thesis_chapter2_reviewed.odf
```

#### Suppression de fichiers et de répertoires

La commande ```rm``` supprime les fichiers. Par défaut, ```rm``` ne supprimera pas les répertoires contenant des fichiers, sauf si vous ajoutez l'option ```-r``` ou ```--recursive```.

<div class="alert alert-warning" role=&quot;alert&quot;>
**Important**

Il n'existe aucune fonction de ligne de commande pour annuler la suppression, ni de "corbeille" à partir de laquelle vous pouvez restaurer les fichiers supprimés.
</div>

Il est judicieux de vérifier votre répertoire de travail actuel avant de supprimer un fichier ou un répertoire.

```cmd
[user@host Documents]$ pwd
/home/student/Documents

Utilisez la commande rm pour supprimer un seul fichier de votre répertoire de travail.

[user@host Documents]$ ls -l thesis*
-rw-rw-r--. 1 user user 0 Feb  6 21:16 thesis_chapter2_reviewed.odf
[user@host Documents]$ rm thesis_chapter2_reviewed.odf
[user@host Documents]$ ls -l thesis*
ls: cannot access 'thesis*': No such file or directory
```

Si vous essayez d'utiliser la commande ```rm``` pour supprimer un répertoire sans utiliser l'option ```-r```, la commande échouera.

```cmd
[user@host Documents]$ rm Thesis/Chapter1
rm: cannot remove 'Thesis/Chapter1': Is a directory
```

Utilisez la commande ```rm -r``` pour supprimer un sous-répertoire et son contenu.

```cmd
[user@host Documents]$ ls -R Thesis
Thesis/:
Chapter1  Chapter2  Chapter3

Thesis/Chapter1:
thesis_chapter1.odf

Thesis/Chapter2:
thesis_chapter2.odf

Thesis/Chapter3:
[user@host Documents]$ rm -r Thesis/Chapter1
[user@host Documents]$ ls -l Thesis
total 8
drwxrwxr-x. 2 user user 4096 Feb 11 12:47 Chapter2
drwxrwxr-x. 2 user user 4096 Feb 11 12:48 Chapter3
```

La commande ```rm -r``` parcourt d'abord chaque sous-répertoire, en supprimant individuellement leurs fichiers avant de supprimer chaque répertoire. Vous pouvez utiliser la commande ```rm -ri``` pour demander de manière interactive une confirmation avant suppression. C'est essentiellement le contraire de l'option ```-f``` qui force la suppression sans demander de confirmation à l'utilisateur.

```cmd
[user@host Documents]$ rm -ri Thesis
rm: descend into directory `Thesis'? y
rm: descend into directory `Thesis/Chapter2'? y
rm: remove regular empty file `Thesis/Chapter2/thesis_chapter2.odf'? y
rm: remove directory `Thesis/Chapter2'? y
rm: remove directory `Thesis/Chapter3'? y
rm: remove directory `Thesis'? y
[user@host Documents]$
```

<div class="alert alert-danger" role=&quot;alert&quot;>
**Avertissement**

Si vous spécifiez à la fois l'option ```-i``` et ```-f```, l'option ```-f``` est prioritaire et aucune confirmation ne vous sera demandée avant que rm supprime les fichiers.
</div>

Dans l'exemple suivant, la commande ```rmdir``` supprime uniquement le répertoire vide. Comme dans l'exemple précédent, vous devez utiliser la commande ```rm -r``` pour supprimer un répertoire comprenant du contenu.

```cmd
[user@host Documents]$ pwd
/home/student/Documents
[user@host Documents]$ rmdir ProjectY
[user@host Documents]$ rmdir ProjectX
rmdir: failed to remove 'ProjectX': Directory not empty
[user@host Documents]$ rm -r ProjectX
[user@host Documents]$ ls -lR
.:
total 0
[user@host Documents]$
```

