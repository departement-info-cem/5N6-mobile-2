import 'package:dio_demo/config/app_config.dart';
import 'package:dio_demo/config/prod_config.dart';

class ConfigFactory {
  static AppConfig create() {
    const environment = String.fromEnvironment(
      'ENV',
      defaultValue:
          'android_dev', // Valeur par défaut si jamais rien n'a été spécifié
    );

    return switch (environment) {
      'prod' => ProdConfig(),
      _ => throw Exception('Environnement inconnu : $environment'),
    };
  }
}
