---
title: "Redirection de la sortie"
description: "linux"
draft: false
weight: 1
---

## Redirection de la sortie vers un fichier ou un programme

### Entrée standard, sortie standard et erreur standard

Un programme d'exécution, ou processus, doit lire l'entrée depuis un emplacement et écrire la sortie quelque part. Une commande exécutée depuis l'invite du shell lit habituellement son entrée depuis le clavier et envoie sa sortie vers sa fenêtre de terminal.

Un processus utilise des canaux numérotés appelés descripteurs de fichiers pour obtenir une entrée et envoyer une sortie. Tous les processus commencent par au moins trois descripteurs de fichier. <b>Entrée standard</b> (canal 0) lit les entrées du clavier. Sortie standard (canal 1) envoie une sortie normale au terminal. <b>Erreur standard</b> (canal 2) envoie des messages d'erreur au terminal. Si un programme ouvre des connexions séparées avec d'autres fichiers, il peut utiliser des descripteurs de fichiers portant des numéros plus élevés.

![HTTP](../../images/5-1.png?height=300&classes=border,shadow,inline)

|Numéro|	Nom du canal|	Description|	Connexion par défaut|	Utilisation|
|---|---|---|---|---|
|0|	stdin|	Entrée standard|	Clavier|	lecture seule|
|1|	stdout|	Sortie standard|	Terminal|	écriture seule|
|2|	stderr|	Erreur standard|	Terminal|	écriture seule|
|3+|	nom de fichier|	Autres fichiers|	aucun|	lecture et/ou écriture|

### Redirection de la sortie vers un fichier

La redirection des E/S change la façon dont le processus obtient son entrée ou sa sortie. Au lieu d’obtenir une entrée du clavier ou d’envoyer une sortie et des erreurs au terminal, le processus lit ou écrit dans des fichiers. La redirection vous permet de sauvegarder des messages dans un fichier normalement envoyé à la fenêtre du terminal. Vous pouvez également utiliser la redirection pour supprimer les sorties ou les erreurs, afin qu'elles ne soient ni affichées sur le terminal ni enregistrées.

La redirection de `stdout` empêche l'affichage de la sortie du processus sur le terminal. Comme indiqué dans le tableau suivant, la redirection de `stdout` seulement n'empêche pas l'affichage des messages d'erreur stderr sur le terminal. Si le fichier n'existe pas, il sera créé. Si le fichier existe et que la redirection ne s'ajoute pas au fichier, le contenu du fichier sera écrasé.

Le fichier spécial `/dev/null` élimine discrètement la sortie de canal redirigée vers ce fichier et est toujours un fichier vide.

  |Utilisation|Explication|Aide visuelle|
  |---|---|---|
  |`> fichier`|	redirige `stdout` pour écraser un fichier	|![HTTP](../../images/5-2.png?height=300&classes=border,shadow,inline)|
  |`>> fichier`| redirige `stdout` pour l'ajouter à un fichier|![HTTP](../../images/5-3.png?height=300&classes=border,shadow,inline)|
  |`2> fichier`| redirige `stderr` pour écraser un fichier|![HTTP](../../images/5-4.png?height=300&classes=border,shadow,inline)|	
  |`&> fichier`| redirige `stdout` et stderr pour écraser le même fichier|![HTTP](../../images/5-6.png?height=300&classes=border,shadow,inline)|	
  |`&>> fichier`| redirige `stdout` et `stderr` pour les ajouter au même fichier|![HTTP](../../images/5-7.png?height=R30&classes=border,shadow,inline)|	
  |`2> /dev/null`| supprime les messages d'erreur `stderr` en les redirigeant vers `/dev/null`|![HTTP](../../images/5-5.png?height=300&classes=border,shadow,inline)|

#### Exemples de redirection de sortie

De nombreuses tâches d'administration de routine sont simplifiées grâce à la redirection. Utilisez le tableau précédent pour vous aider à déchiffrer les exemples ci-dessous :

- Enregistrer un horodatage pour référence ultérieure.

```console
[user@host]$ date > date.txt
```

- Copier les 100 dernières lignes d'un fichier journal vers un autre fichier.

```console
[user@host]$ tail -n 100 /var/log/dmesg > 100-messages.txt
```

- Concaténer quatre fichiers en un.

```console
[user@host]$ cat fich1 fich2 fich3 fich4 > fich1-4.txt
```

