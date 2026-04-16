---
title: "Contrôle de l'accès aux fichiers"
description: "linux"
date: 2019-04-12T12:54:19-04:00
weight: 1
draft: false
---

## Introduction

Linux étant un système multi-utilisateurs, il peut être nécessaire de donner des droits différents sur les fichiers pour les protéger:

 - Confidentialité

 - Protection contre les erreurs

 - ...

Sur Linux, il existe deux types de droits: les droits standards et les ACL. Nous verrons uniquement les droits standards qui sont les plus utilisés.

De plus, c'est avec les droits que l'on peut rendre un fichier exécutable.

## Description

La commande suivante permet d'afficher les permissions sur les fichiers:

```console
$ ls -l
total 40
drwxr-xr-x.  3 antoine informatqiue    18 21 mar 14:22 Bureau
drwxrwxr-x.  3 antoine informatqiue    22  7 mar 17:08 config
drwxrwxr-x.  2 antoine informatqiue  4096 10 avr 13:16 correction
drwxrwxr-x.  2 antoine informatqiue    69  7 fév 17:10 cours
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Documents
-rw-rw-r--.  1 antoine informatqiue   343 27 mar 11:14 expr.txt
drwxrwxr-x.  3 antoine informatqiue    93  7 mar 15:22 hugo
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Images
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Modèles
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Musique
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Public
drwxrwxr-x. 13 antoine informatqiue  4096 11 avr 18:06 quickstart
-rw-r--r--.  1 antoine informatqiue 11459 31 mar 12:53 README.md
drwxrwxr-x.  3 antoine informatqiue  4096 17 mar 15:24 scripts
-rwxrw-r--.  1 antoine informatqiue    52 25 fév 14:14 script.sh
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Téléchargements
-rw-rw-r--.  1 antoine informatqiue     9  3 avr 13:53 total.txt
drwxr-xr-x.  7 antoine informatqiue   162 13 mar 21:27 tp01
drwxr-xr-x.  2 antoine informatqiue     6 18 nov 21:08 Vidéos
```

![droits](../images/permissions.png?height=200&classes=border,shadow,inline)

Le premier caractère de la longue liste est le type de fichier:
 
 -  `-` est un fichier normal
 -  `d` est un répertoire.
 -  `l` est un lien symbolique.

Les permissions s'affichent sous la forme de 3 colonnes de 3 lettres chacune:

 - La première colonne représente les droits pour **le propriétaire** du fichier ou du répertoire. (u pour user).
 - La deuxième colonne représente les droits pour **le groupe propriétaire** du fichier ou du répertoire. (g pour groupe). 
 - La troisième colonne représente les droits pour **tous les autres utilisateurs** (o pour other). <i> C'est tous les autres utilisateurs du système autres que l'utilisateur ou un membre du groupe propriétaire.</i>

Les propriètaires s'affichent sur 2 colonnes:

 - La première colonne représente l'utilisateur qui est propriétaire du fichier ou du répertoire. <i> Par défault c'est l'utilisateur qui a créé ce fichier ou repértoire.</i>
 - La deuxième colonne représente le groupe qui est propriétaire du fichier ou du répertoire. <i>Par défault c'est le groupe principale de cet utilisateur.</i>

Les 3 lettres représentent les permissions sur les fichiers et les répertoires:

|Permission|Effet sur les fichiers|Effet sur les répertoires|
|---|---|---|
|**r (lecture)**|Le contenu du fichier peut être lu.|Le contenu du répertoire (noms des fichiers) peut être listé.|
|**w (écriture)**|Le contenu du fichier peut être modifié.|Des fichiers peuvent être créés dans le répertoire ou supprimés de celui-ci.|
|**x (exécution)**|Les fichiers peuvent être exécutés en tant que commandes.|Le droit d'accéder au dossier et à ses sous-dossiers.|

