import 'package:demo_cloud_functions/config/android_dev_config.dart';
import 'package:demo_cloud_functions/config/app_config.dart';
import 'package:demo_cloud_functions/config/prod_config.dart';

class ConfigFactory {
  static AppConfig create() {
    const environment = String.fromEnvironment(
      'ENV',
      defaultValue:
          'android_dev', // Valeur par défaut si jamais rien n'a été spécifié
    );

    return switch (environment) {
      'android_dev' => AndroidDevConfig(),
      'prod' => ProdConfig(),
      _ => throw Exception('Environnement inconnu : $environment'),
    };
  }
}
