---
title: "Concepts du stockage"
description: "linux"
draft: false
weight: 1
---

#### Stockage et périphériques en mode bloc
- L'accès de bas niveau aux **périphériques de stockage** sous Linux est fourni par un type spécial de fichier appelé **périphérique en mode bloc**. 
- Les fichiers des périphériques en mode bloc sont stockés dans le répertoire `/dev` avec d'autres  fichiers de périphérique.
- Les fichiers des périphériques sont créés automatiquement par le système d'exploitation.
- le premier disque dur SATA, SAS, SCSI ou USB détecté est appelé `/dev/sda`, le deuxième `/dev/sdb`, et ainsi de suite.
```console
[root@VM-Prof]# ls /dev/sda
/dev/sda
```
---
#### Partitions de disque
- Les périphériques de stockage sont généralement divisés en plus petites portions appelées **partitions**.
- Sur un stockage connecté à un SATA, la première partition sur le premier disque est `/dev/sda1`. La deuxième partition sur le deuxième disque est `/dev/sdb2`, etc. 

```console
[root@VM-Prof]# ls /dev/sd*
/dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sdb  /dev/sdb1  /dev/sdb2
```

#### Volumes logiques
- Une autre manière d'organiser les disques et les partitions implique la gestion de **volume logique (LVM — Logical Volume Management)**. 
- Avec la **LVM**, il est possible de regrouper un ou plusieurs périphériques de traitement par blocs dans un pool de stockage nommé **groupe de volumes**.
- La LVM crée un répertoire dans `/dev` qui correspond au nom du groupe et le déplace dans le repértoire `/dev/mapper`.

```console
[root@VM-Prof]# ls /dev/mapper/
almalinux-root  almalinux-swap
```
---
#### Systèmes de fichiers
- Chaque partition ou volume logique doit **être formaté** avec un un système de fichiers.
- Linux prend en charge de nombreux types de systèmes de fichiers, mais les deux types les plus courants sont **xfs** and **ext4**.
- Linux est aussi compatible avec **FAT** et **FAT32 (vfat)**. Linux ne gère pas **NTFS**.
---
#### Points de montage
- Une fois que vous avez ajouté le système de fichiers, la dernière étape consiste à **monter le système de fichiers dans un répertoire** de la structure de répertoires. 
- Lorsque vous montez un système de fichiers sur l'arborescence des répertoires, les utilitaires d'espace utilisateur peuvent lire ou écrire des fichiers sur le périphérique.
---
#### Examen des systèmes de fichiers
- Pour avoir un aperçu des **périphériques de stockage**, **les partitions (ou volumes logiques), les systèmes de fichiers** utilisés et **les points de montage**, 
exécutez les commandes `lsblk` et `lsblk -f`.
```console
[root@VM-Prof]# lsblk
NAME               MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                  8:0    0   20G  0 disk 
├─sda1               8:1    0  600M  0 part /boot/efi
├─sda2               8:2    0    1G  0 part /boot
└─sda3               8:3    0 18.4G  0 part 
  ├─almalinux-root 253:0    0 16.4G  0 lvm  /
  └─almalinux-swap 253:1    0    2G  0 lvm  [SWAP]
sdb                  8:16   0    4G  0 disk 

[root@VM-Prof]# lsblk -f
NAME               FSTYPE      LABEL UUID                                   MOUNTPOINT
sda                                                                         
├─sda1             vfat              1649-CBC5                              /boot/efi
├─sda2             xfs               0deaff2d-5059-49d0-a0b6-5ebed6b72950   /boot
└─sda3             LVM2_member       wiSFdl-jZYp-mfdQ-TkWz-Kc0F-AL6V-vWHmZh 
  ├─almalinux-root xfs               59666dd2-20a8-4d38-ae0d-fc6693044b62   /
  └─almalinux-swap swap              fec8c3c2-561b-465c-b462-c7dd8cebd15e   [SWAP]
sdb           
```
- Pour avoir un aperçu de **la quantité d'espace disponible libre** sur une partition ou volume logique, exécutez la commande `df -h`.
```console
[root@VM-Prof]# df -h
Filesystem                  Size  Used Avail Use% Mounted on
/dev/mapper/almalinux-root   17G  6.5G   10G  40% /
/dev/sda2                  1014M  345M  670M  34% /boot
/dev/sda1                   599M  5.8M  594M   1% /boot/efi
```
---
> **Références** : Pages de manuel lsblk(1) et df(1)

