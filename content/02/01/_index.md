---
title: "Accès à la ligne de commande"
description: "linux"
draft: false
weight: 1
---

## Accès à la ligne de commande

### Présentation du shell bash

Une ligne de commande est une interface en mode texte qui permet de saisir des instructions dans un système informatique. La ligne de commande de Linux est fournie par un programme appelé shell (interpréteur de commandes). Diverses options du programme shell ont été développées au fil du temps et différents utilisateurs peuvent être configurés pour utiliser différents shells. Cependant, la plupart des utilisateurs conservent les paramètres par défaut.

Le shell par défaut des utilisateurs de Red Hat Enterprise Linux est le shell GNU Bourne-Again (bash). Bash est une version améliorée de l'un des shells les plus populaires sur les systèmes UNIX, le shell Bourne (sh).

Lorsqu'un shell est utilisé de manière interactive, il affiche une chaîne lorsqu'il attend une commande de la part de l'utilisateur. On l'appelle l'invite du shell. Lorsqu'un utilisateur standard lance un shell, l'invite par défaut se termine par le caractère `$`, comme indiqué ci-dessous.

```console
[user@host]$ 
```

Le caractère $ est remplacé par un `#` si le shell est exécuté par le super utilisateur, root. Cela souligne bien qu'il s'agit du shell d'un super utilisateur, ce qui permet d'éviter les accidents et les erreurs susceptibles d'entraîner un effet sur tout le système. L'invite du super utilisateur est indiquée ci-dessous.

```console
[root@host]# 
```

Bash peut s'avérer puissant pour l'exécution de commandes. Le shell bash fournit un langage de script qui permet l'automatisation des tâches. Le shell offre des fonctionnalités supplémentaires qui peuvent simplifier ou rendre possibles des opérations difficiles à accomplir efficacement avec des outils graphiques.

> **Note**: Le shell bash repose sur le même concept que l'interpréteur de ligne de commande que l'on trouve dans les dernières versions de cmd.exe de Microsoft Windows, bien que le shell bash offre un langage de script plus évolué. Il s'apparente également au Windows PowerShell de Windows 7 et Windows Server 2008 R2 et version ultérieure. Les administrateurs Apple Mac qui font appel à l'utilitaire Terminal auront le plaisir de constater que bash est le shell par défaut sous MacOS.

### Concepts élémentaires du shell

Les commandes saisies dans l'invite du shell comportent trois parties principales :

- la commande à exécuter ;

- les options qui ajustent le comportement de la commande ;

- les arguments, qui sont, le plus souvent, les cibles de la commande. 

La commande est le nom du programme à exécuter. Elle peut être suivie d'une ou plusieurs options qui affinent le comportement de la commande ou ce qu'elle va faire. Les options commencent normalement par un ou deux tirets (-a ou --all, par exemple) pour les distinguer des arguments. Les commandes peuvent également être suivies d'un ou plusieurs arguments qui indiquent souvent une cible sur laquelle la commande doit s'exécuter.

Par exemple, la commande `usermod -L user01` a une commande (`usermod`), une option (`-L`) et un argument (`user01`). Cette commande a pour effet de verrouiller le mot de passe du compte de l'utilisateur `user01`.

### Connexion à un ordinateur local

Pour exécuter le shell, vous devez vous connecter à l'ordinateur sur un terminal. Un terminal est une interface textuelle utilisée pour entrer des commandes dans un système informatique et imprimer les résultats. Il y a plusieurs manières de procéder.

L'ordinateur pourrait disposer d'un clavier matériel et d'un écran pour les entrées et les sorties qui y sont directement connectées. Il s'agit de la console physique de la machine Linux. La console physique prend en charge plusieurs consoles virtuelles qui peuvent exécuter des terminaux distincts. Chaque console virtuelle prend en charge une session connectée indépendante. Vous pouvez passer de l'une à l'autre en appuyant simultanément sur `Ctrl+Alt` et une touche de fonction (de `F1` à `F6`). La plupart de ces consoles virtuelles exécutent un terminal fournissant une invite de connexion texte. Si vous entrez votre nom d'utilisateur et votre mot de passe correctement, vous vous connectez et une invite du shell s'affiche.

L'ordinateur pourrait fournir une invite de connexion graphique sur l'une des consoles virtuelles. Vous pouvez l'utiliser pour vous connecter à un environnement graphique. L'environnement graphique s'exécute également sur une console virtuelle. Pour obtenir une invite du shell, vous devez démarrer un programme de terminal dans l'environnement graphique. L'invite du shell est fournie dans une fenêtre d'application du programme graphique de terminal.
Note

