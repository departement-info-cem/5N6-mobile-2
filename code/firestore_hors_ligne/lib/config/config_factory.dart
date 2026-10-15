import 'package:firestore_hors_ligne/config/android_dev_config.dart';
import 'package:firestore_hors_ligne/config/app_config.dart';
import 'package:firestore_hors_ligne/config/prod_config.dart';

class ConfigFactory {
  static AppConfig create() {
    const environment = String.fromEnvironment(
      'ENV',
      defaultValue: 'android_dev',
    );

    return switch (environment) {
      'android_dev' => AndroidDevConfig(),
      'prod' => ProdConfig(),
      _ => throw Exception('Environnement inconnu : $environment'),
    };
  }
}
