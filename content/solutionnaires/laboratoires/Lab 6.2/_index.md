---
title: "Laboratoire 6.2"
description: "linux"
draft: false
weight: 10
---
## Laboratoire 6.2 -  Solution

<u>Question 1.1:</u> <pre>$ sudo su -
</pre>

<u>Question 1.2:</u> <pre># useradd admin1
</pre>

<u>Question 1.3:</u> <pre># tail /etc/passwd
</pre>

<u>Question 1.4:</u> <pre># passwd admin1
</pre>

<u>Question 1.5:</u> <pre># useradd admin2
</pre>
<pre># useradd admin3
</pre>

<u>Question 1.6:</u> <pre># tail /etc/passwd
</pre>

<u>Question 1.7:</u> <pre># passwd admin2
</pre>
<pre># passwd admin3
</pre>

<u>Question 1.8:</u> <pre># usermod -c "Admin un" admin1
</pre>
<pre># usermod -c "Admin deux" admin2
</pre>

<u>Question 1.9:</u> <pre># tail /etc/passwd
</pre>

<u>Question 1.10:</u> <pre># userdel -r admin3
</pre>

<u>Question 1.11:</u> <pre># tail /etc/passwd
</pre>

----------------------------------------------------

<u>Question 2.1:</u> <pre># groupadd -g 30000 admins
</pre>

<u>Question 2.2:</u> <pre># groupadd directeurs
</pre>

<u>Question 2.3:</u> <pre># tail /etc/group
</pre>

<u>Question 2.4:</u> <pre># usermod -aG admins admin1
</pre>
<pre># usermod -aG admins admin2
</pre>

<u>Question 2.5:</u> <pre># id admin1
</pre>
<pre># id admin2
</pre>

<u>Question 2.6:</u> <pre># sudo visudo
</pre>
<b>Ajouter la ligne:</b> <pre>%admins ALL=(ALL) ALL
</pre>

<u>Question 2.7:</u> <pre># su - admin1
</pre>

<u>Question 2.8:</u> <pre>$ sudo cat /etc/sudoers.d/admins
</pre>
<b>Oui il peut l'exécuter car nous lui a donné l'accès sudo dans la question 2.6.</b>

<u>Question 2.9:</u> <pre>$ exit
</pre>

<u>Question 2.10:</u> <pre># groupdel directeurs
</pre>

<u>Question 2.11:</u> <pre># exit
</pre>

