# 5.1B – firebase_auth_setup

## Objectif 🎯

Configurer Firebase Authentication dans votre application Flutter avec support de Google Sign-In et authentification par courriel + mot de passe.

ATTENTION Google SignIn n'est pas supporté sur une application Flutter qui s'exécute sur Windows Desktop.

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

### Étape 3 - re-télécharger le google-services.json

Le fichier google-services.json a été modifié, il faut donc récupérer le nouveau.

Depuis la console firebase (navigateur), sélectionnez votre projet.

Dans le menu latéral de gauche, cliquez sur l'icône d'engrenage ⚙️ avec Paramètres puis sélectionner "Général".

En déroulant vers le bas, vous devriez voir un panneau correspondant à l'application Android avec un lien vers `google-services.json`.

Téléchargez ce fichier, copier son contenu et utilisez le pour remplacer le contenu du fichier `google-services.json` qui se trouve dans le sous-dossier android dans votre projet.

### Étape 4 - Code de détection du status de login

Dans la classe d'état de votre widget principal (probablement nommée `HomePage` si vous ne l'avez pas renommée) :

- Votre curseur sur le nom de la classe
- Activez le menu des actions de code avec `Ctrl+.`
- Sélectionnez l'option `Convert to StatefullWidget`
- avant la fonction build `Widget build(BuildContext context) {`

ajoutez le code suivant dans la fonction `initState()`:

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

### Étape 5 - Ajouter google_sign_in (si pas déjà présent dans le projet voir le pubspec)

- Allez à https://pub.dev/packages/google_sign_in
- Copiez la dépendance et ajoutez-la au pubspec.yaml, ou utilisez:

```bash
flutter pub add google_sign_in
flutterfire configure
```

### Étape 6 - Configuration pour (Android Google SignIn)

Vous recevrez probablement une erreur: `com.google.android.gms.common.api.ApiException: 10`

- Ouvrez un terminal dans le dossier de votre projet Flutter
- Entrez dans le dossier android
- Tapez `./gradlew signinReport` (ou `gradle signinReport` parfois)
- Copiez la valeur du **SHA1** que vous trouverez dans la sortie du terminal

Retournez à la console Firebase:
- Sélectionnez l'application **Android** du projet
- Cliquez sur l'engrenage ⚙️
- Cliquez sur **Ajouter une empreinte**
- Collez la valeur SHA1 et validez

Réouvrez le projet Flutter et testez à nouveau. Ça devrait fonctionner!

### Étape 7 - Implémenter Google Sign-In

Ajoutez cette fonction dans votre écran de connexion:

```dart
  Future<UserCredential> signInWithGoogle() async {
  // Déclencher le flow d'authentification
  final GoogleSignInAccount googleUser = await GoogleSignIn.instance
      .authenticate();

  // Obtenir les détails d'authorisation de la requête
  final GoogleSignInAuthentication googleAuth = googleUser.authentication;
  final GoogleSignInClientAuthorization? authorizationClient =
  await googleUser.authorizationClient.authorizationForScopes(['email']);

  // Créer de nouvelles informations de connexion
  final credential = GoogleAuthProvider.credential(
    accessToken: authorizationClient!.accessToken,
    idToken: googleAuth.idToken,
  );

  // Une fois connecté, retourner UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
```

Ajoutez un bouton pour appeler cette fonction. Testez le sign-in Google.

Redémarrez l'application. Essayez de vous connecter avec votre compte Google. On devrait voir : `User is signed in! <email>` dans la console.

Si tout fonctionne, faites un **COMMIT puis PUSH**.



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

Si vous supportez plusieurs plateformes, testez l'application sur chacune des plateformes supportées.

Faites un **COMMIT PUSH**.

### Étape 9 - Accéder à l'utilisateur connecté

Vous pouvez accéder directement à l'utilisateur avec:

```dart
final user = FirebaseAuth.instance.currentUser;
final uid = FirebaseAuth.instance.currentUser?.uid;
```

Utilisez ce `uid` pour identifier le propriétaire des données dans Firestore.

### Aller plus loin

Un atelier de programmation des gens qui l'ont fait:
https://firebase.google.com/codelabs/firebase-auth-in-flutter-apps#0

