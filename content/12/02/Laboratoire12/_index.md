---
title: "Laboratoire 12"
description: "linux"
draft: false
weight: 2
---
## Laboratoire 12 - Gestion du stockage

Connectez-vous à la VM.

#### Exercice 1 - Examen des systèmes de fichiers

1. Basculez vers l'utilisateur **root** dans un shell de connexion, en utilisant le mot de passe **420!lnp4ss**.

2. En utilisant une commande Linux, listez **vos périphériques de stockage, leurs partitions *(ou volumes logiques)*, leur taille et leur point de montage**.

	2.1 Combien de **périphériques de stockage** sont attachés à votre machine ?

	2.2 Combien de **partition ou volume logique** contient chaque périphérique de stockage ?
	
	2.3 Quelle est **la taille** de chaque partition et volume logique ?
	
	2.4 Quelle est **le point de montage** de chaque partition et volume logique ?

3. En utilisant une commande Linux, listez **vos périphériques de stockages, leur système de fichiers et leur UUID**.
	
	3.1 Quel est  **le système de fichiers** utilisé par chaque partition et volume logique ?
	
4. En utilisant une commande Linux, listez **la quantité d’espace disponible libre sur chaque partition ou volume logique**.

---

#### Exercice 2 - Création des partitions, de systèmes de fichiers et des points de montage

1. En restant toujours connecté avec l'utilisateur **root**, exécutez une commande Linux pour lister **le schéma de partitionnement (mbr ou gpt)** utilisé par chaque périphérique de stockage.
	
	1.1 Quel est  le schéma de partitionnement utilisé par chaque périphérique de stockage, est-ce que c'est **mbr** ou **gpt** ?
	
2. Sur le périphérique de stockage **/dev/sdb**, faites-les étapes suivantes:

	2.1 Créez **deux partitions** d'une taille de **2G** chaque.
	
	2.2 Listez votre périphérique de stockage pour vérifier que les deux partitions ont été bien créées.
	
	2.3 Formatez la 1ère partition en **ext4** et la 2éeme en **FAT 32**.
	
	2.4 Listez votre périphérique de stockage pour vérifier que les deux partitions ont été bien formatées par un système de fichiers. 
	
	2.5 Créez le repértoire **/docs**
	
	2.6 Montez **manuellement la 1ère partition** au repértoire **/docs**.
	
	2.7 Listez votre périphérique de stockage pour vérifier que la 1ère partition a été bien monté au repértoire **/docs**
	
	2.8 Éditez le fichier **/etc/fstab** pour monter **automatiquement la 2ème partition** au repértoire **/mnt**.
	
	2.9 Exécutez une commande Linux, afin que le système enregistre cette nouvelle configuration, sans redémarrez la machine.
	
	2.10 Listez votre périphérique de stockage pour vérifier que la 2ème partition a été bien monté au repértoire **/mnt**