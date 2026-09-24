import 'package:demo_firestore/config/app_config.dart';

class ProdConfig implements AppConfig {
  @override
  String get emulatorIp => '';

  @override
  bool get isDev => false;
}
