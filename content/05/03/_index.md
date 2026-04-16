---
title: "L’environnement shell"
description: "linux"
draft: false
weight: 5
---

## Modification de l'environnement shell

### Les variables shell

Le **shell bash** vous permet de définir des **variables shell** que vous pouvez utiliser pour aider à exécuter des commandes ou pour modifier le comportement du shell. Vous pouvez également **exporter des variables shell en tant que variables d'environnement** qui sont automatiquement copiées dans les programmes exécutés à partir de ce shell au démarrage. Vous pouvez utiliser des variables pour faciliter l'exécution d'une commande avec un argument long ou pour appliquer un paramètre commun aux commandes exécutées à partir de ce shell.

Les variables shell **sont uniques à une session shell particulière**. Si vous avez deux fenêtres de terminal ouvertes ou deux sessions de connexion indépendantes sur le même serveur distant, vous exécutez deux shells. Chaque shell a son propre ensemble de valeurs pour ses variables shell.

#### Attribution de valeurs aux variables shell

Attribuez une valeur à une variable shell à l'aide de la syntaxe suivante :

```console
NOMVARIABLE=valeur
```

Les noms de variables peuvent contenir **des lettres majuscules ou minuscules, des chiffres et le caractère de soulignement (`\_`)**. Par exemple, les commandes suivantes définissent des variables shell :

```console
[user@host]$ COMPTE=40
[user@host]$ Prenom=John
[user@host]$ fich1=/tmp/abc
[user@host]$ _ID=RH123
```
N'oubliez pas que cette modification **affecte uniquement le shell dans lequel vous exécutez la commande**, et non pas les autres shells que vous exécutez sur ce serveur.

Vous pouvez utiliser la commande `set` pour lister toutes les variables shell actuellement définies. *(Elle liste également toutes les fonctions du shell que vous pouvez ignorer.)* Cette liste est suffisamment longue pour que vous souhaitiez canaliser la sortie dans la commande less afin de l'afficher page par page.

```console
[user@host]$ set | less
...
BASH=/usr/bin/bash
BASH_VERSION='4.4.20(1)-release'
COLORTERM=truecolor
COLUMNS=98
CONF_FILE=/etc/vdoconf.yml
DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
DESKTOP_SESSION=gnome
DIRSTACK=()
...
```

#### Récupération de valeurs avec une extension de variable

Vous pouvez utiliser l'extension de variable pour faire référence à la valeur d'une variable que vous avez définie. Pour ce faire, faites précéder le nom de la variable d'un signe dollar (`$`). Dans l'exemple suivant, la commande echo affiche le reste de la ligne de commande saisie, mais une fois l'extension de variable effectuée.

Par exemple, la commande suivante définit la variable shell `COMPTE` sur 40.

```console
[user@host]$ COMPTE=40
```

Si vous entrez la commande echo COMPTE, cela affichera la chaîne COMPTER.

```console
[user@host]$ echo COMPTE
COMPTE
```

Mais si vous entrez la commande `echo $COMPTE`, cela affichera la valeur de la variable `COMPTE`.

```console
[user@host]$ echo $COMPTE
40
```

Un exemple plus pratique serait d'utiliser une variable pour désigner un nom de fichier long pour plusieurs commandes.

```console
[user@host]$ fich1=/tmp/tmp.z9pXW0HqcC
[user@host]$ ls -l $fich1
-rw-------. 1 user user 1452 Jan 22 14:39 /tmp/tmp.z9pXW0HqcC
[user@host]$ rm $fich1
[user@host]$ ls -l $fich1
total 0
```

> **Important** : 
S'il existe des caractères de fin adjacents au nom de la variable, vous devrez peut-être protéger le nom de la variable par des accolades. Vous pouvez toujours utiliser des accolades dans les extensions de variables, mais vous verrez également de nombreux exemples dans lesquels ils ne sont pas nécessaires et sont omis.
Dans l'exemple suivant, la première commande echo tente d'étendre la variable inexistante `COMPTEx`, ce qui ne provoque pas d'erreur, mais ne renvoie rien.
```console
[user@host]$ echo Répéter $COMPTEx
Répéter
[user@host]$ echo Répéter ${COMPTE}x
Répéter 40x
```


#### Configuration de bash avec des variables shell

Certaines variables du shell sont définies **au démarrage de bash** mais peuvent être modifiées pour ajuster le comportement du shell.

