# 🔐 5.2A – firebase_auth_setup

## Objectif 🎯

Configurer Firebase Authentication dans votre application Flutter avec support de Google Sign-In et authentification par courriel + mot de passe.

## À faire 🛠️

### Prérequis

Avoir complété la configuration Firebase de base. Assurez-vous d'avoir réinstallé firebase-cli et flutterfire-cli.

### Étape 1 - Installation de la librairie

Si ce n'est pas déjà fait, vérifiez dans pubspec.yaml que `firebase_auth` n'est pas présent.

```bash
flutter pub add firebase_auth
```

Faites un **COMMIT PUSH**.

### Étape 2 - Activation de l'authentification dans Firebase Console

- Allez dans la console Firebase (https://console.firebase.google.com/)
- Sélectionnez votre projet
- Dans le panneau à gauche, cliquez sur **Authentication**
- Cliquez sur **Créer** si nécessaire
- Allez à l'onglet **Sign-in methods** et activez **Google** (confirmez votre courriel si demandé)

### Étape 3 - Code de détection du status de login

Dans le fichier principal de votre application (main.dart), ajoutez le code suivant dans la fonction `initState()`:

```dart
@override
void initState() {
  super.initState();
  FirebaseAuth.instance
    .authStateChanges()
    .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in! ${user.email}');
      }
    }
  );
  // ... reste de votre initState
}
```

Relancez l'application. Vous devriez voir "User is currently signed out!" dans la console.

Faites un **COMMIT PUSH**.

### Étape 4 - Ajouter google_sign_in

- Allez à https://pub.dev/packages/google_sign_in
- Copiez la dépendance et ajoutez-la au pubspec.yaml, ou utilisez:

```bash
flutter pub add google_sign_in
flutterfire configure
```

### Étape 5 - Configuration de la clé Google

Dans la console Firebase du projet :
- Cliquez sur **Paramètres** (engrenage) en haut
- Cliquez sur **Paramètres du projet**
- Allez à l'onglet **Intégrations Google Cloud** et cliquez sur **Accéder**
- Dans le Google Cloud Console, allez à **APIs et services** > **Identifiants**
- Sous "ID clients OAuth 2.0", trouvez l'entrée **Web client (auto created by Google Service)** (PAS Android)
- Copiez l'**ID Client**

Dans votre `main.dart`, assurez-vous que votre fonction `main()` ressemble à ceci:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  GoogleSignIn.instance.initialize(
    serverClientId: "VOTRE_ID_CLIENT_WEB_ICI"
  );
  runApp(MyApp());
}
```

### Étape 6 - Implémenter Google Sign-In

Ajoutez cette fonction dans votre écran principal:

```dart
Future<UserCredential> signInWithGoogle() async {
  // Déclencher le flow d'authentification
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.signIn();
  
  if (googleUser == null) return null; // L'utilisateur a annulé
  
  // Obtenir les détails d'authorisation
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  
  // Créer les informations de connexion
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  
  // Se connecter et retourner les informations
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
```

Ajoutez un bouton pour appeler cette fonction. Testez le sign-in Google.

Faites un **COMMIT PUSH**.

### Étape 7 - Configuration pour Android

Vous recevrez probablement une erreur: `com.google.android.gms.common.api.ApiException: 10`

- Ouvrez Android Studio
- Fermez votre projet Flutter
- Ouvrez le dossier `android` de votre projet Flutter comme un nouveau projet
- Allez à **View** > **Tool Windows** > **Gradle**
- Dans la vue Gradle, cliquez sur le bouton rafraîchir
- Tapez `gradle signinReport` dans le champ de recherche
- Copiez la valeur **SHA1** pour `google_sign_in_android`

Retournez à la console Firebase:
- Sélectionnez l'application **Android** du projet
- Cliquez sur l'engrenage ⚙️
- Cliquez sur **Ajouter une empreinte**
- Collez la valeur SHA1 et validez

Réouvrez le projet Flutter et testez à nouveau. Ça devrait fonctionner!

Faites un **COMMIT PUSH**.

### Étape 8 - Ajouter le Sign-Out

Ajoutez un bouton pour se déconnecter:

```dart
MaterialButton(
  onPressed: () async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
    setState(() {});
  },
  child: Text("Sign Out"),
),
```

Testez la connexion et déconnexion. Vérifiez que l'état change dans la console.

Faites un **COMMIT PUSH**.

### Étape 9 - Accéder à l'utilisateur connecté

Vous pouvez accéder directement à l'utilisateur avec:

```dart
final user = FirebaseAuth.instance.currentUser;
final uid = FirebaseAuth.instance.currentUser?.uid;
```

Utilisez ce `uid` pour identifier le propriétaire des données dans Firestore.

### Configuration iOS (Optionnel, nécessite un Mac)

<details>
  <summary>Configuration iOS</summary>

- Dans la console Firebase, sélectionnez l'application **iOS**
- Cliquez sur l'engrenage et téléchargez `GoogleService-Info.plist`
- Placez le fichier dans `ios/Runner` (remplacez-le s'il existe)
- Ouvrez `ios/Runner/Info.plist` et ajoutez avant `</dict>`:

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>VOTRE_REVERSED_CLIENT_ID</string>
    </array>
  </dict>
</array>
```

Remplacez `VOTRE_REVERSED_CLIENT_ID` par la valeur **REVERSED_CLIENT_ID** dans `ios/Runner/GoogleService-Info.plist`.

- Ouvrez Xcode: Clic droit sur `ios` > **Flutter** > **Open iOS module in Xcode**
- Clic droit sur `Runner` (dossier bleu) > **Add Files to Runner**
- Sélectionnez `ios/Runner/GoogleService-Info.plist` et cochez "Copy items if needed"
- Lancez l'application sur simulateur ou appareil iOS
- Testez la connexion

Faites un **COMMIT PUSH**.

</details>
