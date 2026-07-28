# 📋 2.1B – drawer_liste_nav

## Objectif 🎯

Pratiquer la navigation en transmettant des données personnalisées et intégrer un menu latéral de façon autonome.

## Étape 1 : Liste et navigation

Faites un premier écran nommé **Liste** qui contient une liste de 5 objets de type Truc contenant un **nom** et un **id**.

Faites que l'appui sur un des éléments déclenche la navigation vers un deuxième écran nommé **Détail** qui affiche le truc.

## Étape 2 : Tiroir de navigation

Créez un troisième écran nommé **Connexion** qui affiche 

Ajoutez un tiroir de navigation (Drawer) à l'écran **Liste**, et **Détail** en se basant sur le [cookbook officiel](https://docs.flutter.dev/cookbook/design/drawer).

Le tiroir de navigation doit posséder :

- Un `DrawerHeader` qui affiche votre nom complet.
- Une option nommée "Accueil 🏠" pour naviguer vers l'écran **Liste**.
- Une option nommée "Déconnexion 🙋" pour naviguer vers l'écran **Connexion**, en utilisant [`popUntil`](https://api.flutter.dev/flutter/widgets/Navigator/popUntil.html).

:::tip Conseil
Puisque le tiroir de navigation est exactement le même sur l'écran  **Liste** et **Détail**, il serait judicieux de mettre son code dans un fichier, et d'y faire référence dans les 2 écrans qui l'utilisent.
:::