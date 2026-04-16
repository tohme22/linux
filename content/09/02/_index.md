---
title: "Contrôle des tâches (jobs)"
description: "linux"
date: 2022-03-05T11:41:07-05:00
draft: false
weight: 2
---

### Les tâches (jobs)

Chaque terminal peut disposer **d'un processus en avant-plan** et de n'importe quel nombre de processus en **arrière-plan** indépendants. 

- Une seule **tâche (job)** peut lire en même temps l'entrée et les signaux générés par le clavier depuis une fenêtre de terminal donnée. 
- Les processus qui font partie de cette tâche sont les processus en **avant-plan** de ce terminal de contrôle. 
- Les processus en **arrière-plan** d'un terminal ne peuvent ni lire ni recevoir les interruptions générées par le clavier du terminal, mais peuvent éventuellement écrire sur le terminal. 
- Une tâche en arrière-plan peut être **suspendue (Ctrl+z)** ou **terminée (Ctrl+c)** 

```console
[antoine@host]$ firefox
Z
[2]+  Stoppé                 firefox

[antoine@host]$ firefox
^C
[antoine@host]$ 
```

### Exécution de tâches en arrière-plan

Une commande peut être démarrée en **arrière-plan** en ajoutant une esperluette (`&`) à la fin de la ligne de commande. 
Le shell Bash affiche un **numéro de tâche** (unique pour la session) et le `PID` du nouveau processus enfant. Le shell n'attend pas la fin du processus enfant, mais affiche plutôt l'invite shell.

```console
[antoine@host]$ firefox  &
[1] 3796
[antoine@host]$ gedit &
[2] 3870
[antoine@host]$ 
```

Vous pouvez afficher la liste des tâches que Bash suit pour une session particulière avec la commande `jobs`.

```console
[antoine@host]$ jobs
[1]-  En cours d'exécution   firefox &
[2]+  En cours d'exécution   gedit &
[antoine@host]$ 
```

Une tâche en **arrière-plan** peut être affichée au premier plan à l'aide de la commande `fg` avec son **numéro de tâche**, exemple: `%1`.

```console
[antoine@host]$ fg %1
firefox 
```

Dans l'exemple précédent, la commande `firefox` est exécutée en **avant-plan** sur le terminal de contrôle. Le shell lui-même repasse en état de veille et attend la fin de ce processus enfant.

Pour envoyer un processus en avant-plan vers l'arrière-plan, appuyez d'abord sur la requête suspend générée par le clavier (`Ctrl+z`) dans le terminal.

```console
firefox 
^Z
[1]+  Stopped    firefox 
[antoine@host]$ 
```

La tâche est immédiatement placée à **l'arrière-plan et est suspendue**. La fenêtre du firefox sera gélée, si vous essayez de l'utiliser.

La commande **ps T** affiche les processus en cours et leur état. L'exemple de commande **firefox** étant actuellement **suspendu**, l'état de son processus est **T**.
```console
[antoine@host]$ ps T
    PID TTY      STAT   TIME COMMAND
   4531 pts/0    Ss     0:00 bash
   4573 pts/0    Tl     0:09 /usr/lib64/firefox/firefox
   4611 pts/0    Sl     0:00 gedit
...
```

Pour démarrer le processus suspendu exécuté en arrière-plan, utilisez la commande `bg` avec le même numéro de tâche.

```console
[antoine@host]$ bg %1
[1]+ firefox  &
[antoine@host]$ ps T
    PID TTY      STAT   TIME COMMAND
   4531 pts/0    Ss     0:00 bash
   4573 pts/0    Sl     0:11 /usr/lib64/firefox/firefox
   4611 pts/0    Sl     0:00 gedit
...
```
L'état du process **firefox** devient **prêt (S)** et la fenêtre du firefox sera fonctionnele encore une fois.

> **Note**: Notez le signe `+` après le `[1]`, dans les exemples ci-dessus, indique que cette tâche est la tâche actuelle par défaut. C'est-à-dire que, si une commande attend un argument %numéro de tâche et qu'un numéro de tâche n'est pas fourni, l'action est prise dans la tâche avec l'indicateur `+`. 