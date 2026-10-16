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
- le matricule est une chaîne composée d'**exactement sept chiffres**.

Nous appliquerons ces mêmes contraintes au moyen de deux types de validation complémentaires :
- dans le service Flutter;
- dans les règles Firestore.

:::

</Column>

</Row>

## Rappel sur le service : un seul point d'accès aux données

Centralisez les règles de validation dans le service afin qu'un appel direct ne puisse pas les contourner.

Pour éviter de manipuler un `Map<String, dynamic>`, la démo utilise plutôt un `Etudiant` :
- cela permet d'éviter les erreurs de frappe dans le nom d'un champ;
- `json["nom_de_famille"]` compile même si le nom du champ est erroné;
- `etudiant.nom_de_famille` ne compilera pas si le champ n'existe pas dans le modèle;
- les erreurs sont donc détectées à la compilation;
- surtout, cela évite d'écrire dans la base de données des champs erronés.

Le `withConverter` de `service.dart` relie la collection Firestore au modèle. Le reste de l'application obtient donc des `Etudiant`, et non du JSON non typé.

`dateCreation` est générée par le serveur avec `FieldValue.serverTimestamp()`.
Une application ne doit pas faire confiance à l'heure de l'appareil pour cette
information :
- une personne malveillante peut changer l'heure de son téléphone;
- elle ne peut pas changer l'heure du serveur Firebase.

Le service est aussi l'endroit naturel pour regrouper les écritures, les requêtes, les tris et les traitements après lecture. Ainsi, une règle métier ne doit pas être répétée dans chaque page.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/firestore_typed/lib/service.dart"
    startLine="14"
    endLine="24"
/>

## Validation

### Quelques règles de validation courantes

- Vous devez souvent retirer les espaces au début et à la fin d'une chaîne avant de la valider, car ils sont généralement accidentels. Cette opération s'appelle le *trim*.
- Pour chaque champ texte, définissez une longueur minimale et une longueur maximale.
- Pour les dates, demandez-vous si elles doivent se situer dans le passé ou dans le futur, ou avant ou après une autre date.
- Pensez aux règles de validation propres à votre application.

### Valider dans le code

Avant de transmettre un étudiant à Firestore, le service valide l'objet et lève une exception explicite si les données sont incorrectes :
- vous codez les règles de validation;
- si une règle n'est pas respectée, le **service** lève (`throw`) une exception;
- le code qui **appelle** la fonction intercepte (`catch`) l'exception;
- par exemple, s'il s'agit d'un widget (interface graphique), vous pouvez afficher un message d'erreur.

Dans l'exemple :
- `Etudiant(nom: 'Ada Lovelace', matricule: '1234567')` est accepté;
- `Etudiant(nom: 'A', matricule: '1234567')` est refusé, car le nom est trop court;
- `Etudiant(nom: 'Ada Lovelace', matricule: '12A456789')` est refusé, car le matricule ne comporte pas exactement sept chiffres.

Cette validation améliore l'expérience de la personne qui utilise l'application : la réponse est immédiate et le message peut expliquer quoi corriger. Elle ne protège toutefois pas la base de données : un autre client, une ancienne version de l'application ou un appel direct à l'API pourrait ne pas utiliser ce service.

### Valider dans les règles Firestore

Firebase exécute les règles Firestore sur ses serveurs pour chaque écriture.

Elles permettent d'appliquer les règles côté serveur :
- si votre projet a plusieurs clients, vous n'avez pas à reproduire ces règles dans chacun d'eux;
- peu importe l'origine de la requête, les règles sont appliquées.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/firestore_typed/firestore.rules"
/>

- `request.resource.data` représente le document après l'écriture proposée;
- la fonction vérifie les champs autorisés, leur type et leur format;
- `matches` utilise une expression régulière :
  - `^` désigne le début de la chaîne;
  - `$` en désigne la fin;
- la dernière condition accepte uniquement une date de création générée par le serveur.

Vous verrez plus tard que le même type de règles permet de limiter les droits d'accès en lecture ou en écriture.

#### Déployer les règles Firestore

Le fichier `firestore.rules` devrait contenir les règles :
- cela permet de les conserver dans le dépôt du code source;
- cela permet également d'en assurer le suivi des versions.

Cependant, vous devez alors déployer les règles dans la console Firebase après chaque modification.

```sh
firebase deploy --only firestore
```

Firebase applique alors le contenu local de `firestore.rules` au projet
sélectionné. Vous pouvez ensuite vérifier le déploiement en consultant les règles dans la console Web Firebase, à la section Firestore.

## Seed de données

Pour faire une démonstration d'une application, vous aurez souvent besoin de données. Dans notre exemple, vous pouvez :
- créer une centaine d'étudiants aux noms différents;
- utiliser ces données pour voir l'interface avec des données réalistes.

Voici ce qui est recommandé :
- ajouter une fonction `seed()` dans votre service;
- faire en sorte que cette fonction n'appelle pas directement Firestore;
- lui faire appeler uniquement les autres fonctions du service;
- ajouter une option (facile à masquer) dans le tiroir de navigation.

Cela vous permet d'illustrer facilement votre application en créant les éléments nécessaires à vos démonstrations.

Utilisez l'IA pour obtenir des données plus intéressantes. Vous pourriez avoir une fonction `seed()` qui ressemble à ceci :
```dart
Future<void> seed() async {
  for (int i = 0; i < 10; i++) {
    Etudiant e = Etudiant();
    e.nom = "Paul $i";
    e.matricule = "123456$i";
    await ajouterEtudiant(e);
  }
}
```

