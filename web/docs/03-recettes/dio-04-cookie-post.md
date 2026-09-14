---
description: Envoyer un objet JSON par POST et conserver les cookies de session
hide_table_of_contents: true
---

# DIO 4 - POST et cookies

Une requête POST envoie habituellement un objet JSON dans son corps. Les cookies permettent ensuite au serveur de reconnaître la même session lors des requêtes suivantes.

## Ajouter les dépendances

```bash
flutter pub add dio
flutter pub add cookie_jar
flutter pub add dio_cookie_manager
```

## Conserver les cookies

Le même objet `Dio` doit être réutilisé. Son intercepteur `CookieManager` enregistre les cookies reçus et les ajoute automatiquement aux requêtes suivantes.

```dart
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

final dio = Dio()
  ..interceptors.add(CookieManager(CookieJar()));
```

## Envoyer un objet JSON

Une classe de transfert qui possède `toJson()` peut être envoyée avec `data`.

```dart
final reponse = await dio.post(
  'https://fourn6-mobile-prof.onrender.com/exos/truc/doubler',
  data: {
    'a': 100,
    'b': 'exemple',
    'c': [8, 12, 14],
  },
  options: Options(contentType: Headers.jsonContentType),
);

final resultat = Truc.fromJson(reponse.data as Map<String, dynamic>);
```

Le projet [04-cookie_devtools](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/04-cookie_devtools) montre la configuration de `CookieManager`; le projet [03-post_json_erreur](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/03-post_json_erreur) montre l'envoi d'un DTO avec `toJson()`.

Pour traiter une erreur HTTP, interceptez `DioException` et consultez `exception.response?.statusCode` ainsi que `exception.response?.data`. N'utilisez jamais `!` sur `response` : une erreur réseau peut ne contenir aucune réponse du serveur.

