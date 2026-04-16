---
title: "DNF"
description: "linux"
draft: false
weight: 2
---

#### Gestion de paquetages logiciels avec dnf
- La commande **rpm** de bas niveau peut être utilisée pour installer des paquetages, mais **elle n'est pas conçue pour fonctionner avec des référentiels de paquetages** ou pour **résoudre automatiquement les dépendances** de plusieurs sources.
- **Dnf** est conçu pour mieux gérer l'installation et les mises à jour des logiciels basés sur RPM.
- La commande **dnf** vous permet d’installer, de mettre à jour, de supprimer et d'obtenir des informations sur les paquetages de logiciels et leurs dépendances.

##### Exemple de dépendance: 
- Installez le paquest rpm **wireshark**, que vous avez téléchargé. 
- L'installation va échouer, car il dépend d'autres paquets que vous devez installer avant :
```console
[atohme@VM-Prof]$ sudo rpm -ivh wireshark-2.6.2-14.el8.x86_64.rpm 
warning: wireshark-2.6.2-14.el8.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID 8483c65d: NOKEY
error: Failed dependencies:
	libQt5Core.so.5()(64bit) is needed by wireshark-1:2.6.2-14.el8.x86_64
	libQt5Core.so.5(Qt_5)(64bit) is needed by wireshark-1:2.6.2-14.el8.x86_64
	libQt5Core.so.5(Qt_5.15)(64bit) is needed by wireshark-1:2.6.2-14.el8.x86_64
...
```

- Avec **dnf**, le paquet sera téléchargé automatiquement d'un dépôt sur Internet, avec toutes les autres paquets dépendantes : 
```console
[atohme@VM-Prof]$ sudo dnf install wireshark
Last metadata expiration check: 0:00:29 ago on Fri 29 Apr 2022 12:25:24 PM EDT.
Dependencies resolved.
===============================================================================================
 Package                     Architecture   Version                    Repository         Size
===============================================================================================
Installing:
 wireshark                   x86_64         1:2.6.2-14.el8             appstream         3.6 M
Installing dependencies:
 libatomic                   x86_64         8.5.0-4.el8_5.alma         baseos             23 k
 libsmi                      x86_64         0.4.8-23.el8               appstream         2.4 M
 openal-soft                 x86_64         1.18.2-7.el8               appstream         394 k
 pcre2-utf16                 x86_64         10.32-2.el8                baseos            228 k
 qt5-qtbase                  x86_64         5.15.2-3.el8               appstream         3.6 M
 qt5-qtbase-common           noarch         5.15.2-3.el8               appstream          40 k
 qt5-qtbase-gui              x86_64         5.15.2-3.el8               appstream         6.1 M
 qt5-qtdeclarative           x86_64         5.15.2-2.el8               appstream         4.2 M
 qt5-qtmultimedia            x86_64         5.15.2-2.el8               appstream         882 k
 wireshark-cli               x86_64         1:2.6.2-14.el8             appstream          17 M
 xcb-util-image              x86_64         0.4.0-9.el8                appstream          21 k
 xcb-util-keysyms            x86_64         0.4.0-7.el8                appstream          16 k
 xcb-util-renderutil         x86_64         0.3.9-10.el8               appstream          19 k
 xcb-util-wm                 x86_64         0.4.1-12.el8               appstream          32 k

Transaction Summary
===============================================================================================
Install  15 Packages

Total download size: 39 M
Installed size: 163 M
Is this ok [y/N]: 
```
---
#### Recherche de logiciel avec avec dnf

