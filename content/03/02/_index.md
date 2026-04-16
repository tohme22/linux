---
title: "Gestion des fichiers 2/2"
description: "linux"
draft: false
weight: 3
---

## Création de liens symboliques entre des fichiers

Il est possible de créer plusieurs noms qui pointent vers le même fichier, en créant un lien symbolique (parfois appelé lien logique) au fichier. 

La commande `ln -s` crée un lien symbolique, également appelé « lien logique ». Un lien symbolique n'est pas un fichier normal, mais un type de fichier spécial qui pointe vers un fichier ou un répertoire existant.

Les liens symboliques présentent certains avantages :

- Ils peuvent lier deux fichiers sur des systèmes de fichiers différents.

- Ils peuvent pointer vers un répertoire ou un fichier spécial, pas seulement un fichier normal.

Dans l'exemple suivant, la commande `ln -s` est utilisée pour créer un nouveau lien symbolique pour le fichier `/home/user/newfile-link2.txt` existant qui sera nommé `/tmp/newfile-symlink.txt`.

```cmd
[user@host ~]$ ln -s /home/user/newfile-link2.txt /tmp/newfile-symlink.txt
[user@host ~]$ ls -l newfile-link2.txt /tmp/newfile-symlink.txt
-rw-rw-r--. 1 user user 12 Mar 11 19:19 newfile-link2.txt
lrwxrwxrwx. 1 user user 11 Mar 11 20:59 /tmp/newfile-symlink.txt -> /home/user/newfile-link2.txt
[user@host ~]$ cat /tmp/newfile-symlink.txt
Soft Hello World
```

Dans l’exemple précédent, le premier caractère de la longue liste de `/tmp/newfile-symlink.txt` est `l` au lieu de `-`. Cela indique que le fichier est un lien symbolique et non un fichier normal. (Un `d` indiquerait que le fichier est un répertoire.)

Lorsque le fichier d'origine est supprimé, le lien symbolique pointe toujours vers ce fichier, mais la cible n'existe plus. Un lien symbolique qui pointe vers un fichier manquant est appelé « lien symbolique non résolu ».

```cmd
[user@host ~]$ rm -f newfile-link2.txt
[user@host ~]$ ls -l /tmp/newfile-symlink.txt
lrwxrwxrwx. 1 user user 11 Mar 11 20:59 /tmp/newfile-symlink.txt -> /home/user/newfile-link2.txt
[user@host ~]$ cat /tmp/newfile-symlink.txt
cat: /tmp/newfile-symlink.txt: No such file or directory
```

>> **Important** :Un des effets secondaires du lien symbolique non résolu dans l’exemple précédent est que si vous créez ultérieurement un nouveau fichier avec le même nom que le fichier supprimé (/home/user/newfile-link2.txt), le lien symbolique ne sera plus “non résolu” et pointera vers le nouveau fichier.

Un lien symbolique peut pointer vers un dossier. Le lien symbolique se comporte alors comme un répertoire. Le passage au lien symbolique avec cd fera de lui, le répertoire de travail.  

Si on utilise l’option `-P` de la commande `cd`, on se déplacera au répertoire lié (d’origine).

Dans l'exemple suivant, un lien symbolique nommé `/home/user/configfiles` est créé qui pointe vers le répertoire `/etc`.

```cmd
[user@host ~]$ ln -s /etc /home/user/configfiles
[user@host ~]$ cd /home/user/configfiles
[user@host configfiles]$ pwd
/home/user/configfiles
[user@host configfiles]$ cd -P /home/user/configfiles
/etc
```

## Correspondance des noms de fichiers à l'aide des extensions par le shell

### Objectifs

Après avoir terminé cette section, vous devez pouvoir exécuter efficacement les commandes affectant de nombreux fichiers en utilisant les fonctionnalités de filtrage par motif du shell bash.

### Extensions de ligne de commande

Le shell bash dispose de plusieurs moyens pour étendre une ligne de commande, notamment le filtrage par motif, l'extension du répertoire personnel, l'extension de la chaîne et la substitution de variable. La fonction de recherche de chemins d'accès, historiquement appelée globbing, ou globalisation, est certainement la plus puissante d'entre eux. La fonction de globalisation de bash, appelée parfois « caractères génériques », facilite la gestion d'un grand nombre de fichiers. Grâce aux métacaractères, qui s'« étendent » pour correspondre aux noms de fichiers et de chemins recherchés, les commandes s'exécutent en une fois sur tout un ensemble ciblé de fichiers.

