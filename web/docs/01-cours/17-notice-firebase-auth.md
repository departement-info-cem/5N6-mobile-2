# Prérequis

Avoir fait le premier fichier de configuration. S'assurer d'avoir réinstaller firebase-cli et flutterfire-cli.

## Installation de la librairie

Si ce n'est pas déjà fait (il faut regarder dans le pubspec pour voir s'il y a déjà la librairie auth de firebase) on va installer la librairie

- dans un terminal
- depuis le dossier du projet flutter
- taper : `flutter pub add firebase_auth`
- COMMIT PUSH

## Activation de l'authentification dans la console de firebase + signin par Google

- Dans la console firebase dans un navigateur https://console.firebase.google.com/
- Sélectionne ton projet
- Dans le panneau de nav à gauche, choisis Créer puis Authentication
- Si ce n'est pas déjà fait, active l'authentication
- Dans l'onglet "sign-in methods", active Google (on devrait de demander un courriel pour confirmer)

## Code de détection du status de login

- dans votre IDE
- dans le fichier dart de votre écran principal
- dans la fonction initState
- ajouter le code suivant (la doc de référence se trouve ici : https://firebase.google.com/docs/auth/flutter/start)

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
        print('User is signed in! ' + user.email!);
      }
    }
  );
  ...  reste de votre initState
}
```

- relancer votre application
- pour l'instant vous devriez toujours voir que c'est "currently signed out!" dans la console (onglet run dans l'IDE)
- COMMIT PUSH

## Ajout de google sign_in

- dans un navigateur
- aller dans la console firebase dans votre projet
- dans le volet authentication, cherche les méthodes de sign in
- activer le sign in de Google
- dans un navigateur aller à https://pub.dev/packages/google_sign_in
- copier la dépendance google_sign_in avec la bonne version dans votre pubspec.yaml
- taper : `flutterfire configure`
- copier la fonction suivante dans votre écran Flutter de départ

```dart
Future<UserCredential> signInWithGoogle() async {
    // Déclencher le flow d'authentification
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    // Obtenir les détails d'authorisation de la requête
    final GoogleSignInAuthentication googleAuth = googleUser.authentication;
    final GoogleSignInClientAuthorization? authorizationClient =
        await googleUser.authorizationClient.authorizationForScopes([]);

    // Créer de nouvelles informations de connexion
    final credential = GoogleAuthProvider.credential(
      accessToken: authorizationClient!.accessToken,
      idToken: googleAuth.idToken,
    );

    // Une fois connecté, retourner UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
}
```

- ajouter un bouton dans l'interface pour appeler la méthode signInWithGoogle
- relancer votre application
- déclencher le bouton pour appeler la méthode
- on vous demandera de vous connecter sur Google

### Configuration google_sign_in pour Android

- vous devriez avoir un message "PlatformException(sign_in_failed, com.google.android.gms.common.api.ApiException: 10: , null, null)"
- SHA1 : pour le sign in Google, il faut ajouter la signature SHA1 de l'application dans notre application Android
- SHA1 : avec Android Studio, fermer votre projet Flutter, ouvrir comme un projet le dossier android DANS le projet flutter, en sélectionnant le dossier "android" dans le dialogue d'ouverture de projet
- SHA1 : ouvrir le menu suivant : view -> tool windows -> gradle
- SHA1 : dans la vue gradle, cliquer sur le bouton suivant ![boutongradle](https://github.com/departement-info-cem/5N6-mobile-2/assets/372085/2ef2b0bb-647e-4641-a0cc-4f586c56d30b)
- SHA1 : taper : gradle signinReport dans le dialogue qui apparait
- copier la valeur du SHA1 de la tache google_sign_in_android
- dans un navigateur
- dans la console firebase sélectionner l'application Android de votre projet, cliquer dessus puis cliquer sur l'engrenage
- trouver le bouton "ajouter une empreinte"
- copier la valeur du SHA1 et valider
- re-ouvrir le projet Flutter
- relancer l'application et tenter une connexion, tout devrait fonctionner.
- COMMIT PUSH



### Configuration google_sign_in pour ios (Un mac est nécessaire)

<details>
  <summary>Configuration ios (Optionnel)</summary>

  - Dans la console Firebase sélectionner l'application IOS de votre projet, cliquer sur l'engrenage
  - Téléchargez `GoogleService-Info.plist`
  - Mettez le fichier téléchargé dans votre projet Flutter sous `ios/Runner`. S'il existe déjà, remplacez le.
  - À la fin du fichier `Info.plist` (dans le dossier ios/Runner/) ajouter quelques lignes vides juste au dessus de `</dict>`
  - Dans l'espace vide dans `Info.plist` ajoutez le code suivant en remplaçant **gnagnagna** par la valeur sous "REVERSED_CLIENT_ID" dans le fichier `ios/Runner/GoogleService-Info.plist`

  ```xml
  <key>CFBundleURLTypes</key>
      <array>
        <dict>
          <key>CFBundleTypeRole</key>
          <string>Editor</string>
          <key>CFBundleURLSchemes</key>
          <array>
            <!-- TODO Replace this value: -->
            <!-- Copied from GoogleService-Info.plist key REVERSED_CLIENT_ID -->
            <string>gnagnagna</string>
          </array>
        </dict>
      </array>
  ```

  - Ouvrez votre application avec Xcode (comme lorsqu'on déployait sur iPhone) :
    - Dans Android Studio,
    - Clique droit sur le dossier `ios`, Flutter > Open iOS/macOS module ix Xcode
  - Clique droit sur `Runner (icône du AppStore)/Runner (icône de dossier)`, "Add file to Runner"
  - Sélectionnez le fichier `ios/Runner/GoogleService-Info.plist` que vous avez copié plus tôt, et cocher "Copy items if needed"
  - Lancez votre application sur un simulateur IOS ou un appareil IOS sur un mac
  - Si vous arrivez à vous connectez
  - COMMIT PUSH
</details>

## Ajout d'un signout

- dans votre écran principal,
- ajouter un bouton qui déconnecte, par exemple

```dart
MaterialButton(
  onPressed: () async {
    await GoogleSignIn.instance.signOut();
    await FirebaseAuth.instance.signOut();
    setState(() {});
  },
  child: Text("signout"),
),
```

- relancer l'application
- On devrait pouoir se connecter et se déconnecter et l'état se lit dans la console
- COMMIT PUSH

## Accéder directement a l'utilisateur connecté

- FirebaseAuth.instance.authStateChanges() vu plus haut permet de s'abonner aux changements d'état de connexion
- on peut aussi facilement accéder à l'utilisateur connecté avec FirebaseAuth.instance.currentUser
- son id est accessible avec FirebaseAuth.instance.currentUser?.uid. Ce qui permettra d'indiquer le propriétaire des données par la suite.
