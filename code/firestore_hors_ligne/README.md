# Démo Firestore : mode hors ligne

Cette démo est le support du laboratoire sur le cache local et la synchronisation
hors ligne de Firestore.

## Démarrer le laboratoire

1. Installez les dépendances :

   ```sh
   flutter pub get
   ```

2. Démarrez les émulateurs Firebase depuis ce dossier :

   ```sh
   firebase emulators:start
   ```

   L'émulateur Firestore écoute sur le port 8080 et son interface est
   habituellement accessible à `http://localhost:4000`.

3. Exécutez la démo avec `flutter run`.

La configuration par défaut utilise `10.0.2.2`, qui convient à l'émulateur
Android. Pour un téléphone Android physique, utilisez l'adresse IPv4 locale du
poste qui exécute les émulateurs :

```sh
flutter run --dart-define=EMULATOR_IP=adresse-ip-du-poste
```

Le téléphone et le poste doivent être connectés au même réseau Wi-Fi.

## Scénario à observer

1. Ajoutez un document lorsque le téléphone est connecté et vérifiez sa présence
   dans l'interface de l'émulateur.
2. Activez le mode avion sur le téléphone et ajoutez un autre document.
3. Dans la démo, observez les valeurs `isFromCache` et `hasPendingWrites`.
   L'ajout est visible immédiatement sur le téléphone, mais n'est pas encore
   présent dans l'interface de l'émulateur.
4. Désactivez le mode avion et vérifiez que l'écriture n'est plus en attente,
   puis que le document apparaît dans l'émulateur.
