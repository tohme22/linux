---
title: "Laboratoire 12"
description: "linux"
draft: false
weight: 16
---
## Laboratoire 12 -  Solution

#### Exercice 1 - Examen des systèmes de fichiers

```cmd
1. $ su - 
```
```cmd
2. # lsblk
NAME               MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
sda                  8:0    0   20G  0 disk 
├─sda1               8:1    0  600M  0 part /boot/efi
├─sda2               8:2    0    1G  0 part /boot
└─sda3               8:3    0 18.4G  0 part 
  ├─almalinux-root 253:0    0 16.4G  0 lvm  /
  └─almalinux-swap 253:1    0    2G  0 lvm  [SWAP]
sdb                  8:16   0    4G  0 disk 
```
```cmd
3. # lsblk -f
NAME               FSTYPE      LABEL UUID                                   MOUNTPOINT
sda                                                                         
├─sda1             vfat              1649-CBC5                              /boot/efi
├─sda2             xfs               0deaff2d-5059-49d0-a0b6-5ebed6b72950   /boot
└─sda3             LVM2_member       wiSFdl-jZYp-mfdQ-TkWz-Kc0F-AL6V-vWHmZh 
  ├─almalinux-root xfs               59666dd2-20a8-4d38-ae0d-fc6693044b62   /
  └─almalinux-swap swap              fec8c3c2-561b-465c-b462-c7dd8cebd15e   [SWAP]
sdb                                                                         
```
```cmd
4. # df -h
```

---
#### Exercice 2 - Création des partitions, de systèmes de fichiers et des points de montage

```cmd
1. $ fdisk
/dev/sda --> gpt
/dev/sdb --> mbr
```
```cmd
2.1 # fidsk /dev/sdb
```
```cmd
2.2 # lsblk
```
```cmd
2.3.1 # mkfs.ext4 /dev/sdb1
```
```cmd
2.3.2 # mkfs.vfat /dev/sdb2
```
```cmd
2.4 # lsblk -f
```
```cmd
2.5 # mkdir /docs
```
```cmd
2.6 # mount /dev/sdb1 /docs
```
```cmd
2.7 # lsblk -f
```
```cmd
2.8 # vim /etc/fstab
/dev/sdb2    /mnt   vfat   defaults   00
```
```cmd
2.9 # mount -a
```
```cmd
2.10 # lsblk -f
```


