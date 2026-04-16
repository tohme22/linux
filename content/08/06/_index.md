---
title: "Commande sed"
description: "linux"
draft: false
weight: 6
---

### Transformations de texte de base sur un flux d'entrée avec **sed**

- La commande **sed** permet effectuer des **transformations de texte de base sur un flux d'entrée (un fichier ou une entrée d'un pipeline)**. 
- Il peut effectuer de nombreuses opérations sur des fichiers comme **la recherche, la recherche et le remplacement, l'insertion ou la suppression.**
- La syntaxe de la commande **sed** est la suivante:
	
  **sed *options commandes fichier***
  
|Commandes|Description|
|--|--|
|**s**| substitute : remplace une chaîne de caractères spécifiée par une autre|
|**g**| global: remplace tout le contenu |
|**d**| delete : supprime les lignes sélectionnées|

|Options|Description|
|--|--|
|**-i**| Indique la création d’un fichier destiné à remplacer le fichier d’origine.|
  
#### Remplacer (substituer) les occurences d'une chaine :

**sed s/*ancienne_chaine/nouvelle_chaine*/g'**

##### Exemple 1 (Substitution sur un **fichier** avec **s** et **g**) :
```console
[antoine@host]$ cat fich2.txt 
Tcp et UDP est eu servivce réseau
UDP est utilisé aussi UDP
TCP est performant comme UDP 
Addresse IP
tcp est un protocole
udp aussi 
UDP est un protocole

[antoine@host]$ sed 's/UDP/PPP/' fich2.txt 
Tcp et PPP est eu servivce réseau
PPP est utilisé aussi UDP
TCP est performant comme PPP 
Addresse IP
tcp est un protocole
udp aussi 
PPP est un protocole

[antoine@host]$ sed 's/UDP/PPP/g' fich2.txt 
Tcp et PPP est eu servivce réseau
PPP est utilisé aussi PPP
TCP est performant comme PPP 
Addresse IP
tcp est un protocole
udp aussi 
PPP est un protocole

[antoine@host]$ cat fich2.txt 
Tcp et UDP est eu servivce réseau
UDP est utilisé aussi UDP
TCP est performant comme UDP 
Addresse IP
tcp est un protocole
udp aussi 
UDP est un protocole

[antoine@host]$ sed 's/UDP/PPP/g' fich2.txt > fich2_mod.txt 
[antoine@host]$ cat fich2_mod.txt 
Tcp et PPP est eu servivce réseau
PPP est utilisé aussi PPP
TCP est performant comme PPP 
Addresse IP
tcp est un protocole
udp aussi 
PPP est un protocole
```
- Vous pouvez aussi utiliser l'option **-i** pour créer un nouveau fichier avec la transformation):
```console
[antoine@host]$ sed -i 's/UDP/PPP/g' fich2.txt
Tcp et PPP est eu servivce réseau
PPP est utilisé aussi PPP
TCP est performant comme PPP 
Addresse IP
tcp est un protocole
udp aussi 
PPP est un protocole
[antoine@host]$ cat fich2.txt
Tcp et PPP est eu servivce réseau
PPP est utilisé aussi PPP
TCP est performant comme PPP 
Addresse IP
tcp est un protocole
udp aussi 
PPP est un protocole
```
##### Exemple 2 (Substitution sur un **pipeline**) :
```console
[antoine@host]$ tail -n 3 /etc/passwd 
admin1:x:1008:1008:Admin un:/home/admin1:/bin/bash
admin2:x:1009:1009:Admin deux:/home/admin2:/bin/bash
sophie:x:1010:1010::/home/sophie:/bin/bash
[antoine@host]$ tail -n 3 /etc/passwd | sed 's/:/|/g'
admin1|x|1008|1008|Admin un|/home/admin1|/bin/bash
admin2|x|1009|1009|Admin deux|/home/admin2|/bin/bash
sophie|x|1010|1010||/home/sophie|/bin/bash
```

#### Suppression des occurences d'une chaine :
- En utilisant la commande **d** (suppression), vous pouvez supprimer des occurrences des occurrences d'un **fichier** ou d'un **pipeline**: 

**sed 'nd' *(ou n est le numéro de(s) ligne(s) à supprimer)***

##### Exemple:
```console
[antoine@host]$ cat employes.txt
Riveau Alain	1919-05-22	2020-02-01	Directeur des operations
Cavalier Bart	1987-09-09	2020-09-01	Directeur des ventes
Stone Emma		1991-01-30	2021-01-02	Directrice des communication
Trembblay Guy	1962-02-02	2020-08-01	Vendeur
[antoine@host]$ sed '1,2d' employes.txt 
Stone Emma		1991-01-30	2021-01-02	Directrice des communication
Trembblay Guy	1962-02-02	2020-08-01	Vendeur

[antoine@host]$ cat /etc/passwd | sed '1,50d' 
database2:x:1007:1007::/home/database2:/bin/bash
admin1:x:1008:1008:Admin un:/home/admin1:/bin/bash
admin2:x:1009:1009:Admin deux:/home/admin2:/bin/bash
sophie:x:1010:1010::/home/sophie:/bin/bash

[antoine@host]$ cat /etc/passwd | sed '1,50d' > passwd1.txt
[antoine@host]$ cat passwd1.txt
database2:x:1007:1007::/home/database2:/bin/bash
admin1:x:1008:1008:Admin un:/home/admin1:/bin/bash
admin2:x:1009:1009:Admin deux:/home/admin2:/bin/bash
sophie:x:1010:1010::/home/sophie:/bin/bash
```

#### Exemple avec les commandes cut, sed et sort :
```console
[antoine@host]$ cat fich6.txt 
Antoine:9656569:H7T:Directeur
Alain:26548569:H8T:Directeur adjoint
Pauline:232326569:H7X:Assistance
Jean:3456569:J9I:Assistant
Carol:695636569:K8O:Directrice
[antoine@host]$ cat fich6.txt | cut -d':' -f 1,4 | sed 's/:/ détient le poste: /g' | sort
Alain détient le poste: Directeur adjoint
Antoine détient le poste: Directeur
Carol détient le poste: Directrice
Jean détient le poste: Assistant
Pauline détient le poste: Assistance
```




