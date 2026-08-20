import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({super.key});

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  String _imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Network Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  if (_imageUrl.isEmpty) {
                    return const Text(
                      'Aucune image sélectionnée',
                      style: TextStyle(fontSize: 16),
                    );
                  } else {
                    return Image.network(
                      _imageUrl,
                      // TODO #3c : Charger une image peut prendre du temps. On veut toujours indiquer à l'utilisateur qu'il se passe quelque chose.
                      loadingBuilder:
                          (
                            BuildContext context,
                            Widget imageChargee,
                            ImageChunkEvent? loadingProgress,
                          ) {
                            // TODO #3d: Si loadingProgress est null, le téléchargement est terminé.
                            // On retourne alors l'enfant (l'image finale).
                            if (loadingProgress == null) {
                              return imageChargee;
                            }

                            // TODO #3e: On recoit l'image par morceaux. Calcul de la progression du chargement(de 0.0 à 1.0) de l'image.
                            final double? progress =
                                loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null; // null si le serveur ne fournit pas l'en-tête Content-Length

                            // TODO #3f: On retourne un indicateur de progression circulaire avec la valeur de progression calculée.
                            return Center(
                              child: CircularProgressIndicator(
                                value: progress,
                                strokeWidth: 4.0,
                              ),
                            );
                          },
                      // TODO #3b: On a moins de contrôle sur la source de l'image que pour les autres options.
                      // C'est donc toujours important de gérer les erreurs, même lorsque ce n'est pas l'utilisateur qui a le contrôle de l'URL.
                      errorBuilder: (context, error, stackTrace) {
                        return const Text(
                          'Erreur lors du chargement de l\'image',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        );
                      },
                      width: 220,
                      height: 220,
                      fit: BoxFit.cover,
                    );
                  }
                },
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'URL de l\'image',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // TODO #3a : On tente de charger l'image depuis l'URL saisie par l'utilisateur à chaque fois que le contenu du TextField change.
                  // Utilisez cette image pour tester, qui est longue à charger : https://upload.wikimedia.org/wikipedia/commons/3/3f/Fronalpstock_big.jpg
                  setState(() {
                    _imageUrl = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
