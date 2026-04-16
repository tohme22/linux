---
title: "Laboratoire 11"
description: "linux"
draft: false
weight: 15
---
## Laboratoire 11 -  Solution

#### Exercice 1 - Gestion des archives tar compressées (tar)

```cmd
1. $ su - 
```
```cmd
2. # mkdir /sauvegarde
```
```cmd
3. # tar -czf /sauvegarde/etc.tar.gz /etc
```
```cmd
4. # tar -tf /sauvegarde/etc.tar.gz
```
```cmd
5. # tar -xzf /sauvegarde/etc.tar.gz
```
```cmd
6. # ls -l /sauvegarde
```
```cmd
7. $ su - e1234567
```
```cmd
8. $ touch fich{1..3}.txt
```
```cmd
9. $ tar -cjf remise.tar.bz2 fich{1..3}.txt
```
```cmd
10. $ tar -tf remise.tar.bz2
```
```cmd
11. $ rm fich{1..3}.txt
```
```cmd
12. $ ls fich{1..3}.txt
```
```cmd
13. $ tar -xjf remise.tar.bz2
```
```cmd
14. $ ls fich{1..3}.txt
```
---
#### Exercice 2 - Synchronisation de fichiers sécurisée (rsync)

```cmd
1. $ su - 
```
```cmd
2. # rsync -av /etc /tmp
```
```cmd
3. # ls /tmp
```
```cmd
4. $ touch /etc/config{1..5}.cfg
```
```cmd
5. # rsync -av /etc/tmp
Oui, seulement les nouveaux fichiers qui étaient synchronisés.
```
```cmd
6. # ls /tmp
```
```cmd
7. # rsync -av root@atohme_ZG4_alma:/var/log /tmp
```
```cmd
8. # ls /tmp
```

