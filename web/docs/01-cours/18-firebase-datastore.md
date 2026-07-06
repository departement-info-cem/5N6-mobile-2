---
description: Stocker des données
hide_table_of_contents: true
---

# Firebase : stockage des données

<Row>

<Column>

:::tip Avant la séance :

Le datastore utilise une approche de modélisation des données différente de SQL.

Vous pouvez regarder la doc sur le fonctionnement du Firestore [ici](https://firebase.google.com/docs/firestore/data-model)

Videos à regarder:

<Video url="https://youtu.be/sumhBN2BJt8" />

<Video url="https://youtu.be/tdmwt82ssqQ" />

:::

</Column>

<Column>

:::info Séance :

Nous discuterons des principes de base du Firestore et des parallèles à faire entre un BD relationnelle et Firestore qui est orienté documents

Nous apprendrons les principes de base pour utiliser Firestore dans une application flutter

:::

</Column>

</Row>

:::note Exercices

### Exercice fireinception

À partir de la console de Firestore

Créer l'architecture suivante

- Une maison
  - qui contient des pièces
  - (utiliser le nom de la pièce comme id aux documents)
    - qui contiennent des meubles
    - (utiliser un id généré automatiquement comme id aux documents)
      - qui contiennent des boites
        - qui contiennent des 🐈

### Exercice intro_datastore

À partir de votre projet de test

Créer une collection de jeux dans le Firestore (un jeu doit contenir au moins 2 champs)

Faire 2 pages

Une première qui nous permettra d'afficher tous les jeux (afficher seulement le nom du jeu dans la liste) et qui contiendra un bouton pour ajouter un jeu "hardcodé"

Une deuxième qui nous permettra d'afficher le détail d'un jeu

:::
