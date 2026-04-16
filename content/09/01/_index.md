---
title: "Création d'une liste de processus"
description: "linux"
date: 2022-03-05T11:41:07-05:00
draft: false
weight: 1
---
### Définition d'un processus

Un **processus** est une **instance en cours d'exécution d'un programme exécutable**. 

Un processus consiste en :
- Un espace d'adressage de mémoire allouée ;
- Des propriétés de sécurité, dont les informations de propriété et les privilèges ;
- Un ou plusieurs fils (threads) d'exécution de code de programmes ;
- L'état du processus. 

**Cycle de vie d'un processus :**

- Tous les processus sont des descendants du processus système initial **systemd** sur Linux.
- Un processus (**parent**) existant **réplique son propre espace d'adressage (fork)** pour créer une nouvelle structure de **processus (enfant)**. 
- Le processus enfant est ensuite **exécuté (exec)** par le processeur (CPU), puis il est terminé.
- Un **identifiant de processus unique (PID)** est affecté à chaque nouveau processus (parent et enfant) pour le suivi et la sécurité. 

![cycle](../../images/8-1.png?height=250&classes=border,shadow,inline)

### Lister les processus

La commande `ps` et `ps -f` sert à dresser la liste des processus actifs exécutés sur le shell par **l'utilisateur actuel** :

```console
[antoine@host]$ ps
    PID TTY          TIME CMD
   4102 pts/1    00:00:00 bash
  12446 pts/1    00:00:10 firefox
  13280 pts/1    00:00:00 ps
  [antoine@host]$ 
```
- **PID**  : L'identifiant unique attribué à ce processus pendant son exécution.
- **TTY** : Le terminal où le processus est exécuté.
- **TIME** : Temps du CPU cumulé.
- **CMD**  : La commande avec tous ses arguments.

```console
[antoine@host]$ ps -f
UID          PID    PPID  C STIME TTY          TIME CMD
e1234567    4102    4097  0 13:46 pts/1    00:00:00 bash
e1234567   12446    4102 36 21:10 pts/1    00:00:01 /usr/lib64/firefox/firefox
e1234567   12579    4102  0 21:10 pts/1    00:00:00 ps -f
[antoine@host]$
```
- **UID** : Le nom de l'utilisateur, qui détermine les privilèges des processus.
- **PPID** : L'identifiant unique attribué au processus parent de ce processus.
- **STIME** : *Start time*. À quelle heure ce processus était exécuté.

La commande `ps -aux` sert à dresser la liste de **tous les processus actifs** :

```console
[antoine@host]$ ps -aux
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root           1  3.7  0.1 241108 14108 ?        Ss   23:45   0:05 /usr/lib/systemd/systemd --switched-root --system --deserialize 18
root           2  0.0  0.0      0     0 ?        S    23:45   0:00 [kthreadd]
root           3  0.0  0.0      0     0 ?        I<   23:45   0:00 [rcu_gp]
root           4  0.0  0.0      0     0 ?        I<   23:45   0:00 [rcu_par_gp]
...
e1234567    2749  0.0  0.2 523568 26840 tty2     Sl+  mar11   0:00 /usr/libexec/gsd-keyboard
e1234567    3562  0.7  0.0  25812  5564 pts/0    Ss   00:13   0:00 bash
e1234567    3598  0.0  0.0  61660  3996 pts/0    R+   00:13   0:00 ps -aux
[antoine@host]$ 
```

- **%CPU** : Le temps du processeur utilisé divisé par le temps d'exécution du processus.
- **%MEM** : Le rapport entre la taille de la mémoire utilisée par le processus et la mémoire physique de la machine.
- **VSZ** (*Virtual Memory Size*) : La taille de mémoire virtuelle (en KO) donnée à un processus, mais cela ne signifie pas nécessairement que le processus utilise toute cette mémoire.
- **RSS** (*Resident Set Size*) : La taille de la mémoire en (KO) qu'un processus a actuellement utilisée pour charger toutes ses pages.
- **STAT** : L'état du processus actif.

### Description des états de processus

Lors du dépannage d'un système, il est important de comprendre comment le noyau communique avec les processus et comment les processus communiquent entre eux. Lors de la création du processus, le système attribue un état au processus. La colonne `STAT` de `ps -aux` indique l'état de chaque processus.

Un processus peut être dans plusieurs états:

|État|Description|
|--|--|
|**Prêt (S) *Sleeping***|Il est dans la file d’attente du processeur, il n’est en attente d’aucune ressource.|
|**Élu (R) *Running***|C’est lui qui est sur le processeur, en cours d’exécution.|
|**Bloqué (I) *Interrupt***|Il est en attente d’une ressource autre que le processeur (disque par exemple).|
|**Suspendu (T) *Stopped***|Le processus a été arrêté (suspendu), généralement suite au signal d'un utilisateur ou d'un autre processus.|
|**Zombie (Z)**|Le processus est mort mais son père n’a pas encore pris en compte sa mort. Il y a toujours une entrée le concernant dans la table des processus.|

![etats](../../images/processus.png?height=450&classes=border,shadow,inline)

> **Note:** Le processus peut être **suspendu, arrêté, repris, arrêté et interrompu à l'aide de signaux**. Les signaux sont abordés plus en détail ultérieurement dans ce chapitre. Les signaux peuvent être utilisés par d'autres processus, par le noyau lui-même ou par les utilisateurs connectés au système.