De nombreux administrateurs système choisissent de ne pas exécuter d'environnement graphique sur leurs serveurs. Les ressources qui seraient utilisées par l'environnement graphique sont alors utilisées par les services du serveur.

Dans Red Hat Enterprise Linux 8, si l'environnement graphique est disponible, il s'exécute sur la première console virtuelle, nommée tty1. Cinq invites de connexion texte supplémentaires sont disponibles sur les consoles virtuelles deux à six.

Si vous vous connectez à l'aide de l'écran de connexion graphique, votre environnement graphique démarre sur la première console virtuelle qui n'est actuellement pas utilisée par une session de connexion. Normalement, votre session graphique remplace l'invite de connexion sur la deuxième console virtuelle. (`tty2`). Cependant, si cette console est utilisée par une session de connexion texte active (pas seulement une invite de connexion), la console virtuelle libre suivante est utilisée à la place.

L'écran de connexion graphique continue de s'exécuter sur la première console virtuelle. (`tty1`). Si vous êtes déjà connecté à une session graphique et que vous vous connectez sous l'identité d'un autre utilisateur sur l'écran de connexion graphique ou que vous utilisez l'élément de menu Switch User (qui permet de changer d'utilisateur dans l'environnement graphique sans se déconnecter), un autre environnement graphique est démarré pour cet utilisateur sur la console virtuelle libre suivante.

Lorsque vous vous déconnectez d'un environnement graphique, celui-ci se ferme et la console physique revient automatiquement à l'écran de connexion graphique de la première console virtuelle.
Note

Un serveur administré à distance est dépourvu de clavier et d'écran. Un datacenter peut contenir de nombreux racks de serveurs administrés à distance, et le fait ne pas les équiper d'un clavier et d'un écran permet d'économiser de l'espace et de l'argent. Pour permettre aux administrateurs de se connecter, un serveur administré à distance peut disposer d'une invite de connexion fournie par sa console de série, s'exécutant sur un port série connecté à un serveur de console en réseau pour l'accès à distance de la console de série.

La console de série est normalement utilisée pour réparer le serveur si sa propre carte réseau est mal configurée et que la connexion via sa propre connexion réseau devient impossible. Cependant, la plupart du temps, les serveurs administrés à distance sont accessibles via d'autres moyens sur le réseau.
Connexion sur le réseau

Les utilisateurs et les administrateurs Linux ont souvent besoin d'obtenir un accès shell à un système distant en se connectant à ce dernier via le réseau. Dans un environnement informatique moderne, de nombreux serveurs administrés à distance sont en fait des machines virtuelles ou qui s'exécutent en tant qu'instances de cloud public ou privé. Ces systèmes ne sont pas physiques et ne disposent pas de consoles matérielles réelles. Ils pourraient même ne pas donner accès à leur console de série ou leur console physique (simulée).

Sous Linux, le moyen le plus courant d'obtenir une invite du shell sur un système distant consiste à utiliser SSH (Secure Shell). La plupart des systèmes Linux (y compris Red Hat Enterprise Linux) et MacOS fournissent le programme ssh de ligne de commande OpenSSH dans ce but.

Dans cet exemple, un utilisateur avec une invite du shell sur la machine hôte utilise ssh pour se connecter au système Linux distant remotehost en tant qu'utilisateur remoteuser :

```console
[user@host]$ ssh remoteuser@remotehost
remoteuser@remotehost's password: password
[remoteuser@remotehost]$
```

La commande ssh chiffre la connexion pour sécuriser la communication contre l'interception ou le piratage des mots de passe et du contenu.

### Déconnexion

Lorsque vous avez terminé d'utiliser le shell et que vous souhaitez quitter, vous avez le choix entre plusieurs méthodes pour mettre fin à la session. Vous pouvez saisir la commande exit pour mettre fin à la session shell en cours. Vous pouvez également terminer une session en appuyant sur `Ctrl+D`.

Voici un exemple d'utilisateur qui se déconnecte d'une session SSH :

```console
[remoteuser@remotehost]$ exit
logout
Connection to remotehost closed.
[user@host]$
```

## Accès à la ligne de commande depuis le bureau

### Introduction à l'environnement de bureau GNOME

