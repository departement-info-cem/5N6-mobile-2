# 🐙 6.1E – api_github

## Objectif 🎯

Interroger une API publique, afficher une liste d'objets et ouvrir une URL externe.

## À faire 🛠️

1. Créez un projet Flutter nommé `api_github`.
2. L'écran doit contenir un champ texte pour le nom d'utilisateur GitHub, un bouton et une liste.
3. Au clic, appelez l'URL `https://api.github.com/users/departement-info-cem/repos`, en remplaçant `departement-info-cem` par le nom entré.
4. Convertissez la liste JSON en objets Dart contenant au minimum `name`, `description`, `private` et `html_url`.
5. Affichez chaque dépôt dans un `ListTile` avec son nom, sa description et une indication textuelle de son caractère privé ou public.
6. Ajoutez un bouton accessible qui ouvre `html_url` dans le navigateur.
7. Gérez les états chargement, liste vide et erreur.

Utilisez `url_launcher` pour ouvrir l'URL, puis consultez les recettes [DIO 2 - Appel depuis l'interface](../../03-recettes/dio-02-objet.md) et [DIO 3 - Objet et liste JSON](../../03-recettes/dio-03-liste.md).