#### Filtrage par motif

La globalisation est une opération d'analyse de commande de shell qui étend un motif de caractères génériques en une liste de noms de chemin correspondants. Les métacaractères de la ligne de commande sont remplacés par la liste correspondante avant l'exécution de la commande. Les motifs qui ne renvoient pas de résultat affichent le motif original recherché sous forme de texte littéral. Les classes de motifs et les métacaractères ci-dessous sont couramment utilisés.

|Motif|	Correspondance|
|---|---|
|*|Toute chaîne de zéro caractère ou plus.|
|?|Tout caractère unique.|
|[abc...]|N'importe quel caractère de la classe entre crochets.|
|[!abc...]|Tout caractère non compris dans la classe entre crochets.|
|[^abc...]|Tout caractère non compris dans la classe entre crochets.|
|[[:alpha:]]|Tout caractère alphabétique.|
|[[:lower:]]|Tout caractère minuscule.|
|[[:upper:]]|Tout caractère majuscule.|
|[[:alnum:]]|Tout caractère alphabétique ou numérique.|
|[[:punct:]]|Tout caractère imprimable, sauf un espace ou un caractère alphanumérique.|
|[[:digit:]]|Tout chiffre unique compris entre 0 et 9.|
|[[:space:]]|Tout caractère d'espacement unique. Cela peut inclure des tabulations, des sauts de ligne, des retours chariot, des sauts de page ou des espaces.|

Pour les exemples suivants, supposez que vous avez exécuté les commandes suivantes pour créer des exemples de fichiers.

```cmd
[user@host ~]$ mkdir glob; cd glob
[user@host glob]$ touch alfa bravo charlie delta echo able baker cast dog easy
[user@host glob]$ ls
able  alfa  baker  bravo  cast  charlie  delta  dog  easy  echo
[user@host glob]$ 
```

Le premier exemple utilisera des correspondances de modèle simples avec l'astérisque (`*`) et le point d'interrogation (`?`), et une classe de caractères, pour correspondre à certains de ces noms de fichiers.

```cmd
[user@host glob]$ ls a*
able  alfa
[user@host glob]$ ls *a*
able  alfa  baker  bravo  cast  charlie  delta  easy
[user@host glob]$ ls [ac]*
able  alfa  cast  charlie
[user@host glob]$ ls ????
able  alfa  cast  easy  echo
[user@host glob]$ ls ?????
baker  bravo  delta
[user@host glob]$ 
```

#### Extension par tilde

Le caractère tilde (`~`) correspond au répertoire personnel de l'utilisateur courant. S'il démarre une chaîne de caractères autre qu'une barre oblique (`/`), le shell interprétera la chaîne jusqu'à cette barre oblique comme un nom d'utilisateur, le cas échéant, et remplacera la chaîne par le chemin absolu vers le répertoire personnel de cet utilisateur. Si aucun nom d'utilisateur ne correspond, un tilde réel suivi de la chaîne de caractères sera alors utilisé à la place.

Dans l'exemple suivant, la commande echo est utilisée pour afficher la valeur du caractère tilde. La commande echo peut également être utilisée pour afficher les valeurs des caractères d'extension par accolades, variable et autres.

```cmd
[user@host glob]$ echo ~root
/root
[user@host glob]$ echo ~user
/home/user
[user@host glob]$ echo ~/glob
/home/user/glob
[user@host glob]$ 
```

#### Extension par accolades

L'extension par accolades permet de générer des chaînes de caractères discrétionnaires. Les accolades contiennent une liste de chaînes séparées par des virgules ou une expression séquentielle. Le résultat inclut le texte qui précède ou qui suit la définition de l'accolade. Les extensions par accolades peuvent être imbriquées les unes dans les autres. La syntaxe double point (`..`) s'étend en une séquence tel que `{m..p}` s'étend jusqu'en `m n o p`.

```cmd
[user@host glob]$ echo {Sunday,Monday,Tuesday,Wednesday}.log
Sunday.log Monday.log Tuesday.log Wednesday.log
[user@host glob]$ echo file{1..3}.txt
file1.txt file2.txt file3.txt
[user@host glob]$ echo file{a..c}.txt
filea.txt fileb.txt filec.txt
[user@host glob]$ echo file{a,b}{1,2}.txt
filea1.txt filea2.txt fileb1.txt fileb2.txt
[user@host glob]$ echo file{a{1,2},b,c}.txt
filea1.txt filea2.txt fileb.txt filec.txt
[user@host glob]$ 
```
Une utilisation pratique de l’extension d'accolade est de créer rapidement un certain nombre de fichiers ou de répertoires.

