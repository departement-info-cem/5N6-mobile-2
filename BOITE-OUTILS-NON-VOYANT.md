# Boîte à outils pour non-voyants

## Visual Studio Code

### Raccourcis Généraux

#### Accessibilité

- Alt + F1 : Obtenir l'aide d'accessibilité pour la fenêtre ouverte. Ça vaut la peine de l'essayer souvent, quitte à ce qu'on tombe encore sur le message d'accessibilité de base.
- Shift + Alt + F2 : Obtenir le texte d'une zone actuelle. Beaucoup plus facile consulter du contenu plus "visuel" avec un lecteur d'écran.

#### Éditeur

- Ctrl + M : Activer ou désactiver le "Tab Trapping". Une fois que l'éditeur est dans ce mode, ça devient possible de naviguer d'une section de l'éditeur à l'autre à l'aide de Tab et Ctrl + Tab.
- Shift + Alt + Flèche Ctrl + W sur les IDE de Jetbrains. Permet d'étendre la sélection. Ex : si le curseur est dans un bloc if qui est dans une fonction qui est dans une classe, le premier Shift + Alt + Flèche  sélectionne l'intrieur du if, le 2ième le if au complet, le 3ième le contenu de la fonction, ainsi de suite.
- Shift + Alt + Flèche gauche : Inverse de Shift + Alt + Flèche droite. Permet de réduire la sélection.

#### Navigation

- Ctrl + P : Chercher dans les noms de fichier pour ouvrir un fichier
- Ctrl + 1 ou Ctrl + 2 ou Ctrl + 3, etc pour focuser sur l'éditeur correspondant à l'index d'un onglet ouvert.
- Ctrl + Maj + O : Lister rapidement les symboles dans le fichier ouvert, et y naviguer au besoin
- F8 : Aller au prochain problème trouvé par l'éditeur de code
- Maj + F8 : Aller au précédent problème trouvé par l'éditeur de code
- F12 : Aller à la définition d'un symbole. Ex : lorsque le curseur est sur un appel de méthode, aller à l'endroit où la méthode est définie. Fonctionne aussi avec les variables, les classes, etc.

#### Commandes

- Ctrl + Shift + P : Chercher dans les actions disponibles. Ex pour le cours : Créer un projet, etc.
- Ctrl + . : Liste les suggestions pour modifier du code

### Lancer un projet

Les émulateurs sont à proscrire pour un étudiant non-voyant. Les lecteur d'écrans sont incapables de s'interfacer les émulateur. Il faut toujours utiliser un téléphone physique, avec le lecteur d'écran du téléphone physique.

[TODO Lancer un projet sur un téléphone physisque avec vscode]

### Débogueur

#### Raccourcis

- F9 : Activer le point de déboguage.
- Ctrl + K + I : Lorsque le curseur est sur un variable, en mode debug, permet de consulter la valeur qui est dans la variable.
- Ctrl + Maj + D : Naviguer vers le panneau de déboguage

## Flutter DevTools

Complètement inutile en date de juillet 2026, donc à éviter : Le lecteur d'écran fonctionne minimalement et est insuffisant pour avoir une bonne idée de l'arbre sémantique de Flutter.  

## Interface graphique

- 2 éléments ne doivent jamais être collés. Il doit toujours y avoir un peu d'espace entre eux pour aérer l'interface

## Espacement

Pour aérer une interface, on essaie de faire en sorte que 2 Widgets ne soient jamais collés. Il existe plusieurs méthode pour y arriver :

- Espacement dans les Row et Column : utiliser la propriété mainAxisAlignment et crossAxisAlignment
- En général, utiliser le Widget Padding. On englobe le Widget autour duquel on veut faire de l'espace avec le Widget padding. Ex : 

```dart
return Padding(
    padding: const EdgeInsets.all(8.0), // Donne un padding de 8 tout autour du container
    child: Container(/* Rest du code ici*/)
);
```

### Test


Utiliser des tests pour vérifier le positionnement relatif entre 2 éléments.

Par exemple, pour valider qu'un élément est bel et bien sous un autre :

```dart

```

