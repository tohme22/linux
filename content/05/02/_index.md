---
title: "Modification de fichiers texte (vim)"
description: "linux"
draft: false
weight: 3
---

## Modification de fichiers texte à partir de l'invite du shell

### Modification de fichiers avec vim

L'un des principes clés à la base de la conception de Linux repose sur le fait que les informations et les paramètres de configuration sont stockés dans des fichiers texte. Ces fichiers peuvent être structurés de différentes manières, sous forme de listes de paramètres, de formats de type `INI`, en tant que fichier `XML` ou `YAML` structuré, etc. Cependant, l'avantage des fichiers texte est qu'ils peuvent être visualisés et édités à l'aide de n'importe quel éditeur de texte.

`Vim` est une version améliorée de l'éditeur vi fourni avec les systèmes Linux et UNIX. `Vim` est hautement configurable et efficace pour les utilisateurs avertis. Il comprend des fonctionnalités comme la division de l'écran d'édition, le formatage par couleurs et la mise en surbrillance du texte en cours d'édition.

#### Pourquoi apprendre vim ?

Vous devez savoir utiliser au moins un éditeur de texte pouvant être utilisé depuis une invite shell texte uniquement. Si c'est le cas, vous pouvez éditer des fichiers texte de configuration à partir d’une fenêtre de terminal ou à partir de connexions distantes via `ssh` ou la console Web. Ensuite, vous n'avez pas besoin d'accéder à un bureau graphique pour éditer des fichiers sur un serveur. En fait, il est possible que ce serveur n'ait pas besoin d'un environnement de bureau graphique du tout.

De plus, `vim` est souvent utilisé sur d'autres distributions ou systèmes d'exploitation courants. Par exemple, macOS comprend actuellement une installation légère de `vim` par défaut. Ainsi, les compétences acquises par Vim pour Linux pourraient également vous aider à réaliser d'autres choses.

#### Commencer Vim

`Vim` est installé par défaut sur Red Hat Enterprise Linux. 
Pour lancer Vim  vous utilisez la commande `vim` suivi par le nom du fichier.

```console
[user@host]$ vim nom_fichier
```

#### Modes de fonctionnement de vim

Une caractéristique inhabituelle de `vim` est qu'il propose plusieurs modes de fonctionnement, y compris le `mode commande`, le `mode commande étendu`, le `mode d'insertion` et le `mode visuel`. Selon le mode, vous pouvez émettre des commandes, modifier du texte ou utiliser des blocs de texte. En tant que nouvel utilisateur de Vim, 
vous devez toujours être conscient de votre mode actuel, car **les raccourcis clavier** ont des effets différents selon les modes.

![HTTP](../../images/5-10.png?height=500&classes=border,shadow,inline)

Lorsque vous ouvrez `vim` pour la première fois, il démarre en `mode commande` qui est utilisé pour la navigation, les couper-coller et d'autres manipulations de texte. Entrez dans chacun des autres modes avec un raccourci clavier à une touche pour accéder à des fonctionnalités d'édition spécifiques :

- **Mode d'insertion :** Une pression sur `i` ouvre le `mode d'insertion`, dans lequel tout le texte saisi s'ajoute au contenu du fichier. 

- **Mode de commande :** Appuyez sur `Échap`  pour revenir au `mode de commande`, qui est utilisé pour la navigation, les couper-coller et d’autres manipulations de texte

- **Mode visuel :** Le mode visuel est un excellent moyen de mettre en surbrillance et de manipuler du texte. Il existe trois raccourcis clavier :
    - Mode caractère: Une pression sur `v` ouvre le `mode visuel` , dans lequel il est possible de sélectionner des caractères multiples pour manipuler le texte. 
	- Mode ligne : Utilisez `Maj+v` pour sélectionner plusieurs lignes.
	- Mode bloc : Utilisez `Ctrl+v` pour sélectionner un bloc.<br>
Le même raccourci (`v,` `Maj+v` ou `Ctrl+v`) est utilisé pour passer en mode visuel et pour en sortir.

- **Mode de commande étendu :** La touche `:` ouvre le `mode commande étendu` pour effectuer des tâches comme écrire un fichier (pour l'enregistrer), ou encore quitter l'éditeur `vim`. 

> ** Note** : Si vous n'êtes pas sûr du mode dans lequel se trouve Vim, vous pouvez appuyer sur **Échap** quelques fois pour revenir en mode commande. Appuyer sur Échap en mode commande ne présente aucun risque, il n'est donc pas gênant d'appuyer quelques fois supplémentaires sur la touche.

#### Raccourcis clavier de vim

`Vim` offre des combinaisons de touches efficaces et coordonnées pour effectuer des tâches d'édition avancées. Bien qu'elles deviennent utiles avec de la pratique, les possibilités de vim peuvent désorienter les nouveaux utilisateurs.

![HTTP](../images/vim1.png?height=700&classes=border,shadow,inline)

> **Note**:  Vim dispose de nombreuses fonctionnalités, mais vous devez d’abord maîtriser les raccourcis clavier de base. Vous n'avez pas besoin de connaître rapidement tout l'éditeur et ses fonctionnalités. Familiarisez-vous avec ces bases en pratiquant, puis enrichissez votre vocabulaire Vim en apprenant d'autres commandes `vim`.
Le **laboratoire 5.2** de cette section vous présentera la commande `vimtutor`. Ce tutoriel est un excellent moyen d’apprendre les fonctions principales de `Vim`. 





