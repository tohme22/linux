---
title: "RPM"
description: "linux"
draft: false
weight: 1
---

#### Paquetages logiciels et RPM
- **RPM Package Manager**, initialement développé par Red Hat, fournit une méthode standard pour empaqueter le logiciel en vue de sa distribution. 
- Il est bien plus simple de gérer des logiciels sous la forme de paquetages RPM que d'utiliser des logiciels qui ont été simplement extraits d'une archive. 
- Les informations relatives aux paquetages installés sont stockées dans une base de données RPM locale sur chaque système. 
- Les noms de fichiers des paquetages RPM se composent de quatre éléments : **name-version-release.architecture.rpm** :

![rpm](../../images/rpm.png?height=150&classes=border,shadow,inline&featherlight=false)

- **NAME** correspond à un ou plusieurs mots qui décrivent le contenu (coreutils).
- **VERSION** correspond au numéro de version du logiciel d'origine (8.30).
- **RELEASE** correspond au numéro d'édition du paquetage basé sur cette version. L'édition est définie par le responsable du paquetage.
- **ARCH** correspond à l'architecture de processeur pour laquelle le paquetage a été compilé. **noarch** indique que le contenu du paquetage n'est pas spécifique à une architecture
(contrairement à **x86_64 pour 64 bits**, **aarch64 pour ARM 64 bits**, et ainsi de suite).

- Pour connaitre la version de votre **noyau (kernel)** et **l'archirtecture de votre processeur**, exécutez les commandes suivantes:
```console
[atohme@VM-Prof]$ uname -a
Linux VM-Prof 4.18.0-348.2.1.el8_5.x86_64 #1 SMP Mon Nov 15 09:17:08 EST 2021 x86_64 x86_64 x86_64 GNU/Linux
[atohme@VM-Prof]$ lscpu
Architecture:        x86_64
CPU op-mode(s):      32-bit, 64-bit
```
Vous pouvez trouver une liste des paquetages RPM sur ce site: **https://rpmfind.net/linux/rpm2html/search.php**

---

#### Examen des paquetages RPM

- Pour avoir des inforamtions sur les paquetages rpm installés, on utilise la commande suivante:

	**rpm -q *[select-options]* *[query-options]***

- Pour afficher la liste de tous les paquetages installés, on utilise les options **-qa** :
```console
[atohme@VM-Prof]$ rpm -qa
xmlsec1-1.2.25-4.el8.x86_64
gstreamer1-1.16.1-2.el8.x86_64
google-noto-sans-lisu-fonts-20161022-7.el8.1.noarch
...
```
- Pour vérifier si un paquet est installé et afficher sa version, , on utilise l' option **-q** :
```console
[atohme@VM-Prof]$ rpm -q nano
nano-2.9.8-1.el8.x86_64
```
- Pour lister les informations d’un paquet installé, on utilise les options **-qi** :
```console
[atohme@VM-Prof]$ rpm -qi nano
Name        : nano
Version     : 2.9.8
Release     : 1.el8
Architecture: x86_64
...
```
- Pour lister les fichiers de configuration d’un paquet installé, on utilise les options **-qc** :
```console
[atohme@VM-Prof]$ rpm -qc nano
/etc/nanorc
```
- Pour lister les fichiers de documentation d’un paquet installé, on utilise les options **-qd** :
```console
[atohme@VM-Prof]$ rpm -qd nano
/usr/share/doc/nano/AUTHORS
/usr/share/doc/nano/COPYING
/usr/share/doc/nano/ChangeLog
...
```
---

#### Installation des paquetages RPM

- **Téléchargez** le paquet rpm que vous souhaité installer ***(Trouver la version compatible avec votre système)***.
- Dans notre exemple, nous allons utilier le système **CentOS 8** (qui est compatible avec ***Red hat et AlmaLinux***).

![nano1](../../images/nano1.png?height=600&classes=border,shadow,inline&featherlight=false)

- **Sauvegradez** le paquet dans votre repértoire ***(Ne pas choisir Ouvrir avec)*** :

![nano2](../../images/nano2.png?height=300&classes=border,shadow,inline&featherlight=false)

- **Installez** le paquet rpm que vous avez téléchargé. On utilise les options **-ivh** :
```console
[atohme@VM-Prof]$ cd Downloads/
[atohme@VM-Prof]$ ls
nano-2.9.8-1.el8.x86_64.rpm
[atohme@VM-Prof]$ sudo rpm -ivh nano-2.9.8-1.el8.x86_64.rpm
warning: nano-2.9.8-1.el8.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 8483c65d: NOKEY
Verifying...                          ################################# [100%]
Preparing...                          ################################# [100%]
Updating / installing...
   1:nano-2.9.8-1.el8                 ################################# [100%]
```

---
#### Désinstallation des paquetages RPM

- Pour désinstaller un paquet rpm, on utilise les options **-evh** :

```console
[atohme@VM-Prof]$ sudo rpm -evh nano
Preparing packages...
nano-2.9.8-1.el8.x86_64
```
---
> **Références** : Pages de manuel rpm(1)

