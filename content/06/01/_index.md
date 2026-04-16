---
title: "Concepts d’utilisateur et de groupe"
description: "linux"
draft: false
weight: 1
---
## Description des concepts d'utilisateur et de groupe

### Qu'est-ce qu'un utilisateur ?

Un compte d'utilisateur est utilisé pour fournir des limites de sécurité entre différentes personnes et divers programmes pouvant exécuter des commandes.

Les utilisateurs ont des **noms d'utilisateur** pour les identifier aux utilisateurs humains et faciliter le travail. En interne, le système distingue les comptes d’utilisateurs du **numéro d’identification unique** qui leur est attribué, l'identifiant d'utilisateur ou **UID** . Si un compte d'utilisateur est utilisé par des humains, un mode de passe confidentiel lui sera généralement attribué. L'utilisateur s'en servira pour prouver qu'il est bien l'utilisateur autorisé lors de la connexion.

Les comptes d'utilisateurs sont essentiels à la sécurité du système. Chaque processus (programme en cours d'exécution) du système s'exécute avec le nom d'un utilisateur particulier. Chaque fichier est la propriété d'un utilisateur particulier. La propriété des fichiers permet au système d'appliquer le contrôle d'accès aux utilisateurs des fichiers. L'utilisateur auquel un processus en cours d'exécution est associé détermine à quels fichiers et répertoires ce processus peut accéder.

Les trois principaux types de comptes d'utilisateur sont super utilisateur, utilisateur système et utilisateur normal :

- Le compte **super utilisateur** destiné à l'administration du système. Le nom du super utilisateur est `root` et le compte est associé à l'**UID 0**. Le super utilisateur dispose d'un accès complet au système.

- Le système a des comptes **utilisateur système** utilisés par des processus fournissant des services de support. Ces processus, ou démons, n’ont généralement pas besoin de s’exécuter en tant que super utilisateur. Il s'agit de comptes sans privilège assignés qui leur permettent de sécuriser leurs fichiers et d'autres ressources les uns des autres et des utilisateurs standards du système. Les utilisateurs ne se connectent pas de manière interactive à l'aide d'un compte d'utilisateur système.

- La plupart des utilisateurs ont des **comptes d'utilisateurs standards** qu'ils utilisent pour leur travail quotidien. Comme les utilisateurs système, les utilisateurs standards ont un accès limité au système. 

Vous pouvez utiliser la commande `id` pour afficher des informations sur l'utilisateur actuellement connecté.

```console
[user01@host]$ id
uid=1000(user01) gid=1000(user01) groups=1000(user01) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

Pour afficher des informations basiques sur un autre utilisateur, transmettez le nom d'utilisateur à la commande `id` comme argument.

```console
[user01@host]$ id user02
uid=1002(user02) gid=1001(user02) groups=1001(user02) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

Pour afficher le propriétaire d'un fichier, utilisez la commande `ls -l`. Pour afficher le propriétaire d'un répertoire, utilisez la commande `ls -ld`. Dans la sortie suivante, la troisième colonne indique le nom de l'utilisateur.

```console
[user01@host]$ ls -l fichier1
-rw-rw-r--. 1 user01 user01 0 Feb  5 11:10 fichier1
[user01@host]$ ls -ld rep1
drwxrwxr-x. 2 user01 user01 6 Feb  5 11:10 rep1
```

Pour afficher des informations relatives au processus, utilisez la commande `ps`. Par défaut, seul les processus du shell actuel sont affichés. Ajoutez l'option `a` pour afficher tous les processus liés à un terminal. Pour afficher l'utilisateur associé à un processus, ajoutez l'option `u`. Dans la sortie suivante, la première colonne indique le nom de l'utilisateur.

```console
[user01@host]$ ps -au
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root       777  0.0  0.0 225752  1496 tty1     Ss+  11:03   0:00 /sbin/agetty -o -p -- \u --noclear tty1 linux
root       780  0.0  0.1 225392  2064 ttyS0    Ss+  11:03   0:00 /sbin/agetty -o -p -- \u --keep-baud 115200,38400,9600
user01      1207  0.0  0.2 234044  5104 pts/0    Ss   11:09   0:00 -bash
user01      1319  0.0  0.2 266904  3876 pts/0    R+   11:33   0:00 ps au
```

Le résultat de la commande précédente affiche les utilisateurs par nom, mais en interne, le système d'exploitation les repère à l'aide de leur identifiant utilisateur. La mise en correspondance des noms d'utilisateur et des UID est définie dans les bases de données des informations sur les comptes. Par défaut, les systèmes utilisent le fichier `/etc/passwd` pour stocker les informations concernant les utilisateurs locaux.

