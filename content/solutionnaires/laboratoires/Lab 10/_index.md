---
title: "Laboratoire 10"
description: "linux"
draft: false
weight: 14
---
## Laboratoire 10 -  Solution

#### Exercice 1 - Affichage des adresses IP

```cmd
1. [atohme@host]$ ip link
```
```ps
2. Il ya 5 interfaces réseaux
```
```cmd
3. [atohme@host]$ ip addr show ens192
```
```ps
4. Addresse IP : 10.64.X.X/23   
   Addresse MAC: 00:50:56:8b:5b:da 
```
---
#### Exercice 2 - Ajout et suppression d’une connexion réseau

```cmd
1. [atohme@host]$ nmcli dev status
```
```ps
2. Il y a deux interfaces réseaux de types Ethernet --> ens192 et ens224
```
```ps
3. L'interface réseau ens224 est déconnecté parce qu'il est désactivé ou il n'a pas de connexion (configuration réseau).
```
```cmd
4. [atohme@host]$ nmcli con show 
```
```ps
5. Il y a seulement une connexion résau de type Ethernet --> ens192
```
```cmd
6. [atohme@host]$ nmcli con add type ethernet ifname ens224 con-name LAN1
```
```cmd
7. [atohme@host]$ nmcli con show 
```
```cmd
8. [atohme@host]$ nmcli
```
```ps
9. L'addresse IP de cette nouvelle connexion LAN1 est --> 10.64.X.X/23
```
```cmd
10. [atohme@host]$ nmcli con delete LAN1 
```
```cmd
11. [atohme@host]$ nmcli con add type ethernet ifname ens224 con-name LAN2 ipv4.method manual ipv4.addresses 192.168.5.220/24
```
```cmd
12. [atohme@host]$ nmcli con show 
```
```cmd
13. [atohme@host]$ nmcli
```
---
#### Exercice 3 - Modification des paramètres de connexion réseau
```cmd
1. [atohme@host]$ nmcli con mod LAN2 ipv4.gateway 192.168.5.220 ipv4.dns 192.168.5.225
```
```cmd
2. [atohme@host]$ nmcli con sh LAN2
```
```cmd
3. [atohme@host]$ nmcli con mod LAN2 +ipv4.addresses 192.168.6.200/24
```
```cmd
4. [atohme@host]$ nmcli con d LAN2
   [atohme@host]$ nmcli con u LAN2
```
```cmd
5. [atohme@host]$ nmcli con sh LAN2 
```
---
#### Exercice 4 - Fichiers de configuration

```cmd
1. [atohme@host]$ cd /etc/sysconfig/network-scripts/
```
```cmd
2. [atohme@host]$ cat ifcfg-ens192 
```
```ps
3. BOOTPROTO=dhcp
```
```cmd
4. [atohme@host]$ cat ifcfg-LAN2 
```
```ps
5. BOOTPROTO=none
```
---
#### Exercice 5 - Configuration de noms d'hôte
```cmd
1. [atohme@host]$ hostname
```
```cmd
2. [atohme@host]$ cat /etc/hostname 
```
```cmd
3. [atohme@host]$ nmcli general hostname VM_NomFamile
```
```cmd
4. [atohme@host]$ exit
```
---



