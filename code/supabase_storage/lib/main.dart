import 'package:flutter/material.dart';
import 'package:image_envoi/pages/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //TODO Initialize like Firebase doc: https://supabase.com/docs/reference/dart/initializing
  await Supabase.initialize(
    url: 'https://wymerfgzjfkjrmwldkca.supabase.co',
    publishableKey:
        'VOTRE_CLE_ICI!', // publishableKey fonctionne comme anonKey.
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