```console
[user01@host]$ vim /etc/passwd
```
Chaque ligne du fichier `/etc/passwd` contient des informations sur un utilisateur. Il est divisé en **sept champs séparés par deux-points**. Voici un exemple de ligne de `/etc/passwd` :

{{< highlight bash  >}}
user01:x:1000:1000:Jean Paul:/home/user01:/bin/bash
{{< / highlight >}}

1. Nom d'utilisateur pour cet utilisateur (user01).

2. Le mot de passe de l'utilisateur était stocké ici au format crypté. Il a été déplacé au fichier `/etc/shadow`, qui sera abordé plus loin. Ce champ doit toujours être x .

3. Le numéro `UID` de ce compte utilisateur (1000).

4. Le numéro `GID` du groupe principal de ce compte utilisateur (1000). Les groupes seront abordés plus loin dans cette section.

5. Le vrai nom de cet utilisateur (Jean Paul).

6. Le répertoire personnel de cet utilisateur (`/home/user01`). Il s'agit du répertoire de travail initial au démarrage du shell. Il contient les données de l'utilisateur et les paramètres de configuration.

7. Le programme shell par défaut de cet utilisateur, qui s'exécute lors de la connexion (`/bin/bash`). Pour un utilisateur normal, il s'agit généralement du programme qui fournit l'invite de ligne de commande de l'utilisateur. Un utilisateur système peut utiliser `/sbin/nologin` si les connexions interactives ne sont pas autorisées pour cet utilisateur.

### Qu'est-ce qu'un groupe ?

Un groupe est un ensemble d'utilisateurs devant partager l'accès aux fichiers et aux autres ressources du système. Les groupes peuvent être utilisés pour accorder l'accès à des fichiers à un ensemble d'utilisateurs plutôt qu'à un seul utilisateur.

Comme les utilisateurs, les groupes ont des noms de groupe pour faciliter le travail. En interne, le système distingue les comptes d’utilisateurs du numéro d’identification unique qui leur est attribué, l'identifiant d'utilisateur ou UID .

La mise en correspondance des noms de groupe et des `GID` est définie dans les bases de données des informations sur les comptes de groupe. Par défaut, les systèmes utilisent le fichier `/etc/group` pour stocker les informations concernant les groupes locaux.

```console
[user01@host]$ vim /etc/group
```
Chaque ligne du fichier `/etc/group` contient des informations sur un groupe. Chaque entrée de groupe est divisée en quatre champs séparés par deux-points. Voici un exemple de ligne de `/etc/group` :

{{< highlight bash >}}
group01:x:1010:user01,user02,user03
{{< / highlight >}}

1. Nom de ce groupe (group01).

2. Champ de mot de passe de groupe obsolète. Ce champ doit toujours être `x` .

3. Le numéro `GID` de ce groupe (1010).

4. Une liste des utilisateurs membres de ce groupe en tant que groupe supplémentaire (user01, user02, user03). Les groupes principaux (ou par défaut) et supplémentaires sont abordés plus loin dans cette section.

#### Groupes primaires et groupes supplémentaires

Chaque utilisateur a exactement **un groupe principal**. Pour les utilisateurs locaux, il s’agit du groupe répertorié par numéro `GID` dans le fichier `/etc/passwd`. Par défaut, il s’agit du groupe qui possédera les nouveaux fichiers créés par l’utilisateur.

Normalement, lorsque vous créez un nouvel utilisateur normal, un nouveau groupe portant le même nom que cet utilisateur est créé. Ce groupe est utilisé comme **groupe principal** pour le nouvel utilisateur, et cet utilisateur est le seul membre de ce groupe privé. Il s'avère que cela facilite la gestion des autorisations de fichiers, ce que nous verrons plus loin dans ce cours.

Les utilisateurs peuvent également avoir des **groupes supplémentaires**. La composition des groupes supplémentaires est déterminée par le fichier `/etc/group`. Les utilisateurs ont accès aux fichiers en fonction de l’accès de l’un de leurs groupes. Peu importe si le groupe ou les groupes ayant accès sont des groupes principaux ou supplémentaires de l'utilisateur.

Par exemple, si l'utilisateur `user01` a un groupe principal `user01` et des groupes supplémentaires `wheel` et `group01`, cet utilisateur pourra alors lire les fichiers lisibles par l’un de ces trois groupes.

La commande `id` peut également être utilisée pour connaître l'appartenance d'un utilisateur à un groupe:

