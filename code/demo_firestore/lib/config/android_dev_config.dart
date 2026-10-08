import 'package:demo_firestore/config/app_config.dart';

class AndroidDevConfig implements AppConfig {
  @override
  String get emulatorIp =>
      const String.fromEnvironment('EMULATOR_IP', defaultValue: '10.0.2.2');

  @override
  bool get isDev => true;
}
