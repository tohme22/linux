---
title: "TP1"
description: "linux"
date: 2022-02-06T12:36:57-05:00
draft: false
weight: 1
---

## Exercice 1

La commande `touch` permet de créer un fichier. Exemple :

```cmd
$ touch fichier.txt
```

1. Dans votre répertoire personnel `/home/e1234567/`, créez un répertoire nommé `/home/e1234567/**grading**`.

2. Allez dans le répertoire `/home/e1234567/grading`, et créez trois fichiers vides: `grade1`, `grade2` et `grade3`, en utilisant **une seule commande **.

3. Copiez le fichier `/home/e1234567/grading/grade1` dans `/home/e1234567/grading/grade1-copy.txt`.

4. Retournez dans votre répertoire personnel.

5. Créez un lien symbolique nommé `/home/e1234567/softlink` vers le fichier `/home/e1234567/grading/grade2`.

6. Listez le contenu de votre répertoire personnel pour vérifier que le lien symbolique est bien créé.

## Exercice 2

Cette commande crée le fichier `fichier1.txt`

1. Créez un répertoire `Atelier` dans votre répertoire
   personnel.

2. Créer un fichier `fichier2.txt` dans le répertoire courant. Copiez-le dans le
répertoire `Atelier`.

3. Créez un autre répertoire nommé `Rep`.

4. Déplacez `Atelier` dans `Rep`.

5. Déplacez vous dans `Atelier` et listez son contenu.

6. Revenez dans votre répertoire personnel en tapant simplement `cd`.

7. Supprimez le répertoire `Rep`.

8. Dans quel répertoire vous trouvez-vous?

## Exercice 3

La commande `ls -l` permet de voir la taille des
fichiers. Lorsqu'ils sont de grande taille, il peut être difficile de lire
cette information qui est exprimée en octets.

1. En cherchant dans l'aide de la commande `ls`, trouvez l'option à utiliser avec cette commande pour afficher cette information de façon à ce qu'elle soit facile à lire
pour un être humain.

2. Testez cette commande sur le fichier `/etc/services`.

## Exercice 4

1.	La commande `pwd` permet de vous indiquer dans quel répertoire vous vous trouvez. Utilisez cette commande pour afficher votre répertoire courant.

2.	Allez dans le répertoire `/usr/share/doc`, puis vérifiez le chemin de votre répertoire courant.

3.	Remontez dans le répertoire parent (utilisez un chemin relatif).

4.	Allez dans votre répertoire personnel à l’aide d’un chemin relatif.

5.	En étant dans votre dossier personnel, listez les fichiers présents.

6.	Toujours en étant dans votre dossier personnel, listez les fichiers du répertoire `/usr` 

## Exercice 5

1.	Allez dans le répertoire `/etc`.

2.	En utilisant la commande `find`, cherchez les fichiers dont le nom commence par la lettre `r` dans le répertoire courant. 

La commande `find` s'utilise de la manière suivante :

```cmd
$ find "répertoire dans lequel chercher" -name "motif à rechercher"
```

Exemple :

```cmd
$ find /etc -name "r*"
```

3. Cherchez les fichiers dont le nom se termine par `.txt` sur tout le disque (à partir du répertoire racine).

4. Cherchez tous les fichiers dont le nom contient la chaîne de caractères `rc` dans le répertoire courant.

5. Cherchez tous les fichiers dont le nom comporte trois caractères toujours en étant dans `/etc`.

## Exercice 6

En faisant cet exercice, vérifiez pour cette question le résultat de vos commandes en utilisant la commande `tree`. La figure ci-dessous montre un exemple d’utilisation de cette commande.

<bi style="color:red">Assurez-vous d'être revenu dans votre répertoire personnel**

1.	Dans votre répertoire personnel, à l’aide **d’une seule commande** et en utilisant **l’extension d’accolade**, créez l’arborescence des dossiers suivante :

![HTTP](../../images/atelier4.png?height=300&classes=border,shadow,inline)

2.	À l’aide **d’une seule commande** et en utilisant **l’extension d’accolade**, créez le fichier vide `priseNote` dans chaque répertoire `lab`.


