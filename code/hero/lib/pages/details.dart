import 'package:flutter/material.dart';

import '../model/mascotte.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.mascotte});

  final Mascotte mascotte;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(mascotte.nom),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _image(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_nom(), const SizedBox(height: 16.0), _description()],
            ),
          ),
        ],
      ),
    );
  }

  Hero _image() {
    return Hero( // TODO 4.1 : Ajouter un Hero autour de ce qui va être animé
      tag: mascotte.image, // TODO 5.1 : Utiliser exactement le même tag que dans la tuile
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(12.0),
          bottomRight: Radius.circular(12.0),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 300,
          child: Image.asset(mascotte.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Hero _nom() {
    return Hero( // TODO 4.2 : Ajouter un Hero autour de ce qui va être animé
      tag: '${mascotte.image}_nom', // TODO 5.2 : Utiliser exactement le même tag que dans la tuile
      child: Material( // TODO 6.1 : Il faut englober le texte d'un Material ici aussi
        type: MaterialType.transparency,
        child: Text(
          mascotte.nom,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Hero _description() {
    return Hero( // TODO 4.3: Ajouter un widget Hero autour de ce qui va être animé
      tag: '${mascotte.image}_description', // TODO 5.3 : Utiliser exactement le même tag que dans la tuile
      child: Material( // TODO 6.2 : Il faut englober le texte d'un Material ici aussi
        type: MaterialType.transparency,
        child: Text(mascotte.description, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
