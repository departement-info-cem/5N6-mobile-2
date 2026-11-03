import 'package:cloud_functions/cloud_functions.dart';
import 'package:demo_cloud_functions/config/app_config.dart';
import 'package:demo_cloud_functions/config/config_factory.dart';
import 'package:demo_cloud_functions/firebase_options.dart';
import 'package:demo_cloud_functions/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final AppConfig config = ConfigFactory.create();
  if (config.isDev) {
    FirebaseFunctions.instance.useFunctionsEmulator(config.emulatorIp, 5001);
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
