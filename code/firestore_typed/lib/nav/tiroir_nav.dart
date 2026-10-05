import 'package:firestore_typed/pages/ajout_etudiant.dart';
import 'package:firestore_typed/pages/avec_stream.dart';
import 'package:firestore_typed/pages/maison.dart';
import 'package:flutter/material.dart';

class LeTiroir extends StatefulWidget {
  const LeTiroir({
    super.key,
    this.onEtudiantAjoute,
  });

  final VoidCallback? onEtudiantAjoute;

  @override
  State<LeTiroir> createState() => LeTiroirState();
}

class LeTiroirState extends State<LeTiroir> {
  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        Container(
          height: 200,
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Firestore"),
          onTap: () {
            // TODO ferme le tiroir de navigation
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MaisonPage(),
              ),
            );
            // Then close the drawer
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.person_add),
          title: const Text('Ajouter un étudiant'),
          onTap: () async {
            final navigator = Navigator.of(context);
            navigator.pop();
            final ajoutEffectue = await navigator.push<bool>(
              MaterialPageRoute(
                builder: (context) => const AjoutEtudiantPage(),
              ),
            );
            if (ajoutEffectue == true) {
              widget.onEtudiantAjoute?.call();
            }
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.ac_unit),
          title: const Text("Avec Stream"),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MaisonStreamPage(),
              ),
            );
            // Then close the drawer
          },
        ),
      ],
    );

    return Drawer(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: listView,
      ),
    );
  }
}
