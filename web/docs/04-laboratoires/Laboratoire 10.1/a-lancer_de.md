# 🎲 10.1A – lancer_de

## Objectif 🎯

Écrire une Cloud Function appelable qui lance un dé, l'appeler depuis Flutter à travers l'émulateur, et valider les paramètres reçus du client.

## Prérequis

Avoir lu la [recette Cloud Functions](../../03-recettes/cloud-functions.md), en particulier les sections [Ma première fonction](../../03-recettes/cloud-functions.md#ma-première-fonction-), [Passer des paramètres](../../03-recettes/cloud-functions.md#passer-des-paramètres-) et [Gérer les erreurs](../../03-recettes/cloud-functions.md#gérer-les-erreurs-).

## À faire 🛠️

### Étape 1 - Préparer le projet

Choisissez votre point de départ :

- **Le projet démo** : téléchargez [demo_cloud_functions](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-demo_cloud_functions.zip). Il est déjà configuré pour l'émulateur, avec une fausse configuration Firebase.
- **Votre propre projet** : suivez la section [Ajouter Cloud Functions à votre projet](../../03-recettes/cloud-functions.md#ajouter-cloud-functions-à-votre-projet-) de la recette.

Ensuite :

1. Dans un terminal, dans le répertoire `functions`, exécutez `npm install`, puis `npm run build:watch`.
2. Dans un deuxième terminal, à la racine du projet, exécutez `firebase emulators:start`.
3. Lancez l'application et vérifiez que l'appel à `helloWorld` fonctionne avant d'aller plus loin.

**COMMIT et PUSH**.

### Étape 2 - Écrire la fonction `lancerDe`

Dans `functions/src/index.ts`, ajoutez une fonction appelable `lancerDe` qui retourne un nombre entier aléatoire de 1 à 6.

:::tip
`Math.random()` retourne un nombre à virgule entre 0 (inclus) et 1 (exclu). `Math.floor()` retire la partie décimale d'un nombre.
:::

- Vérifiez que le terminal de l'émulateur affiche une ligne `functions[us-central1-lancerDe]: http function initialized`.
- Écrivez le résultat de chaque lancer avec `logger.info`. Vous le retrouverez dans l'onglet **Logs** de l'interface web des émulateurs (`http://localhost:4000`).
- Lancez `npm run lint` dans le répertoire `functions`, et corrigez les erreurs, s'il y en a.

**COMMIT et PUSH**.

### Étape 3 - Afficher le résultat dans Flutter

1. Ajoutez un bouton **Lancer le dé** qui appelle `lancerDe`. Le nombre retourné par la fonction est un `int` en Dart.
2. Affichez le résultat en gros caractères.
3. Pendant l'appel, désactivez le bouton et affichez un indicateur de chargement.
4. Arrêtez l'émulateur, puis appuyez sur le bouton : affichez un message compréhensible lorsque l'erreur reçue a le code `unavailable`.

**COMMIT et PUSH**.

### Étape 4 - Un dé à plusieurs faces

Modifiez `lancerDe` pour qu'elle reçoive un paramètre `faces`, le nombre de faces du dé :

- si `faces` est absent, la fonction lance un dé à 6 faces;
- si `faces` n'est pas un nombre entier entre 2 et 100, la fonction lance une `HttpsError` avec le code `invalid-argument` et un message qui explique le problème;
- sinon, la fonction retourne un nombre entier aléatoire de 1 à `faces`.

:::tip
`Number.isInteger(valeur)` retourne `true` seulement si `valeur` est un nombre entier. Elle retourne `false` pour une chaîne comme `"6"`.
:::

Dans l'application, ajoutez un `DropdownButton` pour choisir parmi les dés 4, 6, 8, 12 et 20 faces, et envoyez la valeur choisie à `lancerDe`.

**COMMIT et PUSH**.

### Étape 5 - Tester la validation

Le menu déroulant n'envoie que des valeurs valides, mais rien n'empêche un client modifié d'envoyer autre chose. Dans votre code Flutter, remplacez temporairement la valeur envoyée par chacune des valeurs suivantes, et vérifiez que l'application affiche le message d'erreur de votre fonction :

- `1`
- `1000`
- `2.5`
- `'six'`

Remettez ensuite la valeur du menu déroulant.

**COMMIT et PUSH**.

### Étape 6 - Pour réfléchir 🤔

Répondez à ces questions en commentaire au début de `functions/src/index.ts` :

1. Si ce dé sert à un jeu en ligne, pourquoi est-ce plus intéressant de tirer le nombre dans une Cloud Function que dans l'application?
2. Un joueur malhonnête peut quand même appeler `lancerDe` plusieurs fois, et ne garder que son meilleur résultat. Que devrait faire la fonction pour l'en empêcher?

**COMMIT et PUSH**.

## Points clés à retenir

- ✅ Le nom de la constante exportée est le nom de la fonction appelée par le client.
- ✅ Les paramètres envoyés par le client sont dans `request.data`, et ils doivent **toujours** être validés.
- ✅ Seules les erreurs lancées avec `HttpsError` arrivent au client avec leur code et leur message.
- ✅ Le code d'une Cloud Function s'exécute sur le serveur : c'est le seul code auquel on peut faire confiance.
