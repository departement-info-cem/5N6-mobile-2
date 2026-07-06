# Tape le lapin 🐇

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
- Quand on appuie sur 🐇, un compteur vert "Pafs" est augmenté de 1
- Quand on appuie sur 🐹, un compteur rouge "Flops" est augmenté de 1
- À chaque fois qu'on appuie sur un bouton, l'emplacement des 3 🐹 et du 🐇 est mélangé parmis les boutons

## Créer le projet

- Dans Visual Studio Code, assurez vous d'avoir sélectionné le profil **Mobile** pour Visual Studio Code, dans ![Ctrl+Shift+P](./_tape-le-lapin/profil.png) > Profile > Mobile
- Taper le raccourci `Ctrl+Shift+P`, taper **Flutter** et sélectionner **Flutter : New Project**.
- Sélectionner **Application**.
- Dans l'explorateur, sélectionner le dossier où vous stockez vous exercices.
- Tapez **tape_le_lapin** comme nom du projet.
- Cochez seulement **android**.
- Une nouvelle fenêtre va s'ouvrir. Vous pouvez resélectionner le profil **Mobile** au besoin.
- La création des fichiers et dossiers de départ peut prendre quelques secondes.
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
cd 
Tout ce que nous voulons garder est cette fonction d'entrée `main`, et la classe `MyApp`. On peut supprimer le reste qui est en dessous. Vous pouvez aussi enlever tous les commentaires. Voici ce qui devrait vous rester

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
```

### Pafs et Flops

### Titre

### Boutons

## Comportement

Maintenant que nous avons l'interface graphique, nous allons implémenter le comportement.