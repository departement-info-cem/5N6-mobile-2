import 'package:demo_firestore/config/android_dev_config.dart';
import 'package:demo_firestore/config/app_config.dart';
import 'package:demo_firestore/config/prod_config.dart';

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
