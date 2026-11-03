# Émulateurs Firebase 🔥

Les émulateurs Firebase permettent de simuler localement un environnement de développement Firebase, sans dépendre de celui sur la console web de Firebase. C'est généralement une meilleure pratique de développer avec des données locales plutôt que de risquer de perturber les données de production.

La plupart des services offerts par Firebase sont émulables. Les voici :

- App Hosting
- Authentication ✅
- Functions ✅
- Firestore ✅
- Realtime Database
- Hosting
- Pub/Sub
- Storage ✅
- Eventarc
- Data Connect
- Cloud Tasks

Nous allons utiliser ceux qui sont marqués d'un ✅ : Authentication, Functions, Firestore et Storage. À noter qu'il n'existe pas d'émulateur pour [FCM](https://firebase.google.com/docs/cloud-messaging?hl=fr), qui gère les notifications, mais nous allons tout de même nous en sortir en temps et lieu.

## Mise en place générale 🔍

À la racine du projet, créez un fichier `firebase.json` (ou complétez celui qui existe déjà, si `firebase init` ou `flutterfire configure` l'a créé) qui décrit les différents émulateurs que nous allons utiliser. Chaque ligne sous `emulators` représente un émulateur à utiliser. Par contre, nous vous recommandons d'ajouter les émulateurs un à la fois, lorsque vous en aurez besoin.

```json
{
  "emulators": {
    "auth": { "port": 9099 },
    "firestore": { "port": 8080 },
    "storage": { "port": 9199 },
    "functions": { "port": 5001 },
    "ui": { "enabled": true, "port": 4000 }
  }
}
```

Par contre l'émulateur `"ui": { "enabled": true, "port": 4000 }` devrait toujours être présent. Ce sera l'interface web, à l'adresse `http://localhost:4000`, qui nous permettra de consulter ce qu'il y a dans nos services.

## HTTP~~S~~ 🔓

Les émulateurs fonctionnent via HTTP. Or, Android n'accepte plus par défaut ce protocole puisqu'il n'est pas sécuritaire. Nous allons le réactiver **seulement** lorsque nous sommes en développement.

Dans `android/app/src/debug/AndroidManifest.xml`, ajoutez `<application android:usesCleartextTraffic="true" />` sous la balise `manifest`.

Notez bien que nous avons fait la modification dans le dossier `android/app/src/debug` et non dans le dossier `android/app/src/main`.

## Firebase kaputt 🧯

Il arrive que la commande `flutterfire configure` soit incapable de lister vos projets : la liste est vide, ou la commande échoue avec une erreur d'authentification. Ça peut durer plusieurs heures après la création du projet sur la console.

Les émulateurs, eux, n'ont pas besoin de trouver votre projet. En attendant que `flutterfire configure` fonctionne, nous allons donc faire croire à Flutter qu'il est bien configuré, et travailler exclusivement avec les émulateurs. Si `flutterfire configure` fonctionne, passez directement à la section suivante.

Avant d'aller plus loin, assurez-vous d'avoir installé au moins [`firebase_core`](https://pub.dev/packages/firebase_core), et les packages de Firebase qui vous intéressent. Ex : [`cloud_firestore`](https://pub.dev/packages/cloud_firestore), [`firebase_auth`](https://pub.dev/packages/firebase_auth), etc.

### `lib/firebase_options.dart`

Normalement ce fichier est généré par `flutterfire configure`. On peut reproduire sa structure avec des informations bidons, en utilisant l'**identifiant de votre vrai projet**, tel qu'il apparaît dans l'adresse de la console Firebase : `https://console.firebase.google.com/project/id-de-votre-projet/overview`. Attention : c'est l'identifiant (ex. : `notes-jean-tremblay-1a2b3`), et non le nom d'affichage du projet.

```dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    final String platform = kIsWeb
        ? 'web'
        : switch (defaultTargetPlatform) {
            TargetPlatform.iOS || TargetPlatform.macOS => 'ios',
            _ => 'android',
          };
    return FirebaseOptions(
      // Fausse clé, mais au bon format (39 caractères, commence par « A ») :
      // certains SDK natifs refusent une clé mal formée.
      apiKey: 'ADemoProjectApiKey000000000000000000000',
      appId: '1:1234567890:$platform:0000000000000000',
      messagingSenderId: '1234567890',
      projectId: 'id-de-votre-projet', // L'identifiant de votre projet sur la console
      storageBucket: 'id-de-votre-projet.appspot.com', // L'identifiant suivi de « .appspot.com »
    );
  }
}
```

Créez aussi le fichier `.firebaserc` avec ce même identifiant, comme décrit à la section suivante, « Lancer les émulateurs ». Initialisez ensuite Firebase et activez les émulateurs dans `main`, comme décrit [plus bas](#utiliser-les-émulateurs-sur-votre-projet).

:::caution
Les émulateurs sont **obligatoires** avec cette configuration bidon. Sans eux, votre application tentera de joindre les vrais serveurs de Google avec une fausse clé, et toutes les requêtes échoueront. Pour la même raison, les notifications (FCM), Google Sign-In et l'IA de Firebase ne fonctionneront qu'avec la vraie configuration.
:::

:::tip Pas encore de projet?
Si vous n'avez pas encore créé de projet sur la console, utilisez un identifiant qui commence par `demo-`, par exemple `demo-notes`. Avec ce préfixe, les émulateurs démarrent sans `firebase login` et ne contactent jamais un vrai projet. Vous devrez par contre changer l'identifiant (dans `firebase_options.dart` et `.firebaserc`) lorsque vous créerez votre vrai projet, et les données de vos émulateurs ne suivront pas.
:::

### Retour à la normale 😮‍💨

Lorsque `flutterfire configure` se décidera à fonctionner, exécutez la commande : elle remplacera `firebase_options.dart` par la vraie configuration. Puisque vous aviez déjà utilisé le bon identifiant, vous n'avez rien d'autre à changer, ni dans `.firebaserc`, ni dans `main`.

## Lancer les émulateurs ▶️

Pour démarrer l'ensemble des émulateurs configurés, lancez la commande :

```bash
firebase emulators:start --project id-de-votre-projet
```

L'identifiant du projet doit être le même que le `projectId` de votre application Flutter, que vous trouverez dans `lib/firebase_options.dart`. Sinon, l'interface web des émulateurs n'affichera pas les données de votre application.

Utilisez l'identifiant de votre vrai projet Firebase : c'est ce qui rend le passage de l'émulateur au projet déployé le plus simple, puisque seule la condition `config.isDev` change (voir plus [bas](#utiliser-les-émulateurs-sur-votre-projet)). Les émulateurs n'ont pas besoin de trouver ce projet pour démarrer : si la CLI ne le trouve pas, elle affiche des avertissements, mais les émulateurs fonctionnent quand même. Si `flutterfire configure` ne trouve pas votre projet, suivez la section [Firebase kaputt 🧯](#firebase-kaputt-).

Pour ne pas avoir à écrire `--project` à chaque fois, indiquez le projet par défaut dans le fichier `.firebaserc`, à la racine du projet (la commande `flutterfire configure` le fait normalement pour vous) :

```json
{
  "projects": {
    "default": "id-de-votre-projet"
  }
}
```

:::tip Projet de démonstration
Pour une démonstration ou un exercice qui ne sera jamais déployé, vous pouvez utiliser un identifiant qui commence par `demo-` (ex. : `demo-notes`). Les émulateurs démarrent alors sans `firebase login` et ne contactent jamais un vrai projet Firebase.
:::

Le terminal liste l'ensemble des liens disponibles pour accéder à vos émulateurs.

### Conserver les données 💾

Par défaut, **toutes les données des émulateurs sont effacées** lorsque vous les arrêtez. Pour les conserver d'une fois à l'autre, démarrez plutôt les émulateurs avec cette commande :

```bash
firebase emulators:start --import=./donnees-emulateurs --export-on-exit
```

Les données sont exportées dans le dossier `donnees-emulateurs` lorsque vous arrêtez les émulateurs avec `Ctrl+C`, puis réimportées au prochain démarrage.

## Utiliser les émulateurs sur votre projet

On dit à Flutter si on souhaite utiliser les émulateurs lors de l'exécution de la fonction d'entrée `main`.

Les détails pour chaque émulateur sont plus [bas](#les-émulateurs-) dans cette page.

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Si cette ligne n'est pas dans le projet, l'ajouter. Elle doit toujours être la première à être exécutée
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Les émulateurs sont initialisés ici
  // Exemple pour l'émulateur Auth :
  await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099); // Attention à bien utiliser le même numéro de port qui est dans firebase.json
  runApp(const MainApp());
}
```

:::caution
Activez les émulateurs **avant** toute autre utilisation du service. Par exemple, Firestore lève une erreur si vous appelez `useFirestoreEmulator` après avoir déjà fait une requête.
:::

Si nous voulons que les émulateurs soient utilisés uniquement en développement, donc pas en production, est-ce qu'on doit changer le code à chaque fois? 🤔

Non! Nous allons utiliser des configurations Flutter, telles que décrites [ici](./configuration.md). Après avoir suivi la recette, ajoutez une valeur `emulatorIp` à votre configuration :

```dart
abstract class AppConfig {
  String get apiUrl;
  bool get isDev;
  String get emulatorIp; // Ajout
}

class AndroidDevConfig implements AppConfig {
  // ...
  @override
  String get emulatorIp => '10.0.2.2'; // L'ordinateur hôte, vu de l'émulateur Android
}
```

Votre `main` devrait ensuite ressembler à ça, pour `FirebaseAuth` :

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final AppConfig config = ConfigFactory.create();
  if (config.isDev) {
    await FirebaseAuth.instance.useAuthEmulator(config.emulatorIp, 9099);
  }
  runApp(const MainApp());
}
```

## Les émulateurs 🤖

### Auth Emulator 🪪

Assurez-vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"auth": { "port": 9099 },` pour activer l'émulateur.

Pour utiliser l'émulateur, incluez cette ligne dans votre `main` :

```dart
await FirebaseAuth.instance.useAuthEmulator(config.emulatorIp, 9099);
```

C'est tout! Vous pouvez lancer les émulateurs et ça devrait fonctionner.

### Firestore Emulator 🏪

Assurez-vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"firestore": { "port": 8080 },` pour activer l'émulateur.

Pour utiliser l'émulateur, incluez cette ligne dans votre `main` :

```dart
FirebaseFirestore.instance.useFirestoreEmulator(config.emulatorIp, 8080);
```

C'est tout! Vous pouvez lancer les émulateurs et ça devrait fonctionner.

### Storage Emulator 📁

Assurez-vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"storage": { "port": 9199 },` pour activer l'émulateur.

Pour utiliser l'émulateur, incluez cette ligne dans votre `main` :

```dart
await FirebaseStorage.instance.useStorageEmulator(config.emulatorIp, 9199);
```

Il faut aussi créer un fichier `storage.rules` à la racine de votre projet qui contient ce contenu :

```text
rules_version = '2';
service firebase.storage {
  match /b/{bucket}/o {
    match /{allPaths=**} {
      allow read, write: if true;
    }
  }
}
```

Nous reviendrons sur les détails du contenu de ce fichier dans un éventuel cours. Avec un projet de démonstration (identifiant qui commence par `demo-`), l'émulateur démarre même sans ce fichier, en acceptant toutes les lectures et écritures. Avec un vrai identifiant de projet, ce fichier est obligatoire.

Pour que l'émulateur sache où chercher les règles, ajoutez cette section à la racine de `firebase.json`, à côté de `emulators` :

```json
"storage": {
  "rules": "storage.rules"
}
```

:::tip
Contrairement à Authentication et Firestore, Storage exige le forfait payant (Blaze) de Firebase. Pour ne pas avoir à payer, vous devrez donc utiliser l'émulateur local.

Pour faire la mise en place en ayant payé, vous pouvez exécuter la commande `flutterfire configure`.

Pour faire la mise en place en utilisant uniquement l'émulateur, utilisez la configuration de la section [Firebase kaputt 🧯](#firebase-kaputt-) : elle contient déjà le `storageBucket` nécessaire.
:::

### Functions Emulator ⚡

C'est mieux d'avoir complété l'[ajout de Cloud Functions à votre projet](./cloud-functions.md#ajouter-cloud-functions-à-votre-projet-) avant de poursuivre ici.

Exécutez la commande `firebase init emulators` et sélectionnez l'option **Functions Emulator**.

Si pour une raison ou une autre ça ne fonctionne pas, ajoutez cette ligne sous `emulators` dans `firebase.json` :

```json
"functions": { "port": 5001 }
```

Pour utiliser l'émulateur, incluez cette ligne dans votre `main` :

```dart
FirebaseFunctions.instance.useFunctionsEmulator(config.emulatorIp, 5001);
```
