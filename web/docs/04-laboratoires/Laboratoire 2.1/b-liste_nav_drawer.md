# 📋 2.1B – liste_nav_drawer

## Objectif 🎯

Pratiquer la navigation en transmettant des données personnalisées et intégrer un menu latéral de façon autonome.

## À faire 🛠️

### Étape 1 : Liste et navigation

Faites un premier écran nommé **Liste** qui contient une liste de 5 objets de type `Truc` contenant un **nom** (`String`) et un **id** (`int`).

Faites que l'appui sur un des éléments déclenche la navigation vers un deuxième écran nommé **Détail** qui affiche le `Truc`.

:::warning
Si vous voulez utiliser Router pour cet exercice, il faut trouver un moyen de passer l'objet `Truc` en paramètre, et non ses propriétés décomposées ⛔ (ex : `/detail/:id/:nom`) ⛔.

Vous devrez faire un peu de recherche pour trouver une façon propre d'y arriver.
:::

### Étape 2 : Tiroir de navigation

Créez un troisième écran nommé **Connexion** qui affiche "Une page de connexion quelconque".

Ajoutez un tiroir de navigation (Drawer) à l'écran **Liste**, et **Détail** en se basant sur le [cookbook officiel](https://docs.flutter.dev/cookbook/design/drawer).

Le tiroir de navigation doit posséder :

- Un `DrawerHeader` qui affiche votre nom complet.
- Une option nommée "Accueil 🏠" pour naviguer vers l'écran **Liste**.
- Une option nommée "Déconnexion 🙋" pour naviguer vers l'écran **Connexion**, en utilisant [`pushAndRemoveUntil`](https://api.flutter.dev/flutter/widgets/Navigator/pushAndRemoveUntil.html) de sorte que le seul widget qui restera dans la pile sera celui de l'écran **Connexion**.

:::tip Conseil
Puisque le tiroir de navigation est exactement le même sur l'écran  **Liste** et **Détail**, il serait judicieux de mettre son code dans un fichier, et d'y faire référence dans les 2 écrans qui l'utilisent.
:::