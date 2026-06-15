# Démo Notifications push

Démonstration du fonctionnement des notifications avec Flutter, Firebase et .Net Core.

Attention, 2 projets ne fonctionnent pas par défaut. Il faut réaliser les étapes de configuration ci-bas.

## Configurer flutterfire

Suivez les étapes suivantes pour configurer flutterfire dans votre projet, si ce n'est pas déjà
fait. Cela va vous permettre de connecter le projet Flutter à votre projet Firebase.

[Lien vers la documentation de flutterfire.](https://firebase.google.com/docs/flutter/setup?platform=android&hl=fr)

Ajoutez le plugin `firebase_messaging` (si pas déjà présent sur votre projet)

```bash
flutter pub add firebase_messaging
```

Faire un dernier flutter configure

```bash
flutterfire configure
```

## Étapes pour .NET

### Clé Admin Firebase

Votre application .NET doit avoir la permission d'envoyer des notifications. Pour cela, vous devez
générer une clé privée pour l'API Firebase.

1. Sur votre projet firebase, allez dans les paramètres du projet, puis dans "Comptes de service".
2. En bas de la page, cliquez sur "Générer une nouvelle clé privée" pour téléchargez le fichier JSON
   généré.
3. Renommez le fichier en `google-admin.json`
4. Copier le fichier JSON dans le dossier du projet de l'API (Vis à vis du fichier .csproj)

## Suite

Prenez le temps de bien lire les TODO qui sont dans le code, dans l'ordre, pour comprendre comment
fonctionne l'envoi de notifications.

La partie la plus complexe est la gestion de l'état dans lequel votre application se trouve lorsqu'
une notification est reçue. Vous devez gérer les cas où l'application est en arrière-plan, en premier
plan, et fermée.

## Documentation à lire

- [Intégration au serveur](https://firebase.google.com/docs/cloud-messaging/send-message?hl=fr)
- [Réagir aux notifications sur le téléphone](https://firebase.flutter.dev/docs/messaging/usage#handling-messages)
