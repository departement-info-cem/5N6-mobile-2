import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:navigation/app_config.dart';
import 'package:navigation/page/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comparaison - Accueil')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            if (AppConfig.useNavigator) {
              // TODO B2 : Naviguer vers la page de détail avec le Navigator
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (_) => DetailPage(id: 42)));
            } else {
              // TODO A4 : Naviguer vers la page de détail avec le Router
              // Attention, pour être capable d'utiliser context.go, il faut avoir importé import 'package:go_router/go_router.dart';
              // Pour votre curiosité, c'est ce qu'on appelle une extension en Dart : https://dart.dev/language/extension-methods
              context.go('/detail/42');
            }
          },
          child: const Text('Voir le détail (ID: 42)'),
        ),
      ),
    );
  }
}
