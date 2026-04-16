---
title: "Gestion des utilisateurs et groupes"
description: "linux"
weight: 3
draft: false
---

### Création d'utilisateurs à partir de la ligne de commande

- La commande `useradd *username*` crée un nouvel utilisateur appelé username. Elle configure le répertoire personnel et les informations de compte de l'utilisateur, et crée un groupe privé pour l'utilisateur appelé aussi username . 
À ce stade, le compte n'a pas de mot de passe valide défini et l'utilisateur ne peut pas se connecter avant qu'un mot de passe n'ait été défini.

- La commande `useradd --help`  affiche les options de base qui peuvent être utilisées pour remplacer les valeurs par défaut. Dans la plupart des cas, on peut utiliser les mêmes options avec la commande `usermod` pour modifier un utilisateur existant.

- Certaines valeurs par défaut, comme la plage des numéros UID valides et les règles de vieillissement des mots de passe, sont lues dans le fichier `/etc/login.defs`. Les valeurs de ce fichier ne sont utilisées que lorsqu'on crée des utilisateurs. Une modification apportée à ce fichier n'affecte pas les utilisateurs existants. 

### Modification d'utilisateurs existants à partir de la ligne de commande

- La commande `usermod --help` affiche les options de base utilisables pour modifier un compte. On trouve parmi les options courantes :

|Options usermod :|	Utilisation|
|---|---|
|`-c`, `--comment COMMENT`	|Ajouter le vrai nom de l'utilisateur au champ de commentaire.|
|`-g`, `--gid GROUP`	|Spécifier le groupe principal du compte d'utilisateur.|
|`-G`, `--groups GROUPS`	|Spécifier une liste de groupes supplémentaires séparés par des virgules pour le compte d'utilisateur.|
|`-a`, `--append`	|Utilisé avec l'option -G pour ajouter les groupes supplémentaires à l'ensemble de groupes auxquels l'utilisateur appartient au lieu de remplacer l'ensemble de groupes supplémentaires par un nouvel ensemble.|
|`-d`, `--home HOME_DIR`	|Spécifier un répertoire personnel spécifique pour le compte d'utilisateur.|
|`-m`, `--move-home`	|Déplacer le répertoire personnel de l'utilisateur vers un nouvel emplacement. Doit être utilisé avec l'option -d.|
|`-s`, `--shell SHELL`	|Spécifier un shell de connexion spécifique pour le compte d'utilisateur.|

### Suppression d'utilisateurs à partir de la ligne de commande

- La commande `userdel *username*` supprime les détails de l'utilisateur username de |`/etc/passwd`, mais laisse le répertoire personnel de l'utilisateur intact.

- La commande `userdel -r *username*` supprime les détails de l'utilisateur username de |`/etc/passwd` ainsi que le répertoire personnel de l'utilisateur.

> **Avertissement** : Quand on supprime un utilisateur avec `userdel` sans spécifier l'option `-r`, le système se retrouve avec des fichiers qui appartiennent à un UID non affecté. Cela peut aussi arriver lorsqu'un fichier, créé et appartenant à un utilisateur supprimé, se retrouve en dehors du répertoire personnel de l'utilisateur. Cette situation peut entraîner des fuites d'informations et d'autres problèmes de sécurité.

La commande useradd affecte aux nouveaux utilisateurs le premier UID libre supérieur ou égal à 1000, sauf si vous spécifiez de manière explicite un UID à l'aide de l'option `-u`.

C'est ce qui explique pourquoi la fuite d'informations peut se produire. Si le premier UID libre a déjà été affecté à un compte d'utilisateur qui a depuis été supprimé du système, cet ancien UID est réaffecté au nouvel utilisateur et celui-ci se retrouve propriétaire des fichiers restants de l'ancien compte d'utilisateur.

Le scénario suivant fait la démonstration de cette situation.

```console
[root@host]# useradd user01
[root@host]# ls -l /home
drwx------. 3 user01  user01    74 Feb  4 15:22 user01
[root@host]# userdel user01
[root@host]# ls -l /home
drwx------. 3    1000    1000   74 Feb  4 15:22 user01
[root@host]# useradd user02
[root@host]# ls -l /home
drwx------. 3 user02     user02       74 Feb  4 15:23 user02
drwx------. 3 user02     user02       74 Feb  4 15:22 user01
```

Vous pouvez remarquer que user02 possède maintenant tous les fichiers dont user01 était auparavant le propriétaire.

Suivant la situation, l'une des solutions à ce problème consiste à supprimer du système tous les fichiers sans propriétaire une fois que l'utilisateur qui les a créés a été supprimé. Une autre solution consiste à affecter manuellement les fichiers sans propriétaire à un autre utilisateur. L'utilisateur root peut utiliser la commande `find / -nouser -o -nogroup` pour trouver tous les fichiers et répertoires sans propriétaire. 
</div>

### Définition de mots de passe à partir de la ligne de commande

- La commande `passwd username` définit le mot de passe initial ou modifie le mot de passe existant de l'utilisateur username.

- L'utilisateur root peut attribuer n'importe quelle valeur à un mot de passe. Un message s'affiche si le mot de passe ne satisfait pas aux critères minimaux recommandés, mais il est suivi d'une invite pour retaper le nouveau mot de passe. Tous les tokens sont ensuite mis à jour correctement.

```console
[root@host]# passwd user01
Changing password for user user01.
New password: redhat
BAD PASSWORD: The password fails the dictionary check - it is based on a dictionary word
Retype new password: redhat
passwd: all authentication tokens updated successfully.
[root@host]# 
```

- Un utilisateur standard doit choisir un mot de passe d'au moins huit caractères, qui ne peut être ni un mot du dictionnaire, ni le nom de l'utilisateur, ni le mot de passe précédent. 

