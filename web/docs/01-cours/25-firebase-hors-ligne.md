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

Cette activité utilise le projet [firestore hors ligne](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/firestore_hors_ligne.zip) : 
relié au même poste que l'émulateur Firestore.

1. La démo doit être exécutée sur un **émulateur Android**
2. Démarrez les émulateurs Firebase avec `firebase emulators:start`.
3. Ouvrez l'interface des émulateurs à l'adresse affichée dans le terminal, normalement `http://localhost:4000`.

:::

## Exercice : écrire hors ligne

La démo affiche une liste de documents ainsi qu'un état textuel pour chaque document et pour le flux Firestore.

1. Avec le téléphone connecté, ajoutez un document. Confirmez qu'il apparaît sur le téléphone et dans la collection de l'émulateur.
2. Activez le **mode avion** sur l'émulateur. Revenez à l'application et ajoutez un autre document.
3. Observez et notez l'état textuel affiché par l'application:  
  - Voyez-vous l'écriture dans la collection sur l'émulateur Android?
  - Voyez-vous l'écriture dans l'émulateur firestore?
  - A-t-on un moyen de distinguer les éléments persisté sur le backend?
5. En sortant du mode avion, en laissant un petit délai:
  - Voyez-vous l'écriture dans la collection sur l'émulateur Android?
  - Voyez-vous l'écriture dans l'émulateur firestore?
6. En repassant en mode avion, on va faire 2 actions :
  - ajouter un élément dans la collection directement depuis l'application Android;
  - ajouter un élément dans la collection directement depuis l'interface de l'émulateur Fire
7. Refaire la même chose en arrêtant l'émulateur Firestore pour simuler une panne du backend.
  - observer les comportements et noter vos observations.


## Détermine en fonction de tes observations ce que font les métadonnées

La démo écoute le flux avec les changements de métadonnées inclus. Elle affiche deux informations :

- `isFromCache` : ____________________________
- `hasPendingWrites` : ____________________________

Tu peux mettre tes observations dans un fichier `hors_ligne.md` dans ton repo d'exercices.

