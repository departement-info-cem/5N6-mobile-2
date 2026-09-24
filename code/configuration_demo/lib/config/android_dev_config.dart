import 'package:configuration_demo/config/app_config.dart';

class AndroidDevConfig implements AppConfig {
  @override
  String get apiUrl => 'http://10.0.2.2';

  @override
  bool get isDev => true;
}
