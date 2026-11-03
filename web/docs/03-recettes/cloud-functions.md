# Cloud Functions ☁️

## Pourquoi des Cloud Functions? 🤔

Dans le contexte du développement [serverless](./serverless.md), c'est possible de vouloir exécuter du code qui ne s'exécute pas directement sur votre client (ex : mobile, web), mais plutôt sur les serveurs du fournisseur de service serverless. Voici quelques raisons.

### Sécurité 🔒

Certains tokens d'API ne devraient pas se retrouver sur votre client, puisque nous avons déjà vu qu'[un secret sur un client n'est pas vraiment secret](../04-laboratoires/Laboratoire%208.2/l_antre_de_la_bete.md). On utilise donc la Cloud Function comme un [proxy](https://fr.wikipedia.org/wiki/Proxy) pour faire la requête, de sorte que votre token secret ne soit jamais visible pour les utilisateurs.

C'est aussi le seul endroit où vous pouvez faire confiance au code : un client peut être modifié, une Cloud Function non. C'est donc là qu'on valide ce qui est trop complexe pour les règles de sécurité de Firestore (ex. : vérifier qu'un joueur a vraiment assez de points pour acheter un objet).

### Logique côté serveur ⚙️

Certaines opérations ne peuvent pas être faites de façon fiable par le client : maintenir un compteur (ex. : nombre de « j'aime » d'une publication), recopier une donnée dans plusieurs documents, ou faire un traitement lourd (ex. : redimensionner une image). Une Cloud Function peut être déclenchée automatiquement par un événement (création d'un document dans Firestore, téléversement d'un fichier dans Storage, horaire planifié) et faire ce travail une seule fois, au même endroit.

:::caution
Une Cloud Function ne rend pas une requête Firestore plus rapide ni plus puissante : le SDK Admin utilisé côté serveur a les mêmes limites de requêtes que le client. L'avantage est plutôt de pouvoir **préparer les données à l'écriture** (ex. : tenir un compteur à jour) pour que les lectures restent simples.
:::

### Contrôle centralisé 🎯

Au prochain cours, nous allons voir comment envoyer des notifications à l'aide de Cloud Functions. Si on prend l'exemple d'une application de messagerie de groupe, la meilleure pratique est d'avoir un serveur centralisé qui reçoit un message, et qui le distribue ensuite aux autres utilisateurs concernés. 

