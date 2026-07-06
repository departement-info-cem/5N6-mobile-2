---
description: Sécuriser une application et typer des données pour Firebase
hide_table_of_contents: true
---

# Firestore : Contrôle d'accès et typage des documents

<Row>

<Column>

:::tip Avant la séance :

Documentation des règles de firestore [ici](https://firebase.google.com/docs/firestore/security/get-started?utm_source=google&utm_medium=cpc&utm_campaign=Cloud-SS-DR-Firebase-FY26-global-gsem-1713590&utm_content=text-ad&utm_term=KW_&gclsrc=aw.ds&gad_source=1&gad_campaignid=23417478209&gbraid=0AAAAADpUDOjDu6sndNX2bq7-7KPWmunCF&gclid=CjwKCAjw0o3SBhBVEiwAh28-jcqbBhKhTQlbVg0t5XuVj_fulW0s69GtgUZEAj2E9aErVSrlCscNEBoCPKYQAvD_BwE&hl=fr)

Videos à regarder:

<Video url="https://youtu.be/bXVjxu5IRZY" />

<Video url="https://youtu.be/wySmSnwjpXo" />

:::

</Column>

<Column>

:::info Séance :

Quel identifiant pour l'utilisateur:

- courriel?
- ID fourni par FireBase ?

Nous allons discuter de comment rattacher les données à l'utilisateur :

- Créer un compte dans le firestore qui utilise l'identifiant de l'utilisateur authentifié
- Inclure l'identifiant de l'utilisateur dans les objets stockés (comme un champ)

Nous regarderons la démo [FireStore typé](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-firestore_typed.zip):

- Accès typés au firestore
- Récupération du server time à la création d'un objet
- Accès unique aux données ou accès via un Stream

:::

</Column>

</Row>

:::note Exercices

### Exercice save_user

À partir de votre projet de test

Faire une application qui vous permet de se connecter à Firebase

Une fois connecté, sauvegarder l'utilisateur et ses informations dans le Firestore (nom et courriel)

### Exercice type_jeux

À partir de votre projet de test

Créer une application qui vous permettra de créer des jeux (nom, type, plateforme, évaluation, date de sortie)

Les jeux devront être rattachés à un utilisateur.

Vous devrez créer une classe Jeu et faire le nécessaire pour utiliser la méthode withConverter.

:::
