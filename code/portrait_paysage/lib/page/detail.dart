import 'package:flutter/material.dart';
import 'package:portrait_paysage/widget/contenu_principal.dart';

class Detail extends StatelessWidget {
  static const double _seuilDeuxColonnes = 700;

  final String contenu;

  const Detail({super.key, required this.contenu});

  @override
  Widget build(BuildContext context) {
    // TODO #8 : La fonction build est rappelée à chaque fois que la taille de l'écran change,
    // donc on peut détecter si on est en mode master/detail ou navigation simple.
    return LayoutBuilder(
      builder: (context, constraints) {
        // TODO #8 : Détecter si la largeur de l'écran est suffisante pour revenir à la vue principale.
        if (constraints.maxWidth >= _seuilDeuxColonnes) {
          // TODO #9 : Utiliser un callback après le rendu pour fermer proprement la page de détail.
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          });
        }

        return Scaffold(
          appBar: AppBar(title: const Text('Détail')),
          body: DetailContent(contenu: contenu),
        );
      },
    );
  }
}

class DetailContent extends StatelessWidget {
  final String contenu;

  const DetailContent({super.key, required this.contenu});

  @override
  Widget build(BuildContext context) {
    // TODO #10 : Afficher le contenu du détail dans un conteneur centré avec marge.
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: ContenuPrincipal(contenu: contenu),
      ),
    );
  }
}