Par exemple, deux variables shell qui affectent l'historique du shell et la commande history sont `HISTFILE` et `HISTFILESIZE`. 
`HISTFILE`spécifie l'emplacement d'un fichier dans lequel enregistrer l'historique du shell à la fermeture de ce dernier. Par défaut, il s'agit du fichier de l'utilisateur `~/.bash_history`. La variable `HISTFILESIZE` spécifie le nombre de commandes devant être enregistrées dans ce fichier à partir de l'historique.
Vous pouvez modifier la valeur de ces variables, exemple modifier la variable `HISTFILESIZE` pour enregistrer 2000 commandes au lieu de 1000. *Cette modification sera appliquée temporairement jusqu'à la fermeture du terminal.*
```console
[user@host]$ set | grep HISTFILE
HISTFILE=/home/user/.bash_history
HISTFILESIZE=1000
[user@host]$ HISTFILESIZE=2000
[user@host]$ set | grep HISTFILESIZE
HISTFILESIZE=2000
```

Un autre exemple est `PS1`, qui est une variable shell contrôlant l'apparence de l'invite du shell. Si vous modifiez cette valeur, l'apparence de votre invite de shell sera différente. Un certain nombre d'extensions de caractères spéciaux prises en charge par l'invite sont listés dans la section « PROMPTING » de la page de manuel `bash(1)`.
Exemple: Pour changer l'invite du shell pour afficher seulement le nom de l'utilisateur, le temps et l'emplacement, vous utiliser les extensions `\u \t \w`

```console
[user@host]$ echo $PS1
[\u@\h \W]\$
[user@host]$ PS1="[\u \t \W]$ "
[user 09:05:17]$ 
```

Deux éléments à noter à propos de l'exemple ci-dessus : premièrement, comme la valeur définie par `PS1` est une invite, il est pratiquement toujours souhaitable de terminer l'invite par un espace de fin. Deuxièmement, chaque fois que la valeur d'une variable contient un espace sous n'importe quelle forme, à savoir un espace, une tabulation ou un retour, la valeur doit être encadrée par des guillemets simples ou doubles. Ce n'est pas optionnel. Des résultats inattendus se produisent si les guillemets sont omis. Examinez l'exemple `PS1` ci-dessus et notez qu'il est conforme à la recommandation (espace de fin) et la règle (guillemets).
Configuration de programmes avec des variables d'environnement

### Les variables d’environnement

Le shell fournit un environnement aux programmes que vous exécutez à partir de ce shell. Entre autres choses, cet environnement inclut des informations sur le répertoire de travail en cours du système de fichiers, les options de ligne de commande transmises au programme, et les valeurs des variables d'environnement. Les programmes peuvent utiliser ces variables d'environnement pour modifier leur comportement ou leurs paramètres par défaut.

Les variables shell qui ne sont pas des variables d'environnement ne peuvent être utilisées que par le shell. Les variables d'environnement peuvent être utilisées par le shell et par des programmes exécutés à partir de ce shell.

> **Note:** Les variables `HISTFILE`, `HISTFILESIZE` et `PS1` que vous avez étudiées dans la section précédente n'ont pas besoin d'être exportées en tant que variables d'environnement, car elles ne sont utilisées que par le shell lui-même et non par les programmes que vous exécutez à partir du shell.

Pour lister toutes les variables d'environnement d'un shell particulier, exécutez la commande `env`.

```console
[user@host]$ env 
...
LANG=en_US.UTF-8
USER=user
DESKTOP_SESSION=gnome
WAYLAND_DISPLAY=wayland-0
GNOME_TERMINAL_SCREEN=/org/gnome/Terminal/screen/62055956_29df_424e_b580_691b0d5645e3
PWD=/home/user
...
```

Pour lister la valeur d'une seule variable d’environnement, exécutez la commande `printenv` suivi par le nom de la variable.

```console
[user@host]$ printenv HOME
/home/user
```

#### Création des variables d’environnement

Pour créer des variables d’environnement, vous devez créer ou transformer une **variable définie dans le shell en une variable d'environnement** et cela en l'exportant avec la commande `export`.

Exemple: Créer la variable d'environnement `EDITOR` qui spécifie le programme que vous souhaitez utiliser comme éditeur de texte par défaut pour les programmes de ligne de commande.
Par défaut, cette variable d'environnement n'est pas créée. Pour la créer, vous devez d'abord créer une variable shell `EDITOR`, puis la transformer en variable d'environnement en utilisant la commande `export`.

```console
[user@host]$ echo $EDITOR

[user@host]$ EDITOR=vim
[user@host]$ echo $EDITOR
vim
[user@host]$ printenv EDITOR
[user@host]$ export EDITOR
[user@host]$ printenv EDITOR
vim
```

Vous pouvez aussi créer et exporter une variable shell en variable d'environnement en une seule étape :

```console
[user@host]$ export EDITOR=vim
```

