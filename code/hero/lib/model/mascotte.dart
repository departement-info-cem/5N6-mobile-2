class Mascotte {
  final String nom;
  final String image;
  final String description;

  Mascotte({required this.nom, required this.image, required this.description});
}

final List<Mascotte> mascottes = [
  Mascotte(
    nom: 'Bonhomme Carnaval',
    image: 'assets/images/bonhomme.jpg',
    description: 'Mascotte emblématique du Carnaval de Québec',
  ),
  Mascotte(
    nom: 'Hubert',
    image: 'assets/images/hubert.jpeg',
    description: 'Mascotte de la chaîne de restaurants St-Hubert',
  ),
  Mascotte(
    nom: 'Larry',
    image: 'assets/images/larry.jpeg',
    description: 'Mascotte de Radio-Canada sortie des boules à mites!',
  ),
  Mascotte(
    nom: 'Tigre',
    image: 'assets/images/tigre.jpg',
    description: 'Mascotte de Tigre Géant',
  ),
  Mascotte(
    nom: 'Youpi',
    image: 'assets/images/youpi.png',
    description: 'Allez Canadiens Allez!',
  ),
];
