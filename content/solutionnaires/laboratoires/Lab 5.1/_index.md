---
title: "Laboratoire 5.1"
description: "linux"
draft: false
weight: 6
---
## Laboratoire 5.1 -  Solution

Question 1:
```cmd 
wc – l /etc/passwd
cat /etc/passwd | wc –l 
```
**Dans le second cas, le nom de fichier n’est pas passé en argument de la commande wc. La commande ne connaît donc pas le fichier, elle ne se contente que de traiter les données reçues sur son entrée ; par conséquent, le nom du fichier `/etc/passwd` n’est pas affiché.**

Question 2.:
```cmd 
echo bonjour tout le monde > /tmp/ficecho
```

Question 3: 
```cmd 
echo bonjour tout le monde >> /tmp/ficecho
```

Question 4: 
```cmd 
cat /tmp/ficecho /etc/hosts > /tmp/ficcat
```

Question 5: 
```cmd 
cd /etc
ls > /tmp/ls.out 
cat /tmp/ls.out
```

Question 6: 
```cmd 
ls /etc | wc -l
```

Question 7: 
```cmd 
ls /etc | tee /tmp/ls.out | wc -l
```

Question 8: 
```cmd 
ls /etc/passwd glop > /tmp/ls.out 2> /tmp/ls.err
```

Question 9: 
```cmd 
ls /etc/passwd glop > /tmp/ls.out 2> /dev/null
```

Question 10: 
```cmd 
ls /etc/passwd glop &> /tmp/ls.out
```

Question 11: 
```cmd 
find /etc -name passwd 2>/dev/null | wc -l
```