Un autre exemple est la variable `LANG`, qui définit les paramètres régionaux. Cette variable ajuste la langue préférée de la sortie du programme ; le jeu de caractères ; le formatage des dates, des chiffres et de la devise ; et l'ordre de tri des programmes. S'il est réglé sur `en_US.UTF-8`, le paramètre régional utilise l'anglais américain avec l'encodage de caractères `Unicode UTF-8`. Si vous modifier la valeur de la variable d'environnement  `LANG` sur autre chose, par exemple `fr_FR.UTF-8`, il utilisera l'encodage de caracètres `Unicode UTF-8` français.

```console
[user@host]$ date
Tue Jan 22 16:37:45 CST 2019
[user@host]$ echo $LANG
en_US.UTF-8
[user@host]$ export LANG=fr_FR.UTF-8
[user@host]$ printenv LANG
fr_FR.UTF-8
[user@host]$ date
mar. janv. 22 16:38:14 CST 2019
```

Une autre variable d'environnement importante est `PATH`. La variable `PATH` contient une liste de répertoires séparés des deux-points contenant des programmes :

```console
[user@host]$ echo $PATH
/home/user/.local/bin:/home/user/bin:/usr/share/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
[user@host]$ printenv PATH
/home/user/.local/bin:/home/user/bin:/usr/share/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
```