```console
[user01@host]$ id
uid=1000(user01) gid=1000(user01) groups=1000(user01),10(wheel),1010(group01) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
```

Dans l'exemple précédent, `user01` a le groupe `user01` comme groupe principal (`gid`). L'élément `groups` liste tous les groupes de cet utilisateur (autres que le groupe principal `user01`). Les groupes `wheel` et `group01` sont des groupes supplémentaires de l'utilisateur. 



## Accès en tant que super utilisateur

### Le super utilisateur

La plupart des systèmes d'exploitation ont une sorte de super utilisateur qui a tout pouvoir sur le système. Dans Linux, il s'agit de l'utilisateur `root`. Cet utilisateur a le pouvoir d'outrepasser les privilèges normaux sur le système de fichiers. Il peut gérer et administrer le système. Pour effectuer des tâches comme l'installation ou la suppression de logiciels, et pour gérer des fichiers et des répertoires du système, l'utilisateur doit augmenter ses privilèges au niveau de ceux de l'utilisateur root.

L'utilisateur `root` est le seul, par rapport aux utilisateurs normaux, à pouvoir contrôler la plupart des périphériques, à quelques exceptions près. Par exemple, les utilisateurs normaux peuvent contrôler des périphériques amovibles, tels que des périphériques USB. Ainsi, les utilisateurs normaux sont autorisés à ajouter et supprimer des fichiers et à gérer un périphérique amovible, mais par défaut, seul l'utilisateur root peut gérer les disques durs « fixes ».

Ce privilège illimité est toutefois assorti de responsabilités. L'utilisateur `root` a une capacité infinie à endommager le système : suppression de fichiers et de répertoires, suppression de comptes d'utilisateur, ajout de portes dérobées, etc. Si la sécurité du compte de l'utilisateur root était compromise, quelqu'un d'autre aurait le contrôle de l'administration du système. Tout au long de la présente formation, nous encourageons les administrateurs à se connecter en tant qu'utilisateur normal et à n'augmenter leurs privilèges au niveau de root que lorsque cela est nécessaire.

Le compte `root` sous Linux équivaut à peu près au compte local « Administrateur » sous Microsoft Windows. Dans Linux, la plupart des administrateurs système se connectent à l'aide d'un compte d'utilisateur sans privilège et utilisent divers outils pour disposer temporairement des privilèges `root`.

> **Avertissement**: Sous Microsoft Windows, il était courant par le passé que l'utilisateur Administrateur local se connecte directement pour exécuter les tâches d'administration du système. Bien que cela soit possible sous Linux, Red Hat recommande aux administrateurs système de ne pas se connecter directement en tant que root. Les administrateurs système doivent plutôt se connecter en tant qu'utilisateur normal et utiliser d'autres mécanismes (**su** ou **sudo**, par exemple) pour obtenir temporairement des privilèges de super utilisateur.
Lorsque vous vous connectez en tant que super utilisateur, tout l'environnement du bureau s'exécute inutilement avec des privilèges administratifs. Dans cette situation, toute faille de sécurité qui ne compromettrait en temps normal que le compte de l'utilisateur est alors susceptible de compromettre tout le système.

### Changement de compte d'utilisateur

La commande **`su`** ou **`su -`** met à un utilisateur de basculer vers le compte d'un autre utilisateur. Si vous exécutez su à partir d'un compte d'utilisateur normal, vous serez invité à saisir le mot de passe du compte sur lequel vous souhaitez passer. Quand `root` exécute `su`, vous n'avez pas besoin d'entrer le mot de passe de l'utilisateur.

