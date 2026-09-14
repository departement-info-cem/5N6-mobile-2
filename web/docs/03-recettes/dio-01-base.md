---
description: Effectuer une requête HTTP GET avec DIO
hide_table_of_contents: true
---

# DIO 1 - Requête GET de base

[DIO](https://pub.dev/packages/dio) est une bibliothèque Dart pour envoyer des requêtes HTTP. Contrairement à Retrofit, vous créez un client `Dio` et appelez directement ses méthodes `get`, `post`, etc.

## Dépendance et permission Internet

Depuis le dossier de votre projet Flutter, ajoutez DIO :

```bash
flutter pub add dio
```

Pour une application Android, vérifiez aussi que `android/app/src/main/AndroidManifest.xml` contient cette permission :

```xml
<uses-permission android:name="android.permission.INTERNET" />
```

## Envoyer une requête GET

Le projet [01-acces_simple](https://github.com/departement-info-cem/5N6-mobile-2/tree/main/code/http/01-acces_simple) appelle un service qui double un nombre.

```dart
import 'package:dio/dio.dart';

final dio = Dio();
final response = await dio.get(
  'https://fourn6-mobile-prof.onrender.com/exos/long/double/99',
);

final int resultat = response.data;
```

`await` attend la réponse sans bloquer l'interface graphique. La réponse HTTP est un objet `Response`; son champ `data` contient le JSON déjà décodé par DIO.

## Gérer les erreurs

Une requête peut échouer parce que le réseau est indisponible, que le serveur répond avec une erreur ou que l'URL est invalide. Interceptez précisément les erreurs DIO :

```dart
try {
  final response = await dio.get(url);
  final int resultat = response.data;
} on DioException catch (erreur) {
  debugPrint('Erreur HTTP : ${erreur.message}');
}
```

Utilisez les outils de développement de votre IDE et les journaux de débogage pour examiner l'URL, le code HTTP et le contenu de la réponse.

