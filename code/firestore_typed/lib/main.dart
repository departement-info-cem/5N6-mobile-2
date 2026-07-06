import 'package:firebase_core/firebase_core.dart';
import 'package:firestore_typed/firebase_options.dart';
import 'package:firestore_typed/pages/maison.dart';
import 'package:flutter/material.dart';

// TODO autre page où on accède à la liste realtime


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore avec des types Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: const MaisonPage(),
    );
  }
}
