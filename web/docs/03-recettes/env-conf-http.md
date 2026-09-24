---
description: Effectuer une requête HTTP GET avec DIO
---

# Environnement, Configuration, et HTTP

## 1. Créer le projet 🆕

Dans Visual Studio Code, lancez la palette de commande, et sélectionner `Flutter : Create New Project`. Dans le template à choisir, sélectionnez `Empty Application`.

## 2. Environnement 🪙

Nous allons utiliser le service [REST Countries](https://restcountries.com/) comme service REST. Créez vous un compte, et trouvez la clé d'API créée par défaut. Elle devrait commencer par `rc_live`. Cette clé est votre **laissez-passer 🪪** pour intéragir avec l'API de REST Countries.

:::caution 
Ce token ne devrait jamais se retrouver sur GitHub. Si par mégarde, ça vous arrive, il faut immédiatement faire une **rotation** (générer une nouvelle clé et désactiver l'ancienne). Si ça arrive dans votre vie professionnelle, avertissez votre superviseur dans les plus brefs délais.
:::

### 2.1 `.env` 🏞️

Nous allons ajouter le token dans un fichier `.env` qui n'est qu'une liste de clé=valeur.

```env
REST_COUNTRIES_API_KEY=VOTRE_CLÉ_ICI!!!
```

Pour éviter que `.env` ne se retrouve dans votre repo git, ajoutons le à votre `.gitignore` :

```gitignore
// Reste des éléments ignorés

.env
```

### 2.2 `flutter_dotenv` 🐦🏞️

Le package [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv) va nous permettre d'utiliser les valeurs qui sont dans `.env` dans notre code.

Suivez les instructions sur la page du package pour compléter son installation. Un exemple est fourni pour utiliser la librairie.

:::danger Attention!
S'il n'y a aucune clé valeur dans votre fichier `.env`, le lancement de l'application va échouer.
:::

### 2.3 Bonus : `.env.example` 🏞️🏞️

Si jamais vous voulez être gentil avec votre futur vous, vous pouvez créer un fichier `.env.example` qui est une copie de `.env`, mais sans les valeurs. Ainsi c'est plus rapide de savoir quelles tokens vous devez garder. 

```env
REST_COUNTRIES_API_KEY=
```

:::tip
C'est assez standard de devoir utiliser un token pour accéder à un service externe. Par contre, ce qui n'est pas standard, c'est de stocker le token sur le client (votre application). La bonne pratique serait de passer par un serveur (ex : .NET Core, SpringBoot, etc.) pour faire les requêtes, pour éviter que n'importe qui puisse récupérer le token et faire des requêtes en votre nom 🥸. La documentation de [`flutter_dotenv`](https://pub.dev/packages/flutter_dotenv#security) en fait d'ailleurs mention.
:::


## 3. Base HTTP

Bon finalement! Nous nous lançons!

[DIO](https://pub.dev/packages/dio) est une bibliothèque Dart pour envoyer des requêtes HTTP. Vous créez un client `dio` et appelez directement ses méthodes `get`, `post`, etc.

### 3.1 Dépendance 🚬

Depuis le dossier de votre projet Flutter, ajoutez `dio` :

```bash
flutter pub add dio
```

### 3.2 Architecture 📐

Puisque vous commencez à savoir ce qu'est une requête HTTP, nous allons surtout nous concentrer sur l'architecture de notre application. Notre objectif sera d'avoir une première version viable, que nous allons ensuite retravailler.

Voici ce que nous vous proposons pour commencer : 

```text
lib/
├── config/
│   └── app_config.dart           // Le même config créé à l'étape #3 
│── network/
│   └── api_client.dart           // On centralise le client qui effectue les requêtes. 
│── pages/                 
│   └── country_search_page.dart  // Page qui va afficher le résultat des appels.
└── services/                     // Services qui effectuent les requêtes HTTP
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

Ici on le propage : _getCountryDetails retourne un type Futur{'<'}> et est async.

```dart
Future<void> _getCountryDetailsAwait() async {
  //
  final Response<dynamic> response = await _countryService.getCountryDetails(
    _countryTextController.text,
  );
  print(response.data);
}
```

#### `_getCountryDetailsThen`

Ici nous avons exactement le même comportement que pour _getCountryDetailsAwait, mais on prend la 2ieme façon de gérer l'appel
L'asynchronisme est géré directement dans la fonction
Remarquez que Future{'<'}>, async et await ont disparus

```dart 
void _getCountryDetailsThen() {
  _countryService.getCountryDetails(_countryTextController.text).then((value,) { // Première ligne exécutée
    print(value.data); // Troisième ligne exécutée, lorsque l'appel HTTP est terminé
  });
  print('allo'); // Deuxième ligne exécutée
}
```

Il n'y a pas toujours une façon de faire qui est meilleure que l'autre. Tout dépend du contexte et de ce qu'on veut faire avec le résultat.

### 4. HTTP, mais mieux!

Maintenant que nous avons un minimum viable, nous allons rendre notre code pour qu'il soit plus résilient.



## Gérer les erreurs

Une requête peut échouer parce que le réseau est indisponible, que le serveur répond avec une erreur ou que l'URL est invalide. Le projet intercepte cette erreur et informe l'utilisateur avec un `SnackBar`.

Utilisez les outils de développement de votre IDE et les journaux de débogage pour examiner l'URL, le code HTTP et le contenu de la réponse.
