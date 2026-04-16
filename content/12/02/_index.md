---
title: "Gestion du stockage"
description: "linux"
draft: false
weight: 2
---

### Création de partitions :

#### Schéma de partitionnement MBR
- Depuis 1982, le schéma de partitionnement **Master Boot Record (MBR)** régit la manière dont les disques sont partitionnés sur les systèmes basés sur le microprogramme BIOS.
- Ce schéma prend en charge un maximum de **quatre partitions principales**. 
- Sur les systèmes Linux, en recourant aux **partitions étendues et logiques**, les administrateurs peuvent créer jusqu'à **15 partitions**. 
- La taille des partitions est limitée à **2 Tio** sur les disques partitionnés.

![mbr](../../images/mbr.png?height=115&classes=border,shadow,inline&featherlight=false)

.
#### Schéma de partitionnement GPT
- Sur les systèmes basés sur le microprogramme **UEFI**, **schéma GUID Partition Table (GPT)** est la norme qui régit la création de tables de partitionnement sur les disques durs physiques.
- Un schéma GPT fournit jusqu'à **128 partitions**.
- Ceci permet à un schéma GPT de prendre en charge des partitions pouvant atteindre **8 Zio**, soit huit milliards de Tio.
- La table GPT principale réside au début du disque, tandis qu'une copie de sauvegarde, la table GPT secondaire, se trouve à la fin du disque.

![gpt](../../images/gpt.png?height=130&classes=border,shadow,inline&featherlight=false)

.
#### Gestion des partitions avec fdisk
- La commande `fdisk -l` permet d’afficher le **schéma de partitionnement** de chaque périphériques de stockage, et toutes **leurs partitions**.
```console
[root@VM-Prof]# fdisk -l
Disk /dev/sda: 20 GiB, 21474836480 bytes, 41943040 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 04798EFA-007B-4E83-BD92-7A796A665E7B

Device       Start      End  Sectors  Size Type
/dev/sda1     2048  1230847  1228800  600M EFI System
/dev/sda2  1230848  3327999  2097152    1G Linux filesystem
/dev/sda3  3328000 41940991 38612992 18.4G Linux LVM

Disk /dev/sdb: 4 GiB, 4294967296 bytes, 8388608 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x6fe70ac8

Disk /dev/mapper/almalinux-root: 16.4 GiB, 17620271104 bytes, 34414592 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

Disk /dev/mapper/almalinux-swap: 2 GiB, 2147483648 bytes, 4194304 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```
- Pour **créer, supprimmer ou modidifier des partitions**, on utilise la commande `fidsk` suivi par le nom du disque. Ex: `fidsk /dev/sdb`.

```console
[root@VM-Prof]# fdisk /dev/sdb
```
Ensuite plusieurs **options** sont disponibles pour gérer les partitions:

|**Option**|**Fonction**|
|--|--|
|**p**|Lister les partitions actuelles.|
|**n**|Créer une nouvelle partition.|
|**d**|Supprimmer une partition.|
|**w**|Sauvegarder et quitter (avant ça aucune modification n’a eu lieu).|
|**q**|Quitter sans sauvegarder.|

##### Exemple: Création d'une partition primaire sur le disque **/dev/sdb** :
```console
[root@VM-Prof]# fdisk /dev/sdb

Welcome to fdisk (util-linux 2.32.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Command (m for help): n
Partition type
   p   primary (0 primary, 0 extended, 4 free)
   e   extended (container for logical partitions)
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-8388607, default 2048): 
Last sector, +sectors or +size{K,M,G,T,P} (2048-8388607, default 8388607): +2G
Command (m for help): w

[root@VM-Prof]# lsblk /dev/sdb
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sdb      8:16   0   4G  0 disk 
└─sdb1   8:17   0   2G  0 part 
```
---
### Création du système de fichiers :
- Après la création d'une partition, l'étape suivante consiste à lui ajouter **un système de fichiers**.
- En tant qu'utilisateur **root**, utilisez la commande `mkfs.xfs` pour appliquer un système de fichiers **xfs**. Pour **ext4**, utilisez `mkfs.ext4`.
- Une fois la partition est formatée, un nouveau **UUID (Universally unique identifier )** est attribué à la partition pour l'identifier.