```cmd
[user@host glob]$ mkdir ../RHEL{6,7,8}
[user@host glob]$ ls ../RHEL*
RHEL6 RHEL7 RHEL8
[user@host glob]$ 
```

#### Extension par variable

Une variable agit comme un conteneur nommé pouvant stocker une valeur en mémoire. Les variables facilitent l'accès aux données stockées et leur modification à partir de la ligne de commande ou dans un script shell.

Vous pouvez affecter des données soous forme de valeur à une variable via la syntaxe suivante :

```cmd
[user@host ~]$ VARIABLENAME=value
```

Vous pouvez utiliser l'extension par variable pour convertir le nom de la variable en sa valeur sur la ligne de commande. Si une chaîne commence par un signe dollar (`$`), alors le shell essaiera d'utiliser le reste de cette chaîne en tant que nom de variable et de le remplacer par la valeur de la variable.

```cmd
[user@host ~]$ USERNAME=operator
[user@host ~]$ echo $USERNAME
operator
```

Pour éviter les erreurs dues à d'autres extensions du shell, vous pouvez mettre le nom de la variable entre accolades, par exemple `${VARIABLENAME}`.

```cmd
[user@host ~]$ USERNAME=operator
[user@host ~]$ echo ${USERNAME}
operator
```

Les variables du shell et les manières de les utiliser seront traitées plus en détail plus loin dans ce cours.

#### Substitution des commandes

La substitution de commande permet à la sortie d'une commande de remplacer la commande elle-même sur la ligne de commande. La substitution de commande se produit lorsqu'une commande est entre parenthèses et précédée d'un signe dollar (`$`). La forme `$(commande)` permet d'imbriquer plusieurs extensions de commandes.

```cmd
[user@host glob]$ echo "Aujourd'hui est $(date +%A)"
Today is Wednesday.
[user@host glob]$ echo "L'heure est $(date +%l%p) h $(date +%M)"
L'heure est 12 h 26
```

#### Protection des arguments contre l'extension

Dans le shell bash, de nombreux caractères ont une signification particulière. Pour empêcher le shell d’effectuer des extensions de shell sur certaines parties de votre ligne de commande, vous pouvez citer et échapper des caractères et chaînes.

La barre oblique inversée (`\\`) est un caractère d'échappement dans le shell Bash. Cela protégera le caractère qui le suit de son extension.

```cmd
[user@host glob]$ echo "La valeur du ${HOME} est votre répertoire personnel"
La valeur du /home/user est votre répertoire personnel

[user@host glob]$ echo "La valeur du \${HOME} est votre répertoire personnel"
La valeur du $HOME est votre répertoire personnel
```

Dans l'exemple précédent, pour protéger le signe dollar de l'extension, Bash l'a traité comme un caractère régulier et il n'a pas effectué d'extension variable sur $HOME.

Pour protéger les chaînes de caractères plus longues, on utilise des guillemets simples (`'`) ou doubles (`"`) pour entourer ces chaînes. Ils ont des effets légèrement différents. Les guillemets simples arrêtent toute extension du shell. Les guillemets doubles arrêtent la plupart des extensions shell.

Utilisez les guillemets doubles pour supprimer la globalisation et l'extension par le shell, tout en permettant la substitution de commandes et de variables.

```cmd
[user@host glob]$ echo "Salut ${USER} sur $(hostname) à $(date +%F), vous exécutez $(python3 -V)" 
Salut user sur host_glob à 2021-01-06, vous exécutez Python 3.6.8
```

Utilisez des guillemets simples pour interpréter tout le texte littéralement.

```cmd
[user@host glob]$echo 'Salut ${USER} sur $(hostname) à $(date +%F), vous exécutez $(python3 -V)' 
Salut ${USER} sur $(hostname) à $(date +%F), vous exécutez $(python3 -V)
```

>> **Important** : Les guillemets simples (**'**) et l'accent grave de substitution de commande (**`**) peuvent être faciles à confondre, tant à l'écran que sur le clavier. L'utilisation de l'un lorsque vous voulez utiliser l'autre entraîne un comportement inattendu du shell. 

