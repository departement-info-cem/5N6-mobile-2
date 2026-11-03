# demo_cloud_functions

Projet de référence de la [recette Cloud Functions](https://info.cegepmontpetit.ca/5N6-mobile-2/recettes/cloud-functions). Il contient deux fonctions appelables, `helloWorld` et `direBonjour`, et une page Flutter qui les appelle à travers l'émulateur.

Le projet n'est lié à aucun vrai projet Firebase : `lib/firebase_options.dart` est une fausse configuration, et l'identifiant `demo-cloud-functions` (dans `.firebaserc`) commence par `demo-`. L'émulateur démarre donc sans `firebase login`.

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