##### Exemple: Formater la partition **/dev/sdb1** avec le système de fichier **xfs** :
```console
[root@VM-Prof]# mkfs.xfs /dev/sdb1
meta-data=/dev/sdb1              isize=512    agcount=4, agsize=131072 blks
         =                       sectsz=512   attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1
data     =                       bsize=4096   blocks=524288, imaxpct=25
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=2560, version=2
         =                       sectsz=512   sunit=0 blks, lazy-count=1

realtime =none                   extsz=4096   blocks=0, rtextents=0

[root@VM-Prof]# lsblk -f /dev/sdb
NAME     FSTYPE  LABEL UUID                                   MOUNTPOINT
sdb                                                      
└─sdb1   xfs           c8105180-1682-4b1c-bc86-ddcf62f4f74e 
```
---
### Montage de systèmes de fichiers
- Pour accéder à un système de fichiers qui réside sur une partition, il faut le monter dans un répertoire de la structure de répertoires.
- **Le répertoire doit être vide**. Si le répertoire n’est pas vide, les données disparaitront jusqu’à ce que vous démontiez le système de fichiers.

#### Montage manuel de systèmes de fichiers
- Les administrateurs utilisent la commande `mount` pour connecter manuellement la partition à un emplacement de répertoire ou point de montage. 
- Il faut indiquer dans la commande `mount` le **nom de la partition** et le **point de montage**.

##### Exemple: Monter manuellement la partition **/dev/sdb1** au repértoire **/mnt** :
```console
[root@VM-Prof]# mount /dev/sdb1 /mnt

[root@VM-Prof]# lsblk /dev/sdb
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sdb      8:16   0   4G  0 disk 
└─sdb1   8:17   0   2G  0 part /mnt

[root@VM-Prof]# df -h /dev/sdb1
Filesystem      Size  Used Avail Use% Mounted on
/dev/sdb1       2.0G   47M  2.0G   3% /mnt
```

#### Démontage des systèmes de fichiers
- Pour démonter un système de fichiers, il faut indiquer le point de montage comme argument de la commande `umount`.
```console
[root@VM-Prof]# umount /mnt
```

#### Montage automatique de systèmes de fichiers
- Le montage manuel d'un système de fichiers constitue un excellent moyen de s'assurer qu'un périphérique formaté est accessible ou qu'il fonctionne comme il faut. 
- Toutefois, lorsque le serveur redémarre, **le système ne monte pas automatiquement le système de fichiers** sur l'arborescence de répertoires.
- Pour vous assurer que le système monte automatiquement le système de fichiers au démarrage du système, ajoutez une entrée au fichier `/etc/fstab`.
- Ce fichier de configuration répertorie les systèmes de fichiers à monter au démarrage du système.
- `/etc/fstab` est un fichier délimité par des espaces qui contient **six champs par ligne**.

##### Exemple: Monter automatiquement la partition **/dev/sdb1** au repértoire **/mnt** :
- Vous devez spécifier le nom de la partition **/dev/sdb1**, dans le 1er champ, ou son **UUID**, suivi par le **point de montage** et son **système de fichiers**.
```console
[root@VM-Prof]# vim /etc/fstab
# /etc/fstab
# Created by anaconda on Thu Dec  9 14:23:36 2021
/dev/mapper/almalinux-root                /         xfs     defaults                    0 0
UUID=0deaff2d-5059-49d0-a0b6-5ebed6b72950 /boot     xfs     defaults                    0 0     
UUID=1649-CBC5                            /boot/efi vfat    umask=0077,shortname=winnt  0 2     
/dev/mapper/almalinux-swap                none      swap    defaults                    0 0     
/dev/sdb1                                 /mnt      xfs     defaults                    0 0

[root@VM-Prof]# mount -a
[root@VM-Prof]# lsblk /dev/sdb
NAME   MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
sdb      8:16   0   4G  0 disk 
└─sdb1   8:17   0   2G  0 part /mnt
```
- Lorsque vous ajoutez ou supprimez une entrée dans le fichier `/etc/fstab`, exécutez la commande `mount -a` ou redémarrez la machine, afin que le système enregistre la nouvelle configuration.
---

> **Références** : Pages de manuel fdisk(1), mkfs(1), mount(1) et umount(1)