Tous mes étudiants s'appellent maintenant Paul 1, Paul 2, etc. Ce n'est pas très intéressant. Je peux plutôt fournir un exemple comme celui-ci :
```dart
Future<void> seed() async {
    Etudiant e = Etudiant();
    e.nom = "Bart Simpson";
    e.matricule = "1630210";
    await ajouterEtudiant(e);
}
```

Puis demander à une IA de compléter le code avec le prompt suivant :
```
Complète ma fonction pour ajouter 30 autres personnages dans l'univers des simpsons sans boucle, les matricules doivent avoir 7 caractères voici le code Future<void> seed() async {
    Etudiant e = Etudiant();
    e.nom = "Bart Simpson";
    e.matricule = "1630210";
    await ajouterEtudiant(e);
}
```

Voici le résultat obtenu :
```dart
Future<void> seed() async {
  await ajouterEtudiant(Etudiant()..nom = "Homer Simpson"..matricule = "1000000");
  await ajouterEtudiant(Etudiant()..nom = "Marge Simpson"..matricule = "1000001");
  await ajouterEtudiant(Etudiant()..nom = "Bart Simpson"..matricule = "1000002");
  await ajouterEtudiant(Etudiant()..nom = "Lisa Simpson"..matricule = "1000003");
  await ajouterEtudiant(Etudiant()..nom = "Maggie Simpson"..matricule = "1000004");
  await ajouterEtudiant(Etudiant()..nom = "Ned Flanders"..matricule = "1000005");
  await ajouterEtudiant(Etudiant()..nom = "Moe Szyslak"..matricule = "1000006");
  await ajouterEtudiant(Etudiant()..nom = "Apu Nahasapeemapetilon"..matricule = "1000007");
  await ajouterEtudiant(Etudiant()..nom = "Seymour Skinner"..matricule = "1000008");
  await ajouterEtudiant(Etudiant()..nom = "Edna Krabappel"..matricule = "1000009");
  await ajouterEtudiant(Etudiant()..nom = "Milhouse Van Houten"..matricule = "1000010");
  await ajouterEtudiant(Etudiant()..nom = "Montgomery Burns"..matricule = "1000011");
  await ajouterEtudiant(Etudiant()..nom = "Waylon Smithers"..matricule = "1000012");
  await ajouterEtudiant(Etudiant()..nom = "Barney Gumble"..matricule = "1000013");
  await ajouterEtudiant(Etudiant()..nom = "Chief Wiggum"..matricule = "1000014");
  await ajouterEtudiant(Etudiant()..nom = "Ralph Wiggum"..matricule = "1000015");
  await ajouterEtudiant(Etudiant()..nom = "Nelson Muntz"..matricule = "1000016");
  await ajouterEtudiant(Etudiant()..nom = "Martin Prince"..matricule = "1000017");
  await ajouterEtudiant(Etudiant()..nom = "Krusty le Clown"..matricule = "1000018");
  await ajouterEtudiant(Etudiant()..nom = "Sideshow Bob"..matricule = "1000019");
  await ajouterEtudiant(Etudiant()..nom = "Lenny Leonard"..matricule = "1000020");
  await ajouterEtudiant(Etudiant()..nom = "Carl Carlson"..matricule = "1000021");
  await ajouterEtudiant(Etudiant()..nom = "Professor Frink"..matricule = "1000022");
  await ajouterEtudiant(Etudiant()..nom = "Comic Book Guy"..matricule = "1000023");
  await ajouterEtudiant(Etudiant()..nom = "Dr. Hibbert"..matricule = "1000024");
  await ajouterEtudiant(Etudiant()..nom = "Mayor Quimby"..matricule = "1000025");
  await ajouterEtudiant(Etudiant()..nom = "Groundskeeper Willie"..matricule = "1000026");
  await ajouterEtudiant(Etudiant()..nom = "Otto Mann"..matricule = "1000027");
  await ajouterEtudiant(Etudiant()..nom = "Jimbo Jones"..matricule = "1000028");
  await ajouterEtudiant(Etudiant()..nom = "Kearney Zzyzwicz"..matricule = "1000029");
}

```

## Exercice : trim

Modifiez la démo pour que la validation se fasse sur les champs après un *trim*. Vérifiez le résultat en entrant une valeur erronée comme `  A  ` (avec des espaces avant et après). Avant le *trim*, cette valeur dépasse la longueur minimale; après le *trim*, elle est trop courte.

Vérifiez ensuite que, pour une valeur valide, Firestore stocke bien la valeur après le *trim*.

## Exercice du matricule unique

Vous souhaitez mettre en place une validation qui garantit que chaque étudiant a un matricule unique.

Dans Firestore, le seul moyen de garantir l'unicité d'une valeur est de l'utiliser comme identifiant.

Pour **garantir** l'unicité du matricule, vous devez l'utiliser comme identifiant de l'étudiant :
- modifiez le modèle;
- remplacez l'ajout d'un étudiant avec `add` (qui génère l'identifiant) par un `set` (qui fixe l'identifiant) :
  - `etudiantsRef().document(matricule).set( ... )`;
  - à la place de `etudiantsRef().add( ... )`;
- modifiez le code et les règles en conséquence;
- comme la syntaxe des règles Firestore est très spécifique, vous pouvez demander à une IA de les produire. Vous devez cependant lui donner des instructions précises et comprendre les règles générées.

## Exercice : validation de votre projet

Vous pouvez ajouter des TODO dans vos méthodes de service pour indiquer les validations que vous souhaitez appliquer.

Cela facilitera la mise en place des règles côté Firestore.

## Exercice : seed de votre projet

Si ce n'est pas déjà fait, réfléchissez au contenu d'une méthode `seed()` qui permet de faire des démonstrations convaincantes.

Ici encore, vous pouvez utiliser l'IA, par exemple pour créer des noms d'utilisateurs ou de produits plausibles.