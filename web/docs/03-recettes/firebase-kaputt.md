# Firebase kaputt 🧯

Dans certains cas bien particuliers, c'est possible que la commande `flutterfire configure` soit incapable de lister vos projet.

Il faut faire preuve de débrouillardise. Nous allons nous rabattre exclusivement sur les émulateurs, et nous allons faire croire à Flutter qu'il est bien configuré.

Nous allons ajouter ces fichiers dans la structure :

```text
lib/
└── firebase_options.dart
.firebaserc
```

## Dépendance

Avant d'aller plus loin, assurez vous d'avoir installé au moins [`firebase_core`](https://pub.dev/packages/firebase_core), et les packages de firebase qui vous intéresse. Ex : [`cloud_firestore`](https://pub.dev/packages/cloud_firestore), [`firebase_auth`](https://pub.dev/packages/firebase_auth), etc.
## `firebase_options.dart`

Normalement cette configuration est générée par Firebase, lorsqu'on connecte notre projet Flutter au projet Firebase. On peut reproduire la structure qui sera utilisée par le fichier généré avec des informations bidons :

```dart
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    final String platform = kIsWeb
        ? 'web'
        : switch (defaultTargetPlatform) {
            TargetPlatform.iOS || TargetPlatform.macOS => 'ios',
            _ => 'android',
          };
    return FirebaseOptions(
      apiKey: 'demo-api-key',
      appId: '1:1234567890:$platform:0000000000000000',
      messagingSenderId: '1234567890',
      projectId: 'demo-notes', // Idéalement, utilisez le nom que votre projet aura. Doit commencer par une lettre, ne pas avoir de majuscules, et idéalement contenir votre nom complet
    );
  }
}
```

## `.firebaserc`

Le nom doit absolument matcher `projectId` dans `firebase_options.dart`

```json
{
  "projects": {
    "default": "demo-notes"
  }
}
```

## fonction `main`

Si ce n'est pas déjà fait, ajoutez ces lignes au début de votre fonction `main` : 

```dart
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
```

Vous devrez rendre la fonction main asynchrone, si ce n'est pas déjà fait.

## Retour à la normale 😮‍💨

Lorsque `flutterfire configure` se décidera à fonctionner, assurez vous de supprimer les fichiers créés ici. Vous ne devriez pas avoir à toucher à `main`.