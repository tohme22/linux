---
title: "Laboratoire 13"
description: "linux"
draft: true
weight: 17
---
## Laboratoire 13 -  Solution

#### Exercice 1 - RPM

```cmd
1. $ rpm -q nano
nano-2.9.8-1.el8.x86_64
```
```cmd
2. $ sudo rpm -evh nano
```
```cmd
3. $ rpm -q nano
package nano is not installed
```
```cmd
4. $ sudo rpm -ivh nano-2.9.8-1.el8.x86_64.rpm
```
```cmd
5. $ rpm -q nano
nano-2.9.8-1.el8.x86_64
```
```cmd
6. $ rpm -qi nano
```
```cmd
7. $ rpm -qc nano
   $ rpm -qd nano
```

---
#### Exercice 2 - DNF

```cmd
1. $ dnf list guile
```
```cmd
2. $ dnf info guile
```
```cmd
3. $ sudo dnf remove guile
```
```cmd
4. $ dnf list guile
```
```cmd
5. $ sudo dnf remove guile
```
```cmd
6. $ dnf list guile
```
```cmd
7. $ dnf search ifconfig
```
```cmd
8. $ dnf list python3-ifcfg.noarch
Non, elle n'est pas installée
```
```cmd
9. $ dnf history 
```
```cmd
10. $ dnf history 17
```
