# Tape le 🐇

## Objectifs 🎯

- Se familiariser avec les outils de développement
- Se familiariser avec les concepts de Flutter et de Dart
- Produire une première application fonctionnelle
- **PAS BESOIN** de tout comprendre

:::danger
Même si c'est tentant, nous vous recommendons exceptionnellement de ne pas copier-coller le code fournis dans votre projet. C'est mieux de le faire "à bras" 💪.
:::

## Règles du jeu 📐

Vous avez peut-être déjà entendu parler de ["Wack a mole" ou "Tape-Taupe"](https://www.youtube.com/watch?v=TZdPNt1_nbE&t=6s). C'est essentiellement ce que nous tenterons de réaliser aujourd'hui.

Quelques règles : 

- 4 boutons affichent 3x 🐹 et 1x 🐇, placés aléatoirement
- Quand on appuie sur 🐇, un compteur vert "Bonk" est augmenté de 1
- Quand on appuie sur 🐹, un compteur rouge "Zloop" est augmenté de 1
- À chaque fois qu'on appuie sur un bouton, l'emplacement des 3 🐹 et du 🐇 est mélangé parmis les boutons

## Créer le projet

- Dans Visual Studio Code, assurez vous d'avoir sélectionné le profil **Mobile** pour Visual Studio Code dans ![Ctrl+Shift+P](./_tape-le-lapin/profil.png) > Profile > Mobile
- Taper le raccourci `Ctrl+Shift+P`, taper **Flutter** et sélectionner **Flutter : New Project**.
- Sélectionner **Application**.
- Dans l'explorateur, sélectionner le dossier où vous stockez vous exercices.
- Tapez **tape_le_lapin** comme nom du projet.
- Cochez seulement **android**.
- Une nouvelle fenêtre va s'ouvrir. Vous pouvez resélectionner le profil **Mobile** au besoin.
- La création des fichiers et dossiers de départ peut prendre quelques secondes.
- Lancez le projet pour vous assurez que tout fonctionne.
- Commit + push

:::tip
En Flutter, tous les noms de dossier sont en [snake_case 🐍](https://developer.mozilla.org/fr/docs/Glossary/Snake_case).
:::

:::danger Attention!
Flutter est **très** capricieux sur les chemins où sont les projets. Il n'accepte pas d'avoir des caractères spéciaux comme `é` ou `a`, et pas d'espace.

- **Exemple invalide :** `C:\Users\123456\Desktop\Jean-Mathéo Premier\tape_le_lapin`
- **Exemple valide   :** `C:\Users\123456\Desktop\Jean-Matheo_Premier\tape_le_lapin`
:::

## L'interface graphique

Nous allons placer les éléments graphiques avant de leur donner un comportement.

### Préparation

Le fichier `main.dart` qui est dans `lib/` est celui que nous allons modifier. Beaucoup de code a été généré, mais nous allons complètement l'enlever pour le moment. Nous vous recommendons tout de même d'y jeter un coup d'oeil à un autre moment.

Tout ce que nous voulons garder est cette fonction d'entrée `main`, et la classe `MyApp`. On peut supprimer le reste qui est en dessous. Vous pouvez aussi enlever tous les commentaires, et retirer `title: 'Flutter Demo Home Page'` à la ligne TODO. 

Voici ce qui devrait vous rester :

```dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(),
    );
  }
}
```

À ce point, `MyHomePage` devrait être souligné en rouge. C'est normal puisque nous venons d'enlever la classe à laquelle il faisait référence. Nous allons rajouter la classe manquante. 

Créez un nouveau dossier nommé `pages` dans le dossier lib. Dans ce dossier, créez un fichier nommé `lapin.dart`.

Dans le fichier créé, commencez à taper **stfu**, puis ouvrez l'intellisense en appuyant sur **Ctrl+Espace**. Vous devriez pouvoir sélectionner une entrée nommée **Flutter Stateful Widget**. Nommez votre nouveau Widget `MyHomePage`.

![Raccourci template pour Statefull Widget](./_tape-le-lapin/stfu.png)

On remplace `const Placeholder()` par Scaffold comme suit : 

```dart
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: const Center(child: Text('Tape le 🐇')));
  }
}
```

<Row>
<Column vCenter={true}>
De retour dans `main.dart`, positionnez vous sur `MyHomePage`, qui devrait être encore rouge. Appuyez sur **Ctrl+.** (point). Vous aurez l'option d'importer le Widget que nous venons de créer.
</Column>
<Column>![Menu pour importer](./_tape-le-lapin/import.png)</Column>
</Row>

Relancez l'application. Vous devriez maintenant voir **"Tape le lapin"** centré.

Si tout fonctionne comme prévu, COMMIT + PUSH.

### Titre

Le titre est bien, mais rendons le un peu plus gros :

```dart
Text('Tape le 🐇')
```

devient 

```dart
Text('Tape le 🐇', style: TextStyle(fontSize: 40))
```

### Découpage

Pour arriver à placer les prochains éléments, il va falloir séparer l'interface en 3 sections empilées les unes sur les autres :

- Titre (Déjà fait)
- Résultats (nombre de Bonk et de Zloop)
- Boutons pour jouer

<Row>
<Column vCenter={true}>
Nous allons enrober le Widget **Text** par un autre Widget **Column**.

Positionnez votre curseur sur le Widget **Text**, et appuyez sur **Ctrl+.** (point).

Cela fera apparaître une menu contextuel. Sélectionnez l'option pour enrober avec une **Column**.
</Column>
<Column>
![Menu Wrap with, option Column sélectionné](./_tape-le-lapin/wrap.png)
</Column>
</Row>

On se retrouve avec le résultat suivant :

```dart
Center(
  // highlight-start
  child: Column(
    children: [
        Text('Tape le 🐇', style: TextStyle(fontSize: 40))
      ],
  ),
  // highlight-end
),
```

Le Widget **Text** est maintenant le premier élément dans une liste de Widgets qui va du haut vers le bas.

:::tip child 👶 vs children 👶👶👶
Vous remarquerez que la plupart des Widgets ont un attribut :

- **child** : qui accepte un seul Widget enfant, ou
- **children** : qui accepte un tableau d'enfants  
:::

### Bonk et Zloop

Maintenant les résultats pour compter combien de fois nous avons réussi à taper le 🐇 (Bonk), et combien de fois on s'est trompé en appuyant sur le 🐹 (Zloop). On veut afficher **Bonk : x** et **Zloop : y** côté à côte, sous le titre créé précédement.

On ajoute donc une **Row** sous le **Text**.

```dart
Column(
  children: [
    Text('Tape le 🐇', style: TextStyle(fontSize: 40)), // <- Ne pas oublier la virgule ici
    // highlight-start
    Row(
      children: [
        Text("Bonk : x"),
        Text("Zloop : y")
      ]
    ),
    // highlight-end
  ],
),
```

Nos Widget sont bien alignés de gauche à droite, mais ils pourraient être mieux positionnés.

```dart
Row(
  // highlight-next-line
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Text("Bonk : x"),
    Text("Zloop : y")
  ],
),
```

Et un peu de style :

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Text(
      "Bonk : x",
      // highlight-next-line
      style: TextStyle(color: Colors.green, fontSize: 30),
    ),
    Text(
      "Zloop : y",
      // highlight-next-line
      style: TextStyle(color: Colors.red, fontSize: 30),
    ),
  ],
),
```

### Boutons

Pour les boutons, nous allons afficher une grille de 2x2 boutons, qui vont tous afficher 🐹 pour le moment.

Pour former la grille, nous allons ajouter une colonne qui contiendra 2 rangées, qui contiendront 2 boutons chacuns.

```dart
Column(
  children: [
    const Text('Tape le 🐇', style: TextStyle(fontSize: 40)),
    const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Bonk : x",
          style: TextStyle(color: Colors.green, fontSize: 30),
        ),
        Text(
          "Zloop : y",
          style: TextStyle(color: Colors.red, fontSize: 30),
        ),
      ],
    ), // <- Ne pas oublier la virgule ici
    // highlight-start
    Column(
      children: [
        Row(children: []),
        Row(children: []),
      ],
    ),
    // highlight-end
  ],
),
```

Ajoutons maintenant les boutons :

```dart
Column(
  children: [
    Row(
      children: [
        // highlight-start
        ElevatedButton(onPressed: null, child: Text("🐹")),
        ElevatedButton(onPressed: null, child: Text("🐹")),
        // highlight-end
      ],
    ),
    Row(
      children: [
        // highlight-start
        ElevatedButton(onPressed: null, child: Text("🐹")),
        ElevatedButton(onPressed: null, child: Text("🐹")),
        // highlight-end
      ],
    ),
  ],
),
```

On verra dans l'étape suivante ce que `onPressed` fait. C'est d'ailleurs parce-que `onPressed` est nul que les boutons semblent grisés.

On peut aussi grossir les en leur assignant une taille un peu plus élevée, tel que vu précédement :

```dart
Text("🐹", style: TextStyle(fontSize: 70))
```

On peut aussi ajouter cet attribut sur les 2 **Row** créés pour aérer les boutons :

```dart
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
```

### Fignoler l'interface

Tout est à peu près beau. Il ne nous reste qu'à aérer les 3 sections qui sont dans la **Column**. On peut ajouter l'attribut `mainAxisAlignment: MainAxisAlignment.spaceEvenly` dans la première **Column** que nous avons créée.

Avant de continuer, validez que votre interface ressemble à ça :

<center>
<Image img={require('./_tape-le-lapin/interface-fini.png')} height="400" />
</center>

## Comportement

Maintenant que nous avons l'interface graphique, nous allons implémenter le comportement.

### Réagir aux clics

### Mélanger