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

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/04-cookie_devtools/lib/lib_http.dart"
  startLine="1"
  endLine="15"
/>

## Envoyer un objet JSON

Une classe de transfert qui possède `toJson()` peut être envoyée avec `data`.

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/03-post_json_erreur/lib/lib_http.dart"
  startLine="1"
  endLine="17"
/>

<GHCode
  repo="5N6-Mobile-2"
  filePath="code/http/03-post_json_erreur/lib/transfert.dart"
/>

Le projet [04-cookie_devtools](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/04-cookie_devtools) montre la configuration de `CookieManager`; le projet [03-post_json_erreur](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/03-post_json_erreur) montre l'envoi d'un DTO avec `toJson()`.

Pour traiter une erreur HTTP, interceptez `DioException` et consultez `exception.response?.statusCode` ainsi que `exception.response?.data`. N'utilisez jamais `!` sur `response` : une erreur réseau peut ne contenir aucune réponse du serveur.
