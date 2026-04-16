---
title: "Laboratoire 9"
description: "linux"
draft: false
weight: 13
---
## Laboratoire 9 -  Solution

#### Exercice 1 - Contrôle des tâches (jobs)

```cmd
1. [atohme@host]$ ps -aux
```
```cmd
2. [atohme@host]$ ps -aux | grep cupsd
```
```cmd
3. [atohme@host]$ firefox &
```
```cmd
4. [atohme@host]$ jobs
```
```cmd
5. [atohme@host]$ meld &
```
```cmd
6. [atohme@host]$ jobs
```
```cmd
7. [atohme@host]$ fg %2
^Z
[2]+  Stopped  meld
```
```cmd
8. [atohme@host]$ ps T
  134144 pts/0    Sl     0:00 /usr/lib64/firefox/firefox
  134195 pts/0    Tl     0:00 /usr/bin/python3.6 /bin/meld
L'état est T (Suspendu).
```
```cmd
9. [atohme@host]$ bg %2
```
```cmd
10. [atohme@host]$ ps T
 134144 pts/0    Sl     0:00 /usr/lib64/firefox/firefox
 134195 pts/0    Sl     0:00 /usr/bin/python3.6 /bin/meld
L'état est S (Prêt).
```
```cmd
11. [atohme@host]$ jobs
```
```cmd
12. [atohme@host]$ fg %2
^C
```
```ps
13. Le processus firefox est terminé et l'application est fermée.
```
```cmd
14. [atohme@host]$ ps T
  134195 pts/0    Sl     0:00 /usr/bin/python3.6 /bin/meld
```
```ps
15. Fermez la fenêtre meld.
```
```cmd
16. [atohme@host]$ ps T
PID TTY      STAT   TIME COMMAND
 132830 pts/0    Ss     0:00 bash
 135190 pts/0    R+     0:00 ps T
```
---

#### Exercice 2 - Contrôle de processus à l’aide de signaux :

```ps
1. Ouvrez les applications Text Editor et Cheese.
```
```cmd
2. [atohme@host]$  ps -aux | grep -e gedit -e cheese 
USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
atohme    135716  0.1  7.0 1359988 130272 ?      Sl   23:12   0:00 /usr/bin/cheese --gapplication-service
atohme    135734  0.0  2.4 637660 45008 ?        Sl   23:12   0:00 /usr/bin/gedit --gapplication-service
```
```cmd
3. [atohme@host]$ kill -9 135734
```
```cmd
4. [atohme@host]$ ps -aux | grep gedit
```
```cmd
5. [atohme@host]$ kill -SIGTERM 135716
```
```cmd
6. [atohme@host]$ ps -aux | grep cheese
```
```ps
7. Ouvrez l'application Firefox.
```
```cmd
8. [atohme@host]$ ps -aux | grep firefox
```
```cmd
9. [atohme@host]$ killall firefox
```
```cmd
10. [atohme@host]$ ps -aux | grep firefox
```
---

#### Exercice 3 - Contrôle de l’activité des processus :

```cmd
1. [atohme@host]$ uptime
00:25:33 up 8 days, 15:48,  0 users,  load average: 0.23, 0.28, 0.19
```
```cmd
2. [atohme@host]$ lscpu
1 CPU
```
```cmd
3. [atohme@host]$ vim monitor
```
```cmd
4. [atohme@host]$ chmod a+x monitor
```
```cmd
5. [atohme@host]$ ./monitor &
```
```ps
6. Ouvrer une nouvelle fenêtre shell.
```
```cmd
7. [atohme@host]$ top
Le pourcentage de l'utilisation du processeur par le processu monitor est haut.
```
```ps
8. l t m
```
```ps
9. Le pourcentage de l'utilisation du processeur est entre 20% et 25%.
À cause du processus monitor.
```
```ps
10. Retourner à l'autre shell.
```
```cmd
11. [atohme@host]$ uptime
 00:34:09 up 8 days, 15:57,  0 users,  load average: 0.42, 0.24, 0.18
La charge moyenne est plus haute que celle du point 1.
```
```ps
12. k puis tapez le PID, puis tapez 9 pour l'arrêter.
```
```ps
13. q
```







