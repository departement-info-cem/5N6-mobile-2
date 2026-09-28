import 'package:dio/dio.dart';
import 'package:dio_demo/config/app_config.dart';
import 'package:dio_demo/config/config_factory.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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