> **Notes**: Les utilisateurs disposent normalement de permissions de lecture et d'exécution sur les répertoires pour pouvoir lister le contenu et d'y accéder dans ce mode.
>> - Si un utilisateur possède uniquement un accès en lecture au répertoire, il peut lister le nom des fichiers qu'il contient, mais il ne peut pas y accéder.
>> - Si un utilisateur dispose uniquement d'un accès d'exécution sur un répertoire, il ne peut pas lister les noms de fichiers dans le répertoire. S'il connaît le nom d'un fichier qu'il est autorisé à lire, il peut accéder au contenu de ce fichier depuis en spécifiant explicitement le nom de fichier relatif.
>> - Un fichier peut être supprimé par toute personne disposant de permissions d'écriture sur le répertoire dans lequel se trouve le fichier, quelles que soient la propriété ou les permissions du fichier en question.
>>> - Sous Linux, les permissions s'appliquent uniquement au fichier ou répertoire sur lequel elles sont définies. Ainsi, les sous-répertoires et les fichiers contenus dans un répertoire donné n'héritent donc pas automatiquement des permissions définies pour ce dernier.
>>> - L'utilisateur root de Linux dispose d'une permission équivalente à celle de Contrôle total sous Windows , sur tous les fichiers.
 
## Modification des permissions

Deux personnes peuvent modifier les permissions:

 - Le propriétaire du fichier ou du répertoire
 - root

La commande pour modifier les droits est `chmod`.

Il existe 2 méthodes pour modifier les droits: **La méthode symbolique** et **la méthode octale**.

#### La méthode symbolique

Elle utilise les symboles des droits:

 - `r` : lecture

 - `w` : écriture

 - `x` : exécution

Elle utilise les symboles des utilisateurs:

 - `u` : l'utilisateur propriétaire

 - `g` : le groupe propriétaire

 - `o` : les autres

 - `a` : tous (utilisateur, groupe et autres)

Elle utilise les symboles d'ajout, de suppression ou de définition pour spécifier les droits:

 - `+` : pour ajouter un ou plusieurs droits à une catégorie

 - `-` : pour retirer un ou plusieurs droits à une catégorie

 - `=` : pour définir les droits d'une ou plusieurs ctégories.

Voici des exemples:

- Pour donner tous les droits à tous les utilisateurs:
```cmd$ 
chmod a+rwx fichier
$ chmod ugo=rwx fichier
```

- Pour enlever le droit d'écriture aux autres:
```cmd
$ chmod o-w fichier
```

- Pour enlever le droit d'écriture aux autres et au groupe:
```cmd
$ chmod go-w fichier
```

- Pour affecter les droits à toute l'arborescence en dessous:
```cmd
$ chmod -R u-x directory
```

#### La méthode octale

En binaire, les droits sont les suivants:

|r|w|x|
|:---:|:---:|:---:|
|1|1|1|
|4|2|1|

Pour connaître la valeur des droits que l'on souhaite attribuer, il suffit d'additionner la valeur des droits individuels.

Ainsi, si on veut donner les droits de lecture seulement, ce sera 4, écriture seulement ce sera 2 et exécution seulement ce sera 1.

Si on veut donner les droits de lecture et écriture ce sera 6, lecture et exécutionce sera 5...

Avec la méthode octale, il faut obligatoirement définir les droits pour les trois catégories : le propriétaire, le groupe propriétaire et les autres.

Voici des exemples:

- Pour donner tous les droits à tous les utilisateurs:
```cmd
$ chmod 777 fichier
```

- Pour enlever le droit d'écriture aux autres:
```cmd
$ chmod 775 fichier
```

- Pour enlever le droit d'écriture aux autres et au groupe:
```cmd
$ chmod 755 fichier
```

- Pour affecter les droits à toute l'arborescence en dessous:

```cmd
$ chmod -R 644 directory
```

## Modification de l'utilisateur propriétaire

Il est possible de modifier le propriétaire d'un fichier ou d'un répertoire.

Seul root peut effectuer cette action.

La commande est `chown`.

```cmd
$ chown user fichier
```

Pour changer à la fois le groupe propriétaire et l'utilisateur:
```cmd
$ chown user:group fichier
```

Pour changer toute l'arborescence:
```cmd
$ chown -R user directory
```

## Modification du groupe propriétaire

De même qu'il est possible de changer le propriétaire, il est possible de changer le groupe propriétaire.

Deux utilisateurs ont le droit de modifier le groupe propriétaire:

 - root
 - Le propriétaire actuel s'il appartient au groupe auquel on va donner le fichier.
 
```cmd
$ chgrp group fichier
```

Pour changer le groupe pour toute une arborescence:
```cmd
$ chgrp -R group directory
```

Il est possible de modifier d'un seul coup l'utilisteur propriétaire et le groupe propriétaire:
```cmd
$ chown user:group fichier
```