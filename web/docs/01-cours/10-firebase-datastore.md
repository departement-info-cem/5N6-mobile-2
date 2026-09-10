---
description: Stocker des données
hide_table_of_contents: true
---

# Firebase : stockage des données 📦

:::tip Avant la séance

**Prérequis:** Complétez d'abord les laboratoires **[⚙️ A – firebase_setup](../04-laboratoires/Laboratoire%205.1/a-firebase_setup.md)** et **[🔐 B – firebase_auth_setup](../04-laboratoires/Laboratoire%205.1/b-firebase_auth_setup.md)**.

Le Firestore utilise une approche de modélisation des données différente de SQL (NoSQL, orienté documents).

Consultez la documentation Firestore sur le modèle de données **[ici](https://firebase.google.com/docs/firestore/data-model)** en **15-20 minutes**.

Regardez ces vidéos d'introduction (en anglais) :

<Video url="https://youtu.be/sumhBN2BJt8" />

<Video url="https://youtu.be/tdmwt82ssqQ" />

Commencez le laboratoire **[📦 5.2A – firebase_datastore_setup](../04-laboratoires/Laboratoire%205.2/a-firebase_datastore_setup.md)** en particulier les étapes 1-3.

:::

:::info Séance

Nous discuterons des principes fondamentaux du Firestore et des différences avec une base de données relationnelle SQL.

Nous apprendrons les opérations CRUD (Create, Read, Update, Delete) sur Firestore.

Nous verrons comment structurer les données intelligemment pour eviter des requêtes coûteuses.

Nous explorerons les **collections**, **documents**, **subcollections** et la **dénormalisation** des données.

:::

:::note Exercices

### Exercice 1️⃣: fireinception

À partir de la console de Firestore, créez l'architecture suivante :

- Une maison
  - qui contient des pièces
    - (utiliser le nom de la pièce comme ID aux documents)
    - qui contiennent des meubles
      - (utiliser un ID généré automatiquement)
      - qui contiennent des boites
        - qui contiennent des 🐈

### Exercice 2️⃣: intro_datastore

À partir de votre projet de test, complétez le laboratoire **[📦 5.1A – firebase_datastore_setup](../04-laboratoires/Laboratoire%205.2/a-firebase_datastore_setup.md)** en entier.

Créez une collection de jeux dans Firestore (minimum 2 champs par jeu).

Créez deux pages:

1. **Liste**: Affiche tous les jeux (avec bouton pour en ajouter un "hardcodé")
2. **Détail**: Affiche les détails d'un jeu sélectionné

:::
