import 'package:demo_cloud_functions/config/app_config.dart';

class AndroidDevConfig implements AppConfig {
  @override
  bool get isDev => true;

  @override
  String get emulatorIp => '10.0.2.2'; // L'ordinateur hôte, vu de l'émulateur Android
}
