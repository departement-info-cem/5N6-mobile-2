# firestore_typed

Démo d'accès à Firestore avec des objets typés plutôt que des
`Map<String, dynamic>`.

Le fichier `lib/service.dart` centralise la collection typée, les requêtes et
la validation avant écriture. L'exemple gère des étudiants dont le nom doit
contenir au moins deux caractères et dont le matricule est composé de
exactement sept chiffres. Il conserve aussi l'horodatage serveur de création.

## Exécuter la démo

Cette démo fonctionne uniquement sur un émulateur Android avec l'émulateur
Firestore local. Depuis ce répertoire, démarrez l'émulateur Firestore :

```sh
firebase emulators:start --only firestore
```

L'application Android se connecte obligatoirement à `10.0.2.2:8080`, qui
correspond à la machine hôte depuis l'émulateur Android. Aucune connexion à un
projet Firestore distant n'est utilisée.

Le fichier `firebase.json` charge les règles locales de `firestore.rules`.
Elles appliquent les mêmes contraintes que la validation Dart avant écriture,
afin que l'émulateur protège aussi les données de tous les clients.
