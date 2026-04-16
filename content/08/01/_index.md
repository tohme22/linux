---
title: "Commande find"
description: "linux"
draft: false
weight: 1
---

### Recherche de fichiers avec **find**

- La commande **find** localise les fichiers en effectuant une **recherche en temps réel** dans la hiérarchie du système de fichiers. 
- Elle peut également rechercher des fichiers en fonction de critères autres que **le nom du fichier**, tels que les
**autorisations du fichier, son type, sa taille ou son heure de modification.**
- L'utilisateur qui invoque la commande **find** doit disposer **des permissions de lecture et d'écriture sur un répertoire** pour pouvoir en examiner le contenu.
- Le **premier argument** de la commande **find** est le répertoire dans lequel doit se faire la recherche. Si l'argument du répertoire est omis, **find** commence la recherche dans le répertoire actuel et
cherche des correspondances dans tous les sous-répertoires.
- La syntaxe de la commande **find** est la suivante:

	**find *[repértoire] -[option] expression***

##### Exemples :
Pour rechercher des fichiers par **nom**, utilisez l'option **-name** ***NOM_FICHIER.***
```console
[antoine@host]$ sudo find / -name 'ssh'
/etc/ssh
/usr/bin/ssh
...
```
Des **caractères génériques** peuvent servir à rechercher un nom de fichier et à renvoyer tous les résultats qui correspondent partiellement
```console
[antoine@host]$ sudo find / -name '*.txt'
/etc/pki/nssdb/pkcs11.txt
/etc/brltty/brl-lt-all.txt
...
```
Pour rechercher un nom de fichier donné **sans tenir compte de la casse**, utilisez l'option **-iname** suivie du nom de fichier à rechercher.
```console
[antoine@host]$ sudo find / -iname '*messages*'
/usr/share/vim/vim80/lang/zh_CN.UTF-8/LC_MESSAGES
/usr/share/vim/vim80/syntax/messages.vim
...
```

La commande **find** permet de rechercher des fichiers d'après **leur propriétaire ou leurs permissions**. Les options **-user** et **-group** sont utiles lors de la recherche par propriétaire, qui
permettent de rechercher par nom, et **-uid** et **-gid**, qui recherchent par ID. L'option **-perm** sert à rechercher des fichiers avec un ensemble d'autorisations particulier.
```console
[antoine@host]$ find -user antoine
./.bash_logout
./.bash_profile
...
[antoine@host]$ find /home/antoine -perm 777
./.mozilla/firefox/sv588wmk.default-release/lock
...
```

Grâce à l'option **-size** suivie d'une valeur numérique et d'une unité (**k, M, G**), la commande **find** peut rechercher des fichiers qui correspondent à une taille spécifique.

Pour rechercher les fichiers d'une taille supérieure à 10 mégaoctets, ou inférieure à 10 kilo-octets.
```console
[antoine@host]$ find -size +10M
[antoine@host]$ find -size -10k
```

L'option **-type** dans la commande **find** limite l'étendue de la recherche à un type de fichierdonné. Utilisez la liste suivante pour passer les indicateurs requis afin de limiter la portée de la
recherche :
- **f** pour un fichier standard
- **d** pour un répertoire (directory),
- **l** pour un lien symbolique,
```console
[antoine@host]$ find /etc -type d
```
