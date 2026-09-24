import 'package:configuration_demo/config/app_config.dart';

class ProdConfig implements AppConfig {
  @override
  String get apiUrl => 'https://api.montpetitami.quebec';

  @override
  bool get isDev => false;
}
