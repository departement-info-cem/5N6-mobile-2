---
description: Effectuer des requêtes HTTP avec DIO
---

# Appels HTTP avec DIO 🙏

[DIO](https://pub.dev/packages/dio) est une bibliothèque Dart pour envoyer des requêtes HTTP. Vous créez un client `dio` et appelez directement ses méthodes `get`, `post`, etc.

:::tip Avant de commancer
Il est recommandé de mettre en place les [secrets](./secret.md) et la [configuration](./configuration.md) avant de se lancer dans cette recette.
:::

### 1. Dépendances 🚬🚬🚬

Depuis le dossier de votre projet Flutter, ajouter `dio` :

```bash
flutter pub add dio
```

Ces dépendances seront utiles pour nous aider à passer de résultat requête HTTP à objet Dart.

```bash
flutter pub add json_annotation
flutter pub add --dev build_runner json_serializable
```

:::tip
Le drapeau `--dev` indique que la dépendance doit être installée uniquement en développement, soit quand un développeur travaille sur l'application. Ces packages ne seront pas inclus dans le paquetage final.
:::

### 2. Architecture 📐

Puisque vous commencez à savoir ce qu'est une requête HTTP, nous allons surtout nous concentrer sur l'architecture de notre application. Notre objectif sera d'avoir une première version viable, que nous allons ensuite retravailler.

Voici ce que nous vous proposons pour commencer : 

```text
lib/
│── network/
│   └── api_client.dart                    // On centralise le client qui effectue les requêtes. 
│   └── dto/                               // Classes de transfert
│       └── country_details_response.dart
│── pages/
│   └── country_search_page.dart           // Page qui va afficher le résultat des appels.
└── services/                              // Regrouper les requêtes HTTP
    └── country_service.dart
```

Voici le contenu des nouveaux fichiers. **Prenez le temps de les lire, surtout les commentaires plutôt que de simplement copier-coller**.

### 3.3 `lib/network/api_client.dart` 🛜

```dart
class CountryApiClient {
  late final Dio dio;

  CountryApiClient() {
    // Créer le DIO qui va faire effectuer les requêtes
    dio = Dio(
      BaseOptions(baseUrl: AppConfig.countryApiUrl),
    ); // Toutes les requêtes vont être envoyées à l'URL dans AppConfig.apiUrl

    // Comme en 4W6, on ajoute un intercepteur pour inclure le token d'authorisation dans les headers à chaque requête.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${dotenv.env['REST_COUNTRIES_API_KEY']}'; // On utilise notre fameux fichier d'environnement
          handler.next(
            options,
          ); // Permet à un autre intercepteur d'éventuellement modifier la requête sortante.
        },
      ),
    );
  }
}
```

### 3.4 `lib/services/country_service.dart` 🐕‍🦺

Le service utilise `CountryApiClient` pour effectuer ses appels de service.

```dart
class CountryService {
  final CountryApiClient _countryApiClient;

  // CountryService a besoin d'un CountryApiClient pour effectuer ses requêtes.
  CountryService(this._countryApiClient);

  // Notez le mot clé Future. C'est l'équivalent de Task en C#
  // Ça indique que l'exécution de la fonction peut être retardée
  // Encore une fois comme en C#, le mot clé async indique que la fonction est asynchrone
  // Elle ne s'exécutera donc pas séquentiellement
  Future<Response<dynamic>> getCountryDetails(String country) {
    return _countryApiClient.dio.get('/countries/v5?q=$country');
  }
}
```

### 3.5 `lib/pages/country_search_page.dart`

Prenons cette interface graphique : 

```dart
class CountrySearchPage extends StatefulWidget {
  const CountrySearchPage({super.key});

  @override
  State<CountrySearchPage> createState() => _CountrySearchPageState();
}

class _CountrySearchPageState extends State<CountrySearchPage> {
  final TextEditingController _countryTextController = TextEditingController(
    text: 'peru',
  );
  final CountryService _countryService = CountryService(CountryApiClient());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _countryTextController,
            decoration: InputDecoration(
              hintText:
                  'Ex : peru', // Si vous voulez tester, le nom des pays doivent être en anglais.
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _getCountryDetailsAwait,
                child: Text("Appel avec await"),
              ),

              ElevatedButton(
                onPressed: _getCountryDetailsThen,
                child: Text("Appel avec then"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
```

Ce qui nous intéresse le plus, ce sont les fonctions que les 2 boutons appellent : 

Le fait que getCountryDetails (du service) soit asynchrone force la fonction qui l'appelle à le gérer. C'est un peu comme les exception :
1. Soit on propage le fait que la fonction est asynchrone (la fonction qui l'appelle devra le gérer)
2. Soit on le gère directement dans la fonction

#### `_getCountryDetailsAwait`

Ici on le propage : la fonction retourne un type `Futur{'<'}>` et est `async`.

```dart
Future<void> _getCountryDetailsAwait() async {
  // Ressemble à la syntaxe utilisée en C# et en Javascript
  final Response<dynamic> response = await _countryService.getCountryDetails(
    _countryTextController.text,
  );
  print(response.data);
}
```

#### `_getCountryDetailsThen`

Ici nous avons exactement le même comportement que pour _getCountryDetailsAwait, mais on prend la 2ieme façon de gérer l'appel. L'asynchronisme est géré directement dans la fonction.
Remarquez que `Future{'<'}>`, `async` et `await` ont disparus puisque la fonction anonyme pour gérer le retour sera appelée quand l'appel se terminera. 

```dart 
void _getCountryDetailsThen() {
  // Première ligne exécutée ci dessous
  _countryService.getCountryDetails(_countryTextController.text).then((
    value,
  ) {
    // Troisième ligne exécutée, lorsque l'appel HTTP est terminé
    print(value.data);
  });
  // Deuxième ligne exécutée
  print('allo');
}
```

Il n'y a pas toujours une façon de faire qui est meilleure que l'autre. Tout dépend du contexte et de ce qu'on veut faire avec le résultat.

:::tip
Notez que la syntaxe avec `then` existe aussi en [Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then).
:::

## Mot de la fin

Mot de la 