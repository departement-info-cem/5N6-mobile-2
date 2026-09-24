import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firestore/config/app_config.dart';
import 'package:demo_firestore/config/config_factory.dart';
import 'package:demo_firestore/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final AppConfig config = ConfigFactory.create();
  if (config.isDev) {
    FirebaseFirestore.instance.useFirestoreEmulator(config.emulatorIp, 8080);
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: MaterialButton(
            onPressed: () {
              final db = FirebaseFirestore.instance;
              final user = <String, dynamic>{
                "first": "Ada",
                "last": "Lovelace",
                "born": 1815,
              };
              db
                  .collection("users")
                  .add(user)
                  .then(
                    (DocumentReference doc) =>
                        print('DocumentSnapshot added with ID: ${doc.id}'),
                  );
            },
            child: const Text("Test ajout firestore"),
          ),
        ),
      ),
    );
  }
}
