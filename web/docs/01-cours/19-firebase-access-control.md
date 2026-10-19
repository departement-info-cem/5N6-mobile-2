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
- utiliser une IA pour relever des risques potentiels, puis corriger.

:::


## Le client n'est pas une frontière de sécurité

Un contrôle fait seulement dans Flutter peut être contourné : 
- une requête créée manuellement 
- un autre client avec les mêmes identifiants
peut appeler Firebase sans passer par votre interface. 

Les règles Firebase s'exécutent côté infrastructure, 
avant que Firestore ou Cloud Storage accepte
l'opération. C'est donc là qu'on protège les données.

Ensuite nous avons:
- **authentification** répond à « c'est qui? ». Après la connexion,
Firebase fournit un identifiant stable dans `request.auth.uid`. 
- **autorisation** « t'as le droit? ». Qui a accès à quoi?
- le uid fait le lien.

Dans Firestore, conservez par exemple l'UID dans un champ `proprietaireId`.
Pour Cloud Storage, préférez un chemin qui l'exprime clairement, par exemple
`utilisateurs/<uid>/images/photo.jpg`.


## Règles locales et Firebase CLI : firebase,json, firestore.rules et storage.rules

Les règles d'accès sont ultra importantes pour la sécurité de ton appliation.

Elles doivent être versionnées avec le projet:
- firebase.json : la config générale de Firebase, indique dans quels fichiers sont les règles
- firestore.rules : le nom par défaut pour les règles Firestore
- storage.rules : le nom par défaut pour les règles Cloud Storage
- si on souhaite rapidement changer entre 2 versions de règles:
  - on créer un `firestore.rules` et un `firestore-fix.rules`
  - on change dans le config firebase.json pour valider un fix

```json title="firebase.json"
{
  ...
  "firestore": {
    "rules": "firestore.rules"
  },
  "storage": {
    "rules": "storage.rules"
  },
  ...
}
```

Le déploiement de la règle validée en dev vers la prod :

```sh
firebase deploy --only firestore,storage
```

La commande déploie les fichiers désignés par `firebase.json`.


## Structure des règles

[La référence ici](https://firebase.google.com/docs/rules/basics) est très complète.

- Les opérations sont refusées par défaut. 
- Une opération est acceptée seulement si une règle `allow` applicable retourne `true`.
- Soyez précis : séparez les lectures, les créations, les mises à jour et les suppressions lorsque leurs
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

Dans une écriture Firestore:
- `request.resource.data` représente le document proposé, 
- tandis que `resource.data` représente le document existant. 

La règle de mise à jour ci-dessus empêche donc une personne propriétaire de transférer
 la propriété du document. 

## Règles Cloud Storage

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

## Contrôle d'accès vs. validation

Les fichiers de règles Firebase couvrent deux aspects :
- **contrôle d'accès** : empêcher des méchants de corrompre, voler, supprimer.
- **validation** : empêcher des utilisateurs honnêtes salir la BD, casser la logique.

Les deux vont se combiner dans les règles. Par exemple, on veut:
- ajouter un match dans une appli de rencontre
- dans la collection `rencontres`, l'auteur doit être la personne authentifiée
- le message doit contenir au moins 10 caractères et pas plus de 200 caractères
- après un trim
- s'assurer que la personne qui matche a un bien un id qui fonctionne.

```js title="firestore.rules"
rules_version = '2';

service cloud.firestore {
  match /rencontres/{rencontreId} {
    allow create: if
            // 1. CONTROLE ACCES L'utilisateur doit être authentifié et être l'auteur
            request.auth != null &&
            request.resource.data.authorId == request.auth.uid &&

            // 2. VALIDATION Le message doit contenir entre 10 et 200 caractères (après trim)
            request.resource.data.message is string &&
            request.resource.data.message.trim().size() >= 10 &&
            request.resource.data.message.trim().size() <= 200 &&

            // 3. VALIDATION S'assurer que la personne ciblée (le match) a un ID valide et existe dans la base
            request.resource.data.targetId is string &&
            request.resource.data.targetId != request.auth.uid &&
                exists(/databases/$(database)/documents/users/$(request.resource.data.targetId));
  }
}
```

## Grands pièges

- Ne pas faire de règles du tout
- Ne pas tester les règles en dév (en tentant des écritures supposées interdites)
- Rajouter une règle sans tester. Ajouter une règle n'ajoute pas de sécurité mais un nouvel ACCES donc une faille potentielle
- Aller vite. Chaque règle doit correspondre à un besoin, on doit être sûrs. Ça se peut qu'on fasse une règle en une journée. 

## Exercice / Audit par un modèle d'IA

Tu peux faire l'exercice suivant avec nu pligin VSCode ou un CLI au choix:
- Choisis un modèle récent, le plus récent possible des disponibles
- Mets le en mode planification
- Dans ton projet applicatif

```
Look for cybersec vulnerabilities in this repo / folder. 
I am interested in Access Control vulnerabilities but also others (JS injection, DB injection, man in the middle etc.). 
Also for eachvulnerability, if you can outline an exploit to I can validate my fixes.
```

L'exercice est volontairement vague car les modèle d'IA évoluent très vite.
Votre but est d'exploiter au maximum les capacités pour:
- identifier les problèmes
- mettre en place un test démontrant la faille
- mettre en place un correctif

Vous devez acquérir l'intime conviction que l'appli est plus sûre après vos corrections.

:::note Utilisation responsable de Copilot

Dans le TP, Copilot CLI sert à proposer des pistes d'audit. Vous devez
confirmer chaque constat avec la console Firebase ou vos propres tests,
comprendre la correction et/ou l'écrire vous-même. L'outil ne remplace pas votre
responsabilité ni les règles d'utilisation de l'IA du TP.

:::
