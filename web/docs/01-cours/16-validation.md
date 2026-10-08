---
description: Centraliser les accès Firestore et valider les données
hide_table_of_contents: true
---

# Service et validations

<Row>

<Column>

:::tip Avant la séance

Téléchargez et ouvrez l'exemple [firestore_typed](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-firestore_typed.zip).

Repérez les fichiers suivants :

- `lib/model/etudiant.dart` : le modèle typé et sa conversion vers Firestore;
- `lib/service.dart` : le seul endroit qui interroge ou écrit dans Firestore;
- `firestore.rules` : les règles exécutées par Firestore avant d'accepter une écriture.

:::

</Column>

<Column>

:::info Séance

Nous utiliserons un étudiant composé d'un nom et d'un matricule :

- le nom doit contenir au moins deux caractères;
- le matricule est une chaîne de **exactement sept chiffres**.

Nous appliquerons ces mêmes contraintes avec 2 types de validation complémentaires:
- dans le service Flutter
- dans les règles Firestore. 

:::

</Column>

</Row>

## Un seul point d'accès aux données

Un écran ne devrait pas construire une requête Firestore :
- si on travaille fort à mettre des règles de validation dans le service
- on ne souhaite pas qu'un appelle direct contourne ces règles.


On veut éviter de manipuler un `Map<String, dynamic>`, dans la démo, on utilise plutôt un `Etudiant`:
- cela permet de s'assurer qu'on ne peut pas faire une typo dans le nom d'un champ
- `json["non_de_famille"]` compile toujours même si on a une erreur
- `etudiant.non_de_famille` va échouer à la compilation
- on détecte les erreurs à la compilation
- surtout on évite d'écrire dans la BD des champs cassés

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/firestore_typed/lib/model/etudiant.dart"
/>

Le `withConverter` de `service.dart` relie la collection Firestore au modèle. Le reste de l'application obtient donc des `Etudiant`, et non du JSON non typé.

`dateCreation` est généré par le serveur avec `FieldValue.serverTimestamp()`;
une application ne doit pas faire confiance à l'heure de l'appareil pour cette
information:
- un pirate peut changer l'heure de son téléphone
- mais pas l'heure du serveur Firebase

Le service est aussi l'endroit naturel pour regrouper les écritures, les requêtes, les tris et les traitements après lecture. Ainsi, une règle métier ne doit pas être répétée dans chaque page.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/firestore_typed/lib/service.dart"
/>

## Valider avant une écriture

Avant de transmettre un étudiant à Firestore, le service valide l'objet et lève une erreur explicite si les données sont incorrectes.

Par exemple, `Etudiant(nom: 'Ada Lovelace', matricule: '1234567')` est accepté. `Etudiant(nom: 'A', matricule: '12A456')` est refusé avant tout appel réseau. L'écran associe alors un message clair au champ incorrect.

Cette validation améliore l'expérience de la personne qui utilise l'application : la réponse est immédiate et le message peut expliquer quoi corriger. Elle ne protège toutefois pas la base de données : un autre client, une ancienne version de l'application ou un appel direct à l'API pourrait ne pas utiliser ce service.

## Valider dans les règles Firestore

Les règles Firestore sont exécutées par Firebase pour chaque écriture. Elles constituent donc le dernier rempart pour empêcher des données invalides d'entrer dans la base, quel que soit le client.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/firestore_typed/firestore.rules"
/>

`request.resource.data` représente le document après l'écriture proposée. La fonction vérifie les champs autorisés, leur type et leur format. Le `matches` doit couvrir toute la valeur : les ancres `^` et `$` refusent notamment `12345678` et `12A4567`. La dernière condition accepte seulement une date de création générée par le serveur.

Dans cet exemple pédagogique, la lecture est ouverte pour se concentrer sur la validation. Dans une application réelle, ajoutez aussi les contrôles d'authentification et d'autorisation nécessaires. Ne comptez jamais sur les règles pour remplacer les messages de validation de l'interface, ni sur l'interface pour remplacer les règles Firestore.

## Déployer les règles Firestore

Le fichier `firestore.rules` devrait contenir les règles:
- ça permet de les mettre dans le repo de code source
- d'en assurer le suivi des versions.

Cependant il faut alors déployer les règles dans la console firebase à chaque changement.

À la racine de `firestore_typed`, créez `firebase.json` s'il n'existe pas
encore. Ne remplacez pas une configuration existante : ajoutez plutôt la
section `firestore` appropriée.

```json title="firebase.json"
{
  "firestore": {
    "rules": "firestore.rules"
  }
}
```

### à faire uniquement si le projet n'est pas déjà configuré

Dans un terminal ouvert à la racine du projet, connectez-vous à Firebase au
besoin, puis lancez l'initialisation :

```sh
firebase login
firebase init
```

Sélectionnez **Firestore**, choisissez le projet Firebase de la démonstration
et conservez `firestore.rules` comme fichier de règles. Cette initialisation
associe le dossier local à votre projet Firebase et complète la configuration
au besoin.

Avant tout déploiement, vérifiez le projet actif :

```sh
firebase use
```

La commande doit afficher le bon projet. 

### Déploiement des règles

Vous pouvez ensuite publier seulement la configuration Firestore :

```sh
firebase deploy --only firestore
```

Firebase applique alors le contenu local de `firestore.rules` au projet
affiché. Vous pouvez ensuite valider le déploiement en regardant les règles dans votre console firebase web.

## Démonstration A TESTER TODO

1. Lancez la démo et ouvrez l'écran **Ajouter un étudiant**. Entrez `Ada Lovelace` et `1234567`, puis enregistrez. L'étudiant est écrit dans la collection `etudiants`.
2. Essayez ensuite `A` ou `12A4567`. Le service refuse l'écriture et l'écran affiche l'erreur associée au champ incorrect.
3. Dans `firestore_typed`, associez le fichier local de règles au bon projet,
   vérifiez `firebase use`, puis exécutez `firebase deploy --only firestore`.
4. Dans la console Firebase, ouvrez **Firestore Database**, puis l'onglet
   **Règles**. Vérifiez que les règles publiées correspondent à
   `firestore.rules`.
5. Utilisez le simulateur de règles pour tester une opération `create` sur
   `etudiants/un-id` avec un document valide, puis avec `nom: "A"` ou
   `matricule: "12A4567"`. Une écriture invalide envoyée par un autre client
   est alors refusée par Firebase, même si ce client ne contient pas la
   validation Dart.

:::note À retenir

Le service centralise le code Dart qui utilise Firestore et procure une validation agréable pour l'utilisateur. Les règles Firestore protègent les données sur le serveur. Les deux niveaux doivent exprimer les mêmes contraintes importantes.

:::
