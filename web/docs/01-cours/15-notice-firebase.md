# Configuration de Firebase dans FLutter

Ceci est l'explication détaillée de la configuration à faire pour
obtenir une application Flutter fonctionnant avec Firebase.

## Firebase, création de compte

- dans un navigateur ouvrir https://firebase.google.com/
- si nécessaire, se créer un compte
- se connecter

## Firebase, création du projet

- dans un navigateur, entrez dans la console de firebase
- créer un nouveau projet Firebase, vous n'avez pas besoin de Gemini, ni de Google Analytics

## Création du projet de code et repo

- Utiliser l'invitation ClassRoom pour créer votre repo du TP3
- cloner ce nouveau repo sur la machine local (GitKraken ou autre)
- créer un projet flutter de base dans le dossier local du repo
- dans un terminal (Powershell ou le terminal d'IntelliJ / AndroidStudio)
- taper : `flutter upgrade`
- il s'agit de vous assurer d'avoir une version à jour de flutter pour le projet
- lancer votre application de base pour vérifier le fonctionnement
- FAIRE UN COMMIT
- FAIRE UN PUSH

Faire des commits régulièrement va permettre de voir ce qui change dans le projet
pour chaque étape et également de revenir à un point fonctionnel si une étape échoue.

## Installation de firebase-cli (déjà installé par le script, seulement à la maison)

- suivre les instructions ici : https://firebase.google.com/docs/cli

## Connexion à Firebase via le CLI

- tester en exécutant dans le terminal : `firebase login`

## Installation de flutterfire-cli (déjà installé par le script, seulement à la maison)

- dans un terminal (celui de IntellijIdea ou AndroidStudio par exemple)
- taper : `dart pub global activate flutterfire_cli`

## Configuration du projet avec flutterfire

- dans un terminal (celui de IntellijIdea ou AndroidStudio par exemple)
- se placer dans le dossier du projet flutter
- taper : `flutter pub add firebase_core`
- cela ajoute la base de la librairie
- taper : `flutterfire configure`
- vous allez être invité à choisir le projet firebase correspondant au projet
- FAIRE UN COMMIT et au passage regarder quels fichiers ont été configurés
- FAIRE UN PUSH

Ces étapes permettent de connecter l'application que tu développes (localement) avec le projet Firebase (dans le nuage).

## Ajout des composants de firebase via les librairies

L'ensemble de la documentation sur les différentes composantes se trouve ici:
https://firebase.google.com/docs/flutter/setup?platform=web#available-plugins

Vous allez maintenant ajouter plusieurs composantes de Firebase:

- dans un terminal
- depuis le dossier du projet flutter
- taper : `flutter pub add cloud_firestore`, il s'agit de la "base de données" de firebase
- taper : `flutter pub add firebase_auth` pour gérer l'authentification
- taper : `flutter pub add firebase_storage` pour stocker des fichiers, pour nous les images
- taper : `flutter pub add firebase_messaging` pour recevoir des notifications
- FINALEMENT, taper `flutterfire configure` pour s'assurer que tout est configuré correctement.
- FAIRE UN COMMIT, encore une fois pour se donner un point de retour et voir ce qui s'est passé.
- FAIRE UN PUSH

## Initialisation dans le projet test dans le code

- dans le fichier main.dart du projet ou le fichier où vous avez la méthode **main**
- on remplace l'ensemble de la fonction "void main() ... \{ ... \}" par

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

- si vous avez un message d'erreur sur minSdk, il faut aller changer la valeur dans le fichier android>app>build.gradle
- lancer l'application depuis votre IDE
- FAIRE UN COMMIT
- FAIRE UN PUSH

Ton application est configurée pour Firebase avec succès.

## Test d'écriture dans firestore

:::info
Nous allons revenir sur la base de donnée firestore dans un prochain cours. Pour le moment, le but est simplement de s'assurer que tout fonctionne.
:::

- dans un navigateur allez dans la console firebase
- créer une base de données firestore pour le projet
- choisissez le mode test
- dans le fichier main.dart, remplacer la fonction \_incrementCounter() avec

```dart
void _incrementCounter() {
    final db = FirebaseFirestore.instance;
    // Create a new user with a first and last name
    final user = <String, dynamic>{
      "first": "Ada",
      "last": "Lovelace",
      "born": 1815
    };
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
    setState(() {
      _counter++;
    });
  }
```

- dans un navigateur
- ouvrir la console de firebase sur le projet et dans le volet Firestore
- lancer l'application sur un appareil avec une connexion Internet fonctionnelle
- en appuyant sur le bouton +, on demande l'ajout d'un objet dans firestore
- dans le navigateur sur le projet dans le volet firestore, vous devriez voir les données appraitre
- FAIRE UN COMMIT
- FAIRE UN PUSH
