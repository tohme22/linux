---
title: "Configuration des réseaux"
description: "linux"
draft: false
weight: 1
---
### Affichage de la configuration réseaux

#### Description des noms d'interfaces réseau

Les noms d'interface réseau commencent par le type d'interface :
- Les interfaces **Ethernet** commencent par **en**, exemple: **ens192**, **en01**. 
- Les interfaces **WLAN *Wifi*** commencent par **wl**, exemple: **wlp4s0**

#### Identification des interfaces réseau

La commande `ip link` liste toutes les interfaces réseau disponibles sur votre système :

![ip link](../../images/ip-link.png?height=230&classes=border,shadow,inline&featherlight=false)

Dans l'exemple précédent, l'ordinateur possède cinq interfaces réseau : **lo** (loopback), qui correspond au périphérique de bouclage connecté à l'ordinateur lui-même, deux interfaces Ethernet **ens192** et **ens224**, et deux interfaces virtuelles **virbr0** et **virbr0-nic**.

---
#### Affichage des adresses IP

La commande `ip addr` affiche les informations de toutes les interfaces et leur adresse IP. La commande `ip addr show` affiche les informations et l'addresse IP d'un seul interface.

![ip addr](../../images/ip-addr.png?height=170&classes=border,shadow,inline)

- Une interface active est **UP**.
- La ligne **link/ether** spécifie **l'adresse matérielle (MAC)** du périphérique.
- La ligne **inet** présente une **adresse IPv4**, la longueur du préfixe et l'étendue de son réseau.
- La ligne **inet6** présente une **adresse IPv6**, la longueur du préfixe et l'étendue de son réseau. Cette adresse a une étendue globale et est utilisée normalement.

---
#### Vérification de la connectivité entre les hôtes

La commande `ping` sert à tester la connectivité. La commande continue à s'exécuter jusqu'à ce que l'utilisateur appuie sur Ctrl+c, à moins que des options limitent le nombre de paquetages
envoyés, comme par exemple avec l'option `-c`.

![ping](../../images/ping.png?height=210&classes=border,shadow,inline)

---
### Configuration de la mise en réseaux

#### Description des concepts NetworkManager

**NetworkManager** est un service qui surveille et gère les paramètres du réseau. Les outils graphiques et de ligne de commande communiquent avec NetworkManager.

- Un **périphérique** est une interface réseau.
- Une **connexion** est un ensemble de paramètres qu'il est possible de configurer pour un périphérique.
- Une seule connexion peut être **active** pour un périphérique quelconque à un moment donné.
- Chaque connexion porte un **nom** qui l'identifie.
- L'utilitaire `nmcli` permet de créer et de modifier les connexion à partir de la ligne de commande.

#### Affichage des informations réseau

La commande `nmcli`, affiche les information des **toutes les périphériques avec leur connexion** réseaux.

![nmcli](../../images/nmcli0.png?height=550&classes=border,shadow,inline)

La commande `nmcli dev status` affiche **le statut de tous les périphériques réseau** :

![nmcli](../../images/nmcli1.png?height=160&classes=border,shadow,inline)

La commande `nmcli con show` affiche **une liste de toutes les connexions** :

![nmcli](../../images/nmcli2.png?height=100&classes=border,shadow,inline)

---
#### Ajout et suppression d'une connexion réseau

La commande `nmcli con add` permet d'ajouter de nouvelles connexions réseau.

##### Exemple 1 - Ajout d'une connexion réseau avec une addresse IP automatique (DHCP) :
La commande suivante `nmcli con add` ajoute une nouvelle connexion nommée **ens224** pour l'interface **ens224**, qui obtient les informations sur le réseau IPv4 en utilisant le protocole **DHCP**.

![nmcli](../../images/nmcli3.png?height=170&classes=border,shadow,inline)

![nmcli](../../images/nmcli3a.png?height=430&classes=border,shadow,inline)

##### Exemple 2 - Suppresion d'une connexion réseau
Dans l'exemple suivant, on supprime la connexion créée à l'exemple 1 avec la commande `nmcli con del`.

![nmcli](../../images/nmcli3b.png?height=150&classes=border,shadow,inline)

##### Exemple 3 - Ajout d'une connexion réseau avec une addresse IP manuelle
La commande suivante `nmcli con add` ajoute une nouvelle connexion **ens224** pour le périphérique **ens224** avec une **adresse statique IPv4**, en utilisant l'adresse IPv4, le préfixe réseau: **192.168.1.20/24** et la **passerelle par défaut 192.168.1.1**.

![nmcli](../../images/nmcli5.png?height=200&classes=border,shadow,inline)