- Toutes les applications et leurs dépendances se trouvent sur des serveurs sur lesquels dnf télécharge. 
- Ces serveurs sont nommés **dépôts *(repositry)***
- **dnf repolist** : affiche la liste des dépôts configurés sur votre système:
```console
[atohme@VM-Prof]$ dnf repolist
Mise à jour des référentiels de gestion des abonnements.
id du dépôt                      nom du dépôt
epel                             Extra Packages for Enterprise Linux 8 - x86_64
epel-modular                     Extra Packages for Enterprise Linux Modular 8 - x86_64
rhel-8-for-x86_64-appstream-rpms Red Hat Enterprise Linux 8 for x86_64 - AppStream (RPMs)
rhel-8-for-x86_64-baseos-rpms    Red Hat Enterprise Linux 8 for x86_64 - BaseOS (RPMs)
```
- **dnf help** : affiche des informations d'utilisation.
- **dnf list**: affiche les paquets installés ou disponibles dans un dépôt sur Internet.
- **dnf list *NOM_PAQUET***: affiche le paquet et montre s'il est installé ou disponible dans un dépôt sur Internet.
```console
[atohme@VM-Prof]$ dnf list
Last metadata expiration check: 0:40:06 ago on Fri 29 Apr 2022 12:41:17 PM EDT.
Installed Packages
GConf2.x86_64            3.2.6-22.el8                                @AppStream
ModemManager.x86_64      1.10.8-4.el8                                @anaconda 
...
Available Packages
3proxy.x86_64            0.8.13-1.el8                                 epel      
AMF-devel.noarch         1.4.23-2.el8  								  epel 
...

[atohme@VM-Prof]$ dnf list nano
Last metadata expiration check: 0:01:21 ago on Fri 29 Apr 2022 12:41:17 PM EDT.
Installed Packages
nano.x86_64                2.9.8-1.el8                                @anaconda

[atohme@VM-Prof]$ dnf list ftp
Last metadata expiration check: 0:33:23 ago on Fri 29 Apr 2022 12:41:17 PM EDT.
Available Packages
ftp.x86_64                 0.17-78.el8                                appstream
```
- **dnf search *Mot_clé*** : répertorie les paquets en fonction des mots-clés trouvés dans les champs de nom et de résumé uniquement, installés ou dans un dépôt.
```console
[atohme@VM-Prof]$ dnf search http
Last metadata expiration check: 0:35:35 ago on Fri 29 Apr 2022 12:41:17 PM EDT.
================================ Name & Summary Matched: http =================================
almalinux-logos-httpd.noarch : AlmaLinux-related icons and pictures used by httpd
collectd-write_http.x86_64 : HTTP output plugin for collectd
dmlite-apache-httpd.x86_64 : Apache HTTPD frontend for dmlite
...
```
- **dnf info *NOM_PAQUET***: renvoie des informations détaillées sur un paquet, y compris l'espace disque requis pour l'installation.
```console
[atohme@VM-Prof]$ dnf info nano
Last metadata expiration check: 0:41:32 ago on Fri 29 Apr 2022 12:41:17 PM EDT.
Installed Packages
Name         : nano
Version      : 2.9.8
Release      : 1.el8
Architecture : x86_64
Size         : 2.2 M
Source       : nano-2.9.8-1.el8.src.rpm
Repository   : @System
From repo    : anaconda
...

[atohme@VM-Prof]$ dnf info ftp
Available Packages
Name         : ftp
Version      : 0.17
Release      : 78.el8
Architecture : x86_64
Size         : 70 k
...
```
---
#### Installation et suppression de logiciels avec dnf
- **dnf install *NOM_PAQUET***: obtient et installe un paquet logiciel, y compris toutes ses dépendances.
```console
[atohme@VM-Prof]$ sudo dnf install ftp
Last metadata expiration check: 1:00:40 ago on Fri 29 Apr 2022 12:25:24 PM EDT.
Dependencies resolved.
===============================================================================================
 Package          Architecture        Version                     Repository              Size
===============================================================================================
Installing:
 ftp              x86_64              0.17-78.el8                 appstream               70 k

Transaction Summary
===============================================================================================
Install  1 Package

Total download size: 70 k
Installed size: 112 k
Is this ok [y/N]: y
Downloading Packages:
ftp-0.17-78.el8.x86_64.rpm                                     3.2 MB/s |  70 kB     00:00    
-----------------------------------------------------------------------------------------------
...
Installed:
  ftp-0.17-78.el8.x86_64                                                                       
Complete!
```
- **dnf remove *NOM_PAQUET***: supprime un paquet logiciel installé, y compris tous les paquetages pris en charge.
```console
[atohme@VM-Prof]$ sudo dnf remove ftp
Dependencies resolved.
===============================================================================================
 Package          Architecture        Version                    Repository               Size
===============================================================================================
Removing:
 ftp              x86_64              0.17-78.el8                @appstream              112 k

Transaction Summary
===============================================================================================
Remove  1 Package

Freed space: 112 k
Is this ok [y/N]: y
...
Removed:
  ftp-0.17-78.el8.x86_64                                                                       
Complete!
```
- **dnf update *NOM_PAQUET***: obtient et installe une version plus récente du paquetage spécifié, y compris toutes les dépendances.
```console
[atohme@VM-Prof]$ sudo dnf update NetworkManager
Last metadata expiration check: 1:09:12 ago on Fri 29 Apr 2022 12:25:24 PM EDT.
Dependencies resolved.
===============================================================================================
 Package                         Architecture  Version                     Repository     Size
===============================================================================================
Upgrading:
 NetworkManager                  x86_64        1:1.32.10-5.el8_5           baseos        2.6 M
 NetworkManager-adsl             x86_64        1:1.32.10-5.el8_5           baseos        144 k
 NetworkManager-bluetooth        x86_64        1:1.32.10-5.el8_5           baseos        169 k
 NetworkManager-libnm            x86_64        1:1.32.10-5.el8_5           baseos        1.8 M
 NetworkManager-team             x86_64        1:1.32.10-5.el8_5           baseos        148 k
 NetworkManager-tui              x86_64        1:1.32.10-5.el8_5           baseos        335 k
 NetworkManager-wifi             x86_64        1:1.32.10-5.el8_5           baseos        189 k
 NetworkManager-wwan             x86_64        1:1.32.10-5.el8_5           baseos        175 k

Transaction Summary
===============================================================================================
Upgrade  8 Packages

Total download size: 5.6 M
Is this ok [y/N]: 
```
- **dnf update**: affiche la liste des mises à jour disponibles pour les paquets déjà installés.
```console
[atohme@VM-Prof]$ sudo dnf update 
Last metadata expiration check: 1:09:46 ago on Fri 29 Apr 2022 12:25:24 PM EDT.
Dependencies resolved.
===============================================================================================
 Package                     Arch   Version                                    Repo       Size
===============================================================================================
Installing:
 kernel                      x86_64 4.18.0-348.23.1.el8_5                      baseos    7.0 M
Upgrading:
 NetworkManager              x86_64 1:1.32.10-5.el8_5                          baseos    2.6 M
 NetworkManager-adsl         x86_64 1:1.32.10-5.el8_5                          baseos    144 k
 ...
 Transaction Summary
===============================================================================================
Install    5 Packages
Upgrade  198 Packages

Total download size: 608 M
Is this ok [y/N]: 
```
- **dnf history** : affiche l'historique des transactions dnf.
```console
[atohme@VM-Prof]$ dnf history
ID     | Command line                             | Date and time    | Action(s)      | Altered
-----------------------------------------------------------------------------------------------
    15 | remove ftp                               | 2022-04-29 13:28 | Removed        |    1   
    14 | install ftp                              | 2022-04-29 13:26 | Install        |    1  
	...
```
- **dnf history undo #** : inverse une transaction dnf en spécifiant son numéro.
```console
[atohme@VM-Prof]$ sudo dnf history undo 15
Last metadata expiration check: 1:15:20 ago on Fri 29 Apr 2022 12:25:24 PM EDT.
Dependencies resolved.
================================================================================
 Package       Architecture     Version               Repository           Size
================================================================================
Installing:
 ftp          x86_64           0.17-78.el8           appstream            70 k

Transaction Summary
================================================================================
Install  1 Package

Total download size: 70 k
Installed size: 112 k
Is this ok [y/N]: 
```

---
> **Références** : Pages de manuel dnf(1)

