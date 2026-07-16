# Rappel sur les fonctions anonymes (Lambda) 🥸

## Fonctions classique

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

## Passer une fonction en paramètre

Il existe un autre type qui peut être passé en paramètre d'une fonction dans la plupart des languages : **une fonction**.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/fonction_parametre/main.dart"
/>

Ici, on a décidé de rendre la fonction filtrerNotes **générique**, de sorte que celui qui l'appelle peut décider d'une partie du comportement de la fonction. On lui fournit une fonction qu'on a déclaré  auparavant.

Observons un peu plus en détail la syntaxe du nouveau  type de paramètre : 

```dart
bool Function(int) condition
```

- **bool** : type de retour que la fonction doit avoir
- **Function** : il s'agit d'un paramètre de type fonction
- **(int)** : le type des paramètres que la fonction prend. Ici ça prend un seul paramètre de type `int`.
  - Exemple 1 : Si c'était **(String, bool)**, la fonction prendrait un premier paramètre de type `String`, et un deuxième paramètre de type `int`
  - Exemple 2 : Si c'était **(bool Function(int))**, la fonction prendrait un seul paramètre de type Fonction qui retourne un `bool` et prend un seul paramètre de type `int` 🤔🫨🤯😮‍💨.
- **condition** : nom du paramètre

## Fonction anonyme

Parfois, on sait que la fonction qu'on voudra passer en paramètre ne sera utilisée qu'une seule fois, et qu'on pourrait se passer de la déclarer.

C'est ici qu'on voit les fonctions **anonymes** (lambda).

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/lambda_accolade/main.dart"
/>

## Raccourci

:::tip

Si notre fonction anonyme possède une seule instruction, qui retourne le résultat attendu, on peu utiliser cette syntaxe qui est un raccourci :

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/lambda/lambda/main.dart"
/>
:::