Lorsque vous exécutez une commande telle que `ls`, le shell recherche le fichier exécutable ls dans chacun de ces répertoires dans l'ordre, et exécute le premier fichier correspondant qu'il trouve. (Sur un système classique, il s'agit de `/usr/bin/ls`.)

Vous pouvez facilement ajouter des répertoires supplémentaires à la fin de votre `PATH` . Par exemple, vous avez peut-être des programmes ou des scripts exécutables à exécuter comme des commandes normales dans `/home/user/sbin` . Vous pouvez ajouter `/home/user/sbin` à la fin de votre `PATH` pour la session en cours comme ceci :

```console
[user@host]$ export PATH=${PATH}:/home/user/sbin
[user@host]$ printenv PATH
/home/user/.local/bin:/home/user/bin:/usr/share/Modules/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/home/user/sbin
```

#### Supprimer des variables shell et des variables d'environnement

Pour supprimer complètement une variables shell et sa variables d'environnement, utilisez la commande `unset` :

```console
[user@host]$ echo $LANG
en_US.UTF-8
[user@host]$ unset LANG
[user@host]$ echo LANG

[user@host]$ printenv LANG
[user@host]$ 
```

Pour supprimer la valeur d'une variable d'environnement sans supprimer sa variable shell, utilisez la commande `export -n` :

```console
[user@host]$ export -n EDITOR
[user@host]$ printenv EDITOR
[user@host]$ echo $EDITOR
vim
```

### Paramétrage automatique des variables

Si vous souhaitez définir automatiquement des variables d'environnement ou du shell au démarrage de votre shell, vous pouvez modifier **les scripts de démarrage bash**. Au démarrage de bash, plusieurs fichiers texte contenant des commandes shell sont exécutés pour initialiser l'environnement shell.

Les scripts exacts qui s'exécutent dépendent de la manière dont le shell a été lancé, qu'il s'agisse d'un shell de connexion interactif, d'un shell sans connexion ou d'un script shell.

Si vous souhaitez modifier votre compte d'utilisateur qui affecte toutes les invites de votre shell interactif au démarrage, modifiez votre fichier `~/.bashrc`. Par exemple, vous pouvez définir l'éditeur par défaut de ce compte sur `vim` en modifiant le fichier comme suit :

{{< highlight bash >}}
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# User specific aliases and functions
export EDITOR=vim
{{< / highlight >}}

### Création et exécution des scripts shell bash

De nombreuses tâches d'administration système simples et courantes sont effectuées à l'aide d'outils de ligne de commande. Les tâches plus complexes nécessitent souvent le chaînage de
plusieurs commandes qui se transmettent les résultats. À l'aide de l'environnement du shell bash et des fonctions de script, les commandes Linux sont combinées en **scripts shell** pour résoudre
facilement des problèmes concrets ardus et répétitifs.

Dans sa forme la plus simple, un **script shell bash** est un fichier exécutable contenant une liste de commandes et éventuellement une logique de programmation permettant de contrôler la prise
de décision dans une tâche globale. Lorsqu'il est bien écrit, un script shell est en lui-même un puissant outil de ligne de commande qui peut être exploité par d'autres scripts.
La maîtrise de la création de script shell est essentielle à une bonne administration système dans tout environnement opérationnel. Une connaissance pratique de la création de scripts shell est
très importante dans les environnements entreprise où l'utilisation de scripts peut améliorer l'efficacité et la précision d'exécution de tâches routinières.

Vous pouvez créer un script shell bash en ouvrant un nouveau fichier vide dans un éditeur de texte. Bien que vous puissiez utiliser n'importe quel éditeur de texte, les éditeurs avancés tels que `vim` 
comprennent la syntaxe shell bash et proposent une mise en surbrillance par code de couleurs. Cette mise en surbrillance permet d'identifier les erreurs courantes telles que la
syntaxe incorrecte, les guillemets dépareillés, les parenthèses, les accolades et les crochets non fermés, etc.

```console 
[user@host]$ vim monscript.sh
```

#### Spécification de l'interpréteur de commandes

La première ligne d'un script commence par la notation `#!`, composée d'un **dièse** et d'une **point d'exclamation**. 
Cette notation spécifique de nombre magique sur deux octets indique un script d'interprétation. La syntaxe qui suit la notation est le nom complet de fichier qui permet à l'interpréteur de
commandes approprié de traiter les lignes de ce script. Pour les fichiers script utilisant la syntaxe de script bash, la première ligne d'un script shell commence comme suit :

```console #!/bin/bash ```

#### Écrire un script bash

Pour écrire un script simple qui affiche un message au terminal, utilisez la commande `echo` suivi par le texte a affiché entre guillemets `""`.
La commande `echo` est largement utilisée dans les scripts shell pour afficher des messages d'information ou d'erreur.

{{< highlight bash  >}}
#!/bin/bash 
echo "Bonjour tout le monde"
{{< / highlight >}}

Vous pouvez taper une **liste des commandes** à exécuter. Utilsiez le signe `#` si vous voulez ajouter des commentaires.
Vous pouvez aussi **rediriger le résultat** d'une commande vers un fichier, et aussi créer **des variables** et les utiliser dans le script.

{{< highlight bash  >}}
#!/bin/bash 
echo "Bonjour tout le monde"
echo "Emplacement du répertoire:"
pwd
touch fich{1..5}.txt
  
# Lister les fichiers créés
echo "Voici la liste des fichiers:"
ls fich*
ls -l fich* > sortie.txt
echo "Voici la liste des fichiers détaillés:"
VAR1=sortie.txt
cat ${VAR1}
{{< / highlight >}}

#### Exécution d'un script shell bash

Un script shell terminé doit pouvoir être exécuté comme une commande ordinaire. Vous pouvez utiliser les commandes `sh` ou `bash` suivi par le nom du script à exécuter.

```console[user@host]$ sh monscript.sh
 Bonjour tout le monde
 ...
[user@host]$ bash monscript.sh
 Bonjour tout le monde
 ...
```

Vous pouvez aussi utiliser la commande `chmod a+x` pour ajouter l'autorisation d'exécution au script. En faisant cela, vous pouvez exécuter le script shell en entrant le nom de chemin d'accès du script sur la ligne de commande.

```console
[user@host]$ chmod a+x monscript.sh
[user@host]$ /home/user/monscript.sh
[user@host]$ ./monscript.sh
 Bonjour tout le monde
 ...
```

Si vous placez le script dans l'un des répertoires listés dans la variable d'environnement `PATH` du shell, vous pouvez invoquer le script shell en utilisant le nom de fichier seul, comme pour toute
autre commande. Le shell utilise la première commande trouvée avec ce nom de fichier ; évitez d'utiliser des noms de commande existants pour votre nom de fichier de script shell. 
Un des repéretoires qui se trouve dans la variable `PATH` est `/home/user/bin`, vous devez créer ce répertoire, il n'est pas créée par défaut.
Vous pouvez déplacer votre script dans ce répertoire.

La commande `which`, suivie du nom de fichier du script exécutable, affiche le nom du chemin d'accès à la commande qui sera exécutée. 

```console
[user@host]$ echo $PATH
/home/user/.local/bin:/home/user/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/user/sbin

[user@host]$ which monscript.sh
/usr/bin/which: no monscript.sh in (/home/user/.local/bin:/home/user/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/home/user/sbin)

[user@host]$ mkdir bin
[user@host]$ pwd
/home/user/bin
[user@host]$ mv monscript.sh bin/
[user@host]$ which monscript.sh
~/bin/monscript.sh

[user@host]$ cd bin
[user@PC_Prof bin]$ monscript.sh
 Bonjour tout le monde
 Emplacement du répertoire:
 /home/user/bin
 Voici la liste des fichiers:
 fich1.txt  fich2.txt  fich3.txt  fich4.txt  fich5.txt
 Voici la liste des fichiers détaillés:
 -rw-rw-r--. 1 antoine antoine 0 Feb 16 18:08 fich1.txt
 -rw-rw-r--. 1 antoine antoine 0 Feb 16 18:08 fich2.txt
 -rw-rw-r--. 1 antoine antoine 0 Feb 16 18:08 fich3.txt
 -rw-rw-r--. 1 antoine antoine 0 Feb 16 18:08 fich4.txt
 -rw-rw-r--. 1 antoine antoine 0 Feb 16 18:08 fich5.txt
 ```
