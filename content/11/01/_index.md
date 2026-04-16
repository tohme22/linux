---
title: "Gestion des archives"
description: "linux"
draft: false
weight: 1
---
### Gestion des archives tar compressées

#### La commande tar

L'archivage et la compression des fichiers sont utiles pour la création de sauvegardes et pour le transfert de données sur un réseau. 
- L'une des commandes les plus anciennes et les plus courantes pour créer et exploiter des archives de sauvegarde est la commande **tar**.
- Avec **tar**, les utilisateurs peuvent rassembler un grand nombre de fichiers en un seul (**une archive**). 
- Une **archive tar** est une séquence structurée de données de fichier combinée à des métadonnées sur chaque fichier et à un index permettant d'extraire des fichiers individuels.
- L'archive peut être compressée avec une compression **gzip**, **bzip2** ou **xz**.
- La commande **tar** peut aussi lister le contenu d'une archive ou extraire ses fichiers sur le système en cours.

#### Options de la commande tar

La commande tar attend l'une des trois options suivantes :
- Utilisez l'option **-c** pour créer une archive.
- Utilisez l'option **-t** pour lister le contenu d'une archive.
- Utilisez l'option **-x** pour extraire une archive.

Autres options couramment utilisées :
- Utilisez l'option **-f** avec un nom de fichier comme argument de l'archive à utiliser.
- Utilisez l'option **-v** pour le mode « détaillé » ; ce qui est utile pour voir quels fichiers sont ajoutés à l'archive ou en sont extraits.
---
#### Archivage de fichiers et de répertoires
La première option à utiliser lors de la création d'une archive est **c**, suivie de l'option **f**, d'**un espace**, puis du **nom du fichier d'archive** à créer, et enfin de **la liste des fichiers et répertoires** à
intégrer dans l'archive. L'archive est créée dans le répertoire actuel, sauf indication contraire.

Exemple, pour archiver les trois fichiers **file1.txt**, **file2.txt** et **file3.txt**, on utilise la commande suivante :
```console
$ tar -cf archive.tar file1.txt file2.txt file3.txt 
$ ls -l archive.tar 
-rw-rw-r--. 1 atohme atohme 10240 Apr 11 11:12 archive.tar
```

> **Note:** Pour que **tar** puisse archiver les fichiers sélectionnés, l'utilisateur qui exécute la commande **tar** doit obligatoirement avoir **l'autorisation de lire** ces fichiers. 
> Par exemple, la création d'une archive du dossier **/etc** et de l'intégralité de son contenu nécessite des privilèges **root**, car seul l'utilisateur root est autorisé à lire tous les fichiers du répertoire /etc. 

Exemple, pour archiver le répertoire **/etc** entant qu'utilisateur **root**, , on utilise la commande suivante :
```console
# tar -cf etc.tar /etc
tar: Removing leading `/' from member names
# ls -l etc.tar
-rw-r--r--. 1 root root 30228480 Apr 11 11:18 etc.tar
```
---
#### Lister le contenu d'une archive
L'option **t** indique à tar de lister le contenu (table des matières, d'où la lettre t) de l'archive. Utilisez l'option **f** avec le nom de l'archive à interroger.
```console
# tar -tf etc.tar
etc/
etc/fstab
etc/crypttab
etc/mtab
...
```
---
#### Extraction des fichiers d'une archive
Une archive tar doit normalement être extraite dans **un répertoire vide**, afin d'éviter l'écrasement de fichiers existants. 

Exemple, pour restaurer des fichiers à partir de l'archive **/root/etc.tar** dans le répertoire **/root/sauveagrde**, exécutez :
```console
# mkdir sauvegarde
# cd sauvegarde/
# tar -xf /root/etc.tar 
# ls -l
total 12
drwxr-xr-x. 150 root root 8192 Apr 11 08:57 etc
```
---
#### Création d'une archive compressée
Il existe trois méthodes de compression différentes pour la commande tar. 
- La compression **gzip** est la méthode la plus rapide, la plus ancienne et la plus répandue sur toutes les distributions, et même sur toutes les plates-formes. 
- La compression **bzip2** crée des fichiers d'archive plus petits que gzip mais est moins répandue que gzip.
- La compression **xz** est relativement nouvelle, mais offre généralement le meilleur taux de compression des méthodes disponibles.

##### Les options pour créer une archive tar compressée
- **-z** pour la compression **gzip** (**nom-fichier.tar.gz**).
- **-j** pour la compression **bzip2** (**nom-fichier.tar.bz2**)
- **-J** pour la compression **xz** (**nom-fichier.tar.xz**)

##### Exemples:
Pour créer une archive **gzip** compressée nommée **/root/etc.tar.gz**, avec le contenu du répertoire **/etc** :
```console
# tar -czf /root/etc.tar.gz /etc
tar: Removing leading `/' from member names
# ls -l etc.tar
-rw-r--r--. 1 root root 30228480 Apr 11 11:18 etc.tar
```

Pour créer une archive **bzip2** compressée nommée **/root/log.tar.bz2**, avec le contenu du répertoire **/var/log** :
```console
# tar -cjf /root/log.tar.bz2 /var/log
tar: Removing leading `/' from member names
# ls -l log.tar.bz2 
-rw-r--r--. 1 root root 1196790 Apr 11 11:52 log.tar.bz2
```

Pour créer une archive **xz** compressée nommée **/root/ssh.tar.xz**, avec le contenu du répertoire **/etc/ssh** :
```console
# tar -cJf /root/ssh.tar.xz /etc/ssh
tar: Removing leading `/' from member names
# ls -l ssh.tar.xz 
-rw-r--r--. 1 root root 36543 Apr 11 11:53 ssh.tar.xz
```
---
#### Extraction d'une archive compressée
- La première étape de l'extraction d'une archive **tar compressée** consiste à déterminer où extraire les fichiers archivés, puis à créer le répertoire cible et à l'ouvrir. 
- La commande tar détermine **la méthode de compression** qui a été utilisée. Vous devez utiliser l'option de type de décompression appropriée ; sinon, tar renvoie une erreur concernant le type
de décompression spécifié dans les options ne correspondant pas au type de décompression du fichier.

##### Exemples:
Pour extraire le contenu d'une archive comprimée **gzip** nommée **/root/etc.tar.gz** dans le répertoire **/root/etc-sauvegarde** :
```console
# mkdir etc-sauvegarde
# cd etc-sauvegarde/
# tar -xzf /root/etc.tar.gz 
# ls -l
total 12
drwxr-xr-x. 150 root root 8192 Apr 11 08:57 etc
```

Pour extraire le contenu d'une archive comprimée **bzip2** nommée **/root/log.tar.bz2** dans le répertoire **/root/log-sauvegarde** :
```console
# mkdir log-sauvegarde
# cd log-sauvegarde/
# tar -xjf /root/log.tar.bz2 
# ls -l
total 0
drwxr-xr-x. 3 root root 17 Apr 11 11:56 var
```

Pour extraire le contenu d'une archive comprimée **xz** nommée **/root/ssh.tar.xz** dans le répertoire **/root/ssh-sauvegarde** :
```console
# mkdir ssh-sauvegarde
# cd ssh-sauvegarde
# tar -xJf /root/ssh.tar.xz 
# ls -l
total 0
drwxr-xr-x. 3 root root 17 Apr 11 12:00 etc
```

> **Références** : Pages de manuel tar(1), gzip(1), gunzip(1), bzip2(1), bunzip2(1), xz(1), unxz(1)


