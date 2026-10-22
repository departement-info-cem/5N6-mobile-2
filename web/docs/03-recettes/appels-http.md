---
description: Effectuer des requêtes HTTP avec DIO
---

# Appels HTTP avec DIO 🙏

[DIO](https://pub.dev/packages/dio) est une bibliothèque Dart pour envoyer des requêtes HTTP. Vous créez un client `dio` et appelez directement ses méthodes `get`, `post`, etc.

Dans cette recette une requête va être faite à l'API de [REST Countries](https://restcountries.com/), pour rechercher un pays, et en affichant l'emoji de son drapeau ainsi que sa signification. Si ce n'est pas déjà fait, [créez vous une clé d'API de REST Countries](https://restcountries.com/api-keys).

:::tip Avant de commancer
Il est fortement recommandé d'avoir consulté la recette de [Bruno 🐕](./bruno.md) et d'avoir mis en place les [Secrets 🤫](./secret.md) et la [Configuration 🧑‍🔧](./configuration.md) avant de se lancer dans cette recette.
:::

## 1. Dépendances 🚬🚬🚬

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

## 2. Architecture 📐

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

## 3. `lib/network/dto/country_details_response.dart`

Tel que vu dans la recette de [Bruno 🐕](./bruno.md), la réponse de la requête HTTP de recherche d'un pays est énorme, même lorsqu'il n'y a qu'un seul pays trouvé.

Nous allons donc vouloir cibler les quelques champs qui nous intéressent.

```dart
// Inclure le fichier généré qui facilite les transformations
// json -> objet dart et objet dart -> json
// Restera rouge tant que cette commande n'aura pas été exécutée :
// dart run build_runner build
// N'ayez pas peur de jeter un coup d'oeil à ce qui est dans ce fichier généré.
// C'est moins complexe qu'il n'y parait.
part 'country_details_response.g.dart';

@JsonSerializable()
class CountryDetailsResponse {
  final String description;
  final String emoji;

  CountryDetailsResponse({required this.description, required this.emoji});

  // Drôle de code! Permet de passer de json à CountryDetailsResponse.
  // Ça utilise une fonction généré dans country_details_response.g.dart
  factory CountryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsResponseFromJson(json);

  // Autre drôle de code! Permet de passer de CountryDetailsResponse à json.
  // Ça utilise aussi une fonction généré dans country_details_response.g.dart
  Map<String, dynamic> toJson() => _$CountryDetailsResponseToJson(this);
}
```

## 4. `lib/network/api_client.dart` 🛜

```dart
// Le client est réutilisé à chaque requête
class CountryApiClient {
  late final Dio dio;

  CountryApiClient() {
    final AppConfig config = ConfigFactory.create();
    // Créer le DIO qui va faire effectuer les requêtes
    dio = Dio(
      BaseOptions(
        // Toutes les requêtes vont être envoyées à l'URL dans AppConfig.apiUrl
        baseUrl: config.countryApiUrl,
      ),
    );

    // Comme en 4W6, on ajoute un intercepteur pour inclure le token d'authorisation dans les headers à chaque requête.
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${dotenv.env['REST_COUNTRIES_API_KEY']}';
          // Permet à un autre intercepteur d'éventuellement modifier la requête sortante.
          handler.next(options);
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
  Future<List<CountryDetailsResponse>> getCountryDetails(String country) async {
    Response<dynamic> response = await _countryApiClient.dio.get(
      '/countries/v5?q=$country',
    );
    dynamic jsonRawContent = response.data!;
    // Regardez le résultat de cette requête dans Bruno pour mieux comprendre ce qui est fait ici
    List<dynamic> objects = jsonRawContent["data"]["objects"];
    return objects
        .map((dynamic json) => CountryDetailsResponse.fromJson(json["flag"]))
        .toList();
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

  // Contiendra la liste des pays trouvés
  List<CountryDetailsResponse> _countries = [];

  // D'autre code viendra ici

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DIO"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _queryTextField(),
            SizedBox(height: 24),
            _searchButtons(),
            SizedBox(height: 16),
            _countryListView(),
          ],
        ),
      ),
    );
  }

  Expanded _countryListView() {
    return Expanded(
      child: ListView.builder(
        itemCount: _countries.length,
        itemBuilder: (BuildContext context, int index) => Row(
          children: [
            Text(_countries[index].emoji, style: TextStyle(fontSize: 32)),
            SizedBox(width: 24),
            Flexible(child: Text(_countries[index].description)),
          ],
        ),
      ),
    );
  }

  Row _searchButtons() {
    return Row(
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
    );
  }

  TextField _queryTextField() {
    return TextField(
      controller: _countryTextController,
      decoration: InputDecoration(
        // Si vous voulez tester, le nom des pays doivent être en anglais. "uni" est un bon terme de recherche.                hintText: 'Ex : peru',
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
  try {
    final List<CountryDetailsResponse> response = await _countryService
        .getCountryDetails(_countryTextController.text);
    print(response);
    setState(() {
      _countries = response;
    });
  } on DioException catch (e) {
    print(e.error);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(e.response!.data["errors"][0]["message"])),
    );
  }
}
```

#### `_getCountryDetailsThen`

Ici nous avons exactement le même comportement que pour _getCountryDetailsAwait, mais on prend la 2ieme façon de gérer l'appel. L'asynchronisme est géré directement dans la fonction.
Remarquez que `Future{'<'}>`, `async` et `await` ont disparus puisque la fonction anonyme pour gérer le retour sera appelée quand l'appel se terminera. 

```dart 
void _getCountryDetailsThen() {
  // Première ligne exécutée ci dessous
  _countryService
      .getCountryDetails(_countryTextController.text)
      .then(
        // Ce qu'on fait quand tout s'est passé comme on le souhaite
        (List<CountryDetailsResponse> response) {
          // Troisième ligne exécutée, lorsque l'appel HTTP est terminé
          print(response);
          setState(() {
            _countries = response;
          });
        },
        // Ce qu'on fait quand une erreur est survenue
        onError: (e) {
          print(e);
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.response!.data["errors"][0]["message"])),
          );
        },
      );
  // Deuxième ligne exécutée
  print('allo');
}
```

Il n'y a pas toujours une façon de faire qui est meilleure que l'autre. Tout dépend du contexte et de ce qu'on veut faire avec le résultat.

:::tip
Notez que la syntaxe avec `then` existe aussi en [Javascript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then).
:::

## Mot de la fin

Un projet de référence de ce qui a été démontré dans cette recette est disponible [ici](https://github.com/departement-info-cem/5N6-mobile-2/releases/latest/download/code-dio_demo.zip).