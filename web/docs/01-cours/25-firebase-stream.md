---
description: Observer le cache local et la synchronisation de Firestore
hide_table_of_contents: true
---

# Mode hors ligne

:::info Objectifs

À la fin de cette séance, vous pourrez :

- ajouter des données dans Firestore lorsqu'un appareil Android est hors ligne;
- expliquer la différence entre les données affichées sur le téléphone et celles visibles dans l'émulateur Firestore local;
- utiliser les métadonnées d'un instantané Firestore pour déterminer si les données proviennent du cache et si des écritures sont toujours en attente de synchronisation.

:::

## Préparer la démo

Cette activité utilise le projet `code\demo_firestore` fourni dans le dépôt du cours. La démo doit être exécutée sur un **téléphone Android physique** relié au même poste que l'émulateur Firestore.

1. Dans `code\demo_firestore`, installez les dépendances avec `flutter pub get`.
2. Démarrez les émulateurs Firebase avec `firebase emulators:start`.
3. Ouvrez l'interface des émulateurs à l'adresse affichée dans le terminal, normalement `http://localhost:4000`.
4. Branchez votre téléphone Android, activez le débogage USB, puis démarrez l'application avec `flutter run`.

La configuration de la démo utilise `10.0.2.2` pour joindre l'émulateur. Cette adresse convient à l'émulateur Android. Avant le laboratoire sur un téléphone physique, utilisez l'adresse IPv4 locale de votre poste et démarrez la démo avec :

```sh
flutter run --dart-define=EMULATOR_IP=adresse-ip-du-poste
```

Assurez-vous que le téléphone et le poste sont sur le même réseau Wi-Fi.

:::caution

Le téléphone ne peut pas joindre `localhost` du poste. Utilisez l'adresse IPv4 locale du poste seulement pour le laboratoire, et n'utilisez pas un projet Firestore de production.

:::

## Laboratoire : écrire hors ligne

La démo affiche une liste de documents ainsi qu'un état textuel pour chaque document et pour le flux Firestore.

1. Avec le téléphone connecté, ajoutez un document. Confirmez qu'il apparaît sur le téléphone et dans la collection `offline_lab` de l'interface de l'émulateur.
2. Activez le **mode avion** sur le téléphone. Revenez à l'application et ajoutez un autre document.
3. Observez et notez l'état textuel affiché par l'application. Le nouveau document doit être visible immédiatement sur le téléphone, avec une écriture locale en attente.
4. Actualisez l'interface de l'émulateur Firestore sur le poste. Le document ajouté hors ligne ne doit pas encore y apparaître.
5. Désactivez le mode avion. Attendez que la démo indique que l'écriture n'est plus en attente, puis vérifiez que le document apparaît dans l'émulateur.

## Lire les métadonnées

La démo écoute le flux avec les changements de métadonnées inclus. Elle affiche deux informations :

- `isFromCache` indique que l'instantané lu par l'application provient du cache local plutôt que du serveur;
- `hasPendingWrites` indique qu'au moins une écriture locale n'a pas encore été confirmée par Firestore.

Pendant le mode avion, une écriture ajoutée par l'application a `hasPendingWrites: true`. Après la reconnexion et la synchronisation, cette valeur devient `false`. Selon le contenu déjà présent dans le cache, `isFromCache` peut aussi demeurer vrai pendant la lecture hors ligne.

:::note Remise

Remettez les observations suivantes :

1. l'état affiché par la démo après l'ajout connecté;
2. l'état affiché après l'ajout en mode avion;
3. le moment où le document apparaît dans l'interface de l'émulateur;
4. l'état affiché après la reconnexion.

:::
