---
title: "Configuration de noms d'hôte"
description: "linux"
draft: false
weight: 2
---
### Configuration de noms d'hôte

#### Modification du nom d'hôte du système

- La commande `hostname` affiche  **le nom d'hôte** entièrement qualifié du système.
- Un nom d'hôte statique est spécifié dans le fichier `/etc/hostname`. 
- La commande `nmcli general hostname` *nouveau_nom* sert à modifier ce fichier et le nom d'hôte.
- Vous devez **se déconnecter** et **connecter** pour afficher le nouveau nom dans l'invite Shell.

![hostname](../../images/hostname1.png?height=220&classes=border,shadow,inline)

---
#### Configuration de la résolution de noms

- Le résolveur sert à convertir les noms d'hôte en adresses IP.
- Par défaut, il vérifie le contenu du fichier `/etc/hosts` en premier.

![hostname](../../images/hostname2.png?height=90&classes=border,shadow,inline)

- Si aucune entrée n'est trouvée dans le fichier: `/etc/hosts`, par défaut, le résolveur essaye de trouver le nom d'hôte en utilisant le **serveur de noms DNS**. 
- Le fichier `/etc/resolv.conf` contient les addresses IP des serveurs DNS à interroger

![hostname](../../images/hostname3.png?height=150&classes=border,shadow,inline)

- NetworkManager met à jour le fichier `/etc/resolv.conf` à l'aide des paramètres DNS des fichiers de configuration de connexion, en utilisant la commande `nmcli`.

```console
[atohme@pc]# nmcli con mod ens224 +ipv4.dns 192.168.1.10
```
---
#### Test de la résolution de noms DNS
La commande `host` *HOSTNAME* peut être utilisée pour **tester la connectivité du serveur DNS**.

##### Exemple:

![hostname](../../images/hostname4.png?height=80&classes=border,shadow,inline)


> **Références** : Pages de manuel hosts(5), host(1) et resolv.conf(5)