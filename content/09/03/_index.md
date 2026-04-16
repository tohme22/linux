---
title: "Contrôle de processus"
description: "linux"
date: 2022-03-05T11:41:07-05:00
draft: false
weight: 3
---
### Contrôle de processus à l'aide de signaux

Un **signal** est une interruption logicielle envoyée à un processus. 
- Les signaux renvoient des événements à un programme en cours d'exécution. 
- Les événements qui génèrent un signal peuvent être une erreur, un événement externe ou une utilisation explicite d'une commande d'envoi de signal ou d'une séquence de clavier.

Le tableau suivant répertorie **les principaux signaux** utilisés régulièrement par les administrateurs système pour la gestion des processus:

|Numéro de signal|	Nom abrégé| Définition| Objet|
|---|---|---|---|
|**1**|**SIGHUP**| Suspendre (Hangup)|Sert à signifier l'arrêt du processus de contrôle d'un terminal. Envoyé en appuyant sur la séquence de touches `SUSP` (`Ctrl+z`).|
|**2**|**SIGINT**|Arrêt (interrupt) au clavier|Provoque l'arrêt du programme. Peut être bloqué ou traité. Envoyé en appuyant sur la séquence de touches `INTR` (`Ctrl+c`).|
|**9**|**SIGKILL**|Suppression, non blocable|Provoque l'arrêt abrupt du programme. Ne peut être bloqué, ignoré ou traité ; toujours fatal.|
|**15 *défaut***|**SIGTERM**|Arrêter|Provoque l'arrêt du programme. Contrairement à `SIGKILL`, peut être bloqué, ignoré ou traité. Manière « polie » de demander l'arrêt d'un programme ; permet l'auto-nettoyage.|

> **Note**: Les numéros des signaux varient selon la plateforme Linux utilisée, mais leur nom et leur signification sont standardisés. Pour l'utilisation avec des commandes, il est conseillé d'utiliser le nom des signaux plutôt que leur numéro.

#### Commandes pour l'envoi de signaux par requête explicite

Vous pouvez envoyer un signal au processus en **avant-plan** en appuyant sur un raccourci clavier pour suspendre (`Ctrl+z`), ou supprimer (`Ctrl+c`). 
Toutefois, vous devrez utiliser des commandes d'envoi de signaux pour envoyer des signaux aux processus exécutés en arrière-plan ou dans une session différente.

