---
title: "Commande cut"
description: "linux"
draft: false
weight: 5
---

### Extraire des colonnes et des champs avec **cut**

- La commande **cut** permet **d’extraire des colonnes ou des champs sélectionnés** depuis son entrée standard stdinentrée standard ou des fichiers.
- La syntaxe de la commande **cut** est la suivante:
	
  **cut *options fichier***
  
|Options|Description|
|--|--|
|**-f**| Spécifiez les champs que vous souhaitez extraire|
|**-d**| Spécifiez le délimiteur que vous souhaitez utiliser|
|**-c**| Spécifiez les caractères que vous souhaitez extraire|
  
#### Extraire un champ :
En utilisant l’option **-f** vous pouvez spécifier les champs que vous souhaitez extraire.
```console
[antoine@host]$ cat employes.txt 
Riveau Alain	1919-05-22	2020-02-01	Directeur des operations
Cavalier Bart	1987-09-09	2020-09-01	Directeur des ventes
Stone Emma	1991-01-30	2021-01-02	Directrice des communication
Trembblay Guy	1962-02-02	2020-08-01	Vendeur
[antoine@host]$ cut -f 2 employes.txt
1919-05-22
1987-09-09
1991-01-30
1962-02-02
[antoine@host]$ cut -f 3,4 employes.txt
2020-02-01	Directeur des operations
2020-09-01	Directeur des ventes
2021-01-02	Directrice des communication
2020-08-01	Vendeur
[antoine@host]$ cut -f 1,4 employes.txt > employes_nom.txt
[antoine@host]$ cat employes_nom.txt 
Riveau Alain	Directeur des operations
Cavalier Bart	Directeur des ventes
Stone Emma		Directrice des communication
Trembblay Guy	Vendeur
```
#### Couper en fonction d’un délimiteur :
Par défaut, le délimiteur est **la tabulation** mais les fichiers peuvent utiliser d’autres séparateurs de colonnes **(espace, virgule, apostrophes, …)**.
Ainsi la commande vous permet de spécifier un délimiteur grâce à l’option **-d**.

Exemple, pour extraire le 1er champ avant le délimiteur **espace ' '**, et couper le reste sur un **fichier** :
```console
[antoine@host]$ cat employes.txt 
Riveau Alain	1919-05-22	2020-02-01	Directeur des operations
Cavalier Bart	1987-09-09	2020-09-01	Directeur des ventes
Stone Emma		1991-01-30	2021-01-02	Directrice des communication
Trembblay Guy	1962-02-02	2020-08-01	Vendeur
[antoine@host]$ cut -d ' ' -f 1 employes.txt
Riveau
Cavalier
Stone
Trembblay
```
Exemple, pour extraire le 1er champ avant le délimiteur **virgule ','**, et couper le reste sur **une chaine de caractères** :
```console
[antoine@host]$ echo "Bienvenue,sur,cmontmo.com" | cut -d ',' -f 1
Bienvenue
```
Exemple, pour extraire le 3e et le 4e champs avant le délimituer **':'** et couper le reste, en utilisant un **pipeline** :
```console
[antoine@host]$ head /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
...
[antoine@host]$ head /etc/passwd | cut -d ':' -f 3-4
0:0
1:1
2:2
...
```
#### Extraire des champs par des caractères:
En utilisant l'option **-c** vous pouvez extraire ***N*** caractères. 

Exemple, pour extraire les **10 à 20 premiers caractères** du fichier employee.txt:
```console
[antoine@host]$ cut -c 10-20 employes.txt
ain		1919-05
Bart	1987-0
a		1991-01-3
```
Exemple, pour afficher l’historique des commandes bash sans les chiffres, utilise la commande **cut** pour afficher à partir du **8e caractères** :
```console
[antoine@host]$ history
965  su -
966  ls -l
967  cat /etc/group
968  useradd database1
...
[antoine@host]$ history | cut -c 8-
su - 
ls -l
cat /etc/group
useradd database1
...
```



