# 🚀 11.2B – Firebase Hosting

## Objectif 🎯

Déployer la version web de votre application Flutter Firebase sur Firebase Hosting, et l'ouvrir depuis n'importe quel appareil.

## Prérequis

- Avoir complété le laboratoire [🌐 11.2A – Ajouter une plateforme](./a-ajouter-plateforme.md) avec la plateforme **web**.
- L'application fonctionne avec `flutter run -d chrome`.

## À faire 🛠️

### Étape 1 - Construire la version web

À la racine du projet :

```bash
flutter build web --release
```

Le résultat est dans `build/web`. Ouvrez le dossier : c'est un site statique (`index.html`, JavaScript, images). C'est tout ce que Firebase Hosting va servir.

:::info
Le dossier `build` est déjà ignoré par le `.gitignore` de Flutter. Ne le commitez pas.
:::

### Étape 2 - Initialiser Firebase Hosting

```bash
firebase init hosting
```

Répondez aux questions :

| Question | Réponse |
|---|---|
| Projet Firebase | Votre projet existant |
| *What do you want to use as your public directory?* | `build/web` |
| *Configure as a single-page app?* | **Yes** |
| *Set up automatic builds and deploys with GitHub?* | **No** |
| *File build/web/index.html already exists. Overwrite?* | **No** |

:::danger
Si vous répondez **Yes** à la dernière question, Firebase remplace votre application par une page d'accueil générique. Relancez `flutter build web --release` pour réparer.
:::

Vérifiez que `firebase.json` contient maintenant une section `hosting` avec `"public": "build/web"`.

**COMMIT et PUSH**.

### Étape 3 - Déployer

```bash
firebase deploy --only hosting
```

1. Ouvrez l'URL **Hosting URL** affichée à la fin, de la forme `https://<votre-projet>.web.app`.
2. Ouvrez la même URL sur votre téléphone.
3. Dans la console Firebase, ouvrez **Hosting** : votre déploiement apparaît dans l'historique.

### Étape 4 - Tester en production

Sur l'URL déployée, testez :

- **La connexion** : dans la console Firebase, **Authentication > Paramètres > Domaines autorisés**, vérifiez que `<votre-projet>.web.app` est dans la liste. Sinon, ajoutez-le.
- **Les images de Storage** : elles doivent s'afficher. Sinon, ouvrez la console du navigateur (`F12`) et vérifiez la configuration CORS du bucket.
- **Le rechargement** : allez sur un autre écran, puis rechargez la page avec `F5`. L'application doit se relancer, sans erreur 404.

Notez les problèmes rencontrés et leur solution dans `MULTIPLATEFORME.md`.

**COMMIT et PUSH**.

### Étape 5 - Redéployer une nouvelle version

1. Changez quelque chose de visible dans l'application (le titre d'un écran, par exemple).
2. Augmentez la version dans `pubspec.yaml`.
3. Reconstruisez et redéployez :

```bash
flutter build web --release
firebase deploy --only hosting
```

4. Rechargez la page déployée et vérifiez le changement. S'il n'apparaît pas, forcez le rechargement avec `Ctrl+Shift+R`.
5. Dans la console Firebase, **Hosting > Historique des versions** : revenez à la version précédente avec **Restaurer**, vérifiez, puis restaurez la plus récente.

**COMMIT et PUSH**.

### Étape 6 - Pour réfléchir 🤔

Répondez à la fin de `MULTIPLATEFORME.md` :

1. Ouvrez les outils de développement du navigateur sur votre site déployé et cherchez votre `apiKey` Firebase. N'importe qui peut la lire. Qu'est-ce qui protège alors vos données dans Firestore et Storage? (Indice : séance 12.1)
2. Que se passe-t-il si vous oubliez `flutter build web` avant `firebase deploy`?

**COMMIT et PUSH**.

## Points clés à retenir

- ✅ Une application Flutter web est un site statique : `flutter build web` le produit dans `build/web`.
- ✅ Firebase Hosting sert ce dossier : `firebase init hosting` une fois, `firebase deploy --only hosting` à chaque version.
- ✅ Single-page app = **Yes** : toutes les URL sont redirigées vers `index.html`, et c'est Flutter qui gère la navigation.
- ✅ Toujours reconstruire avant de déployer.
- ✅ La configuration Firebase est publique sur le web : ce sont les règles d'accès qui protègent les données.