Les **signaux** peuvent être spécifiés en tant qu'options soit à l'aide de leur nom (par exemple, `-SIGHUP`, soit à l'aide de leur numéro (le `-1` associé). 
Les utilisateurs peuvent supprimer leurs propres processus, mais doivent disposer des privilèges root pour supprimer ceux des autres.

La commande **kill** envoie un signal à un processus à l'aide de son `PID`. Malgré son nom, la commande `kill` peut être utilisée pour envoyer n'importe quel signal, et pas seulement pour arrêter des programmes. Vous pouvez utiliser la commande `kill -l` pour lister les noms et les numéros de tous les signaux disponibles.

```console
[antoine@host]$ kill -l
 1) SIGHUP      2) SIGINT      3) SIGQUIT     4) SIGILL      5) SIGTRAP
 6) SIGABRT     7) SIGBUS      8) SIGFPE      9) SIGKILL    10) SIGUSR1
11) SIGSEGV    12) SIGUSR2    13) SIGPIPE    14) SIGALRM    15) SIGTERM
16) SIGSTKFLT  17) SIGCHLD    18) SIGCONT    19) SIGSTOP    20) SIGTSTP
...
[antoine@host]$
```
##### Exemple: 
Exécutez trois processus de la commande `sleep` en arrière plan.

```console
[antoine@host]$ sleep 1000 &
[1] 5479
[antoine@host]$ sleep 2000 &
[2] 5486
[antoine@host]$ sleep 3000 &
[3] 5493
[antoine@host]$ 
```

Utilsiez la commande `ps` pour afficher les `PID` de ces processus pour pouvoir envoyer des signaux avec la commande `kill` .

```console
[antoine@host]$ ps | grep sleep
   5672 pts/0    00:00:00 sleep
   5679 pts/0    00:00:00 sleep
   5686 pts/0    00:00:00 sleep
[antoine@host]$ kill 5672
[1]   Complété              sleep 1000

[antoine@host]$ ps | grep sleep
   5679 pts/0    00:00:00 sleep
   5686 pts/0    00:00:00 sleep
[antoine@host]$ kill -9 5679
[2]-  Processus arrêté      sleep 2000

[antoine@host]$ ps | grep sleep
   5686 pts/0    00:00:00 sleep
[antoine@host]$ kill -SIGTERM 5686
[3]+  Complété              sleep 3000
```
La commande **killall** peut signaler plusieurs processus en fonction de leur nom de commande.

```console
[antoine@host]$ sleep 1000 &
[1] 5479
[antoine@host]$ sleep 2000 &
[2] 5486
[antoine@host]$ sleep 3000 &
[3] 5493
[antoine@host]$ ps | grep sleep
   5672 pts/0    00:00:00 sleep
   5679 pts/0    00:00:00 sleep
   5686 pts/0    00:00:00 sleep
[antoine@host]$ killall sleep
[1]   Complété              sleep 1000
[2]-  Complété              sleep 2000
[3]+  Complété              sleep 3000
```

### Contrôle de l'activité des processus

- La **charge moyenne** est une mesure fournie par le noyau Linux qui constitue un moyen simple de représenter la charge système perçue au fil du temps. 
- Elle peut être utilisée pour déterminer de manière générale le nombre de demandes de ressources système en attente et pour déterminer si la charge du système augmente ou diminue avec le temps
- Toutes les cinq secondes, le noyau collecte l'indice de charge actuelle en fonction du nombre de processus se trouvant dans des états exécutables et ne pouvant être interrompus.
- Ce nombre est accumulé et signalé en tant que moyenne mobile exponentielle de la **dernière minute, et des cinq et quinze dernières minutes**.

La commande **uptime** est un moyen d'afficher la moyenne de charge actuelle. Elle imprime l'heure actuelle, la durée d'utilisation de la machine, le nombre de sessions utilisateur en cours et la
charge moyenne actuelle.
```console
[antoine@host]$ uptime
 13:19:01 up  1:10,  1 user,  load average: 0,20, 0,60, 0,40
```
Les **trois valeurs de la charge moyenne** représentent la charge au cours de la **dernière minute**, et des **cinq et quinze dernières minutes**. Un coup d'oeil rapide permet de savoir si la charge du
système semble augmenter ou diminuer.

La commande **lscpu** peut vous aider à déterminer le nombre de processeurs d'un système.

Dans l'exemple suivant, le système est un système simple socket double coeur avec deux hyperthreads par coeur.

```console
[antoine@host]$ lscpu
Architecture :                          x86_64
Mode(s) opératoire(s) des processeurs : 32-bit, 64-bit
Boutisme :                              Little Endian
Processeur(s) :                         4
Liste de processeur(s) en ligne :       0-3
Thread(s) par cœur :                    1
Cœur(s) par socket :                    2
Socket(s) :                             2
Nœud(s) NUMA :                          1
Nom de modèle :                         Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Vitesse du processeur en MHz :          2208.001
```

Un certain nombre d'outils supplémentaires indiquent la moyenne de charge, comme le programme `top`.

Le programme **top** est un aperçu dynamique des processus du système, qui affiche un en-tête récapitulatif suivi d'une liste de processus ou de fils d'exécution similaire aux informations de `ps`.
Elle permet d'afficher des informations **en continu** sur l'activité du système. Elle permet surtout de suivre les ressources que le processus utilise **(RAM, % de CPU, durée du processus depuis son démarrage)**.

```console
[antoine@host]$ top
top - 13:35:44 up  1:27,  1 user,  load average: 0,05, 0,03, 0,00
Tasks: 314 total,   2 running, 312 sleeping,   0 stopped,   0 zombie
%Cpu(s):  0,7 us,  1,0 sy,  0,0 ni, 97,8 id,  0,0 wa,  0,4 hi,  0,1 si,  0,0 st
MiB Mem :   8941,8 total,   6177,5 free,   1387,4 used,   1376,9 buff/cache
MiB Swap:   4096,0 total,   4096,0 free,      0,0 used.   7275,5 avail Mem 

    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND                                               
   2519 e1234567  20   0 3486496 192328 108796 S   0,7   2,1   0:45.58 gnome-shell                                           
   4491 e1234567  20   0   65580   4972   4072 R   0,7   0,1   0:00.06 top                                                   
   1058 root      20   0  292364  11568   9924 S   0,3   0,1   0:07.34 vmtoolsd                                              
   2909 e1234567  39  19  641052  29984  19456 S   0,3   0,3   0:00.24 tracker-miner-f                                       
   2911 e1234567  20   0  572028  31528  17332 S   0,3   0,3   0:00.32 tracker-store                                         
      1 root      20   0  241108  14108   9092 S   0,0   0,2   0:07.03 systemd           
```
#### Touches fondamentales dans **top**
|Touche|Objet|
|--|--|
|**l, t, m**|Activer les lignes d'en-tête de la charge, des fils d'exécution et de la mémoire.|
|**1**|Activer, dans l'en-tête, l'affichage par processeur.|
|**b**|Activer ou désactive le surlignage des processus en cours d'exécution ;.|
|**k**|Arrêter un processus. À l'invite, saisissez PID, puis signal.|
|**Maj+p**|Trier la liste des processus en fonction de l'utilisation du processeur.|
|**Maj+m**|Trier la liste des processus en fonction de l'utilisation de la mémoire.|
|**f**|Gérer les colonnes en activant ou en désactivant des champs.|
|**Maj+w**|Enregistrer la configuration d'affichage en cours pour l'utiliser au prochain fois.|
|**q**|Quitter.|



