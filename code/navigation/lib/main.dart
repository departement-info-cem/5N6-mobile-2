import 'package:flutter/material.dart';
import 'package:navigation/app_config.dart';
import 'package:navigation/core/app_router.dart';
import 'package:navigation/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (AppConfig.useNavigator) {
      // TODO B1 : Il n'y a rien à ajouter pour le Navigator.
      // C'est la même chose que sur n'importe quel projet de départ.
      return MaterialApp(
        title: 'Navigation avec Navigator',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const HomePage(),
      );
    } else {
      // TODO A1 : Il faut remplacer MaterialApp par MaterialApp.router lorsqu'on utilise Router
      return MaterialApp.router(
        title: 'Navigation avec Router',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.red)),
        // TODO A2 : C'est le routeur qui s'occupe de choisir la page de départ
        // Faites Ctrl + Click (ou F12) sur appRouter pour aller voir sa définition
        routerConfig: appRouter,
      );
    }
  }
}