![nmcli](../../images/nmcli5a.png?height=430&classes=border,shadow,inline)

---
#### Contrôle des connexions réseau
La commande `nmcli con down` *nom* désactive la connexion *nom* sur l'interface réseau à laquelle elle est liée. Notez que la commande prend le nom d'une connexion, et non le nom de l'interface
réseau.

![nmcli](../../images/nmcli6.png?height=75&classes=border,shadow,inline)

La commande `nmcli con up` *nom* active la connexion *nom* sur l'interface réseau à laquelle elle est liée. 

![nmcli](../../images/nmcli7.png?height=55&classes=border,shadow,inline)

---
#### Modification des paramètres de connexion réseau
Pour afficher la liste des paramètres actuels d'une connexion, exécutez la commande `nmcli con show` *nom*, où *nom* est le nom de la connexion.

![nmcli](../../images/nmcli8.png?height=880&classes=border,shadow,inline)

##### Exemple 1 - Ajout l'addresse IP d'un DNS pour une connexion :

La commande `nmcli con mod` *nom* permet de modifier les paramètres d'une connexion. Comme ajouter une addresse IP d'un serveur DNS, en utilisant l'option `ipv4.dns` suivi par l'addresse IP du DNS.

![nmcli](../../images/nmcli9.png?height=150&classes=border,shadow,inline)

##### Exemple 2 - Ajout d'une 2ème addresse IP

Avec la commande `nmcli con mod` *nom* vous pouvez ajouter une autre addresses IP en utilisant l'option `+ipv.addresses` suivi par l'addresse IP souhaitée.

![nmcli](../../images/nmcli10.png?height=80&classes=border,shadow,inline)

---
### Récapitulatif des commandes

Le tableau ci-dessous répertorie les principales commandes **nmcli** décrites dans cette section.

|Commande|Objet|
|---|---|
|**nmcli**|Affiche les informations de toutes les interfaces avec leur connexion.|
|**nmcli dev status**|Affiche le statut de toutes les interfaces réseau.|
|**nmcli con show**|Liste toutes les connexions.|
|**nmcli con show** *nom*|Liste les paramètres actuels de la connexion *nom*.|
|**nmcli con add con-name** *nom*|Ajoute une nouvelle connexion appelée *nom*.|
|**nmcli con mod** *nom*|Modifie la connexion *nom*.|
|**nmcli con down** *nom*|Désactive la connexion *nom*.|
|**nmcli con up** *nom*|Active la connexion *nom*.|
|**nmcli con del** *nom*|Supprime la connexion *nom*.|

---
### Fichiers de configuration

Toute la configuration de vos interfaces réseau est enregistrée dans le répertoire `/etc/sysconfig/networkscripts/`.

![nmcli](../../images/nmcli11.png?height=120&classes=border,shadow,inline)

Chaque connexion a son propre fichier de configuration nommé avec le nom  de la connexion, exemple pour la connexion **ens192** le fichier est nommé **ifcfg-ens192**.

![nmcli](../../images/nmcli12.png?height=350&classes=border,shadow,inline)

![nmcli](../../images/nmcli13.png?height=500&classes=border,shadow,inline)

##### Options de configuration IPv4 du fichier ifcfg

![nmcli](../../images/nmcli14.png?height=300&classes=border,shadow,inline)

Dans les paramètres statiques, les variables pour l'adresse IP, le préfixe et la passerelle ont un nombre en suffixe. Cela permet l'attribution de plusieurs ensembles de valeurs à l'interface. La
variable DNS comprend également un nombre qui est utilisé pour indiquer l'ordre de recherche lorsque plusieurs serveurs sont spécifiés.

Il est également possible de configurer le réseau **en modifiant les fichiers de configuration de la connexion**. Les fichiers de configuration de la connexion contrôlent les interfaces logicielles
des différents périphériques réseau. Le tableau suivant répertorie les variables standard présentes dans le fichier utilisé pour une configuration IPv4 statique ou dynamique.

Après avoir modifié les fichiers de configuration, exécutez la commande `nmcli con reload` pour que **NetworkManager** lise les modifications de la configuration. L'interface doit encore **être redémarrée** pour que les modifications soient prises en compte.

![nmcli](../../images/nmcli15.png?height=40&classes=border,shadow,inline)

![nmcli](../../images/nmcli16.png?height=200&classes=border,shadow,inline)

![nmcli](../../images/nmcli17.png?height=150&classes=border,shadow,inline)

![nmcli](../../images/nmcli18.png?height=500&classes=border,shadow,inline)

> **Références** : Pages de manuel NetworkManager(8), nmcli(1), nmcli-examples(5), nmsettings(5), ip(8) et ipaddress(8)