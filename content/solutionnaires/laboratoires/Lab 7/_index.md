---
title: "Laboratoire 7"
description: "linux"
draft: false
weight: 11
---
## Laboratoire 7 -  Solution

<u>Question 1:</u> <pre>$ su -
</pre>

<u>Question 2:</u> <pre># mkdir /home/admins
</pre>

<u>Question 3:</u> <pre># chgrp admins /home/admins
</pre>

<u>Question 4:</u> <pre># ls -ld /home/admins	
</pre>

<u>Question 5:</u> <pre># chmod g+w /home/admins 
</pre>
<pre># # ls -ld /home/admins
</pre>

<u>Question 6:</u> <pre># chmod 770 /home/admins
</pre>
<pre># ls -ld /home/admins
</pre>

<u>Question 7:</u> <pre># exit
</pre>
<pre>$ su - admin1
</pre>

<u>Question 8:</u> <pre>$ cd /home/admins
</pre>
<pre>$ touch admin1.txt
</pre>

<u>Question 9:</u> <pre>$ ls -l admin1.txt
</pre>

<u>Question 10:</u>
</pre>
<pre>$ su - admin2
</pre>

<u>Question 11:</u> <pre>$ cd /home/admins/
</pre>
<pre>$ echo "text" >> admin1.txt
</pre>

<u>Question 12:</u> <pre>$ cat admin1.txt
</pre>

<u>Question 13:</u> <b>Oui admin2 est capable d'ajouter du texte, car il est membre du groupe admins qui a la prmission écriture sur ce fichier.</b>

<u>Question 14:</u> <pre>$ exit
</pre>










