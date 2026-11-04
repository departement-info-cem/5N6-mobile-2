# Notifications 🚨

Une notification push est un message envoyé par un serveur, qui s'affiche sur le téléphone même quand l'application est en arrière-plan ou fermée. Avec Firebase, c'est le service [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging?hl=fr) (FCM) qui livre les notifications : votre serveur, ici une [Cloud Function](./cloud-functions.md), demande à FCM d'envoyer un message à une installation précise de votre application, et FCM se charge de le livrer au téléphone.

## Comment ça fonctionne? 🤔

1. Au démarrage, l'application s'enregistre auprès de FCM, qui lui fournit un **FID** (*Firebase Installation ID*) : un identifiant unique pour cette installation de l'application sur ce téléphone.
2. L'application envoie son FID au serveur.
3. Quand le serveur veut notifier l'utilisateur, il demande à FCM d'envoyer le message à ce FID.
4. FCM livre la notification au téléphone. Si l'application est en arrière-plan ou fermée, Android l'affiche dans la barre de notifications.

:::info Jeton ou FID?
Beaucoup d'exemples sur le web parlent plutôt d'un **jeton** (*token*), obtenu avec `getToken()`. Depuis la version 17 de [firebase_messaging](https://pub.dev/packages/firebase_messaging), `getToken()` est déprécié et remplacé par `register()`, qui fournit un FID. Le principe reste le même : c'est l'adresse de l'installation à qui envoyer la notification.
:::

:::caution FCM n'a pas d'émulateur
Les [émulateurs Firebase](./emulateurs_firebase.md) ne simulent pas Cloud Messaging. Même quand votre fonction s'exécute dans l'émulateur, l'envoi passe par les vrais serveurs de Google. Il vous faut donc :

- un vrai projet Firebase, et non un projet dont l'identifiant commence par `demo-`;
- un émulateur Android qui a les services Google Play (une image système *Google Play* ou *Google APIs*);
- des identifiants qui donnent à votre fonction le droit d'envoyer des notifications (voir [Donner des identifiants à l'émulateur](#donner-des-identifiants-à-lémulateur-)).
:::

## Mise en place 🆕

Cette recette suppose que les [Cloud Functions sont déjà ajoutées à votre projet](./cloud-functions.md#ajouter-cloud-functions-à-votre-projet-), avec l'identifiant de votre vrai projet Firebase dans `.firebaserc`.

1. Ajoutez la dépendance [firebase_messaging](https://pub.dev/packages/firebase_messaging) à votre projet Flutter :

```bash
flutter pub add firebase_messaging
```

2. Dans le répertoire `functions`, installez la dernière version du SDK Admin. L'envoi à un FID demande la version 14 ou plus récente :

```bash
npm install firebase-admin@latest
```

Vous n'avez rien à ajouter dans `AndroidManifest.xml` : firebase_messaging déclare lui-même la permission `POST_NOTIFICATIONS`, obligatoire depuis Android 13.

## Obtenir le FID 🪪

Sur Android 13 et plus, l'utilisateur doit d'abord accepter de recevoir des notifications. `requestPermission()` affiche la demande, puis `register()` lance l'enregistrement auprès de FCM. Le FID arrive dans le flux `onRegistered` :

```dart
final reglages = await FirebaseMessaging.instance.requestPermission();
if (reglages.authorizationStatus == AuthorizationStatus.denied) {
  // L'utilisateur a refusé : aucune notification ne sera affichée
  return;
}

FirebaseMessaging.instance.onRegistered.listen((fid) {
  // Affiché dans la console de débogage, pour l'envoi en ligne de commande
  debugPrint('FID : $fid');
  setState(() => _fid = fid);
});
await FirebaseMessaging.instance.register();
```

- On s'abonne à `onRegistered` **avant** d'appeler `register()`, pour ne pas manquer l'événement.
- Le FID peut changer, par exemple si l'utilisateur réinstalle l'application. `onRegistered` est alors appelé avec le nouveau FID.
- N'oubliez pas d'annuler l'abonnement (`cancel()`) dans le `dispose()` de votre widget.

## Envoyer une notification 📤

### Côté serveur

Dans `functions/src/index.ts`, initialisez le SDK Admin, puis ajoutez la fonction `envoyerNotification` :

```ts
import {initializeApp} from "firebase-admin/app";
import {getMessaging} from "firebase-admin/messaging";

// Donne accès aux services Firebase (ici, Cloud Messaging) avec le SDK Admin
initializeApp();

export const envoyerNotification = onCall<{fid?: string}>(async (request) => {
  const fid = request.data.fid;
  if (!fid) {
    throw new HttpsError("invalid-argument", "Le FID est obligatoire.");
  }
  try {
    await getMessaging().send({
      fid: fid,
      notification: {
        title: "Bonjour de Firebase!",
        body: "Cette notification vient de la fonction envoyerNotification.",
      },
    });
  } catch (erreur) {
    logger.error("Échec de l'envoi de la notification", erreur);
    throw new HttpsError(
      "internal",
      "L'envoi a échoué. Consultez les journaux de l'émulateur.",
    );
  }
  logger.info("Notification envoyée");
  return "Notification envoyée.";
});
```

- `initializeApp()` n'est appelée qu'une seule fois, au début du fichier, et non dans chaque fonction.
- `notification` contient le titre (`title`) et le texte (`body`) qu'Android affiche dans la barre de notifications.
- La fonction est `async` : `send()` retourne une `Promise`, et il faut attendre la réponse de FCM pour savoir si l'envoi a réussi.
- Le détail d'un échec est écrit dans les journaux de l'émulateur. Le client ne reçoit qu'un message générique : seules les [`HttpsError`](./cloud-functions.md#gérer-les-erreurs-) se rendent au client.

:::caution Ne faites pas ça dans une vraie application
Cette fonction envoie une notification à n'importe quel FID reçu du client. Quelqu'un qui connaît le FID d'un autre utilisateur pourrait donc lui envoyer des notifications. Dans une vraie application, le client enregistre son FID dans Firestore, par exemple dans le document de l'utilisateur connecté, et c'est le serveur qui choisit à qui envoyer, par exemple quand un nouveau message est créé.
:::

### Donner des identifiants à l'émulateur 🔑

Pour envoyer une notification, le SDK Admin doit prouver à Google qu'il a le droit d'utiliser votre projet. Une fonction déployée reçoit ces identifiants automatiquement. Dans l'émulateur, il faut les fournir avec une **clé de compte de service** :

1. Dans la console Firebase, cliquez sur la roue dentée, en haut à gauche, puis sur **Paramètres du projet**.
2. Dans l'onglet **Comptes de service**, cliquez sur **Générer une nouvelle clé privée**. Un fichier JSON est téléchargé.
3. Déplacez ce fichier **à l'extérieur** du répertoire de votre projet, par exemple dans `C:\cles-firebase\`.
4. Dans le terminal où vous démarrez l'émulateur, avec PowerShell, indiquez l'emplacement de la clé, puis démarrez l'émulateur :

```powershell
$env:GOOGLE_APPLICATION_CREDENTIALS = "C:\cles-firebase\nom-de-votre-cle.json"
firebase emulators:start
```

La variable n'existe que dans ce terminal : répétez la première commande chaque fois que vous ouvrez un nouveau terminal. Au démarrage, l'émulateur affiche l'avertissement `Application Default Credentials detected. Non-emulated services will access production using these credentials.` C'est voulu : Cloud Messaging fait partie des services non émulés.

:::danger Attention!!!
Cette clé permet à quiconque la possède d'agir sur votre projet Firebase en votre nom. Elle ne doit jamais se retrouver dans votre dépôt Git. C'est pour cette raison qu'on la garde à l'extérieur du répertoire du projet.
:::

### Côté Flutter

L'appel est le même que pour n'importe quelle autre fonction. On envoie simplement le FID en paramètre :

```dart
await FirebaseFunctions.instance
    .httpsCallable('envoyerNotification')
    .call<String>({'fid': _fid});
```

## Recevoir la notification 📱

Ce qui se passe à la réception dépend de l'état de l'application.

### Application au premier plan

Quand l'application est ouverte à l'écran, Android **n'affiche pas** la notification. C'est à l'application de la montrer, en écoutant le flux `onMessage` :

```dart
FirebaseMessaging.onMessage.listen((message) {
  setState(() => _message = 'Reçue : ${message.notification?.title}');
});
```

Appuyez sur le bouton qui appelle `envoyerNotification` : le titre de la notification s'affiche dans l'application.

### Application en arrière-plan ou fermée

Android affiche lui-même la notification dans la barre de notifications. Votre code n'est appelé que si l'utilisateur appuie dessus :

- si l'application était en arrière-plan, le message arrive dans le flux `FirebaseMessaging.onMessageOpenedApp`;
- si l'application était fermée, elle démarre, et `await FirebaseMessaging.instance.getInitialMessage()` retourne le message. Si l'application a été démarrée normalement, cette méthode retourne `null`.

```dart
FirebaseMessaging.onMessageOpenedApp.listen((message) {
  setState(() => _message = 'Ouverte depuis : ${message.notification?.title}');
});
```

### Tester en arrière-plan

Quand l'application est en arrière-plan, vous ne pouvez pas appuyer sur son bouton. Appelez plutôt la fonction [en ligne de commande](./cloud-functions.md#lappeler-en-ligne-de-commande-) :

1. Dans la console de débogage de Visual Studio Code, copiez le FID affiché après `FID :`.
2. Sur l'émulateur Android, appuyez sur le bouton **Accueil** pour mettre l'application en arrière-plan.
3. Dans PowerShell, remplacez `VOTRE_FID` et `id-de-votre-projet`, puis exécutez la commande :

```powershell
Invoke-RestMethod -Method Post -ContentType "application/json" -Body '{"data": {"fid": "VOTRE_FID"}}' -Uri http://127.0.0.1:5001/id-de-votre-projet/us-central1/envoyerNotification
```

Ou avec `curl` (macOS, Linux ou Git Bash) :

```bash
curl -X POST -H "Content-Type: application/json" -d '{"data": {"fid": "VOTRE_FID"}}' http://127.0.0.1:5001/id-de-votre-projet/us-central1/envoyerNotification
```

La notification apparaît dans la barre de notifications de l'émulateur. Appuyez dessus : l'application revient au premier plan et affiche le message reçu par `onMessageOpenedApp`.

## Pour aller plus loin 🚀

- **Envoyer au bon moment** : plutôt que d'être appelée par le client, une fonction peut être [déclenchée par Firestore](https://firebase.google.com/docs/functions/firestore-events?hl=fr), par exemple pour notifier un utilisateur quand il reçoit un nouveau message.
- **Messages de données** : en plus de `notification`, un message peut contenir un champ `data`, que l'application traite elle-même, même en arrière-plan. Voyez la [documentation de firebase_messaging](https://firebase.flutter.dev/docs/messaging/usage#handling-messages).
- **Autres façons d'envoyer** : la documentation de FCM explique comment [envoyer un message](https://firebase.google.com/docs/cloud-messaging/send-message?hl=fr) à plusieurs appareils, ou à tous ceux abonnés à un sujet (*topic*).

## Le mot de la fin

Le projet de référence de la recette [Cloud Functions](./cloud-functions.md) contient le code de cette recette, dans la démo **Notifications** : [code-demo_cloud_functions.zip](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-demo_cloud_functions.zip).

Ce projet utilise une fausse configuration Firebase, et la démo **Notifications** l'indique à l'écran au lieu de fonctionner. Pour l'essayer :

1. À la racine du projet démo, exécutez `flutterfire configure` et choisissez votre vrai projet Firebase.
2. Dans `.firebaserc`, remplacez `demo-cloud-functions` par l'identifiant de votre projet.
3. Démarrez l'émulateur avec la clé de compte de service, comme décrit dans [Donner des identifiants à l'émulateur](#donner-des-identifiants-à-lémulateur-).
