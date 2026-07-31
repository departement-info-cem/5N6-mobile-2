import 'package:flutter/material.dart';

class ContenuPrincipal extends StatelessWidget {
  final String? contenu;

  const ContenuPrincipal({super.key, this.contenu});

  @override
  Widget build(BuildContext context) {
    if (contenu == null) {
      // TODO #11 : Si on n'a rien selectionné, lorsqu'on est en paysage.
      return const Text('selectionner un truc dans la liste');
    } else {
      // si on a une selection
      return Column(
        children: [
          Padding(padding: const EdgeInsets.all(18.0), child: Text(contenu!)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(height: 50, color: Colors.grey),
          ),
        ],
      );
    }
  }
}