#### Plages d'UID

Linux utilise des numéros et plages de numéros UID à des fins spécifiques.

- L'UID **0** est toujours affecté au compte du super utilisateur, root.

- UID **1-200** est une plage « d'utilisateurs système » que Red Hat affecte de manière statique aux processus système.

- UID **201-999** est une plage « d'utilisateurs système » utilisée par des processus système qui ne sont pas propriétaires de fichiers sur le système de fichiers. En général, ils sont affectés de manière dynamique à partir du pool disponible, lorsque le logiciel qui en a besoin est installé. Les programmes sont exécutés sous l'identité de ces utilisateurs système « sans privilège » afin de limiter leur accès aux seules ressources dont ils ont besoin pour fonctionner.

- UID **1000+** est la plage disponible pour l'affectation aux utilisateurs standard. 

## Gestion des comptes de groupes locaux

Un groupe doit exister avant qu'on puisse y ajouter un utilisateur. Plusieurs outils de ligne de commande sont utilisés pour gérer les comptes de groupes locaux.

### Création de groupes à partir de la ligne de commande

- Utilisez la commande `groupadd` pour créer des groupes. Sans option, la commande groupadd utilise le premier GID disponible dans la plage spécifiée dans le fichier `/etc/login.defs` lors de la création des groupes.

- L'option `-g` spécifie un GID particulier pour le groupe à utiliser.

```console
[user01@host]$ sudo groupadd -g 10000 group01
[user01@host]$ tail /etc/group
...output omitted...
group01:x:10000:
```

> **Note**: Les groupes privés d'utilisateurs étant créés automatiquement (GID 1000 et plus), il est généralement recommandé de mettre de côté une plage de GID destinés aux groupes supplémentaires. Une plage plus élevée permettra d'éviter les collisions avec un groupe système (GID 0-999).


###  Modification des groupes existants à partir de la ligne de commande

- La commande `groupmod` change les propriétés d'un groupe existant. L'option -n spécifie un nouveau nom pour le groupe.

```console
[user01@host]$ sudo groupmod -n group0022 group02
[user01@host]$ tail /etc/group
...output omitted...
group0022:x:988:
```

Notez que le nom du groupe group02 est mis à jour par group0022.

- L'option `-g` sert à spécifier un nouveau GID.

```console
[user01@host]$ sudo groupmod -g 20000 group0022
[user01@host]$ tail /etc/group
...output omitted...
group0022:x:20000:
```

Notez que le GID 988 est mis à jour par 20000. 

### Suppression de groupes à partir de la ligne de commande

La commande `groupdel` supprime les groupes.

```console
[user01@host]$ sudo groupdel group0022
```
> **Note** :  Vous ne pouvez pas supprimer un groupe s'il s'agit du groupe principal d'un utilisateur existant. Tout comme avec la commande userdel, vérifiez tous les systèmes de fichiers pour vous assurer qu'il ne reste aucun fichier appartenant au groupe sur le système. 


### Modification de l'appartenance à un groupe à partir de la ligne de commande

- Les membres d'un groupe sont contrôlés par la gestion des utilisateurs. Utilisez la commande `usermod -g` pour changer le groupe principal d'un utilisateur.

```console
[user01@host]$ id user02
uid=1006(user02) gid=1008(user02) groups=1008(user02)
[user01@host]$ sudo usermod -g group01 user02
[user01@host]$ id user02
uid=1006(user02) gid=10000(group01) groups=10000(group01)
```

- Utilisez la commande `usermod -aG` pour ajouter un utilisateur au groupe supplémentaire.

```console
[user01@host]$ id user03
uid=1007(user03) gid=1009(user03) groups=1009(user03)
[user01@host]$ sudo usermod -aG group01 user03
[user01@host]$ id user03
uid=1007(user03) gid=1009(user03) groups=1009(user03),10000(group01)
```
> **Important** : L'utilisation de l'option `-a` active le mode append pour la fonction usermod. Sans `-a`, l'utilisateur sera supprimé de l'un des groupes supplémentaires actuels qui ne sont pas inclus dans la liste des options `-G`. 

## Gestion des mots de passe des utilisateurs

### Mots de passe fantômes et politique des mots de passe

À un moment donné, les mots de passe chiffrés étaient stockés dans le fichier `/etc/passwd`, lisibles par tout le monde. Cela était considéré comme raisonnablement sûr, jusqu'à ce que les attaques par dictionnaire sur les mots de passe chiffrés se banalisent. À ce stade, les mots de passe chiffrés ont été déplacés vers un fichier `/etc/shadow` séparé, lisible uniquement par root. Ce nouveau fichier permettait également de mettre en œuvre des fonctionnalités de vieillissement et d'expiration des mots de passe.

Comme `/etc/passwd`, chaque utilisateur a une ligne dans le fichier `/etc/shadow`. 
Un exemple de ligne de `/etc/shadow` avec ses **neuf champs séparés par des deux-points** figure ci-dessous:

![cycle](../images/mot-de-passe1.png?height=500&classes=border,shadow,inline)

#### Format d'un mot de passe chiffré

Le champ de mot de passe chiffré stocke trois informations : l'algorithme de hachage utilisé, le sel et le hachage chiffré. Chaque information est délimitée par le signe **$**.

![cycle](../images/mot-de-passe2.png?height=250&classes=border,shadow,inline)

L’association d’un sel au mot de passe sert principalement à se défendre contre les attaques utilisant des listes précalculées de hachages de mots de passe. L’ajout de sels modifie les hachages obtenus, de sorte que la liste précalculée est inutile. Si un attaquant parvient à se procurer une copie d’un fichier `/etc/shadow` qui utilise des sels, il devra procéder à une attaque par force brute, ce qui est plus fastidieux et nécessite davantage de temps.
