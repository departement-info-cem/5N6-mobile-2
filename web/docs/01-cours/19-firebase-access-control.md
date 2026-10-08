---
description: Protéger Firestore et Cloud Storage avec des règles d'accès Firebase
hide_table_of_contents: true
---

# Cybersécurité et règles d'accès Firebase

:::info Objectifs

À la fin de cette séance, vous pourrez :

- distinguer l'authentification de l'autorisation;
- associer les données et les fichiers à l'UID Firebase de leur propriétaire;
- écrire et tester des règles qui autorisent une opération précise dans
  Firestore et Cloud Storage;
- maintenir les règles dans des fichiers locaux et les déployer avec Firebase
  CLI;
- utiliser Copilot CLI pour relever des risques potentiels, puis confirmer les
  constats par des tests de règles.

:::

## Le client n'est pas une frontière de sécurité

Un contrôle fait seulement dans Flutter peut être contourné : une ancienne
version de l'application, une requête créée manuellement ou un autre client
peut appeler Firebase sans passer par votre interface. Les règles Firebase
s'exécutent côté service, avant que Firestore ou Cloud Storage accepte
l'opération. Elles sont donc la frontière qui protège les données.

L'**authentification** répond à « qui est connecté? ». Après la connexion,
Firebase fournit un identifiant stable dans `request.auth.uid`. L'**autorisation**
répond à « cette personne peut-elle faire cette opération sur cette
ressource? ». Ne comparez pas un courriel fourni par le client : utilisez
l'UID vérifié par Firebase.

Dans Firestore, conservez par exemple l'UID dans un champ `proprietaireId`.
Pour Cloud Storage, préférez un chemin qui l'exprime clairement, par exemple
`utilisateurs/<uid>/images/photo.jpg`.

## Structure des règles

Les règles sont refusées par défaut. Une opération est acceptée seulement si
une règle `allow` applicable retourne `true`. Soyez précis : séparez les
lectures, les créations, les mises à jour et les suppressions lorsque leurs
conditions diffèrent.

```js title="firestore.rules"
rules_version = '2';

service cloud.firestore {
  match /databases/{database}/documents {
    function estConnecte() {
      return request.auth != null;
    }

    function creeSaRessource() {
      return estConnecte()
          && request.auth.uid == request.resource.data.proprietaireId;
    }

    function possedeRessourceExistante() {
      return estConnecte()
          && request.auth.uid == resource.data.proprietaireId;
    }

    match /jeux/{jeuId} {
      allow create: if creeSaRessource();
      allow read, delete: if possedeRessourceExistante();
      allow update: if possedeRessourceExistante()
          && request.resource.data.proprietaireId
              == resource.data.proprietaireId;
    }
  }
}
```

Dans une écriture Firestore, `request.resource.data` représente le document
proposé, tandis que `resource.data` représente le document existant. La règle
de mise à jour ci-dessus empêche donc une personne propriétaire de transférer
silencieusement la propriété du document. Ajoutez aussi les contraintes de
type, de champs et de format importantes, comme dans la démo
[firestore_typed](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-firestore_typed.zip).

Cloud Storage emploie une syntaxe similaire, mais son chemin commence par le
bucket et les opérations portent sur des fichiers.

```js title="storage.rules"
rules_version = '2';

service firebase.storage {
  match /b/{bucket}/o {
    match /utilisateurs/{utilisateurId}/{chemin=**} {
      allow read, write: if request.auth != null
          && request.auth.uid == utilisateurId;
    }
  }
}
```

Cette règle est un point de départ : elle isole les fichiers par propriétaire.
Selon votre application, ajoutez des contraintes sur la taille, le type de
contenu et les chemins autorisés. Évitez les règles globales telles que
`allow read, write: if true`; elles rendent toutes les données ou tous les
fichiers publics.

:::caution Règles qui se chevauchent

Si plusieurs règles correspondent à une requête, l'accès est accordé dès
qu'une condition retourne `true`. Une règle trop large dans un chemin parent
peut donc annuler la protection attendue dans un chemin enfant.

:::

## Tester dans la console Firebase

Avant de déployer, ouvrez les onglets **Règles** de Firestore et de Cloud
Storage dans la console Firebase. Utilisez leur simulateur pour tester au
minimum les scénarios suivants :

| Service | Chemin et opération | Utilisateur attendu | Résultat attendu |
| --- | --- | --- | --- |
| Firestore | Créer `jeux/un-id` avec son propre `proprietaireId` | propriétaire connecté | Autorisé |
| Firestore | Lire ou modifier le jeu d'une autre personne | autre utilisateur connecté | Refusé |
| Firestore | Créer, lire ou supprimer sans connexion | non authentifié | Refusé |
| Cloud Storage | Envoyer ou lire `utilisateurs/<son-uid>/images/photo.jpg` | propriétaire connecté | Autorisé |
| Cloud Storage | Lire `utilisateurs/<autre-uid>/images/photo.jpg` | autre utilisateur connecté | Refusé |

Un refus est un résultat de sécurité attendu. Notez l'opération, le chemin,
l'identité simulée et la décision obtenue afin de pouvoir expliquer vos règles.

## Règles locales et Firebase CLI

La console est utile pour expérimenter, mais les règles validées doivent être
versionnées avec le projet. À la racine du projet Flutter, exécutez
`firebase init`, sélectionnez **Firestore** et **Storage**, puis associez le
bon projet Firebase. Firebase CLI crée ou complète `firebase.json` et les
fichiers de règles.

```json title="firebase.json"
{
  "$schema": "https://raw.githubusercontent.com/firebase/firebase-tools/master/schema/firebase-config.json",
  "firestore": {
    "rules": "firestore.rules"
  },
  "storage": {
    "rules": "storage.rules"
  }
}
```

Les fichiers `firestore.rules` et `storage.rules` deviennent la source de
vérité. Vérifiez le projet actif avec `firebase use`, puis publiez seulement
les règles après vos tests :

```sh
firebase deploy --only firestore,storage
```

La commande déploie les fichiers désignés par `firebase.json`. Ne déployez pas
dans un projet de production par erreur : vérifiez le projet affiché par la
CLI et vos modifications avant de confirmer.

## Laboratoire : protéger et auditer votre projet

Réalisez le [laboratoire 12.1 — règles d'accès et audit](../04-laboratoires/Laboratoire%2012.1/a-regles-acces-audit.md).
Il vous guidera pour tester, versionner et déployer vos règles Firestore et
Cloud Storage, puis pour examiner votre code et vos règles avec Copilot CLI.

:::note Utilisation responsable de Copilot

Dans le TP, Copilot CLI sert à proposer des pistes d'audit. Vous devez
confirmer chaque constat avec la console Firebase ou vos propres tests,
comprendre la correction et l'écrire vous-même. L'outil ne remplace pas votre
responsabilité ni les règles d'utilisation de l'IA du TP.

:::
