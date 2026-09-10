---
description: Stocker des données
hide_table_of_contents: true
---

# Firebase : stockage des données 📦

:::tip Avant la séance

**Prérequis:** Complétez d'abord les laboratoires **[⚙️ A – firebase_setup](../04-laboratoires/Laboratoire%205.1/a-firebase_setup.md)** et **[🔐 B – firebase_auth_setup](../04-laboratoires/Laboratoire%205.1/b-firebase_auth_setup.md)**.

Le Firestore utilise une approche de modélisation orientée documents / collections. 

Cette approche est assez différente de SQL ou encore Entity Framework.

Consultez la documentation Firestore sur le modèle de données **[ici](https://firebase.google.com/docs/firestore/data-model)** en **15-20 minutes**.

Commencez le laboratoire **[📦 5.2A – firebase_datastore_setup](../04-laboratoires/Laboratoire%205.2/a-firebase_datastore_setup.md)** en particulier les étapes 1-3.

Regardez ([firestore_typed](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-firestore_typed.zip)**)

:::

:::info Séance

Nous discuterons des principes fondamentaux du Firestore et des différences avec une base de données relationnelle SQL.

Nous explorerons les **collections**, **documents**, **subcollections** et la **dénormalisation** des données.

Nous regarderons dans l'exemple firestore_typed:
- comment regrouper les appels dans un service
- comment utiliser une classe et un converter de types pour éviter le JSON dans tout le code
- comment récupérer un tag de création fiable avec l'heure serveur
- comment récupérer un instantané (snapshot) ou un flux d'instantanés (stream)

Nous verrons comment utiliser l'émulateur pour éviter de se faire facturer.

:::

:::note Exercices

### Exercice intro_datastore

À partir de votre projet de test, complétez le laboratoire **[📦 5.1A – firebase_datastore_setup](../04-laboratoires/Laboratoire%205.2/a-firebase_datastore_setup.md)** en entier.

Créez une collection de jeux dans Firestore (minimum 2 champs par jeu).

Créez deux pages:

1. **Liste**: Affiche tous les jeux (avec bouton pour en ajouter un "hardcodé")
2. **Détail**: Affiche les détails d'un jeu sélectionné


### Exercice mon modèle

Pour votre application, il va falloir mettre en place un modèle de données.

L'idée est de commencer à réfléchir ici à ce modèle.

Pour exemple voici le modèle de l'application MontpetitAmi

```
firestore:
  collections:
    users:
      document_id: userId
      document:
        displayName:
          type: string
          required: true
          constraints: "2-50 characters"

        displayNameLowercase:
          type: string
          required: true

        birthday:
          type: timestamp
          required: false
          nullable: true

        description:
          type: string
          required: false
          nullable: true
          constraints: "maximum 200 characters"

        occupation:
          type: string
          required: false
          nullable: true
          constraints: "maximum 100 characters"

        interests:
          type: list<string>
          required: false
          nullable: true
          constraints: "maximum 20 items"

        createdAt:
          type: timestamp
          required: false
          nullable: true
          default: server_timestamp

      subcollections:
        friends:
          document_id: friendId
          document:
            addedAt:
              type: timestamp
              required: true
              default: server_timestamp

            noteCount:
              type: int
              required: true
              default: 0

            name:
              type: string
              required: false
              constraints: "1-80 characters"
              usage: "Only used for local, non-registered friends"

            birthday:
              type: timestamp
              required: false
              nullable: true
              usage: "Used for local friends; registered friends use users/{friendId}.birthday"

            description:
              type: string
              required: false
              nullable: true
              constraints: "maximum 200 characters"

            occupation:
              type: string
              required: false
              nullable: true
              constraints: "maximum 100 characters"

            interests:
              type: list<string>
              required: false
              nullable: true
              constraints: "maximum 20 items"

          subcollections:
            notes:
              document_id: noteId
              document:
                text:
                  type: string
                  required: true
                  constraints: "1-1000 characters"

                date:
                  type: timestamp
                  required: true
paths:
  user: users/{userId}
  friend_relation: users/{userId}/friends/{friendId}
  note: users/{userId}/friends/{friendId}/notes/{noteId}
```

:::