La commande `su` démarre **un shell sans connexion**, alors que la commande `su -` (avec l'option de tiret) lance **un shell de connexion**. La principale différence qui existe entre ces deux commandes est que `su -` configure l'environnement shell comme s'il s'agissait d'une nouvelle connexion sous cette identité, alors que `su` lance simplement un shell sous l'identité de cet utilisateur, mais en conservant les paramètres d'environnement courants.

```console
[user01@host]$ su user02
Password: 
[user02@host]$ echo $PATH
/home/**user02**/.local/bin:/home/**user02**/bin:/home/**user01**/.local/bin:/home/**user01**/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
[user02@host]$ exit
[user01@host]$
```

```console
[user01@host]$ su - user02
Password: 
[user02@host]$ echo $PATH
/home/**user02**/.local/bin:/home/**user02**/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
[user02@host]$ exit
[user01@host]$
```

Si vous omettez le nom d'utilisateur, la commande `su` ou `su -` tente de basculer vers root par défaut.

```console
[user01@host]$ su -
Password: 
[root@host]# 
```
Dans la plupart des cas, les administrateurs doivent exécuter `su -` pour obtenir les paramètres d'environnement normaux de l'utilisateur. Pour plus d'informations, consultez la page de manuel `bash(1)`.

### Exécution de commandes avec Sudo

Dans certains cas, le compte d'utilisateur `root`. peut ne pas avoir de mot de passe valide pour des raisons de sécurité. Dans ce cas, les utilisateurs ne peuvent pas se connecter au système en tant que `root` directement avec un mot de passe, et `su` ne peut pas être utilisé pour obtenir un shell interactif. Dans ce cas, sudo peut être utilisé pour accéder à `root`.

À la différence de `su` , **`sudo`**  nécessite généralement que **les utilisateurs entrent leur propre mot de passe pour l'authentification, et non le mot de passe du compte d'utilisateur auquel ils tentent d'accéder**. Autrement dit, les utilisateurs qui utilisent sudo pour exécuter des commandes en tant que root n'ont pas besoin de connaître le mot de passe root. Au lieu de cela, ils utilisent leurs propres mots de passe pour authentifier l'accès.

En outre, `sudo` peut être configuré pour autoriser des utilisateurs spécifiques à exécuter une commande sous une autre identité, ou uniquement certaines commandes sous l'identité de cet utilisateur.

> **Note** :Dans Linux, tous les membres du groupe `wheel` peuvent utiliser `sudo` pour exécuter des commandes sous l'identité de n'importe quel utilisateur, y compris `root`. L'utilisateur sera invité à saisir son propre mot de passe.

Par exemple, lorsque `sudo` est configuré pour autoriser l'utilisateur `user01` à exécuter la commande `usermod` en tant que `root`, `user01` peut exécuter la commande suivante pour verrouiller ou déverrouiller le compte d'un utilisateur :

```console
[user01@host]$ sudo usermod -L user02
[sudo] password for user01: 
[user01@host]$ su - user02
Password: 
su: Authentication failure
```

Si un utilisateur essaie d'exécuter une commande sous une autre identité et que la configuration sudo ne l'autorise pas, la commande sera bloquée, la tentative sera consignée dans le journal et, par défaut, un email sera envoyé à l'utilisateur root.

```console
[user02@host]$ sudo tail /var/log/secure
[sudo] password for user02: 
user02 is not in the sudoers file.  This incident will be reported.
```

Un autre avantage de `sudo` est que toutes les commandes exécutées sont journalisées par défaut dans `/var/log/secure`.

```console
[user01@host]$ sudo tail /var/log/secure
...
Feb  6 20:45:46 host sudo[2577]:  user01 : TTY=pts/0 ; PWD=/home/user01 ; USER=root ; COMMAND=/sbin/usermod -L user02
...
```
#### Obtenir un shell root interactif avec Sudo

Si un compte d'utilisateur non administrateur sur le système peut utiliser `sudo` pour exécuter la commande `su`, vous pouvez exécuter **`sudo su -`** à partir de ce compte pour obtenir un shell d'utilisateur root interactif. Cela fonctionne parce que `sudo` exécutera `su -` en tant que root et root n'a pas besoin d'entrer un mot de passe pour utiliser `su` .

```console
[user01@host]$ sudo su -
[sudo] password for user01: 
[root@host]# 
```

#### Configuration de Sudo

Le fichier de configuration principal pour `sudo` et **`/etc/sudoers`**. Pour éviter les problèmes si plusieurs administrateurs tentent de le modifier en même temps, vous devez le modifier uniquement avec la commande `visudo`.

```console
[user01@host]$ sudo visudo
```

Par exemple, la ligne suivante du fichier `/etc/sudoers` active l'accès sudo pour les membres du groupe `wheel`.

```cmd
## Allows people in group wheel to run all commands
%wheel  ALL=(ALL)       ALL
```

Dans cette ligne, `%wheel` est le groupe auquel la règle s'applique. Un `%` spécifie qu'il s'agit d'un groupe, le groupe `wheel` . L'indication `ALL=(ALL)` spécifie que de n'importe quel ordinateur, les membres du groupe `wheel` peut exécuter n'importe quelle commande. Le `ALL` final indique que `wheel` peut exécuter ces commandes en tant que n'importe quel utilisateur du système.

Vous pouvez aussi donner ce privilège à juste un utilisateur ou un autre groupe, en ajoutant les lignes suivantes:

```cmd
user01  ALL=(ALL)  ALL
```

```cmd
%group01  ALL=(ALL)  ALL
```




