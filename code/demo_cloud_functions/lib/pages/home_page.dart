import 'package:demo_cloud_functions/pages/auth_page.dart';
import 'package:demo_cloud_functions/pages/hello_world_page.dart';
import 'package:demo_cloud_functions/pages/notifications_page.dart';
import 'package:flutter/material.dart';

class Demo {
  final String titre;
  final IconData icone;
  final Widget page;

  const Demo({required this.titre, required this.icone, required this.page});
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Pour ajouter une démo, ajoutez-la à cette liste
  static const List<Demo> demos = [
    Demo(
      titre: 'Hello World',
      icone: Icons.waving_hand,
      page: HelloWorldPage(),
    ),
    Demo(titre: 'Requête authentifiée', icone: Icons.lock, page: AuthPage()),
    Demo(
      titre: 'Notifications',
      icone: Icons.notifications,
      page: NotificationsPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Démos Cloud Functions')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        children: demos
            .map(
              (demo) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => demo.page),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(demo.icone, size: 48),
                    const SizedBox(height: 8),
                    Text(demo.titre, textAlign: TextAlign.center),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