L'environnement de bureau est l'interface graphique de l'utilisateur d'un système Linux. L'environnement de bureau par défaut dans Red Hat Enterprise Linux 8 est fourni par GNOME 3. Il offre un bureau intégré aux utilisateurs ainsi qu'une plateforme de développement unifiée basée sur l'environnement graphique offert par Wayland (par défaut) ou le système X Window hérité.

Le shell GNOME fournit les fonctions de base de l'interface utilisateur de l'environnement de bureau GNOME. L'application GNOME Shell est hautement personnalisable. Red Hat Entreprise Linux 8 permet d'adapter l'apparence de GNOME Shell au thème « Standard » qui est utilisé dans cette section. Red Hat Entreprise Linux 7 est adapté à un thème alternatif nommé « Classique » qui est plus proche de l'apparence des anciennes versions de GNOME. L'un ou l'autre thème sont accessibles de manière persistante à la connexion en cliquant sur l'icône en forme d'engrenage en regard du bouton Sign In disponible après avoir sélectionné le compte, mais avant de saisir le mot de passe.

![HTTP](../../images/2-1.png?height=400&classes=border,shadow,inline)

À la première connexion d'un utilisateur, un programme de configuration initiale se lance pour aider à configurer les réglages de base du compte. Une fois cette opération effectuée, l'application GNOME Help démarre sur l'écran Getting Started with GNOME. Cet écran comprend des vidéos et de la documentation pour orienter les nouveaux utilisateurs vers l'environnement GNOME 3. Vous pouvez rapidement lancer l'Aide GNOME en cliquant sur le bouton Activities situé à gauche de la barre supérieure et dans le lanceur d'applications qui apparaît à gauche de l'écran, en cliquant sur l'icône en forme de bouée de sauvetage pour la lancer.

#### Parties du shell GNOME

Les éléments du shell GNOME comprennent les éléments suivants, comme illustré par cette capture d'écran du shell GNOME en mode Vue d'ensemble du mode Activities :

![HTTP](../../images/2-2.png?height=500&classes=border,shadow,inline)

1. Barre supérieure : barre qui longe tout le haut de l'écran. Elle s'affiche dans Vue d'ensemble du mode Activities et dans les espaces de travail. La barre supérieure contient le bouton Activities et les contrôles de volume, du réseau, d'accès au calendrier et de sélection entre les modes de saisie du clavier (si plusieurs modes sont configurés).

2. Vue d'ensemble du mode Activities : il s'agit d'un mode spécial qui permet à l'utilisateur d'organiser les fenêtres et de lancer des applications. La Vue d'ensemble du mode Activities peut être saisie en cliquant sur le bouton Activities dans le coin supérieur gauche de la barre supérieure ou en appuyant sur la touche `Super`. La touche `Super` (parfois appelée touche Windows ou touche de commande) se trouve à proximité du coin inférieur gauche d'un clavier de type IBM PC à 104/105 touches ou Apple. Les trois grandes zones de la vue d'ensemble Activities sont le lanceur d'applications sur le côté gauche de l'écran, la vue d'ensemble des fenêtres au milieu de l'écran et le sélecteur d'espace de travail sur le côté droit de l'écran.

3. Menu système : le menu est situé dans l'angle supérieur droit de la barre supérieure permet de régler la luminosité de l'écran et d'activer ou de désactiver les connexions réseau. Sous le menu du nom d'utilisateur se trouvent les options permettant d'ajuster les paramètres de compte et de se déconnecter du système. Le menu système propose également des boutons pour ouvrir la fenêtre Settings, verrouiller l'écran ou arrêter le système.

4. Lanceur d'applications : liste configurable des icônes des applications favorites de l'utilisateur et des applications en cours d'exécution, complétée par un bouton grille au bas du lanceur d'applications pouvant servir à sélectionner d'autres applications. Les applications peuvent être lancées en cliquant sur l'une des icônes, ou en utilisant le bouton grille pour trouver une application moins utilisée. Ce « lanceur d'applications » est également parfois appelé le dock.

5. Vue d'ensemble des fenêtres : zone au centre de la vue d'ensemble des activités affichant les vignettes de toutes les fenêtres actives dans l'espace de travail actuel. Cela permet de faire apparaître plus facilement les fenêtres au premier plan dans un espace de travail encombré ou de les déplacer vers un autre espace de travail.