- Répertorier le nom des fichiers masqués et standard du répertoire personnel dans un fichier.

```console
[user@host]$ ls -a > fichiers-cachés.txt
```

- Ajouter la sortie à un fichier existant.

```console
[user@host]$ echo "nouvelle information" > information.txt
[user@host]$ echo "autre information" >> information.txt
```

- Les quelques commandes suivantes génèrent des messages d'erreur, car certains répertoires système sont inaccessibles aux utilisateurs normaux. Observez lorsque les messages d'erreur sont redirigés. Redirigez les erreurs vers un fichier tout en affichant la sortie de la commande normale sur le terminal.

```console
[user@host]$ find /etc -name passwd 2> erreurs.txt
```

- Enregistrer la sortie des processus et les messages d'erreur dans des fichiers distincts.

```console
[user@host]$ find /etc -name passwd > sorties.txt 2> erreurs.txt
```

- Stocker ensemble la sortie et les erreurs générées.

```console
[user@host]$ find /etc -name passwd &> sorties_erreurs.txt
```

- Ajouter la sortie et les erreurs générées à un fichier existant.

```console
[user@host]$ find /etc -name passwd &>>  sorties_erreurs.txt
```

- Ignorer et éliminer les messages d'erreur.

```console
[user@host]$ find /etc -name passwd > sorties.txt 2> /dev/null
```

### Construction de pipelines

Un pipeline est une séquence d'une ou plusieurs commandes séparées par le caractère pipe (`|`). Un pipe connecte la sortie standard de la première commande à l'entrée standard de la commande suivante.

![HTTP](../../images/5-8.png?height=300&classes=border,shadow,inline)

Les pipelines permettent la manipulation et le formatage de la sortie d'un processus par d'autres processus avant sa transmission vers le terminal. Une image mentale utile consiste à imaginer que les données « circulent » dans le pipeline d'un processus à un autre, et sont légèrement modifiées par chaque commande du pipeline par lequel elles transitent.

> **Note** : Les pipelines et la redirection des E/S manipulent la sortie standard et l'entrée standard. La redirection envoie la sortie standard vers des fichiers ou obtient l'entrée standard depuis des fichiers. Les pipes envoient la sortie standard depuis un processus vers l'entrée standard d'un autre processus.

#### Exemples de pipelines

Dans cet exemple, la sortie de la commande `ls` est affichée sur un écran du terminal à la fois en utilisant `cat`.

```console
[user@host]$ ls -l /usr/bin | cat
```

La sortie de la commande `ls` est transmise par le pipe à `wc -l`, qui compte le nombre de lignes reçues de `ls` et l'imprime sur le terminal.

```console
[user@host]$ ls | wc -l
```

Dans ce pipeline, `head` sort les 10 premières lignes de `ls -t`, avec le résultat final redirigé vers un fichier.

```console
[user@host]$ ls -t | head -n 10 > 10_dernieres-lignes.txt
```

#### Pipelines, redirection et commande `tee`

Lorsque la redirection est associée à un pipeline, le shell configure d'abord l'intégralité du pipeline, puis redirige l'entrée/la sortie. Cela signifie que si une redirection de sortie est utilisée au milieu d'un pipeline, la sortie accède au fichier et non à la commande suivante du pipeline.

Dans cet exemple, la sortie de la commande `ls` accède au fichier et `cat` n'affiche rien sur le terminal.

```console
[user@host]$ ls -l > sorties.txt | cat
```

La commande `tee` surmonte cette limitation. Dans un pipeline, `tee` copie son entrée standard vers sa sortie standard et redirige également sa sortie standard vers les fichiers nommés comme arguments de la commande. En imaginant que les données sont comme de l'eau circulant à travers un pipeline, `tee` peut être visualisé comme un raccord en « T » dans le tuyau qui dirige la sortie dans deux directions.

![HTTP](../../images/5-9.png?height=300&classes=border,shadow,inline)

#### Exemples de pipeline utilisant la commande tee

Cet exemple redirige la sortie de la commande `ls` vers le fichier et la transmet à `cat` pour l'afficher sur un écran du terminal à la fois.

```console
[user@host]$ ls -l | tee sorties.txt | cat
```

Si `tee` est utilisé à la fin d'un pipeline, la sortie finale d'une commande peut être enregistrée et envoyée vers le terminal en même temps.

```console
[user@host]$ ls -l | head -n 10 | tee 10_dernieres-lignes.txt
```
