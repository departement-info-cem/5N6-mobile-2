import 'package:dio_demo/config/app_config.dart';

class ProdConfig implements AppConfig {
  @override
  String get countryApiUrl => 'https://api.restcountries.com';

  @override
  bool get isDev => true;
}
