# 📋 6.1C – http_listes

## Objectif 🎯

Récupérer et afficher des listes JSON avec DIO et `ListView.builder`.

## À faire 🛠️

Créez un projet Flutter nommé `http_listes`. Son écran doit être séparé verticalement en deux zones de même hauteur, chacune contenant une liste défilable.

1. La première zone appelle `https://fourn6-mobile-prof.onrender.com/exos/long/list` et affiche chaque nombre dans un `ListTile`.
2. La seconde zone appelle `https://fourn6-mobile-prof.onrender.com/exos/truc/list`.
3. Créez la classe Dart nécessaire pour les objets retournés par le second service.
4. Pour chaque objet, affichez ses deux propriétés simples et le nombre d'éléments de sa liste.
5. Utilisez un `ListView.builder` pour les deux affichages et prévoyez un état de chargement ou d'erreur pour chaque appel.

Consultez la recette [DIO 3 - Objet et liste JSON](../../03-recettes/dio-03-liste.md).

