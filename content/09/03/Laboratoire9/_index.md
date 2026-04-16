---
title: "Laboratoire 9"
description: "linux"
draft: false
weight: 2
---
## Laboratoire 9 . Gestion des processus linux

Connectez-vous à la VM.

#### Exercice 1 - Contrôle des tâches (jobs)

1. Exécutez une commande pour afficher la liste de **tout les processus** actifs.

2. Cherchez et listez seulement le processus nommée **cupsd**. Quelle est l'identifiant de ce processus, son état et son emplacement?

3. Lancez l'application **firefox** à patir du shell en **arrière plan**.

4. Visualisez la liste des tâches (jobs).

5. Lancez l'application **meld** à patir du shell en **arrière plan**.

6. Visualisez la liste des tâches (jobs).

7. Mettez le processus **meld** à l'**avant plan**, puis **suspendez** ce processus.

8. Listez l'état de ce processus **meld**. Quel est son état et pourquoi?

9. Démarrez le processus **meld** suspendu exécuté en arrière.plan.

10. Listez encore une fois l'état de ce processus **meld**. Quel est son état maintenant et pourquoi?

11. Visualisez la liste des tâches (jobs).

12. Mettez le processus **firefox** à l'**avant plan**, puis **terminez** ce processus.

13. Qu'est qui c'est passé avec le processus et l'application **firefox**, et pourquoi?

14. Listez les processus, pour vérifier que le processus **firefox** a été bien terminé.

15. Fermez la fenêtre de l'application **meld**.

16. Listez les processus, pour vérifier que le processus **meld** a été bien terminé.

---

#### Exercice 2 - Contrôle de processus à l’aide de signaux :

1. À partir de votre bureau graphique, ouvrez les applications **Text Editor** et **Cheese**.

2. À partir du shell, trouver les informations suivantes, pour chaque processus de l'étape précédente:

   - Leur identifiant (PID).
   - Le temps du processeur utilisé.
   - Le pourcentage de mémoire utilisé.
   - La taille de mémoire virtuelle donnée à chaque processus.
   - Leur état.
   
3. En utilisant un **signal numérique**, forcez l'arrêt du processus utilisé par l'application **Text Editor**.

4. Vérifiez que le processus est bien terminé.

5. En utilisant un **signal abrégés (textuel)**, arrêtez le processus utilisé par l'application **Cheese**.

6. Vérifiez que le processus est bien terminé.

7. À partir de votre bureau graphique, ouvrez l'application **Firefox**.

8. Retournez à votre shell et vérifiez que le processus **firefox** est en cours d'exécution.

9. En utilisant la commande **killall** terminez le processus **firefox**.

10. Listez les processus, pour vérifier que le processus **firefox a été bien terminé.

---

#### Exercice 3 - Contrôle de l’activité des processus :

1. Affichez la moyenne de **charge actuelle** de votre système. Notez les **trois derniers valeurs**. 
*Ce sont les valeurs de la charge moyenne qui représentent la charge au cours de la dernière minute, et des cinq et quinze dernières minutes*

2. Affichez les détails du **processeur (CPU)** de votre machine. Combien de processeurs possède votre ordinateur?

   Vous alez maintenant créer un script qui générera une charge artificielle du processeur en effectuant soixante mille problèmes d'addition. Il se met
ensuite en veille pendant une seconde, réinitialise la variable et se répète.

3. Créez un script nommé **monitor** avec le contenu suivant :
```console
#!/bin/bash
while true; do
  var=1
  while [[ var -lt 60000 ]]; do
    var=$(($var+1))
  done
sleep 1
done
```
4. Enregistrez ce script et rendez.le exécutable: **chmod a+x monitor**

5. Exécutez ce script à patir du shell en arrière plan : **./monitor &**

6. Gardez votre fenêtre shell ouvert et ouvrez une nouvelle fenêtre shell côte à côte de l'autre fenêtre.

7. Dans cette nouvelle fenêtre shell, exécutez la comamnde **top**. Qu'est ce que vous constatez?

8. Utilisez les touches **l** , **t** et **m** pour activer les lignes d'en-tête de la charge, des fils d'exécution (threads) et de la mémoire. 
Après avoir observé ce comportement, assurez.vous que tous les en.têtes sont affichés.

9. Quel est le pourcentage de l'utilisation du processeur (approximativement)? Pourquoi c'est haut?

10. Gardez la fenêtre shell du **top** ouvert, et retournez à l'autre fenêtre shell. 

11. Exécutez la même commande utilisée au point 1 de cette execice 3. Quels sont **les trois nouvelles valeurs de la charge moyenne**, comparez.les avec les valeurs du point 1.

12. Retournez au shell de la commande **top**, en utilisant un touche du programme **top** arrêtez le processus **monitor**, en saisissant son PID, puis un signal. Expliquez les étapes utilisées.

13. Quittez **top**.

