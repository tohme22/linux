---
title: "Laboratoire 11"
description: "linux"
draft: false
weight: 2
---
## Laboratoire 11 - Archivage et synchronisation de fichiers

Connectez-vous à la VM.

#### Exercice 1 - Gestion des archives tar compressées (tar)

1. Basculez vers l'utilisateur **root** dans un shell de connexion, en utilisant le mot de passe **420!lnp4ss**.

2. Créez le repéretoire `/sauvegarde`.

3. Créez une **archive comprésée** du répertoire `/etc` en utilisant la compression **gzip** dans le repéretoire `/sauvegarde`.

4. Listez le contenu de l'archive créée, à l'étape précédente, pour vérifier qu'elle contient les fichiers du répertoire `/etc`.

5. Extrayez cette archive dans le répertoire `/sauvegarde`.

6. Listez le contenu du répertoire `/sauvegarde` pour vérifier que l'archive a été bien extraite.

7. Basculez vers votre compte d'utilisateur **e1234567**.

8. En utilisant une seule commande, créez trois fichiers `fich1.txt`, `fich2.txt` et `fich3.txt`.

9. Créez une archive comprésée `remise.tar.bz2` de ces trois fichiers dans votre repéretoire personel.

10. Listez le contenu de l'archive `remise.tar.bz2` pour vérifier qu'elle contient les fichiers `fich1.txt`, `fich2.txt` et `fich3.txt`.

11. Supprimez, de votre repértoire personnel, les trois fichiers `fich1.txt`, `fich2.txt` et `fich3.txt`.

12. Vérifiez que les trois fichiers sont bien supprimés.

13. Extrayez l'archive `remise.tar.bz2` dans votre repéretoire personel.

14. Vérifiez que l'archive `remise.tar.bz2` a été bien extraite.

---

#### Exercice 2 - Synchronisation de fichiers sécurisée (rsync)

1. Basculez vers l'utilisateur **root** dans un shell de connexion, en utilisant le mot de passe **420!lnp4ss**.

2. Synchronisez le contenu du répertoire `/etc` avec le répertoire `/tmp`.

3. Vérifiez que le répertoire `/etc` a été bien synchronisé dans le répertoire `/tmp`.

4. En utilisant une seule commande, créez cinq fichiers `config1.cfg`, `config2.cfg`, `config3.cfg`, `config4.cfg` et `config5.cfg`, dans le répertoire `/etc`.

5. Resynchronisez encore une fois le contenu du répertoire `/etc` avec le répertoire `/tmp`. Est-ce que c'est tout le contenu du répertoire `/etc` qui a été synchronisé ou seulement les nouveaux fichiers?

6. Synchronisez le répertoire `/var/log` de la machine distante **atohme_ZG4_alma** avec le répertoire `/tmp` sur votre la machine locale.

7. Vérifiez que le répertoire `/var/log`, de la machine distante, a été bien synchronisé dans le répertoire `/tmp`.