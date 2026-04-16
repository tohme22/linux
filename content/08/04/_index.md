---
title: "Commande sort"
description: "linux"
draft: false
weight: 4
---

###  Tri de données avec **sort**

- La commande **sort** permet de trier le contenu d’un fichier texte, ligne par ligne.
- La syntaxe de la commande **sort** est la suivante:
	
  **sort *[option] fichier***

- Par défaut, les **règles de tri** sont :
  - Les lignes commençant par un chiffre apparaîtront avant les lignes commençant par une lettre.
  - Les lignes commençant par une lettre minuscule apparaîtront avant les lignes commençant par la même lettre en majuscule.
- Les règles de tri peuvent être modifiées en fonction des options que vous fournissez à la commande **sort**.

##### Exemples (*Sans utiliser les options*):
```console
[antoine@host]$ cat fich3.txt
bananes
Oranges
Poires
Kiwis
Pommes
tomates
Comcombres
abricots
Appple
dodo
1234
5677
_76
Toto
[antoine@host]$ sort fich3.txt
1234
5677
_76
abricots
Appple
bananes
Comcombres
dodo
Kiwis
Oranges
Poires
Pommes
tomates
Toto
```
Voici la liste des **options** les plus utilisées:

|Options|Description|
|--|--|
|**-r**| Tri dans l’ordre inverse|
|**-n**| Tri des données numériques|
|**-k**| Tri d'une table sur la base d'un numéro de colonne|

##### Exemples:
- Vous pouvez effectuer un tri dans l’ordre inverse à l’aide de l'option **-r**.
```console
[antoine@host]$ sort -r fich3.txt
Toto
tomates
Pommes
Poires
...
```
Pour trier un fichier numériquement, utilisez l’option **–n**. Cette option est utilisée pour trier le fichier avec des **données numériques** présentes à l’intérieur. 
```console
[antoine@host]$ cat fich4.txt 
1003
15
200
3
39
50
558
89
[antoine@host]$ sort -n fich4.txt 
3
15
39
50
89
200
558
1003
```
Pour trier une table sur la base d'un numéro de colonne, en utilise l'otion **-k**
```console
[antoine@host]$ $ cat fich5.txt 
clerk    4000
director 9000
employee  6000
guard     3000
manager  5000
peon     4500
[antoine@host]$ $ sort -k 2 fich5.txt 
guard     3000
clerk    4000
peon     4500
manager  5000
employee  6000
director 9000
```

