---
title: "TP2"
description: "linux"
draft: false
weight: 2
---

## Exercice 1 - Pipeline

#### Question 1:

- En utilisant un pipeline, et la commande **tr**, affichez les différents répertoires contenus dans la variable **PATH** sur des lignes différentes.

Voici un exemple du résultat attendu :
```cmd
/home/e1234567/.local/bin
/home/e1234567/bin
/usr/local/bin
/usr/local/sbin
/usr/bin
/usr/sbin
```

#### Question 2:

- En utilisant un pipeline, et la commande **tr**, affichez le contenu du fichier **/etc/passwd** sur des colonnes différentes séparées par une tabulation horizontale au lieu des deux points.

Voici un exemple du résultat attendu :
```cmd
root	x	0	0	root	/root	/bin/bash
bin	x	1	1	bin	/bin	/sbin/nologin
daemon	x	2	2	daemon	/sbin	/sbin/nologin
adm	x	3	4	adm	/var/adm	/sbin/nologin
lp	x	4	7	lp	/var/spool/lpd	/sbin/nologin
...
```

#### Question 3:

- Reprenez la commande précédente et faites le **tri alphabétique** du résultat pour trier selon **l’ordre alphabétique des noms des utilisateurs**.

Voici un exemple du résultat attendu :
```cmd
admin1	x	1008	1008	Admin un	/home/admin1	/bin/bash
admin2	x	1009	1009	Admin deux	/home/admin2	/bin/bash
adm	x	3	4	adm	/var/adm	/sbin/nologin
avahi	x	70	70	Avahi mDNS/DNS-SD Stack	/var/run/avahi-daemon	/sbin/nologin
bin	x	1	1	bin	/bin	/sbin/nologin
...
```

#### Question 4:

- La commande cut permet d’extraire des colonnes d’un fichier. Par exemple, **cut -d ’ :’ –f1,3 /etc/passwd** affiche la première et la troisième colonne du fichier passwd en utilisant les deux points comme séparateur de colonnes. 
La commande **sed ‘s/ancienne-chaine/nouvelle-chaine/g’** permet de remplacer toutes les occurrences de l’ancienne chaine par la nouvelle chaine.

Affichez le répertoire personnel de chaque utilisateur du système à l’aide du format suivant :

***nomUtilisateur* a pour répertoire personnel :*cheminDuRépertoirePersonnel***

```cmd
root a pour répertoire personnel :/root
bin a pour répertoire personnel :/bin
daemon a pour répertoire personnel :/sbin
adm a pour répertoire personnel :/var/adm
...
```

## Exercice 2 - Pipeline et redirection

#### Question 1:
- Tout en utilisant les droits d’utilisateur standard, cherchez tous les fichiers journaux **.log* de votre système. 
- Le résultat doit être sauvegardé dans nouveau un fichier **journal.txt** et les messages d’erreurs doivent être supprimés. 
- Vérifier que le fichier **journal.txt** est créé.

#### Question 2:
- Ajoutez une ligne d’étoiles à la fin de votre fichier **journal.txt**. 
- Vérifier que la ligne est ajoutée au fchier **journal.txt**.

#### Question 3:
- Reprenez votre commande de la *Question 1* et modifiez-la pour chercher tous les fichiers journaux **.log** de votre système triés par ordre alphabétique décroissant.  
- Le résultat doit être ajouté au fichier **journal.txt**. Vérifier que le nouveau résultat est ajouté au fchier **journal.txt**.

## Exercice 3 - Substitution de commande et de variable

#### Question 1:
- Comptez le nombre de tous les utilisateurs de votre système et affectez le résultat à la variable **nbUtilisateurs**. 

#### Question 2:
- Affichez le nombre d’utilisateurs à l’aide d’un message qui a le format suivant : **$$$ Le nombre d'utilisateurs est: *N* $$$**

Exemple de sortie :
```cmd
$$$ Le nombre d'utilisateurs est: 49 $$$
```

#### Question 3:
- On veut savoir combien de dossiers ou fichiers contient le répertoire courant. 
- Le résultat doit être affiché comme suit :
**Le répertoire *nomduRépertoire* contient *N* dossiers ou fichiers**

Exemple de sortie :
```cmd
Le répertoire /home/e1234567 contient 8 fichiers ou dossiers
```

## Exercice 4 - vim, script bash et variable d’environnement
#### Question 1:
- À l’aide de l’éditeur **vim**, écrivez un script bash nommé **script1.sh**, qui permet de chercher la ligne d’information sur l’utilisateur **etudiantadmin** à partir du fichier **/etc/passwd**.
- Vous pouvez utiliser la commande **grep** pour retourner la ligne qui contient une chaine de caractère spécifique.
- Ensuite, créez dans votre script des variables pour stocker les informations sur le nom du groupe principal, le répertoire personnel et le shell de cet utilisateur.
- Enfin, votre script doit afficher un message qui a le format suivant :

  **etudiantadmin a le groupe principal : *nomDuGroupePrincipal*, le répertoire personnel : *nomDuRepertoirePersonne*, le shell : *exécutableDuShell* .**

Exemple de sortie :
```cmd
$ sh script1.sh 
etudiantadmin a le groupe principal: etudiantadmin, le répertoire personnel: /home/etudiantadmin, le shell: /bin/bash
```

#### Question 2:
- Créez le répertoire **scripts** dans votre répertoire personnel. Déplacez-y le script bash.

#### Question 3:
- Faites-en sorte de pouvoir invoquer le script bash par son nom, comme vous le faites pour les autres commandes.



