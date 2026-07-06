import 'package:flutter/material.dart';
import 'package:image_client/dynamique.dart';

class FixePage extends StatefulWidget {
  const FixePage({Key? key}) : super(key: key);

  @override
  State<FixePage> createState() => _FixePageState();
}

class _FixePageState extends State<FixePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestion de la taille des images'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DynamiquePage(),
                  ),
                );
              },
              child: const Text("Page avec tailles dynamiques")),
          Expanded(
            child: ListView(children: [
              //TODO Pour utiliser des images de taille fixe, c'est plutôt simple,
              // il suffit de spécifier au serveur la taille d'image désirée
              // Soit la taille du contrôle
              Image.network(
                "https://fourn6-mobile-prof.onrender.com/exos/image?width=10",
                width: 10,
              ),
              Image.network(
                "https://fourn6-mobile-prof.onrender.com/exos/image?width=50",
                width: 50,
              ),
              Image.network(
                "https://fourn6-mobile-prof.onrender.com/exos/image?width=100",
                width: 100,
              ),
              Image.network(
                "https://fourn6-mobile-prof.onrender.com/exos/image",
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
