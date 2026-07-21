# Boîte à outils Flutter pour non-voyants

## Lancer un projet

Les émulateurs sont à proscrire pour un étudiant non-voyant. Les lecteurs d'écran sont incapables de s'interfacer correctement avec les émulateurs. Il faut toujours utiliser un téléphone physique, avec le lecteur d'écran du téléphone.

À noter que le logcat n'est plus du tout utile en Flutter. Toutes les informations utiles vont s'afficher dans une console spécifique à Flutter.

- Dans un terminal :
  - Je recommande d'explorer sommairement ce que la commande `flutter help` fait. Chaque sous-commande (ex : flutter run) possède son propre menu help, qu'on peut accéder avec --help. C'est une habitude à prendre à chaque fois qu'on commence à utiliser un nouvel outil en terminal. Ce sera un mantra à l'université. Voici quand même les principales commandes :
  - `flutter doctor` : S'assurer que l'environnement est correct
  - `flutter devices` : Lister les périphériques disponibles pour exécuter Flutter.
  - `flutter run --device <DEVICE_ID>` : Exécuter l'application dans le dossier courant, en spécifiant sur quel appareil l'exécuter. Le DEVICE_ID est trouvable en exécutant `flutter devices` La commande est bloquante et affiche les logs de l'application.

### Démarrage minimal recommandé (téléphone physique)

1. Brancher le téléphone Android en USB.
2. Vérifier qu'il est visible avec `flutter devices`.
3. Lancer l'app avec `flutter run --device <DEVICE_ID>`.
4. Pendant l'exécution :
   - Touche `r` : hot reload
   - Touche `R` : hot restart
   - Touche `q` : quitter l'exécution
5. Corriger les erreurs affichées directement dans la console Flutter.

### Commandes essentielles à mémoriser

- `flutter doctor` : Vérifier l'état de l'environnement.
- `flutter devices` : Lister les appareils détectés.
- `flutter run --device <DEVICE_ID>` : Lancer sur un appareil précis.
- `dart analyze` : Détecter rapidement les problèmes de code.
- `flutter test` : Exécuter les tests.

### Dépannage appareil physique

- Le téléphone n'apparaît pas dans `flutter devices` :
  - Vérifier que le débogage USB est activé.
  - Accepter la fenêtre "Autoriser le débogage USB" sur le téléphone.
  - Changer de câble USB (plusieurs câbles ne permettent que la recharge).
  - Changer de port USB.
  - Relancer avec `flutter devices`.
- Flutter signale que l'appareil est non autorisé :
  - Rebrancher le téléphone.
  - Réinitialiser l'autorisation USB sur le téléphone et réaccepter.

## Débogueur

### Raccourcis

- F9 : Activer le point de déboguage.
- Ctrl + K + I : Lorsque le curseur est sur un variable, en mode debug, permet de consulter la valeur qui est dans la variable.
- Ctrl + Maj + D : Naviguer vers le panneau de déboguage

## Flutter DevTools

Complètement inutile en date de juillet 2026, donc à éviter : Le lecteur d'écran fonctionne minimalement et est insuffisant pour avoir une bonne idée de l'arbre sémantique de Flutter.  

## Accessibilité Flutter à ne pas oublier

- Toujours fournir un libellé textuel clair pour les icônes interactives.
- Ne jamais transmettre une information uniquement par la couleur.
- Garder un ordre de focus logique (haut vers bas, gauche vers droite dans la structure).
- Vérifier que les widgets importants sont annoncés correctement par le lecteur d'écran.
- Utiliser `Semantics` quand un widget visuel n'est pas assez explicite.

Exemple minimal :

```dart
Semantics(
  label: 'Ouvrir les paramètres',
  button: true,
  child: IconButton(
    onPressed: onOpenSettings,
    icon: const Icon(Icons.settings),
  ),
)
```

## Instructions Interface graphique

- 2 éléments ne doivent jamais être collés. Il doit toujours y avoir un peu d'espace entre eux pour aérer l'interface.

## Espacement

Pour aérer une interface, on essaie de faire en sorte que 2 widgets ne soient jamais collés. Il existe plusieurs méthodes pour y arriver :

- Espacement dans les Row et Column : utiliser la propriété mainAxisAlignment et crossAxisAlignment.
- Entre 2 éléments précis : insérer un SizedBox (ex : `SizedBox(height: 8)`).
- En général, utiliser le widget Padding. On englobe le widget autour duquel on veut faire de l'espace. Ex : 

```dart
return Padding(
  padding: const EdgeInsets.all(8.0), // Donne un padding de 8 tout autour du container
  child: Container(/* Reste du code ici */)
);
```

### Test


Utiliser des tests pour vérifier le positionnement relatif entre 2 éléments.

Par exemple, pour valider qu'un élément est bel et bien sous un autre :

```dart
testWidgets('Le bouton Enregistrer est sous le titre', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: MonEcran()));

  final titre = find.text('Profil');
  final bouton = find.widgetWithText(ElevatedButton, 'Enregistrer');

  final yTitre = tester.getTopLeft(titre).dy;
  final yBouton = tester.getTopLeft(bouton).dy;

  expect(yBouton, greaterThan(yTitre));
});

```

