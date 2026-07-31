import 'package:flutter/material.dart';
import 'package:portrait_paysage/page/detail.dart';
import 'package:portrait_paysage/widget/contenu_principal.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const double _seuilDeuxColonnes = 700;

  final _liste = List<String>.generate(100, (i) => 'element ${i + 1}');
  String? _selected;

  void _selectItem(String item, bool useDeuxColonnes) {
    // TODO #4 : Déterminer si on est en mode master/detail (écran large) ou navigation simple (écran étroit).
    setState(() {
      _selected = item;
    });

    if (!useDeuxColonnes) {
      // TODO #5 : Naviguer vers la page de détail lorsqu'on est sur un écran étroit.
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (context) => Detail(contenu: item)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Master/Detail'),
        actions: [
          if (_selected != null)
            IconButton(
              // TODO #6 : Permettre de vider la sélection quand on veut recommencer.
              onPressed: () => setState(() => _selected = null),
              icon: const Icon(Icons.clear),
            ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // TODO #1 : Utiliser LayoutBuilder pour adapter le widget à la taille disponible.
          final useDeuxColonnes = constraints.maxWidth >= _seuilDeuxColonnes;
          if (useDeuxColonnes) {
            // TODO #2 : Afficher la liste et le détail côte à côte sur un écran large.
            return _paysage();
          }

          return _listeLayout(useDeuxColonnes: false);
        },
      ),
    );
  }

  Widget _listeLayout({required bool useDeuxColonnes}) {
    return ListView.builder(
      itemCount: _liste.length,
      itemBuilder: (context, index) {
        final item = _liste[index];
        final selected = item == _selected;

        return ListTile(
          // TODO #3 : Mettre en évidence l’élément sélectionné,
          // avec un bonne vielle condition ternaire -> condition ? valeur_si_vrai : valeur_si_faux
          tileColor: selected ? Colors.black12 : Colors.transparent,
          leading: selected
              ? const Icon(Icons.arrow_right)
              : const Icon(Icons.list),
          title: Text(item),
          subtitle: const Text('Description détaillée'),
          onTap: () => _selectItem(item, useDeuxColonnes),
        );
      },
    );
  }

  Widget _paysage() {
    // TODO #7 : Recomposer une vue en deux colonnes avec la liste et le détail.
    return Row(
      children: <Widget>[
        Expanded(flex: 1, child: _listeLayout(useDeuxColonnes: true)),
        Expanded(
          flex: 2,
          child: Container(
            color: Theme.of(
              context,
            ).colorScheme.surfaceVariant.withOpacity(0.35),
            child: _selected == null
                ? const Center(
                    child: Text('Sélectionnez un élément dans la liste'),
                  )
                : ContenuPrincipal(contenu: _selected),
          ),
        ),
      ],
    );
  }
}
