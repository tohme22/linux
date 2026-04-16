---
title: "Travail Pratique 3"
description: "linux"
draft: false
weight: 3
---
## Travail Pratique 3 -  Solution

#### Exercice 1 - Gestion des utilisateurs et des groupes
```cmd
# su -
```
```cmd
# useradd -u 3001 -c "Developpeur 1" -s /bin/sh dev1
# useradd -u 3002 -c "Developpeur 2" -s /bin/sh dev2
# useradd -u 4001 -c "Systeme Admin 1" -s /bin/bash sysadmin1
# useradd -u 4002 -c "Systeme Admin 2" -s /bin/bash sysadmin2
# useradd -u 4003 test2
```
```cmd
# tail /etc/passwd
```
```cmd
# passwd dev1
# passwd dev2
# passwd sysadmin1
# passwd sysadmin23
# passwd sysadmin2
# passwd test2
```
```cmd
# userdel -r test2
```
```cmd
# groupadd -g 2021 groupedev
# groupadd -g 2022 groupesysadmin
# groupadd -g 2023 groupeTI
```
```cmd
# tail /etc/group
```
```cmd
# usermod -g groupedev -aG groupeTI dev1
# usermod -g groupedev -aG groupeTI dev2
```
```cmd
# id dev1
# id dev2
```
```cmd
# usermod -g groupesysadmin -aG groupeTI sysadmin1
# usermod -g groupesysadmin -aG groupeTI sysadmin2
```
```cmd
# id sysadmin1
# id sysadmin2
```

---
#### Exercice 2 - Gestion des permissions du système de fichiers
```cmd
# mkdir -p /TI/dev
# mkdir /TI/sysadmin
# mkdir /TI/general
# chgrp groupeTI /TI
# chgrp groupedev /TI/dev/
# chgrp groupesysadmin /TI/sysadmin/
# chgrp groupeTI /TI/general/
# chmod 750 /TI/
# chmod 770 /TI/dev/
# chmod 770 /TI/sysadmin/
# chmod 775 /TI/general/
```
```cmd
# ls -la /TI/
total 0
drwxr-x---.  5 root groupeTI        48 Apr  9 15:49 .
dr-xr-xr-x. 18 root root           234 Apr  9 15:49 ..
drwxrwx---.  2 root groupedev        6 Apr  9 15:49 dev
drwxrwxr-x.  2 root groupeTI         6 Apr  9 15:49 general
drwxrwx---.  2 root groupesysadmin   6 Apr  9 15:49 sysadmin
```
```cmd
# su - dev1
$ touch /TI/sysadmin/programme1.js
touch: cannot touch '/TI/sysadmin/programme1.js': Permission denied
$ touch /TI/dev/programme1.js
$ touch /TI/general/programme1.js
```
```cmd
$ su - sysadmin1
Password: 
$ touch /TI/sysadmin/script.sh
$ touch /TI/dev/script.sh
touch: cannot touch '/TI/dev/script.sh': Permission denied
$ touch /TI/general/script.sh
```
```cmd
$ su - dev2
Password: 
$ rm /TI/dev/programme1.js 
rm: remove write-protected regular empty file '/TI/dev/programme1.js'? y
$ rm /TI/sysadmin/script.sh
rm: cannot remove '/TI/sysadmin/script.sh': Permission denied
$ mkdir /TI/Outils
mkdir: cannot create directory ‘/TI/Outils’: Permission denied
$ mkdir /TI/general/Outils
```
```cmd
$ chown root:groupeTI /TI/general/Outils
chown: changing ownership of '/TI/general/Outils': Operation not permitted
Vous devez utiliser le compte root pour changer la propriété d'un repértoire.
```

---
#### Exercice 3 - Exécution de commandes avec Sudo
```cmd
$ su - sysadmin1
Password: 
$ sudo cat /etc/shadow
[sudo] password for sysadmin1: 
sysadmin1 is not in the sudoers file.  This incident will be reported.
```
```cmd
$ su -
# visudo 

Ajoutez la ligne suivante et enregistrez le fichier :
%groupesysadmin ALL=(ALL)       ALL
```
```cmd
$ su - sysadmin1
Password: 
$ sudo cat /etc/shadow
[sudo] password for sysadmin1: 
root:$6$qfoJF0DvQZGx9mMu$::0:99999:7:::
bin:*:18505:0:99999:7:::
daemon:*:18505:0:99999:7:::
adm:*:18505:0:99999:7:::
...
```