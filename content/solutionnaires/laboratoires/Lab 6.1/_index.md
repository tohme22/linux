---
title: "Laboratoire 6.1"
description: "linux"
draft: false
weight: 9
---
## Laboratoire 6.1 -  Solution

<u>Question 1.1:</u> <pre>$ id
uid=1001(e1234567) gid=1001(e1234567) groupes=1001(e1234567),10(wheel) contexte=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
</pre>

<u>Question 1.2:</u> <pre>$ pwd
/home/e1234567
</pre>

<u>Question 1.3:</u> <pre>$ echo $HOME
/home/e1234567</pre>
<pre>$ echo $PATH
/home/e1234567/.local/bin:/home/e1234567/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin
</pre>

<u>Question 2.1:</u> <pre>$ sudo su
[sudo] password for e1234567: Passw0rd
</pre>

<u>Question 2.2:</u> <pre># id
uid=0(root) gid=0(root) groups=0(root) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
</pre>

<u>Question 2.3:</u> <pre># pwd
/home/e1234567
</pre>

<u>Question 2.4:</u> <pre># echo $HOME
/root
</pre>
<pre> # echo $PATH
/sbin:/bin:/usr/sbin:/usr/bin
</pre>

<u>Question 2.5:</u> <pre>$ exit</pre>

<u>Question 3.1:</u> <pre>$ sudo su -
</pre>

<u>Question 3.2:</u> <pre># id
uid=0(root) gid=0(root) groups=0(root) context=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023
</pre>

<u>Question 3.3:</u> <pre># pwd
/root
</pre>

<u>Question 3.4:</u> <pre># echo $HOME
/root
</pre>
<pre># echo $PATH
/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
</pre>

<u>Question 3.5:</u> 
La principale différence qui existe entre ces deux commandes est que <code class="gr">su -</code> configure l’environnement shell comme s’il s’agissait d’une nouvelle connexion sous cette identité, 
alors que <code class="gr">su</code> lance simplement un shell sous l’identité de cet utilisateur, mais en conservant les paramètres d’environnement courants.

<u>Question 3.6:</u> <pre># exit</pre>

<u>Question 4.1:</u> <pre>$ su - etudiantadmin
Password: 420!lnp4ss
</pre>

<u>Question 4.2:</u> <pre>$ tail -5 /var/log/messages
tail: cannot open '/var/log/messages' for reading: Permission denied
</pre>
La commande échoue car elle doit être exécuter en tant que root.

<u>Question 4.3:</u> <pre>$ sudo tail -5 /var/log/messages
Password: 420!lnp4ss
</pre>
La commande réussie car elle était exécutée en tant que root.

<u>Question 4.4:</u> <pre>$ cp /etc/motd /etc/motdOLD
cp: cannot create regular file '/etc/motdOLD': Permission denied
</pre>
La commande échoue car elle doit être exécuter en tant que root.

<u>Question 4.5:</u> <pre>$ sudo cp /etc/motd /etc/motdOLD
</pre>
La commande réussie car elle était exécutée en tant que root.

<u>Question 4.6:</u> <pre>$ rm /etc/motdOLD
rm: remove write-protected regular empty file '/etc/motdOLD'? y
rm: cannot remove '/etc/motdOLD': Permission denied
</pre>
La commande échoue car elle doit être exécuter en tant que root.

<u>Question 4.7:</u> <pre>$ sudo rm /etc/motdOLD</pre>
La commande réussie car elle était exécutée en tant que root.

<u>Question 4.8:</u> <pre>$ exit</pre>