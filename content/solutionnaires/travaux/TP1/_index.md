---
title: "Travail Pratique 1"
description: "linux"
draft: false
weight: 1
---
## Travail Pratique 1 -  Solution

**Exercice 1:** 
```cmd
mkdir grading
```
```cmd
cd grading/
touch grade{1..3}
ls
```
```cmd
cp grade1 grade1-copy.txt
```
```cmd 
cd
```
```cmd 
ln -s ~/grading/grade2 softlink
```
```cmd 
ls -l
```

**Exercice 2:**
```cmd 
mkdir Atelier
```
```cmd 
touch fichier2.txt
cp 
fichier2.txt Atelier
   ```
```cmd 
mkdir Rep
```
```cmd 
mv Atelier Rep 
```
```cmd 
cd Rep/Atelier
ls
```
```cmd 
cd
```
```cmd 
rm -r Rep
```
```cmd 
pwd
``` 
**Dans le répertoire personnel de l'utilisateur**

**Exercice 3:**
```cmd
man ls
``` 
**Chercher l'option -h**

```cmd 
ls -lh /etc/services 
-rw-r--r--. 1 root root 677K 15 avr  2020 /etc/services
```

**Exercice 4:**
```cmd 
pwd
```
```cmd 
cd /usr/share/doc
```
```cmd 
cd ..
pwd
```
```cmd 
cd ../../home/e123467/
```
```cmd 
ls
```
```cmd 
ls /usr
```

**Exercice 5:**
```cmd 
cd /etc
```
```cmd 
find /etc -name "r*"
ou 
find name "r*"
```
```cmd 
find / -name "*.txt"
```
```cmd 
find /etc -name "*rc*"``` ou ```cmd find -name "*rc*"
```
```cmd 
find /etc -name "???"``` ou ```cmd find -name "???"
```

**Exercice 6:**
```cmd 
mkdir -p coursLinux/semaine{1..5}/{lab,lecon}
```
```cmd 
touch coursLinux/semaine{1..5}/lab/priseNote
```






