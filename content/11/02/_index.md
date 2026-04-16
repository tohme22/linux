---
title: "Synchronisation des fichiers"
description: "linux"
draft: false
weight: 2
---
### Synchronisation de fichiers sécurisée entre des systèmes

#### Synchroniser des fichiers et des répertoires avec rsync

- La commande `rsync` constitue un moyen de copier des fichiers d'un **système local ou distant** à un autre de manière sécurisée.
- L'outil utilise un algorithme qui minimise la quantité de données copiées en **synchronisant uniquement les parties des fichiers qui ont été modifiées**.
- **rsync** copie uniquement les différences entre les systèmes de fichiers
- Les deux options courantes lors de la synchronisation à l'aide de `rsync` sont `-v` et `-a`.

- L'option `-v` fournit une sortie plus détaillée, ce qui est utile pour la résolution de problèmes et pour voir les progrès en direct.
- L'option `-a` active le « mode Archive », ce qui permet de copier de façon récursive  et d'activer un grand nombre d'options utiles qui conservent la plupart des caractéristiques des
fichiers. Le mode Archive revient à spécifier les options suivantes :

##### Options activées avec rsync -a (mode Archive)

|Commande|Objet|
|---|---|
|**-r**|synchronise l'arborescence de répertoires complète de manière récursive.|
|**-l**|synchronise les liens symboliques.|
|**-p**|permet de conserver les permissions.|
|**-o**|préserve le propriétaire des fichiers.|
|**-g**|préserve la propriété du groupe.|
|**-t**|préserve les horodatages.|
---
#### Synchroniser le contenu de deux fichiers ou répertoires locaux

Par exemple, pour synchroniser le contenu du répertoire **/var/log** avec le répertoire **/tmp** :
```console
~]$ su -
Password: 
[root@VM]# rsync -av /var/log /tmp
sending incremental file list
log/
log/Xorg.9.log
log/boot.log
...
[root@VM]# ls -l /tmp
total 8
drwxr-xr-x. 16 root root 4096 Apr 11 09:16 log
[root@VM]#
```

Une barre oblique sur le répertoire source permet de synchroniser le contenu de ce répertoire sans créer de nouveau le sous-répertoire dans le répertoire cible. 
Dans cet exemple, le répertoire **log** n'est pas créé dans le répertoire **/tmp**, seul le contenu de **/var/log/** est synchronisé dans **/tmp**.
```console
[root@VM]# rsync -av /var/log/ /tmp
sending incremental file list
./

Xorg.9.log
boot.log
boot.log-20220204
...
[root@VM]# ls -l /tmp
total 6748
drwxr-xr-x.  2 root   root      4096 Dec  9 09:36 anaconda
drwx------.  2 root   root        23 Dec  9 09:37 audit
-rw-------.  1 root   root         0 Apr  2 03:12 boot.log
...
[root@VM]#
```

S'il y a une modification dans le repértoire **/var/log**, et vous synchronisez encore une fois le répertoire **/var/log** avec le répertoire **/tmp**, juste cette modification qui sera copiée.
```console
[root@VM]# touch /var/log/log22.txt
[root@VM]# rsync -av /var/log/ /tmp
sending incremental file list
./
log22.txt

sent 3,594 bytes  received 56 bytes  7,300.00 bytes/sec
total size is 18,333,544  speedup is 5,022.89
[root@VM]#
```
---
#### Synchroniser le contenu des fichiers ou répertoires locaux vers un ordinateur distant

Pour synchroniser d'un ordinateur local à un emplacement sur un ordinateur distant, on utilise le syntaxe : **rsync -av /repértoire_local  user@hôte_distant:/chemin**. 
- L'emplacement distant peut être le système source ou le système de destination, mais l'un des deux ordinateurs doit être local.
- Pour conserver la propriété du fichier, vous devez être un utilisateur **root** sur le système de destination. 
- Si la destination est distante, authentifiez-vous en tant que **root**. Si la destination est locale, vous devez exécuter **rsync** comme **root**.

Dans cet exemple, synchronisez le répertoire **/var/log** de la **machine distante *atohme_ZG4_alma*** avec le répertoire **/tmp** sur **la machine locale *VM-Local*** :
```console
[root@VM-Local]# rsync -av root@atohme_ZG4_alma:/var/log /tmp
The authenticity of host 'atohme_zg4_alma (10.64.51.189)' can't be established.
ECDSA key fingerprint is SHA256:lyU8QN0X/bvnVRLZ7ccEow2Q4syIMs3S1dWc9cEDxy8.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added 'atohme_zg4_alma,10.64.51.189' (ECDSA) to the list of known hosts.
root@atohme_zg4_alma's password: 
receiving incremental file list
log/
log/Xorg.9.log
log/boot.log
...
sent 2,149 bytes  received 18,462,742 bytes  1,191,283.29 bytes/sec
total size is 18,450,206  speedup is 1.00
[root@VM-Local]# ls -l /tmp
total 8
drwxr-xr-x. 16 root root 4096 Apr 11 14:26 log
[root@VM-Local]# 
```

De la même manière, synchronisez le répertoire **/var/log** de la **machine locale *VM-Local*** avec le répertoire **/tmp** de la **machine distante *atohme_ZG4_alma***:
```console
[root@VM-Local]# rsync -av /var/log/ root@atohme_ZG4_alma:/tmp
root@atohme_zg4_alma's password: 
sending incremental file list
./
Xorg.9.log
boot.log
...
[root@VM-Local]#
```

> **Références** : Pages de manuel rsync(1)