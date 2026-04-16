---
title: "Travail Pratique 4"
description: "linux"
draft: true
weight: 4
---
## Travail Pratique 4 -  Solution

#### Exercice 1 - Archivage et synchronisation
```cmd
# su -
```
```cmd
# tar -czf /tmp/log50.gz.tar /var/log
```
```cmd
# ls /tmp
log50.gz.tar
```
```cmd
# rsync -av /tmp/log50.gz.tar root@atohme_ZG4_alma:/tmp
password:
```
---
#### Exercice 2 - Gestion de réseaux 
```cmd
# nmcli con show
```
```cmd
# nmcli con del ens224
```
```cmd
# nmcli connection add type ethernet ifname ens224 con-name static ipv4.method manual ipv4.addresses 172.25.250.X/24 ipv4.gateway 172.25.250.250 ipv4.dns 172.25.250.250 
```
```cmd
# nmcli con show static
```
```cmd
# nmcli general hostname serveurX
```
```cmd
# nmcli connection modify static +ipv4.addresses 172.25.200.X/24
# nmcli connection down static
# nmcli connection up static
```
```cmd
# nmcli con show static
```
```cmd
# nmcli con del static
```
---
#### Exercice 3 - Gestion du stockage
```cmd
# fdisk /dev/sdb
p (pour lister les partitions existantes).
d (pour supprimer toutes les partitions existantes).
```
```cmd
# fdisk /dev/sdbee
n 
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-8388607, default 2048): 
Last sector, +sectors or +size{K,M,G,T,P} (2048-8388607, default 8388607): +3G
w
```
```cmd
# mkfs.ext4 /dev/sdb1
```
```cmd
# mount /dev/sdb1 /mnt
```
```cmd
# lsblk -f
```
---
#### Exercice 4 - Installation de logiciels
```cmd
# dnf list gparted
```
```cmd
# dnf install -y gparted
```
```cmd
# gparted &
```
```cmd
# dnf search ifconfig
# dnf install -y python3-ifcfg
```
```cmd
# dnf list python3-ifcfg
```
```cmd
# dnf remove -y python3-ifcfg
```

