6. Sélecteur d'espace de travail : zone à droite de la vue d'ensemble Activities qui affiche les vignettes de tous les espaces de travail actifs et permet de sélectionner des espaces de travail ainsi que de déplacer des fenêtres d'un espace de travail à un autre.

7. Corbeille à messages : offre un moyen de passer en revue les notifications envoyées à GNOME par les applications ou des composants du système. Si une notification est envoyée, elle s'affiche brièvement sous la forme d'une simple ligne en haut de l'écran, et un indicateur apparaît au milieu de la barre supérieure, à côté de l'horloge, pour informer l'utilisateur des notifications reçues récemment. Il est possible d'ouvrir la corbeille à messages pour examiner ces notifications en cliquant sur l'horloge dans la barre supérieure ou en appuyant sur Super+M. Pour fermer la barre des notifications, cliquez sur l'horloge dans la barre supérieure ou en appuyant sur Échap ou à nouveau sur `Super+M`.

![HTTP](../../images/2-3.png?height=300&classes=border,shadow,inline)

Vous pouvez afficher et modifier les raccourcis clavier GNOME utilisés par votre compte. Ouvrez le menu système sur le côté droit de la barre supérieure. Cliquez sur le bouton Settings en bas du menu à gauche. Dans la fenêtre de l'application qui s'ouvre, sélectionnez Devices → Keyboard à partir du volet de gauche. Le volet de droite affiche vos paramètres de raccourci actuels.

> **Note** Il peut s'avérer difficile d'envoyer certains raccourcis clavier, tels que les touches de fonction ou la touche Super, à une machine virtuelle. Cela est dû au fait que les frappes de touche spéciales utilisées par ces raccourcis peuvent être capturées par votre système d'exploitation local ou par l'application que vous utilisez pour accéder au bureau graphique de votre machine virtuelle.

> **Important**
L'utilisation de la touche Super n'est pas toujours simple dans les environnements actuels de formation adaptée au rythme de chacun et de formation virtuelle Red Hat. Il est probable que vous ne puissiez pas simplement utiliser la touche Super de votre clavier, car elle n’est généralement pas transmise par votre navigateur Web à la machine virtuelle dans l'environnement de formation.
Une icône de clavier devrait normalement figurer en haut à droite de la fenêtre de navigateur qui affiche l’interface de votre machine virtuelle. Si vous cliquez dessus, un clavier s'affiche à l'écran. Si vous cliquez à nouveau dessus, il se ferme.
> > Le clavier à l'écran traite la touche Super comme une touche de modification qui est souvent maintenue enfoncée tout en appuyant sur une autre touche. Si vous cliquez dessus une fois, elle devient jaune pour indiquer que la touche est maintenue enfoncée. Dès lors, pour saisir Super+M dans le clavier à l'écran, cliquez sur `Super`, puis sur `M`.
Si vous voulez simplement enfoncer et relâcher la touche Super sur le clavier à l'écran, cliquez deux fois dessus. Le premier clic permet de maintenir la touche Super "enfoncée", et le deuxième clic de la relâcher.
Les autres touches traitées comme des touches de modification (comme Super) par le clavier à l'écran sont `Maj`, `Ctrl`, `Alt` et `Caps` . Les touches `Échap` et `Menu` sont traitées comme des touches normales et non comme des touches de modification.

### Espaces de travail

Les espaces de travail sont des écrans de bureau séparés qui contiennent différentes fenêtres d'application. Ils peuvent servir à organiser l'environnement de travail en regroupant par tâche les fenêtres d'applications ouvertes. Par exemple, les fenêtres utilisées pour effectuer une activité particulière de maintenance du système (comme la configuration d'un nouveau serveur distant) peuvent être regroupées dans un espace de travail unique, tandis que les applications de messagerie et autres applications de communication peuvent être regroupées dans un autre espace de travail.

Il existe deux méthodes simples pour passer d'un espace de travail à l'autre. Une méthode, sûrement plus rapide, consiste à appuyer sur `Ctrl+Alt+Flèche` vers le haut ou `Ctrl+Alt+Flèche` vers le bas pour changer d'espace de travail de manière séquentielle. La deuxième méthode consiste à basculer vers la vue d'ensemble Activities et à cliquer sur l'espace de travail souhaité.

L'utilisation de la vue d'ensemble Activities présente un avantage : on peut cliquer sur les fenêtres et les faire glisser entre les espaces de travail, en utilisant le sélecteur d'espace de travail sur le côté droit de l'écran et la vue d'ensemble des fenêtres au centre de l'écran.
Important

