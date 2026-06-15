import 'package:demo_notification/pages/notifications_page.dart';
import 'package:demo_notification/services/notifications_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

// TODO #17.1 : Déclaration du navigator key
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  // TODO #1 : Initialiser Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// TODO #9 Transformer le widget en Stateful.
// Truc : Mettre son curseur sur le nom de la classe, puis appuyer sur Alt+Entrée.
//        Choisir "Convert to StatefulWidget"
class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // TODO #10 : Mettre en place les de notifications
    setupFirebaseMessaging();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Demo Notifications',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const NotificationsPage(),
        // TODO #17.2 : Assignation du navigator key
        navigatorKey: navigatorKey);
  }
}
