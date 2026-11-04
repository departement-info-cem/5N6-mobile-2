# demo_cloud_functions

Projet de référence de la [recette Cloud Functions](https://info.cegepmontpetit.ca/5N6-mobile-2/recettes/cloud-functions). L'écran d'accueil donne accès à une démo par bouton :

- **Hello World** : appelle `helloWorld`, puis `direBonjour` avec un paramètre;
- **Requête authentifiée** : connecte un compte de test dans l'émulateur Auth, puis appelle `monProfil`, qui refuse les utilisateurs non connectés;
- **Notifications** : s'enregistre auprès de Firebase Cloud Messaging, puis appelle `envoyerNotification` pour se faire envoyer une notification. Cette démo a besoin d'un vrai projet Firebase : voir la [recette Notifications](https://info.cegepmontpetit.ca/5N6-mobile-2/recettes/notifications).

Le projet n'est lié à aucun vrai projet Firebase : `lib/firebase_options.dart` est une fausse configuration, et l'identifiant `demo-cloud-functions` (dans `.firebaserc`) commence par `demo-`. L'émulateur démarre donc sans `firebase login`. Seule la démo **Notifications** ne fonctionne pas avec cette fausse configuration, parce que Cloud Messaging n'a pas d'émulateur.

## À faire, dans cet ordre

1. Dans un **nouveau terminal**, installer les dépendances :

```bash
cd functions
npm install
```

2. Dans le **même terminal** que la dernière commande, démarrer la compilation automatique :

```bash
npm run build:watch
```

3. Dans un **nouveau terminal**, à la racine du projet, démarrer l'émulateur :

```bash
firebase emulators:start
```

4. Démarrer l'application avec la configuration **DEV** (onglet *Exécuter et déboguer* de Visual Studio Code, puis raccourci `F5`).

Les journaux des fonctions sont visibles dans l'onglet **Logs** de l'interface web des émulateurs : http://localhost:4000.

## Appeler une fonction en ligne de commande

Une fois l'émulateur démarré, dans PowerShell :

```powershell
Invoke-RestMethod -Method Post -ContentType "application/json" -Body '{"data": {"nom": "Alice"}}' -Uri http://127.0.0.1:5001/demo-cloud-functions/us-central1/direBonjour
```

Ou avec `curl` (macOS, Linux ou Git Bash) :

```bash
curl -X POST -H "Content-Type: application/json" -d '{"data": {"nom": "Alice"}}' http://127.0.0.1:5001/demo-cloud-functions/us-central1/direBonjour
```
