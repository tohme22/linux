---
title: "Commande grep"
description: "linux"
draft: false
weight: 2
---

### Cherche une chaîne de caractères  avec **grep**

- La commande **grep** cherche la chaîne de caractères « **expression** » à l'intérieur des fichiers ou des répertoires spécifiés et affiche les lignes correspondantes. 
- Avec l'option **-R**, la recherche s'effectue également dans tous les sous-répertoires compris dans le répertoire donné.
- La syntaxe de la commande **grep** est la suivante:

  **grep *[option] 'expression' fichier***
  
##### Exemples (*Sans utiliser les options*):
  
Afficher toutes les lignes de fichier qui contiennent une **expression** spécifique, ou utiliser une expression avec des **caractères génériques** :
```console
[antoine@host]$ grep 'ssh' /etc/services 
ssh             22/tcp              # The Secure Shell (SSH) Protocol
x11-ssh-offset  6010/tcp            # SSH X11 forwarding offset

[antoine@host]$ grep '^ssh' /etc/services 
ssh             22/tcp              # The Secure Shell (SSH) Protocol
ssh             22/udp              # The Secure Shell (SSH) Protocol
ssh             22/sctp                 # SSH
```
Voici la liste des **options** les plus utilisées :

|Options|Fonction|
|--|--|
|**-i**| Utiliser l'expression régulière fournie sans demander à tenir compte de la casse (ignorer les distinctions majuscules-minuscules).|
|**-v**| Afficher uniquement les lignes qui ne correspondent pas à l'expression régulière.|
|**-e**| L'utilisation de plusieurs options **-e** permet de spécifier plusieurs expressions régulières qui seront appliquées avec un « OU » logique.|

##### Exemples :

Les expressions régulières sont sensibles à la casse par défaut. Utilisez l'option **-i** pour exécuter une recherche non sensible à la casse.
```console
[antoine@host]$ grep -i 'tcp' fich2.txt 
Tcp est eu servivce réseau
TCP est prformant
tcp est un protocole
```
L'option **-v** affiche uniquement les lignes qui **ne correspondent pas à l'expression** régulière.
```console
[antoine@host]$ grep -v 'tcp' fich2.txt 
Tcp est eu servivce réseau
UDP est utilisé aussi
TCP est prformant
Addresse IP
udp aussi
```
Pour lister un fichier sans afficher les lignes de commentaires, utilisez l'option **-v**. Dans l'exemple ci-après, l'expression régulière identifie toutes les lignes qui commencent par un **#** ou
par un **;** *(ces caractères indiquant généralement qu'une ligne doit être interprétée comme un commentaire).*
```console
[antoine@host]$ cat /etc/ethertypes
#
# Ethernet frame types
#		This file describes some of the various Ethernet
#		protocol types that are used on Ethernet networks.
IPv4	0800  	ip ip4 		# Internet IP (IPv4)
X25		0805

[antoine@host]$ cat /etc/ethertypes | grep -v '^[#;]'
IPv4	0800  	ip ip4 		# Internet IP (IPv4)
X25		0805
ARP		0806	ether-arp	#
ou
[antoine@host]$ grep -v '^[#;]' /etc/ethertypes
IPv4	0800  	ip ip4 		# Internet IP (IPv4)
X25		0805
ARP		0806	ether-arp	#
```
La commande grep avec l'option **-e** vous permet de rechercher **plusieurs expressions** régulières à la fois.
```console
[antoine@host]$ cat /etc/services | grep -e 'ssh' -e 'opsec' -e 'ptp'
ssh             22/tcp                          # The Secure Shell (SSH) Protocol
ssh             22/sctp                 # SSH
ptp-event       319/tcp                 # PTP Event
...
sshell          614/tcp                 # SSLshell
...
opsec-cvp       18181/tcp               # OPSEC CVP
...
```