Comme la touche Super dans les environnements actuels de formation adaptée au rythme de chacun et de formation virtuelle Red Hat, les combinaisons de touches `Ctrl+Alt` ne sont généralement pas transmises par votre navigateur Web à la machine virtuelle dans l'environnement de formation.

Vous pouvez saisir ces combinaisons de touches pour changer d'espace de travail à l'aide du clavier à l'écran. Au moins deux espaces de travail doivent être utilisés. Ouvrez le clavier à l'écran et cliquez sur `Ctrl`, `Alt`, puis sur la Flèche vers le haut ou sur la Flèche vers le bas.

Cependant, dans ces environnements de formation, il est généralement plus simple d'éviter d'utiliser des raccourcis clavier et le clavier Ravello à l'écran. Changez d'espace de travail en cliquant sur le bouton Activities puis, dans le sélecteur d'espace de travail situé à droite de la vue d'ensemble des activités, cliquez sur l'espace de travail vers lequel vous souhaitez basculer.

### Lancement d'un terminal

Pour lancer une invite de shell dans GNOME, démarrez une application de terminal graphique telle que GNOME Terminal. Il y a plusieurs manières de procéder. Les deux méthodes les plus couramment utilisées sont énumérées ci-dessous :

Dans la vue d'ensemble Activities, sélectionnez Terminal depuis le lanceur d'applications (soit depuis la zone des favoris, soit en le recherchant avec le bouton grille (dans le regroupement Utilities) ou le champ de recherche en haut de la vue d'ensemble des fenêtres).

Appuyez sur la combinaison de touches `Alt+F2` pour ouvrir la zone `Enter a Command` et entrez `gnome-terminal`. 

Lorsqu'une fenêtre de terminal est ouverte, une invite de shell s'affiche pour l'utilisateur qui a lancé le programme de terminal graphique. L'invite de shell et la barre de titre de la fenêtre de terminal indiquent le nom de l'utilisateur, le nom de l'hôte et le répertoire de travail actuels.

### Verrouillage de l'écran ou déconnexion

Le verrouillage de l'écran ou la déconnexion peuvent être effectués à partir du menu système, à l'extrémité droite de la barre supérieure.

Pour verrouiller l'écran, à partir du menu système situé dans l'angle supérieur droit, cliquez sur le bouton de verrouillage en bas du menu ou appuyez sur `Super+L` (ce qui pourrait peut-être plus facile à retenir que `Windows+L`). L'écran se verrouille également si une session graphique reste inactive pendant quelques minutes.

Un rideau de verrouillage d'écran apparaît et affiche l'heure du système et le nom de l'utilisateur connecté. Pour déverrouiller l'écran, appuyez sur Entrée ou Espace pour lever le rideau de verrouillage d'écran, puis entrez le mot de passe de l'utilisateur sur l'écran de verrouillage.

Pour vous déconnecter et fermer la session graphique actuelle, sélectionnez le menu système dans l'angle supérieur droit de la barre supérieure et sélectionnez `(User) → Log Out`. Une fenêtre s'affiche, offrant la possibilité d'annuler (`Cancel`) ou de confirmer l'action `Log Out`.
Arrêt et redémarrage du système

Pour arrêter le système, dans le menu système situé dans l'angle supérieur droit, cliquez sur le bouton d'alimentation en bas du menu ou appuyez sur `Ctrl+Alt+Suppr`. Dans la boîte de dialogue qui s'affiche, vous pouvez choisir d'éteindre (`Power Off`) la machine, de la redémarrer (`Restart`) ou d'annuler (`Cancel`) l'opération. Si vous n'effectuez aucun choix, le système s'arrête automatiquement au bout de 60 secondes. 

## Exécution de commandes à l'aide du shell bash

Le GNU Bourne-Again Shell (bash) est un programme qui interprète les commandes saisies par l'utilisateur. Chaque chaîne saisie dans le shell peut comporter trois parties au maximum : la commande, les options (qui commencent généralement par `-` ou `--`) et les arguments. Chaque mot saisi dans le shell est séparé des autres par des espaces. Les commandes correspondent aux noms des programmes installés sur le système. Chaque commande possède ses propres options et arguments.

Lorsque vous êtes prêt à exécuter une commande, appuyez sur la touche `Entrée`. Tapez chaque commande sur une ligne séparée. Le résultat de la commande est affiché avant l'invite du shell suivante.

```console
[user@host]$ whoami
user
```

Si vous souhaitez saisir plusieurs commandes sur une seule ligne, utilisez un point-virgule (`;`) pour les séparer. Le point-virgule fait partie de la classe des caractères nommés métacaractères qui ont une signification spéciale pour bash. Dans ce cas, le résultat des deux commandes est affiché avant l'invite du shell suivante.

L'exemple suivant montre comment combiner deux commandes (command1 et command2) sur la ligne de commande.

```console
[user@host]$ command1;command2
```

### Exemples de commandes simples

La commande `date` sert à afficher la date et l'heure actuelles. Elle peut également être utilisée par le super utilisateur pour régler l'horloge du système. Un argument qui commence par un signe plus (`+`) spécifie un gabarit pour la commande date.

```console
[user@host]$ date
Sat Jan  26 08:13:50 IST 2019
[user@host]$ date +%R
08:13
[user@host]$ date +%x
01/26/2019
```

 La commande passwd modifie le mot de passe d'un utilisateur. Le mot de passe d'origine du compte doit être spécifié avant que le changement soit autorisé. Par défaut, `passwd` est configuré pour exiger un mot de passe fort, composé de minuscules, de majuscules, de chiffres et de symboles, et qui n'est pas basé sur un mot du dictionnaire. Le super utilisateur peut se servir de la commande passwd pour changer le mot de passe des autres utilisateurs.

```console
[user@host]$ passwd
Changing password for user user.
Current password: old_password
New password: new_password
Retype new password: new_password
passwd: all authentication tokens updated successfully.
```

Linux ne nécessite pas d'extensions de nom de fichier pour classifier les fichiers par type. La commande file analyse le début du contenu d'un fichier et affiche son type. Les fichiers à classer sont transmis à la commande en tant qu'arguments.

```console
[user@host]$ file /etc/passwd
/etc/passwd: ASCII text
[user@host]$ file /bin/passwd
/bin/passwd: setuid ELF 64-bit LSB shared object, x86-64, version 1 
(SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, 
for GNU/Linux 3.2.0, BuildID[sha1]=a3637110e27e9a48dced9f38b4ae43388d32d0e4, stripped
[user@host]$ file /home
/home: directory
```

### Affichage du contenu des fichiers

L'une des commandes les plus simples et les plus utilisées sous Linux est `cat`. La commande cat vous permet de créer un ou plusieurs fichiers, d'afficher le contenu des fichiers, de concaténer le contenu de plusieurs fichiers et de rediriger le contenu du fichier vers un terminal ou des fichiers.

L'exemple montre comment afficher le contenu du fichier `/etc/passwd`.

```console
[user@host ~]$ cat /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
...output omitted...
```

Utilisez la commande suivante pour afficher le contenu de plusieurs fichiers.

```console
[user@host]$ cat file1 file2
Hello World!!
Introduction to Linux commands.
```

Certains fichiers sont très longs et leur affichage peut nécessiter davantage d'espace que le terminal. La commande cat n'affiche pas le contenu d'un fichier sous forme de pages. La commande less affiche une page d'un fichier à la fois et vous permet de la faire défiler à votre guise.

La commande less permet de faire défiler vers le bas ou vers le haut des fichiers plus longs que le contenu affichable dans une fenêtre de terminal. Utilisez les touches Flèche vers le haut et Flèche vers le bas pour faire défiler vers le haut ou vers le bas. Appuyez sur q pour quitter la commande.

Les commandes `head` et `tail` affichent le début et la fin d'un fichier, respectivement. Par défaut, ces commandes affichent 10 lignes du fichier, mais elles disposent toutes les deux d'une option `-n` qui permet de spécifier un nombre de lignes différent. Le fichier à afficher est transmis à ces commandes en tant qu'argument.

```console
[user@host]$ head /etc/passwd
root:x:0:0:root:/root:/bin/bash
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
lp:x:4:7:lp:/var/spool/lpd:/sbin/nologin
sync:x:5:0:sync:/sbin:/bin/sync
shutdown:x:6:0:shutdown:/sbin:/sbin/shutdown
halt:x:7:0:halt:/sbin:/sbin/halt
mail:x:8:12:mail:/var/spool/mail:/sbin/nologin
operator:x:11:0:operator:/root:/sbin/nologin
[user@host]$
[user@host]$ tail -n 3 /etc/passwd
gdm:x:42:42::/var/lib/gdm:/sbin/nologin
gnome-initial-setup:x:977:977::/run/gnome-initial-setup/:/sbin/nologin
avahi:x:70:70:Avahi mDNS/DNS-SD Stack:/var/run/avahi-daemon:/sbin/nologin
```

La commande `wc` compte les lignes, mots et caractères d'un fichier. Elle accepte une option `-l`, `-w` ou `-c` pour n'afficher respectivement que le nombre de lignes, de mots ou de caractères.

```console
[user@host]$ wc /etc/passwd
  45  102 2480 /etc/passwd
[user@host]$ wc -l /etc/passwd ; wc -l /etc/group
45 /etc/passwd
70 /etc/group
[user@host]$ wc -c /etc/group /etc/hosts
 966 /etc/group
 516 /etc/hosts
1482 total
```

### Saisie semi-automatique par tabulation

La saisie semi-automatique par tabulation vous permet de compléter rapidement les commandes et les noms de fichiers après que vous avez entré le nombre de caractères qui réduit les possibilités à une seule. Si les caractères saisis ne sont pas uniques, appuyez deux fois sur la touche de tabulation pour afficher toutes les commandes qui commencent par les caractères déjà saisis.

```console
[user@host]$ pas Tab+Tab
passwd       paste        pasuspender
[user@host]$ pass Tab
[user@host]$ passwd 
Changing password for user user.
Current password: 
```

La saisie semi-automatique par tabulation peut servir à compléter les noms de fichiers quand on les saisit comme arguments de commandes. Quand on appuie sur la touche de tabulation, celle-ci complète le nom du fichier autant qu'il est possible. Une seconde pression sur la touche de tabulation entraîne l'affichage par le shell d'une liste de tous les fichiers qui correspondent au schéma courant. Tapez des caractères supplémentaires jusqu'à ce que le nom soit unique, puis utilisez la saisie semi-automatique par tabulation pour compléter la commande.

```console
[user@host]$ ls /etc/pas1Tab
[user@host]$ ls /etc/passwd2Tab
passwd   passwd-
```

La saisie semi-automatique par tabulation peut être utilisée avec les arguments et les options de nombreuses commandes. La commande useradd sert au super utilisateur, root, pour créer d'autres utilisateurs dans le système. Elle dispose de nombreuses options qui peuvent servir à contrôler le comportement de la commande. On peut utiliser la saisie semi-automatique par tabulation après une option partielle pour la compléter sans avoir à taper trop de texte.

```console
[root@host]# useradd --1Tab+Tab
--base-dir        --groups          --no-log-init     --shell
--comment         --help            --non-unique      --skel
--create-home     --home-dir        --no-user-group   --system
--defaults        --inactive        --password        --uid
--expiredate      --key             --root            --user-group
--gid             --no-create-home  --selinux-user
[root@host]# useradd --
```

### Affichage d'une longue commande sur plusieurs lignes

Les commandes comportant de nombreuses options et arguments peuvent rapidement devenir longues et sont automatiquement entourées par la fenêtre de commande lorsque le curseur atteint la marge de droite. Pour faciliter la lecture des commandes, vous pouvez taper une commande longue en utilisant plusieurs lignes.

Pour ce faire, utilisez une barre oblique inverse (`\\`), aussi appelée caractère d'échappement, pour ignorer la signification du caractère qui suit immédiatement la barre oblique inverse. Vous avez appris que la saisie d'un saut de ligne, en appuyant sur la touche Entrée, indique au shell que la saisie de la commande est terminée et qu'elle doit être exécutée. En échappant le saut de ligne, le shell est invité à passer à une nouvelle ligne de commande sans exécuter la commande. Le shell accuse réception de la demande en affichant une invite de continuation, appelée invite secondaire, en utilisant le caractère supérieur à (`>`) par défaut, sur une nouvelle ligne vide. Les commandes peuvent être saisies sur plusieurs lignes.

```console
[user@host]$ head -n 3 \
> /usr/share/dict/words \
> /usr/share/dict/linux.words
==> /usr/share/dict/words <==
1080
10-point
10th

==> /usr/share/dict/linux.words <==
1080
10-point
10th
[user@host ~]$ 
```

<div class="alert alert-warning" role=&quot;alert&quot;>
**Important**

L'exemple d'écran précédent montre comment une commande continue apparaît pour un utilisateur typique. Cependant, la présentation en conditions réelles dans des supports d'apprentissage, tels que ce manuel, est généralement source de confusion. Les nouveaux apprenants peuvent insérer par erreur le caractère supérieur à dans le cadre de la commande tapée. Le shell interprète la saisie d'un caractère supérieur à comme une redirection de processus non prévue par l'utilisateur. La redirection de processus est décrite dans un chapitre ultérieur.

Pour éviter cette confusion, ce manuel de cours ne montre pas les invites secondaires dans une sortie écran. Un utilisateur voit toujours l'invite secondaire dans la fenêtre shell, mais le contenu du cours n'affiche intentionnellement que les caractères à saisir, comme illustré dans l'exemple ci-dessous. Comparez avec l'exemple d'écran précédent.
</div>

```console
[user@host]$ head -n 3 \
/usr/share/dict/words \
/usr/share/dict/linux.words
==> /usr/share/dict/words <==
1080
10-point
10th

==> /usr/share/dict/linux.words <==
1080
10-point
10th
[user@host ~]$ 
```

### Historique des commandes

La commande `history` affiche la liste des commandes précédemment exécutées, précédées d'un numéro de commande.

Le point d'exclamation (`!`) est un métacaractère qui sert à rappeler les commandes précédentes sans avoir à les retaper. La commande `!number` rappelle la commande qui correspond au nombre spécifié. La commande `!string` rappelle la commande la plus récente qui commence par la chaîne spécifiée.

```console
[user@host]$ history
   ...output omitted...
   23  clear
   24  who
   25  pwd
   26  ls /etc
   27  uptime
   28  ls -l
   29  date
   30  history
[user@host]$ !ls
ls -l
total 0
drwxr-xr-x. 2 user user 6 Mar 29 21:16 Desktop
...output omitted...
[user@host ~]$ !26
ls /etc
abrt                     hosts                     pulse
adjtime                  hosts.allow               purple
aliases                  hosts.deny                qemu-ga
...output omitted...
```

Les touches fléchées peuvent être utilisées pour naviguer dans les commandes précédentes de l'historique du shell. La Flèche vers le haut modifie la commande précédente dans la liste de l'historique. La Flèche vers le bas modifie la commande suivante dans la liste d'historique. La Flèche gauche et la Flèche droite déplacent le curseur vers la gauche et la droite dans la commande en cours à partir de la liste de l'historique afin de vous permettre de la modifier avant de l'exécuter.

Vous pouvez utiliser les combinaisons de touches É`chap+.` ou `Alt+.` pour insérer le dernier mot de la commande précédente à l'emplacement actuel du curseur. L'utilisation répétée de la combinaison de touches remplacera ce texte par le dernier mot de commandes plus antérieures dans l'historique. La combinaison de touches `Alt+.` est particulièrement pratique, car vous pouvez maintenir `Alt` enfoncée et appuyer sur `.` à plusieurs reprises pour parcourir facilement les commandes précédentes et plus antérieures.

### Modification de la ligne de commande

Quand on l'utilise de manière interactive, bash offre des fonctions de modification de la ligne de commande. À l'aide des commandes d'éditeur de texte, l'utilisateur peut se déplacer dans les commandes en cours de saisie et les modifier. L'utilisation des touches de direction pour se déplacer dans la commande courante et pour parcourir l'historique des commandes a été présentée plus tôt au cours de cette session. Des commandes d'édition plus puissantes sont présentées dans le tableau suivant.

|Raccourci|	Description|
|---|---|
|`Ctrl+A`| 	Passe au début de la ligne de commande.|
|`Ctrl+E`| 	Passe à la fin de la ligne de commande.|
|`Ctrl+U`| 	Efface le texte entre le début de la ligne de commande et le curseur.|
|`Ctrl+K`| 	Efface le texte entre le curseur et la fin de la ligne de commande.|
|`Ctrl +Flèche gauche`| 	Passe au début du mot précédent sur la ligne de commande.|
|`Ctrl+Flèche droite`| 	Passe à la fin du mot suivant sur la ligne de commande.|
|`Ctrl+R`| 	Recherche une chaîne de caractères dans l'historique des commandes.|

D'autres commandes de modification de la ligne de commande sont disponibles, mais celles-ci sont les plus utiles pour les nouveaux utilisateurs. Les autres commandes sont décrites dans la page de manuel bash(1). 
