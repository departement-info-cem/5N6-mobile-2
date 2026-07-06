import 'package:flutter/material.dart';

import '../model/mascotte.dart';
import '../pages/details.dart';

class Tuile extends StatelessWidget {
  const Tuile({super.key, required this.mascotte});

  final Mascotte mascotte;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPage(mascotte: mascotte),
          ),
        );
      },
      child: SizedBox(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _image(),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [_nom(), _description()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Hero( // TODO 1.1 : Ajouter un widget Hero autour de ce qui va être animé
      tag: mascotte.image, // TODO 2.1 : Le tag doit être unique pour chaque widget Hero
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          width: 150,
          height: 200,
          child: Image.asset(mascotte.image, fit: BoxFit.cover),
        ),
      ),
    );
  }

  Widget _nom() {
    return Hero(
      // TODO 1.2 : Ajouter un widget Hero autour de ce qui va être animé
      tag: '${mascotte.image}_nom', // TODO 2.2 : Le tag doit être unique pour chaque widget Hero
      child: Material( // TODO 3.1 : Lorsque c'est du texte, c'est important de l'englober d'un Material. Essayez de l'enlever pour voir ce qui se passe!
        type: MaterialType.transparency,
        child: Text(
          mascotte.nom,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }

  Widget _description() => Hero(
    // TODO 1.3 : Ajouter un widget Hero autour de ce qui va être animé
    tag: '${mascotte.image}_description', // TODO 2.3 : Le tag doit être unique pour chaque widget Hero
    child: Material( // TODO 3.2 : Lorsque c'est du texte, c'est important de l'englober d'un Material. Essayez de l'enlever pour voir ce qui se passe!
      type: MaterialType.transparency,
      child: Text(
        mascotte.description,
        softWrap: true,
        overflow: TextOverflow.visible,
      ),
    ),
  );
}
