---
description: Porter une application Flutter Firebase sur le web et Windows
hide_table_of_contents: true
---

# 11.2 - Multiplateforme Firebase 

:::tip Avant la séance :

- Relisez la section [Activer web](../03-recettes/deploiement-web.md#1-activer-web) de la recette Déploiement web.
- Consultez le tableau des [plateformes supportées par FlutterFire](https://firebase.google.com/docs/flutter/setup#available-plugins).

:::

:::info Séance :

Nous porterons une application Flutter Firebase Android sur le web et Windows, et nous déploierons la version web sur Firebase Hosting.

:::

:::note Exercices

Complétez les laboratoires :

- **[🌐 11.2A – Ajouter une plateforme](../04-laboratoires/Laboratoire%2011.2/a-ajouter-plateforme.md)**
- **[🚀 11.2B – Firebase Hosting](../04-laboratoires/Laboratoire%2011.2/b-firebase-hosting.md)**

Appliquez ensuite ces corrections à votre TP4, le cas échéant.
:::

## Ce qui casse

Votre code Dart compile pour le web et Windows. Vos plugins et Firebase, eux, ne suivent pas toujours.

| Enjeu | Web | Windows | Quoi faire |
|---|---|---|---|
| `dart:io` (`File`, `Platform`) | ❌ Non | ✅ Oui | Travailler avec des octets (`Uint8List`) |
| Images de Firebase Storage | ⚠️ CORS | ✅ Oui | Configurer CORS sur le bucket |
| Google Sign-In | ⚠️ Autre flux | ❌ Non | `signInWithPopup` sur web, masquer sur Windows |
| Taille d'écran, souris, clavier | ⚠️ | ⚠️ | Mise en page réactive |

## Fichiers et images : pas de `dart:io` sur le web

Le navigateur n'a pas de système de fichiers. `File`, `Image.file` et `putFile` plantent sur le web. C'est exactement ce que fait le projet `firebase_storage_demo` :

```dart
// ❌ Android seulement
Image.file(File(image.path));
ref.putFile(File(image.path));
```

Utilisez plutôt les octets de l'`XFile` retourné par `image_picker`. Ça fonctionne sur toutes les plateformes :

```dart
// ✅ Partout
final Uint8List octets = await image.readAsBytes();
Image.memory(octets);
ref.putData(octets, SettableMetadata(contentType: image.mimeType ?? 'image/jpeg'));
```

## Images de Storage : CORS

Sur le web, `Image.network` télécharge l'image depuis votre page. Le bucket Firebase Storage refuse par défaut les requêtes venant d'un autre domaine (CORS) : l'image ne s'affiche pas, et la console du navigateur affiche une erreur CORS.

Autorisez les lectures sur le bucket, une seule fois, avec un fichier `cors.json` :

```json
[
  {
    "origin": ["*"],
    "method": ["GET"],
    "maxAgeSeconds": 3600
  }
]
```

```bash
gcloud storage buckets update gs://<votre-projet>.firebasestorage.app --cors-file=cors.json
```

Le nom exact du bucket est affiché en haut de la page **Storage** de la console Firebase.

:::caution
`CachedNetworkImage` fonctionne sur le web, mais sans cache disque : c'est le navigateur qui gère le cache.
:::

## Google Sign-In : pas sur Windows

Le package `google_sign_in` n'a **aucune** implémentation pour Windows. Le bouton plantera.

- Sur **Windows** : masquez le bouton Google et gardez la connexion par courriel et mot de passe.
- Sur le **web** : passez directement par Firebase Auth, qui ouvre un popup Google.

```dart
if (kIsWeb) {
  await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
} else {
  // flux google_sign_in habituel (Android)
}
```

## Notifications push

- **Windows** : Firebase Cloud Messaging n'est pas supporté. Désactivez la fonctionnalité.
- **Web** : il faut un service worker `web/firebase-messaging-sw.js` et une clé VAPID. Prévoyez du temps si votre TP en dépend.

## Détecter la plateforme

Utilisez le code :

```dart
import 'package:flutter/foundation.dart';

bool get googleDisponible =>
    kIsWeb || defaultTargetPlatform == TargetPlatform.android;
```

Testez `kIsWeb` **en premier** : sur le web, `defaultTargetPlatform` retourne le système d'exploitation du navigateur, pas « web ».

## Windows : préparer le poste

- Visual Studio (pas VS Code) avec la charge de travail **Développement Desktop en C++**.
- Le **mode développeur** de Windows activé (requis par les plugins).
- `flutter doctor` doit afficher un crochet vert pour Visual Studio.

## Mise en page

Une fenêtre se redimensionne, et on y navigue à la souris et au clavier. Revoyez la séance [3.1 - Multilingue et Réactivité](./05-multilingue-reactivite.md) et testez plusieurs largeurs.
