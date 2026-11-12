# 🌐 11.2A – Ajouter une plateforme

## Objectif 🎯

Ajouter le web (ou Windows) à une application Flutter Firebase existante, la configurer avec `flutterfire configure`, puis corriger ce qui casse.

## Prérequis

- Un projet Flutter Firebase  Android : votre TP, ou le projet [firebase_storage_demo](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-firebase_storage_demo.zip).
- `firebase` et `flutterfire` installés et connectés à votre compte.

## À faire 🛠️

### Étape 1 - Choisir la plateforme

Choisissez **web** ou **Windows** (sur un poste Windows seulement).

1. Exécutez `flutter devices`. Chrome (ou Edge) doit apparaître pour le web, `Windows (desktop)` pour Windows.
2. Pour Windows, exécutez `flutter doctor` : la ligne **Visual Studio** doit avoir un crochet vert. Sinon, suivez la section *Windows : préparer le poste* de la page de la séance.

### Étape 2 - Ajouter la plateforme au projet

À la racine du projet :

```bash
flutter create --platforms=web .
```

ou

```bash
flutter create --platforms=windows .
```

:::caution
N'oubliez pas le point à la fin : il désigne le projet courant. Sans lui, Flutter crée un nouveau projet.
:::

Vérifiez qu'un dossier `web` (ou `windows`) est apparu, et que `lib` n'a pas été modifié.

**COMMIT et PUSH**.

### Étape 3 - Configurer Firebase pour la nouvelle plateforme

```bash
flutterfire configure
```

1. Choisissez votre projet Firebase existant.
2. Cochez **android** et la nouvelle plateforme.
3. Ouvrez le diff de `lib/firebase_options.dart` : un nouveau bloc `web` (ou `windows`) est apparu.
4. Dans la console Firebase, **Paramètres du projet > Général** : une nouvelle application est listée.

**COMMIT et PUSH**.

### Étape 4 - Lancer et faire la liste de ce qui casse

```bash
flutter run -d chrome
```

ou

```bash
flutter run -d windows
```

Testez **chaque** écran et **chaque** fonctionnalité : connexion, affichage d'images, envoi d'images, notifications, etc.

Créez un fichier `MULTIPLATEFORME.md` à la racine du projet. Pour chaque problème, notez :

- ce que vous faisiez;
- le message d'erreur (console de VS Code ou console du navigateur, avec `F12`);
- la cause, selon vous, en vous aidant du tableau de la page de la séance.

**COMMIT et PUSH**.

### Étape 5 - Corriger

Corrigez les problèmes un par un. Au minimum :

- **Images choisies** : remplacez `Image.file` et `putFile` par `readAsBytes`, `Image.memory` et `putData`.
- **Images de Storage (web)** : configurez CORS sur votre bucket.
- **Notifications** : désactivez-les sur la plateforme si elles ne sont pas supportées.

Après chaque correction, relancez sur Android **et** sur la nouvelle plateforme : une correction ne doit rien casser ailleurs. Mettez à jour `MULTIPLATEFORME.md`.

**COMMIT et PUSH** après chaque correction.

### Étape 6 - Pour réfléchir 🤔

Répondez à la fin de `MULTIPLATEFORME.md` :

1. Sur Android, la configuration Firebase vient aussi de `android/app/google-services.json`. D'où vient-elle sur la nouvelle plateforme?
2. Quelle fonctionnalité de votre application abandonneriez-vous sur cette plateforme, et pourquoi?

**COMMIT et PUSH**.

## Points clés à retenir

- ✅ `flutter create --platforms=<plateforme> .` ajoute une plateforme à un projet existant.
- ✅ `flutterfire configure` doit être relancé après chaque ajout de plateforme.
- ✅ Sur le web, pas de `dart:io` : on manipule des octets.
- ✅ `kIsWeb` et `defaultTargetPlatform` permettent d'adapter le code à la plateforme.
- ✅ On teste sur **toutes** les plateformes après chaque correction.
