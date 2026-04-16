---
title: "Laboratoire 8"
description: "linux"
draft: false
weight: 12
---
## Laboratoire 8 -  Solution

#### Exercice 1:
```cmd
cat /etc/services | grep -v '^#' | wc -l 
```
#### Exercice 2:
```cmd
echo $PATH | tr ':' '\t'
```
#### Exercice 3:
```cmd
grep 'admin*' /etc/passwd | sed 's/admin/administrateur/g'
```
#### Exercice 4:
```cmd
cat /etc/passwd | cut -d':' -f 2 | sed 's/x/###/g' > exercice4.txt
```