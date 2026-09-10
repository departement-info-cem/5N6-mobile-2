# ⚙️ 5.2A – firebase_setup

## Objectif 🎯

Configurer une application Flutter pour fonctionner avec Firebase (authentification, base de données, stockage, notifications).

## À faire 🛠️

### Étape 1 - Créer un compte Firebase

- Allez sur https://firebase.google.com/
- Créez un compte si nécessaire
- Connectez-vous

### Étape 2 - Créer un projet Firebase

- Allez à la console Firebase: https://console.firebase.google.com/
- Cliquez sur **Créer un projet**
- Nommez votre projet
- Vous n'avez **pas besoin** de Gemini, ni de Google Analytics
- Cliquez sur **Créer le projet**

### Étape 3 - Préparer votre projet Flutter

- Clonez le repo du projet (votre TP par exemple) sur votre machine locale

### Étape 4 - Mettre à jour Flutter

Dans un terminal, depuis votre dossier du projet:

```bash
flutter upgrade
```

Ceci assure que vous avez une version à jour de Flutter.

### Étape 5 - Vérifier le fonctionnement initial

- Lancez votre application de base:
  ```bash
  flutter run
  ```
- Vérifiez que tout fonctionne avant de commencer la configuration Firebase.


### Étape 6 - Installer firebase-cli

**À la maison seulement** (déjà installé au labo). Suivez les instructions **[ici](https://firebase.google.com/docs/cli)**.

### Étape 7 - Se connecter à Firebase via CLI

Testez en exécutant dans le terminal:

```bash
firebase login
```

### Étape 8 - Installer flutterfire-cli

**À la maison seulement** (déjà installé au labo). Dans le terminal:

```bash
dart pub global activate flutterfire_cli
```

### Étape 9 - Configurer le projet avec FlutterFire

Depuis le dossier de votre projet Flutter:

```bash
flutter pub add firebase_core
flutterfire configure
```

Vous serez invité à choisir le projet Firebase correspondant à votre projet.

Regardez les fichiers modifiés dans votre IDE.

**COMMIT et PUSH**.

### Étape 10 - Ajouter les composants Firebase

Depuis le dossier du projet Flutter, tapez les commandes suivantes:

```bash
flutter pub add cloud_firestore
flutter pub add firebase_auth
flutter pub add google_sign_in
flutter pub add firebase_storage
flutter pub add firebase_messaging
flutterfire configure
```

**COMMIT et PUSH**.

### Étape 11 - Initialiser Firebase dans le code

Dans votre fichier `main.dart`, remplacez la fonction `main()` avec:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoogleSignIn.instance.initialize();
  runApp(MyApp());
}
```

### Étape 12 - Corriger minSdk si nécessaire

Si vous voyez une erreur concernant `minSdk`, ouvrez le fichier `android/app/build.gradle` et augmentez la valeur `minSdkVersion` à 21 ou plus.

### Étape 13 - Lancer l'application

Lancez votre application depuis votre IDE:

```bash
flutter run
```

**COMMIT et PUSH**.

Votre application est maintenant configurée pour utiliser Firebase! Vous pouvez procéder avec les étapes d'authentification et de base de données dans les laboratoires suivants.

### Étape 14 - Tester l'accès à Firestore (optionnel)

Pour vérifier que tout fonctionne correctement:

- Allez à la console Firebase
- Créez une base de données Firestore en mode test
- Dans votre `main.dart`, remplacez la fonction `_incrementCounter()` avec:

```dart
void _incrementCounter() {
  final db = FirebaseFirestore.instance;
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };
  db.collection("users").add(user).then((DocumentReference doc) =>
    print('DocumentSnapshot added with ID: ${doc.id}')
  );
  setState(() {
    _counter++;
  });
}
```

- Lancez l'application
- Appuyez sur le bouton **+**
- Allez à la console Firebase dans le volet **Firestore**
- Vous devriez voir les données apparaître!

**COMMIT et PUSH**.
