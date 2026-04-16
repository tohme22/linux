---
title: "Travail Pratique 2"
description: "linux"
draft: false
weight: 2
---
## Travail Pratique 2 -  Solution

**Exercice 1:** 
```cmd
$ echo $PATH| tr ':' '\n'
```
```cmd
$ cat /etc/passwd | tr ':' '\t'
```
```cmd
$ cat /etc/passwd | tr ':' '\t'| sort
```
```cmd
cat /etc/passwd | cut -d':' -f 1,6 | sed 's/:/ a pour répertoire personnel :/g
```

**Exercice 2:**
```cmd
$ find / -name *.log 2>/dev/null > journal.txt
$ cat journal.txt
```
```cmd
$ echo “***************************************” >> journal.txt
$ cat journal.txt
```
```cmd
$ find / -name *.log  2>/dev/null | sort -r >> journal.txt
$ cat journal.txt
```

**Exercice 3:**
```cmd
$ nbUtilisateurs=$(cat /etc/passwd | wc -l)
```
```cmd
$ echo "\$*\$*\$* Le nombre d'utilisateurs est: $nbUtilisateurs \$*\$*\$*"
```
```cmd
$ echo "le répertoire $(pwd) contient $(ls | wc -l) fichiers ou dossiers"
```

**Exercice 4:**
```cmd
$ vim script1.sh
```
{{< highlight bash  >}}
#!/bin/bash
nomGroupPrinc=$(grep etudiantadmin /etc/passwd | cut -d':' -f 5)
nomRepPerso=$(grep etudiantadmin /etc/passwd | cut -d':' -f 6)
execShell=$(grep etudiantadmin /etc/passwd | cut -d':' -f 7)
echo "etudiantadmin a le groupe principal: ${nomGroupPrinc}, le répertoire personnel: ${nomRepPerso}, le shell: {execShell}"
{{< / highlight >}}

```cmd
$ mkdir scripts
$ mv script1.sh scripts
```

```cmd
$ PATH=${PATH}:/home/e1234567/scripts
$ chmod a+x /home/e1234567/scripts/script1.sh
$ script1.sh
```
