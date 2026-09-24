# Émulateurs Firebase 🔥

Les émulateurs Firebase permettent de simuler localement un environnement de développement Firebase, sans dépendre de celui sur la console web de firebase. C'est généralement une meilleure pratique de développer avec des données locales plutôt que de risquer de perturber les données de production.

La plupart des services offerts par Firebase sont émulables. Les voicis : 

- App Hosting
- Authentication ✅
- Functions ✅
- Firestore ✅
- Database 
- Hosting
- Pub/Sub
- Storage Emulator ✅
- Eventarc Emulator
- Data Connect Emulator
- Cloud Tasks Emulator

Nous allons utiliser ceux qui ont un ✅. À noter qu'il n'existe pas d'émulateur pour [FCM](https://firebase.google.com/docs/cloud-messaging?hl=fr), qui gère les notifications, mais nous allons tout de même nous en sortir en temps et lieux.

## Mise en place générale 🔍

À la racine du projet, créons un fichier `firebase.json` qui décris les différents émulateurs que nous allons utiliser. Chaque ligne sous `emulators` représente un émulateur à utiliser. Par contre, nous vous recommandons d'ajouter les émulateurs un à la fois, lorsque vous en aurez besoin.

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

Par contre l'émulateur `"ui": { "enabled": true, "port": 4000 }` devrait toujours être présent. Ce sera l'interface web qui nous permettra de consulter ce qu'il y a dans nos services.

## Les émulateurs 🤖

### Auth Emulator 🪪

Assurez vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"auth": { "port": 9099 },` pour activer l'émulateur.

C'est tout! Vous pouvez lancer les émulateurs et ça devrait fonctionner.

### Firestore Emulator 🏪

Assurez vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"firestore": { "port": 8080 },` pour activer l'émulateur.

C'est tout! Vous pouvez lancer les émulateurs et ça devrait fonctionner.

### Storage Emulator 📁

Assurez vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"storage": { "port": 9199 },` pour activer l'émulateur.

🚧 SECTION EN CONSTRUCTION 🚧

### Function Emulator 🍆

Assurez vous que cette ligne soit présente sous `emulators` dans `firebase.json` : `"functions": { "port": 5001 },,` pour activer l'émulateur.

🚧 SECTION EN CONSTRUCTION 🚧

Par contre nous pouvons tout de suite vous dire que ce n'est pas aussi simple que pour les les autres émulateurs.

## HTTP~~S~~ 🔓

Les émulateurs fonctionnent via HTTP. Or, Android n'accepte plus par défaut ce protocol puisqu'il n'est pas sécuritaire. Nous allons le réactiver **seulement** lorsque nous sommes en développement.

Dans `android/app/src/debug/AndroidManifest.xml`, ajouter `<application android:usesCleartextTraffic="true" />` sous la balise `manifest`.

Notez bien que nous avons fait la modification dans le dossier `android/app/src/debug` et non dans le dossier `android/app/src/main`.

## Lancer les émulateurs ▶️

Pour démarrer l'ensemble des émulateurs configurés, lancer la commande :

```bash
firebase emulators:start
```

Le terminal liste l'ensemble des liens disponibles pour accéder à vos émulateurs.

## Utiliser les émulateurs sur votre projet

On dit à Flutter si on souhaite utiliser les émulateurs lors de l'éxécution de la fonction d'entrée `main`.

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Si cette ligne n'est pas dans le projet, l'ajouter. Elle doit toujours être la première à être exécutée
  // Les émulateurs sont initialisés ici
  // Exemple pour l'émulateur Auth :
  await FirebaseAuth.instance.useAuthEmulator('10.0.2.2', 9099); // Attention à bien utiliser le même numéro de port qui est dans firebase.json 
  runApp(MyApp());
}
```

Si nous voulons que les émulateurs soient utilisés uniquement en développement, donc pas en production, est-ce qu'on doit changer le code à chaque fois? 🤔

Non! Nous allons utiliser des configurations Flutter, telles que décrites [ici](./configuration.md). Après avoir suivi la recette, et l'avoir adaptée à vos besoins, votre `main` devrait ressembler à ça, pour `FirebaseAuth` :

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppConfig config = ConfigFactory.create();
  if (config.isDev) {
    await FirebaseAuth.instance.useAuthEmulator(config.emulatorUrl, 9099);
  }
  runApp(const MainApp());
}
```
