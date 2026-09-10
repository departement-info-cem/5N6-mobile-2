# 5.1C – Émulateurs firebase

## Objectif 🎯

On veut utiliser les émulateurs pour notre développement en local. Il s'agit d'une suite de logiciels:
- qui simulent le comportement des services Firebase
- maintiennent une liste de comptes, une BD, un stockage à part de celui de production
- permettent de tester nos choses sans taper dans les crédits payants firebase

On ne passera aux serveurs de Firebase qu'au passage en production.

https://firebase.google.com/docs/emulator-suite/install_and_configure?utm_source=google&utm_medium=cpc&utm_campaign=Cloud-SS-DR-Firebase-FY26-global-gsem-1713590&utm_content=text-ad&utm_term=KW_firebase&gclsrc=aw.ds&gad_source=1&gad_campaignid=23417478209&gbraid=0AAAAADpUDOhfWBeF9ryVSdg35r6wMqdHP&gclid=CjwKCAjwqonVBhA4EiwA9wYJ3W0ohc0IsTiBkQPM7OwtGVlDZAOsmmo_5YNxjRh2D7l9aETbv83PWRoCmhYQAvD_BwE&hl=fr

## À faire 🛠️

### Prérequis

Il vous faudra:
- avoir installé firebase CLI
- avoir un projet avec la configuration du base et auth firebase fonctionnelle

### Étape 0 - Initialiser les services

Dans un terminal, placé dans le dossier de ton projet d'application Flutter.

```bash
firebase init
```

Il va vous assister pour configurer la base des service Firebase. On va choisir auth firestore functions.


### Étape 1 - Initialiser les émulateurs

Si la commande d'avant n'a pas complété ou pour changer les ports, vous devrez relancer

```bash
firebase init emulators
```

Il vous proposera de sélectionner les émulateurs à prendre, sélectionnez:
- Authentication Emulator
- Functions Emulator (utile pour les notifications)
- Firestore Emulator (notre base de données)
- Storage Emulator (pour les images)

Choisissez les ports par défaut pour les services.

Pour l'UI de l'émulateur, on vous recommande le port 8888.

### Étape 2 - lancer les émulateurs

```
firebase emulators:start
```

L'interface graphique des émulateurs va démarrer sur http://localhost:8888/


### Étape 3 - Connecter notre appli aux émulateurs


```dart
bool localDev = true;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (localDev) {
    // 10.0.2.2 pointe vers l'hôte sur émulateur Android
    // localhost pour les autres plateformes (iOS, web, etc.)
    final String host = defaultTargetPlatform == TargetPlatform.android
        ? '10.0.2.2'
        : 'localhost';

    await FirebaseAuth.instance.useAuthEmulator(host, 9099);
    // ajouter les autres émulateurs Firebase ici si nécessaire, par exemple Firestore, Storage, etc.
    // await FirebaseFirestore.instance.useFirestoreEmulator(host, 8080);
  }
  GoogleSignIn.instance.initialize();
  runApp(MyApp());
}
```

- la ligne principale c'est useAuthEmulator
- selon la plateforme l'adresse n'est pas la même
- on peut pointer vers un ou plusieurs émulateurs (un par service)

Relancez l'application.

Faites un **COMMIT PUSH**.

### Étape 4 - http sous Android

Depuis un certain temps, les téléphones Android refusent par défaut tout traffic HTTP et pas HTTPS.

Notre émulateur roule en HTTP, il faut donc autoriser ce traffic. Le plus simple:
- dans le dossier android - app - src - main 
- ouvrir le fichier AndroidManifest.xml
- ajouter `android:usesCleartextTraffic="true"` dans la balise manifest - application


### Étape 5 - Test

1. Lance ton application
2. Essaie de te connecter avec un compte Google depuis l'émulateur
3. Navigue sur http://localhost:8888/auth
4. Tu devrais voir le compte ici
5. Dans ta console firebase, normalement rien.