Comme dans votre [cours de Web Avancé](https://info.cegepmontpetit.ca/5W5-Web-Avancee/info/SignalR).

![Mème d'un soldat au regard traumatisé avec le code C# « AWAIT CLIENTS.GROUP(GROUPNAME).SENDASYNC(...) » superposé, illustrant le traumatisme psychologique de développer avec cette fonction SignalR.](./_pourquoi-functions/ptsd.jpg)

## Ajouter Cloud Functions à votre projet 🆕

Ajoutez la dépendance [cloud_functions](https://pub.dev/packages/cloud_functions) à votre projet.

:::info Et le forfait payant?
Déployer des Cloud Functions exige le forfait Blaze (paiement à l'utilisation). Nous allons donc travailler avec l'émulateur, mais en gardant l'identifiant de votre vrai projet Firebase : le jour où vous déploierez, seule la condition `config.isDev` changera dans votre code.
:::

Avec votre vrai projet, `firebase init functions` vérifie que celui-ci est au forfait Blaze, et échoue s'il ne l'est pas. Pour générer les fichiers sans cette vérification, nous allons faire croire à la CLI qu'il s'agit d'un projet de démonstration :

1. Si un fichier `.firebaserc` existe à la racine de votre projet, renommez-le temporairement en `.firebaserc.bak`.
2. Exécutez la commande `firebase init functions --project demo-init`, et approuvez tous les choix par défaut, à l'exception du choix du langage : choisissez **TypeScript**. Le préfixe `demo-` indique à la CLI de ne contacter aucun vrai projet.
3. Supprimez le fichier `.firebaserc` que la commande a créé, puis renommez `.firebaserc.bak` en `.firebaserc`.

Les fichiers générés sont les mêmes que pour un vrai projet. Le fichier `firebase.json` devrait avoir du code qui ressemble à ça, à la racine du JSON : 


```json
"functions": [
    {
      "source": "functions",
      "codebase": "default",
      "disallowLegacyRuntimeConfig": true,
      "ignore": [
        "node_modules",
        ".git",
        "firebase-debug.log",
        "firebase-debug.*.log",
        "*.local"
      ],
      "predeploy": [
        "npm --prefix \"$RESOURCE_DIR\" run lint",
        "npm --prefix \"$RESOURCE_DIR\" run build"
      ]
    }
  ]
```

Prenez le temps de regarder le contenu du répertoire `functions` qui vient d'être créé. C'est un peu comme un projet web, avec un `package.json` et un répertoire `src` qui va contenir les `functions`. Une description sommaire du rôle de chaque fichier / dossier est disponible [ici](https://firebase.google.com/docs/functions/typescript?hl=fr#initializing_a_new_project_with_typescript).

Assurez-vous que `.firebaserc` contient l'identifiant de votre vrai projet, le même que le `projectId` de `lib/firebase_options.dart`. Sinon, créez-le, pour ne pas avoir à ajouter `--project` à chaque commande `firebase` :

```json
{
  "projects": {
    "default": "id-de-votre-projet"
  }
}
```

C'est aussi un bon moment pour configurer l'[émulateur de Cloud Functions](./emulateurs_firebase.md#functions-emulator-).

:::note À faire maintenant, et à chaque fois que vous clonerez votre projet
Dans un terminal, dans le répertoire `functions`, exécutez `npm install`.
:::

:::note À faire à chaque fois que vous démarrez l'émulateur
TypeScript est un langage qui doit être compilé : l'émulateur exécute le JavaScript de `functions/lib`, pas le TypeScript de `functions/src`. Dans un terminal, à partir du répertoire `functions`, exécutez cette commande **avant** de démarrer l'émulateur. Elle surveille les changements dans `functions/src` et les compile automatiquement en JavaScript dans `functions/lib`. L'émulateur recharge ensuite vos fonctions tout seul.

```bash
npm run build:watch
```

Dans un deuxième terminal, à la racine du projet, démarrez l'émulateur :

```bash
firebase emulators:start
```

Si la CLI affiche `Unable to fetch project Admin SDK configuration`, ce n'est pas grave : la CLI ne trouve pas encore votre projet, ou vous n'êtes pas connecté avec `firebase login`. L'émulateur fonctionne quand même.
:::

En utilisant les [configurations](./configuration.md) décrites dans la [recette des émulateurs](./emulateurs_firebase.md#utiliser-les-émulateurs-sur-votre-projet), votre fonction `main` devrait ressembler à ceci :

```dart
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final AppConfig config = ConfigFactory.create();
  if (config.isDev) {
    FirebaseFunctions.instance.useFunctionsEmulator(config.emulatorIp, 5001);
  }
  runApp(const MainApp());
}
```

Vous pourrez ensuite appeler vos fonctions de n'importe où dans votre application avec `FirebaseFunctions.instance`.

## Ma première fonction 👶

### Écrire la fonction ✍️

Remplacez le contenu de `functions/src/index.ts` par celui-ci :

```ts
import {setGlobalOptions} from "firebase-functions";
import {onCall} from "firebase-functions/https";
import * as logger from "firebase-functions/logger";

// Limite le nombre de serveurs démarrés en même temps, pour contrôler les coûts
setGlobalOptions({maxInstances: 10});

export const helloWorld = onCall(() => {
  logger.info("Hello logs!", {structuredData: true});
  return "Bonjour de Firebase!";
});
```

Quelques observations :

- Le nom de la constante exportée (`helloWorld`) devient le nom de la fonction. C'est ce nom que le client utilisera pour l'appeler.
- `onCall` crée une fonction *appelable* depuis le client. Le SDK Firebase s'occupe du format de la requête, de l'authentification et des erreurs. Il existe aussi `onRequest`, qui crée un point d'accès HTTP brut, comme un contrôleur dans vos cours de web, mais nous n'en aurons pas besoin.
- Ce que la fonction retourne est envoyé au client en JSON : une chaîne, un nombre, un booléen, une liste ou un objet.
- `logger` écrit dans les journaux du serveur, et non sur le téléphone.

:::tip ESLint
Le projet `functions` utilise ESLint avec les règles de Google : guillemets doubles, lignes de 80 caractères maximum, indentation de 2 espaces. L'émulateur ne vérifie pas ces règles, mais le déploiement, oui : il exécute `npm run lint` avant d'envoyer vos fonctions. Prenez la bonne habitude dès maintenant, et lancez `npm run lint` à partir du répertoire `functions` au besoin.
:::

### Vérifier qu'elle est chargée 👀

Si `npm run build:watch` et l'émulateur sont démarrés, le terminal de l'émulateur devrait afficher une ligne qui ressemble à ceci :

```text
✔  functions[us-central1-helloWorld]: http function initialized (http://127.0.0.1:5001/id-de-votre-projet/us-central1/helloWorld).
```

Modifiez le texte retourné par la fonction et enregistrez : `build:watch` recompile le fichier, et l'émulateur recharge la fonction tout seul. Pas besoin de le redémarrer.

### L'appeler en ligne de commande 💻

Une fonction appelable est une requête HTTP `POST` comme une autre. On peut donc la tester sans écrire une ligne de Flutter, avec l'adresse affichée par l'émulateur.

Dans PowerShell :

```powershell
Invoke-RestMethod -Method Post -ContentType "application/json" -Body '{"data": null}' -Uri http://127.0.0.1:5001/id-de-votre-projet/us-central1/helloWorld
```

Avec `curl` (macOS, Linux ou Git Bash) :

```bash
curl -X POST -H "Content-Type: application/json" -d '{"data": null}' http://127.0.0.1:5001/id-de-votre-projet/us-central1/helloWorld
```

La réponse ressemble à ceci :

```json
{"result": "Bonjour de Firebase!"}
```

- Le corps de la requête doit être un objet JSON avec une propriété `data`, qui contient les paramètres envoyés à la fonction (`null` s'il n'y en a pas). Sinon, la fonction refuse la requête.
- La valeur retournée par la fonction se trouve dans la propriété `result`. En cas d'erreur, la réponse contient plutôt une propriété `error`.
- Vous pouvez aussi envoyer cette requête avec [Bruno](./bruno.md).

C'est exactement ce que fait le SDK Firebase pour vous lorsque vous appelez la fonction depuis Flutter.

### L'appeler depuis Flutter 📱

```dart
final resultat = await FirebaseFunctions.instance
    .httpsCallable('helloWorld')
    .call<String>();
print(resultat.data); // Bonjour de Firebase!
```

Le type entre `< >` est le type de la valeur retournée par la fonction. Après l'appel, ouvrez l'onglet **Logs** de l'interface web des émulateurs (`http://localhost:4000`) : le message `Hello logs!` y apparaît.

## Passer des paramètres 📨

### Côté serveur

Dans `functions/src/index.ts`, ajoutez cette deuxième fonction :

```ts
export const direBonjour = onCall<{nom?: string}>((request) => {
  const nom = request.data.nom ?? "inconnu";
  logger.info(`Bonjour demandé pour ${nom}`);
  return {message: `Bonjour ${nom}!`, heureServeur: new Date().toISOString()};
});
```

- Les paramètres envoyés par le client sont dans `request.data`. Le type entre `< >` décrit ce qu'on s'attend à recevoir, mais **rien ne garantit que le client le respecte** : il faut toujours valider. Nous le ferons à la section suivante.
- Pour retourner plusieurs valeurs, on retourne un objet.
- `heureServeur` est l'heure de l'ordinateur qui a exécuté la fonction : une preuve que le code ne s'est pas exécuté sur le téléphone.

En ligne de commande, les paramètres vont dans la propriété `data` du corps de la requête : `{"data": {"nom": "Alice"}}`.

### Côté Flutter

Les paramètres sont passés à `call`, sous forme de `Map`. Puisque la fonction retourne un objet, le type de la réponse est aussi une `Map` :

```dart
final resultat = await FirebaseFunctions.instance
    .httpsCallable('direBonjour')
    .call<Map<String, dynamic>>({'nom': 'Alice'});
print(resultat.data['message']); // Bonjour Alice!
print(resultat.data['heureServeur']);
```

## Gérer les erreurs 🚨

### Côté serveur

Que se passe-t-il si le client n'envoie pas de nom, ou un nom vide? Il faut refuser la requête, et expliquer pourquoi au client. Dans `functions/src/index.ts`, ajoutez `HttpsError` à l'import de `onCall`, puis modifiez `direBonjour` :

```ts
import {onCall, HttpsError} from "firebase-functions/https";

// ...

export const direBonjour = onCall<{nom?: string}>((request) => {
  const nom = request.data.nom?.trim();
  if (!nom) {
    throw new HttpsError("invalid-argument", "Le nom est obligatoire.");
  }
  logger.info(`Bonjour demandé pour ${nom}`);
  return {message: `Bonjour ${nom}!`, heureServeur: new Date().toISOString()};
});
```

`HttpsError` permet de renvoyer au client un [code d'erreur](https://firebase.google.com/docs/functions/callable?hl=fr#handle_errors) (ex. : `invalid-argument`, `not-found`, `permission-denied`) et un message.

:::caution
Seules les erreurs lancées avec `HttpsError` sont transmises au client avec leur code et leur message. Toute autre exception arrive dans Flutter avec le code `internal`, sans détail.
:::

### Côté Flutter

Une erreur de la fonction arrive dans Flutter sous la forme d'une `FirebaseFunctionsException`, avec le code et le message choisis dans `HttpsError` :

```dart
try {
  final resultat = await FirebaseFunctions.instance
      .httpsCallable('direBonjour')
      .call<Map<String, dynamic>>({'nom': 'Alice'});
  print(resultat.data['message']); // Bonjour Alice!
} on FirebaseFunctionsException catch (e) {
  if (e.code == 'unavailable') {
    print("L'émulateur est-il démarré?");
  } else {
    print('Erreur (${e.code}) : ${e.message}');
  }
}
```

Essayez d'appeler `direBonjour` avec un nom vide, puis en arrêtant l'émulateur, et observez le code d'erreur reçu.

## Requête authentifiée 🔐

Une fonction a souvent besoin de savoir **qui** l'appelle : pour lire les données de l'utilisateur, ou pour refuser les visiteurs anonymes.

### Mise en place

Il faut d'abord que votre application utilise [Firebase Auth](https://pub.dev/packages/firebase_auth), avec l'[émulateur Auth](./emulateurs_firebase.md#auth-emulator-). Dans `main`, activez-le avant l'émulateur de Cloud Functions :

```dart
if (config.isDev) {
  await FirebaseAuth.instance.useAuthEmulator(config.emulatorIp, 9099);
  FirebaseFunctions.instance.useFunctionsEmulator(config.emulatorIp, 5001);
}
```

### Côté serveur

Ajoutez cette fonction dans `functions/src/index.ts` :

```ts
export const monProfil = onCall((request) => {
  if (!request.auth) {
    throw new HttpsError("unauthenticated", "Vous devez être connecté.");
  }
  logger.info(`Profil demandé par ${request.auth.uid}`);
  return {uid: request.auth.uid, courriel: request.auth.token.email ?? null};
});
```

- Lorsqu'un utilisateur est connecté, le SDK Firebase envoie son jeton avec chaque appel. Firebase vérifie ce jeton **avant** d'exécuter la fonction, puis remplit `request.auth`.
- Si personne n'est connecté, `request.auth` est `undefined`. C'est à vous de refuser l'appel, avec le code `unauthenticated`.
- `request.auth.token` contient les informations du jeton, dont le courriel (`email`) de l'utilisateur.

:::caution
N'acceptez jamais l'identifiant de l'utilisateur en paramètre (ex. : `request.data.uid`) : n'importe quel client peut y mettre l'identifiant de quelqu'un d'autre. Seul `request.auth.uid` est fiable, puisque Firebase l'a vérifié.
:::

### Côté Flutter

Il n'y a rien à ajouter : l'appel est le même que pour n'importe quelle fonction.

```dart
final resultat = await FirebaseFunctions.instance
    .httpsCallable('monProfil')
    .call<Map<String, dynamic>>();
print(resultat.data['uid']);
```

Appelez `monProfil` sans être connecté, puis connecté, et observez la différence.

## Le mot de la fin

Un projet de référence de ce qui a été démontré dans cette recette est disponible [ici](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-demo_cloud_functions.zip).
