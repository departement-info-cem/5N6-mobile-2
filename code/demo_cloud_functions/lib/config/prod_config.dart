import 'package:demo_cloud_functions/config/app_config.dart';

class ProdConfig implements AppConfig {
  @override
  bool get isDev => false;

  @override
  String get emulatorIp => ''; // Aucun émulateur en production
}
