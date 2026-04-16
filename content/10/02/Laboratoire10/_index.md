---
title: "Laboratoire 10"
description: "linux"
draft: false
weight: 2
---
## Laboratoire 10 - Gestion de réseaux

Connectez-vous à la VM.

#### Exercice 1 - Affichage des adresses IP

1. En utilisant la commande **ip**, listez toutes les interfaces réseau disponibles sur votre système.

2. Combien y a-t-il d'interfaces réseaux ?

3. En utilisant la commande **ip**, affichez l'adresse IP de l'interface actif **ens192**.

4. Quelle est l'addresse IP et l’adresse matérielle (MAC) de cet interface réseau ?

---

#### Exercice 2 - Ajout et suppression d’une connexion réseau

1. En utilisant la commande **nmcli** affichez le statut de tous les périphériques réseaux.

2. Combien y a-t-il d'interfaces réseaux de types **Ethernet** ? Nommez-les.

3. Pourquoi une de ces interfaces résaux Ethernet est déconnectée ?

4. En utilisant la commande **nmcli**, affichez une liste de toutes les connexions résaux.

5. Combien y a-t-il de connexions de type **Ethernet** ? 

6. Ajoutez une nouvelle connexion sur l'interface réseau **ens224** avec une **addresse IP automatique (DHCP)**. Nommez la nouvelle connexion **LAN1**.
 
7. Listez toutes les connexions résaux pour vérifier que la connexion **LAN1** est bien créée.

8. Exécutez la commande **nmcli** pour afficher l'addresse IP de cette nouvelle conexion **LAN1**.

9. Quelle est l'addresse IP de cette nouvelle connexion **LAN1** ?

10. En utilisant la commande **nmcli**, supprimez cette nouvelle connexion **LAN1**

11. Ajoutez encore une fois une nouvelle connexion sur l'interface réseau **ens224**, mais cette fois-çi utilisez une **addresse IP manuelle : 192.168.5.X/24 *(où X est le numéro de votre ordinateur)***. Nommez la nouvelle connexion **LAN2**.

12. Listez toutes les connexions résaux pour vérifier que la connexion **LAN2** est bien créée.

13. Exécutez la commande **nmcli** pour afficher l'addresse IP de cette nouvelle conexion **LAN2**.

---

#### Exercice 3 - Modification des paramètres de connexion réseau

1. En utilisant la commande **nmcli**, modifiez la connexion réseau **LAN2** pour ajouter une **passerelle par défaut : 192.168.5.220** et une **addresse d'un serveur DNS : 192.168.5.225**.

2. En utilisant la commande **nmcli**, affichez la liste des paramètres actuels de la connexion **LAN2** pour vérifier que l'addresse IP de la passerelle par défaut  et du serveur DNS sont bien ajoutées.

3. En utilisant la commande **nmcli**, ajoutez sur la connexion réseau **LAN2** une **deuxième addresse IP manuelle : 192.168.6.X/24 *(où X est le numéro de votre ordinateur)***. 

4. Désactivez puis activez la connexion **LAN2**, pour appliquer la modification faite à l'étpe précedente.

5. Affichez la liste des paramètres actuels de la connexion **LAN2** pour vérifier que la deuxième addresse IP a été bien ajoutée.

---

#### Exercice 4 - Fichiers de configuration

1. Où se touvent les fichiers de configuration de vos deux connexion **ens192** et **LAN2** ?

2. Listez le contenu du fichier de configuration de la connexion **ens192**.

3. Quel paramètre, de ce fichier, montre que la configuration IP est automatique pas manuelle ?

4. Listez le contenu du fichier de configuration de la connexion **LAN2**.

5. Quel paramètre, de ce fichier, montre que la configuration IP est manuelle pas automatique ?

---

#### Exercice 5 - Configuration de noms d'hôte

1. Utilisez une commande pour affichez **le nom d’hôte** de votre machine.

2. Listez le contenu du fichier qui contient **le nom d’hôte** de votre machine.

3. Modifiez le nom d'hôte de votre machine et nommé-le **VM_VotreNom_Famille**.

4. Fermez le terminal shell et ouvrez-le encore une fois, pour afficher le nouveau nom à l’invite Shell.
