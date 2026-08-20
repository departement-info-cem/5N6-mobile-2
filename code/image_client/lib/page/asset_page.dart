import 'package:flutter/material.dart';

class AssetPage extends StatelessWidget {
  const AssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Asset')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TODO #1b - Référerencer les images ici des assets en spécifiant le chemin dans le projet Flutter
            Image.asset('assets/images/anse-aux-gascons.jpeg'),
            const SizedBox(height: 20),
            const Text(
              'L\'anse aux gascons - Marc-Aurèle Fortin, 1942.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
