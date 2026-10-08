---
title: Règles d'accès Firebase et audit de sécurité
---

# 12.1A - Règles d'accès Firebase et audit de sécurité

## Objectifs

Vous allez protéger les données et les fichiers de votre application avec des
règles Firestore et Cloud Storage. Vous testerez ensuite ces règles dans la
console Firebase, les déploierez depuis votre projet et demanderez à Copilot
CLI de vous aider à relever des vulnérabilités possibles.

## Avant de commencer

Vous devez avoir un projet Firebase avec Authentication, Firestore et Cloud
Storage activés. Chaque compte utilisé pour les tests doit être identifiable
par son UID Firebase.

Pour installer Firebase CLI à la maison, installez Node.js, puis exécutez :

```powershell
npm install -g firebase-tools
firebase login
firebase projects:list
```

`firebase projects:list` doit afficher votre projet. Au laboratoire, Firebase
CLI est déjà installé.

### Installer GitHub Copilot CLI

Sur Windows, utilisez l'une des méthodes officielles suivantes :

```powershell
winget install GitHub.Copilot
```

ou, si Node.js 22 ou une version plus récente est installée :

```powershell
npm install -g @github/copilot
```

Vérifiez ensuite l'installation avec `copilot --version`. Dans le dossier de
votre projet, lancez `copilot`, acceptez l'accès uniquement si vous faites
confiance à ce dossier, puis utilisez `/login` si l'outil vous le demande.
Vous devez disposer d'un abonnement GitHub Copilot actif.

Consultez la [documentation d'installation de Copilot CLI](https://docs.github.com/fr/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli)
si une des commandes échoue.

## Partie 1 - Écrire les règles

1. À la racine de votre projet Flutter, lancez `firebase init`. Sélectionnez
   **Firestore** et **Storage**, puis le projet Firebase correspondant à
   votre application. Ne remplacez pas un fichier local déjà correct sans en
   comprendre l'effet.
2. Vérifiez que `firebase.json` référence vos fichiers de règles :

   ```json
   {
     "firestore": { "rules": "firestore.rules" },
     "storage": { "rules": "storage.rules" }
   }
   ```

3. Dans `firestore.rules`, protégez au moins une collection dont les documents
   ont un champ qui contient l'UID du propriétaire. Une personne non
   authentifiée ne doit pas y accéder. Une personne authentifiée ne doit
   accéder qu'à ses propres documents. Séparez les règles `create`, `update`
   et `delete` si leurs conditions ne sont pas les mêmes.
4. Dans `storage.rules`, placez les fichiers personnels sous un chemin qui
   contient l'UID, par exemple `utilisateurs/<uid>/...`. Autorisez seulement
   cet utilisateur à lire et écrire dans son dossier. Si votre application
   accepte des fichiers, ajoutez aussi des limites adaptées sur leur type ou
   leur taille.

:::tip

Évitez `allow read, write: if true` et les correspondances récursives trop
larges. Une règle autorisée dans un chemin parent suffit pour autoriser une
opération, même si une règle enfant est plus restrictive.

:::

## Partie 2 - Tester dans la console Firebase

Dans la console Firebase, ouvrez l'onglet **Règles** de Firestore, puis celui
de Cloud Storage. Pour chaque service, utilisez le simulateur de règles et
consignez dans un tableau les scénarios suivants :

| Service | Opération | Identité simulée | Résultat attendu |
| --- | --- | --- | --- |
| Firestore | Créer un document dont votre UID est propriétaire | votre utilisateur | Autorisé |
| Firestore | Lire ou modifier le document d'une autre personne | autre utilisateur | Refusé |
| Firestore | Lire ou écrire sans utilisateur | non authentifié | Refusé |
| Storage | Envoyer ou lire un fichier sous votre UID | votre utilisateur | Autorisé |
| Storage | Lire ou envoyer dans le dossier d'une autre personne | autre utilisateur | Refusé |
| Storage | Lire ou écrire sans utilisateur | non authentifié | Refusé |

Si un résultat ne correspond pas à l'attendu, corrigez la règle et recommencez
le test. Un refus attendu est une réussite du test.

## Partie 3 - Déployer les règles locales

1. Confirmez le projet sélectionné :

   ```sh
   firebase use
   ```

2. Relisez les changements de `firestore.rules`, `storage.rules` et
   `firebase.json`.
3. Déployez seulement les règles :

   ```sh
   firebase deploy --only firestore,storage
   ```

4. Retournez dans les deux services de la console pour vérifier que les
   règles publiées correspondent à vos fichiers locaux. Refaites au moins un
   test autorisé et un test refusé pour chaque service.

## Partie 4 - Audit avec Copilot CLI

Depuis la racine de votre projet, lancez `copilot`. Demandez une analyse en
lecture seule : n'acceptez aucune modification proposée avant d'avoir vérifié
le rapport.

```text
Analyse ce projet Flutter et ses fichiers Firebase (firebase.json,
firestore.rules et storage.rules) pour relever les vulnérabilités de contrôle
d'accès. N'écris ni ne modifie aucun fichier. Pour chaque problème potentiel,
indique le fichier et la ligne, le chemin et l'opération touchés, une condition
d'exploitation réaliste, le niveau de gravité et une correction minimale.
Vérifie notamment les règles ouvertes, les accès sans authentification, les
ressources d'un autre utilisateur, les changements de propriétaire, les
suppression trop permissives, les validations d'écriture et les chemins Cloud
Storage trop larges. Termine par les scénarios permis et refusés à tester dans
la console Firebase.
```

Copilot peut se tromper ou manquer un problème. Vérifiez chaque constat avec
vos règles et le simulateur Firebase. Corrigez seulement les problèmes que
vous comprenez et que vous avez confirmés; rédigez les corrections vous-même,
conformément aux règles du TP.

## Remise

Remettez :

1. vos fichiers `firebase.json`, `firestore.rules` et `storage.rules`
   versionnés dans votre dépôt;
2. un tableau des six tests du laboratoire, avec le résultat obtenu;
3. le rapport Copilot CLI ou un résumé de ses constats;
4. les vulnérabilités confirmées, les corrections que vous avez appliquées et
   les tests qui les valident.
