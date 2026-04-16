---
title: "Laboratoire 5.3"
description: "linux"
draft: false
weight: 8
---
## Laboratoire 5.3 -  Solution

Question 1.1: 
```cmd 
$ vim ~/.bashrc
```

Question 1.2: **Ajoutez au fichier `~/.bashrc`  la ligne suivante: `PS1='[\u@\h \t \w]$ ‘`**

Question 1.3:  `:wq!` ou `ZZ` 
```ps  
[e1234567@localhost 12:34:25 ~]
```

Question 2.1: 
```cmd 
$ touch tmp.txt
```

Question 2.2: 
```cmd 
$ fichier=tmp.txt
```

Question 2.3: 
```cmd 
$ echo $fichier
```

Question 2.4: 
```cmd 
$ ls -l $fichier
```

Question 2.5: 
```cmd 
$ rm $fichier
```

Question 3: 
```cmd 
$ export EDITOR=vim
$ echo $EDITOR
```

Question 4.1: 
```cmd 
$ vim monscript1.sh
```

Question 4.2: **Insérez le texte.**

Question 4.3:  `:wq!` ou `ZZ`

Question 4.4: 
```cmd 
$ sh monscript1.sh
```

Question 4.5: 
```cmd 
$ cat sortie.txt
```

Question 4.6: 
```cmd 
$ vim monscript1.sh
```

Question 4.7: **Insérez le reste du texte.**

Question 4.8:  `:wq!` ou `ZZ`

Question 4.9: 
```cmd 
$ chmod a+x monscript1.sh
```

Question 4.10: 
```cmd 
$ ./monscript1.sh
```

Question 4.11: 
```cmd 
$ cat sortie.txt
```

Question 4.12: 
```cmd 
$ rm monscript1.sh sortie.txt
```
