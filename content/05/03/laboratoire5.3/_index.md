---
title: "Laboratoire 5.3"
description: "linux"

draft: false
weight: 6
---
### Laboratoire 5.3 -  Modification de l'environnement shell

Dans ce laboratoire, vous devez pouvoir réaliser les tâches suivantes :

- Modifier le profil de l'utilisateur.
- Créer une variable shell.
- Créer une variable d'environnement. 
- Créer et exécuter un script shell.

##### Étape 1:
Dans cette étape, vous allez modifier votre invite shell pour ajouter le temps. Pour le faire, vous allez ajouter la variable shell `PS1` dans le fichier `~/.bashrc` de votre utilisateur actuel:

&nbsp; &nbsp; 1.1 Éditez le fichier de configuration `~/.bashrc` en utilisant `vim`.

&nbsp; &nbsp; 1.2 Ajoutez dans le fichier la variable shell `PS1='[\u@\h \t \w]$ '`. N'oubliez pas d'inclure, à la fin de la valeur que vous définissez, un espace de fin et de placer la valeur entière entre guillemets, y compris l'espace de fin.

&nbsp; &nbsp; 1.3 Sauvegardez le fichier `~/.bashrc` , quittez le terminal et rouvrez-le, pour mettre à jour l'invite de commande. Vérifiez que l'invite affiche maintenant le temps, similaire à cet exemple:

```ps
[e1234567@localhost 12:34:25 ~]
```
##### Étape 2:
Dans cette étape, vous allez attribuer une valeur à une variable shell. Les noms de variables peuvent contenir des lettres majuscules ou minuscules, des chiffres et le caractère de soulignement. Récupérez la valeur de la variable.

&nbsp; &nbsp; 2.1 Créez un fichier vide et nommez-le `temp.txt`.
  
&nbsp; &nbsp; 2.2 Créez une variable appelée `fichier` avec la valeur `temp.txt`.

&nbsp; &nbsp; 2.3 Afficher la valeur de la variable `fichier`.

&nbsp; &nbsp; 2.4 Utilisez le nom de la variable `fichier` et la commande `ls -l` pour lister les fichiers `temp.txt`. 

&nbsp; &nbsp; 2.5 Utilisez la commande `rm` et le nom de la variable `fichier` pour supprimer le fichier `temp.txt`. Confirmez qu'il a été supprimé.

##### Étape 3:

3.1 Attribuez la valeur `vim` à la variable `editor`. Utilisez une commande pour transformer la variable shell en variable d'environnement.

##### Étape 4:
Dans cette étape, vous allez créer et exécuter un script bash simple.

&nbsp; &nbsp; 4.1 Utilisez l'éditeur de texte `vim` pour créer un fichier texte sous votre répertoire personnel et nommez-le `monscript1.sh`.

&nbsp; &nbsp; 4.2 Insérez le texte suivant et enregistrez le fichier. Notez que le nombre de signes dièse (#) est arbitraire:

{{< highlight bash >}}
#!/bin/bash
echo "C'est mon premier script bash" > ~/sortie.txt
echo "" >> ~/sortie.txt
echo "#####################################################" >> ~/sortie.txt
{{< / highlight >}}

&nbsp; &nbsp; 4.3 Enregistrez et fermez le fichier. 

&nbsp; &nbsp; 4.4 Utilisez la commande `sh` pour exécuter le script.

&nbsp; &nbsp; 4.5 Affichez le contenu du fichier `sortie.txt` généré par le script.

&nbsp; &nbsp; 4.6 Éditez encore une fois le fichier `monscript1.sh`.

&nbsp; &nbsp; 4.7 Ajoutez les derniéres 5 lignes suivantes au fichier `monscript1.sh`.

{{< highlight bash >}}
#!/bin/bash
echo "C'est mon premier script bash" > ~/sortie.txt
echo "" >> ~/sortie.txt
echo "#####################################################" >> ~/sortie.txt

echo "LISTER LE CONTENU DE MON RÉPERTOIRE" >> ~/sortie.txt
echo "" >> ~/sortie.txt
ls -la >> ~/sortie.txt
echo "" >> ~/sortie.txt
echo "#####################################################" >> ~/sortie.txt
{{< / highlight >}}

&nbsp; &nbsp; 4.8 Enregistrez et fermez le fichier.

&nbsp; &nbsp; 4.9 Rendez le fichier `monscript1.sh` exécutable à l'aide de la commande `chmod`.

&nbsp; &nbsp; 4.10 Exécutez le script `monscript1.sh` en entrant directement son nom de chemin d’accès.

&nbsp; &nbsp; 4.11 Affichez le contenu du fichier `sortie.txt` généré par le script.

&nbsp; &nbsp; 4.12 Supprimez le fichier script `monscript1.sh` et le fichier `sortie.txt`.
