# Rappel sur les fonctions anonymes (Lambda) 🥸

Depuis le début de la technique, vous avez, entre autre, appris à définir et à appeler des fonctions.

Les suspects usuels pour les types de retour et de paramètres d'une fonction sont :

- bool
- int
- String
- List
- Objet
- etc.

Voici un exemple classique en Dart, où une fonction filtre quelles notes passent un cours :

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/simple/main.dart"
/>

Il existe un autre type qui peut être passé en paramètre d'une fonction dans la plupart des languages : une fonction.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/fonction_parametre/main.dart"
/>

Ici, on a décidé de rendre la fonction filtrerNotes **générique**, de sorte que celui qui l'appelle peut décider d'une partie du comportement de la fonction. On lui fournit une fonction qu'on a déclaré  auparavant.

Parfois, on sait que la fonction qu'on voudra passer en paramètre ne sera utilisée qu'une seule fois, et qu'on pourrait se passer de la déclarer.

C'est ici qu'on voit les fonctions **anonymes** (lambda).

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/lambda_accolade/main.dart"
/>

:::tip

Si notre fonction anonyme n'une seule expression, on peu utiliser cette synthaxe qui est un raccourci :

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/lambda/main.dart"
/>
:::