---
description: Règles d'accès pour les différents services
hide_table_of_contents: true
---

# Firebase: Règles d'accès

<Row>

<Column>

:::tip Avant la séance :

Vous regarderez la documentation pour les règles d'accès ici **[Premiers pas](https://firebase.google.com/docs/firestore/security/get-started?hl=fr)**.

Portez une attention particulière à [Structuration des règles de sécurité](https://firebase.google.com/docs/firestore/security/rules-structure?hl=fr).

Pour la mise en place, vous pouvez regarder la **[documentation ici](notice-firebase-rules)**.

:::

</Column>

<Column>

:::info Séance :

À la création de votre DB Firestore, vous avez des règles d'accès qui ressemble à ceci

```js title="Version de Test"
rules_version = '2';

service cloud.firestore {

  match /databases/{database}/documents {

    match /{document=**} {
      allow read, write: if request.time < timestamp.date(2024, 12, 14);
    }
  }

}​​​​​​​​
```

On regardera comment sécuriser l'accès aux données en modifiant ces règles d'accès.

:::

</Column>

</Row>
