---
title: "Commande tr"
description: "linux"
draft: false
weight: 3
---

### Transformation de caractères avec **tr**

- La commande **tr** (pour l’abrégé de *translate*) permet de **traduire, convertir et/ou supprimer des caractères** depuis l’entrée standard stdin, tout en écrivant sur la sortie standard stdout. 
- Cela en fait un outil très précieux pour la manipulation de chaîne de caractères.
- La syntaxe de la commande **tr** est la suivante:
	
  **tr *[option] ensemble1 ensemble 2***
  
##### Exemples (*Sans utiliser les options*):
```console
[antoine@host]$ echo "bmontmk.bkm" | tr bk co
cmontmo.com
```
```console
[antoine@host]$ echo "bienvenue sur le site cmontmo.com"| tr '[a-z]' '[A-Z]'
BIENVENUE SUR LE SITE CMONTMO.COM

```
```console
[antoine@host]$ echo "Le, séparateur, est, une, virgule" | tr ',' ';'
Le; séparateur; est; une; virgule
```
```console
[antoine@host]$ cat /etc/passwd | tr ':' '\n'
root
x
0
0
root
/root
/bin/bash
```
**Voici quelques caractères d'échappement :**

|Caractère |Description|
|--|--|
|**\n**| Correspond à une nouvelle ligne|
|**\t**| Correspond à une tabulation|
|**\r**| Correspond à un retour|
|**\f**| Correspond à un saut de page|

Voici la liste des **options** les plus utilisées:

|Options|Description|
|--|--|
|**-d**| Supprimer les caractères du premier ensemble de la sortie|
|**-s**| Remplacer les caractères répétés répertoriés dans l’ensemble 1 par une seule occurrence|
|**-c**| Complète l’ensemble de caractères de la chaîne|

##### Exemples:
- Dans cet exemple, on demande à la commande **tr** de supprimer le caractère **,** et le **#** dans le 2ème exemple :
```console
[antoine@host]$ echo "Le, séparateur, est, une, virgule"| tr -d ","
Le séparateur est une virgule
[antoine@host]$ 
[antoine@host]$ cat fich1.txt
# Bonjour antoine
# Hello!
# OK
[antoine@host]$ cat fich1.txt | tr -d '#'
 Bonjour antoine
 Hello!
 OK
```
- Dans cet exemple, on demande à la commande **tr** de supprimer un caractère qui se répète. Par exemple pour retirer tous les espaces consécutifs :
```console
[antoine@host]$ echo "Bienvenue     sur         cmontmo.com"| tr -s '[:space:]'
Bienvenue sur cmontmo.com
```
- Dans cet exemple, on demande à la commande **tr** de compléter tous les caractères **non alphanumériques** par le caractère par le caractère nouvelle ligne **\n**.
```console
[antoine@host]$ echo "Bienvenue sur cmontmo.com" | tr -c '[:alnum:]' '\n'
Bienvenue
sur
cmontmo
com
```
