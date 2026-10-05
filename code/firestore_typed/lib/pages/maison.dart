import 'package:firestore_typed/model/etudiant.dart';
import 'package:firestore_typed/nav/tiroir_nav.dart';
import 'package:firestore_typed/pages/ajout_etudiant.dart';
import 'package:firestore_typed/pages/utils.dart';
import 'package:firestore_typed/service.dart';
import 'package:flutter/material.dart';

class MaisonPage extends StatefulWidget {
  const MaisonPage({super.key});

  @override
  State<MaisonPage> createState() => _MaisonPageState();
}

class _MaisonPageState extends State<MaisonPage> {
  List<Etudiant> liste = [];

  @override
  void initState() {
    super.initState();
    chargerListe();
  }

  void chargerListe() async {
    liste = await obtenirEtudiants();
    setState(() {});
  }

  Future<void> ouvrirAjoutEtudiant() async {
    final ajoutEffectue = await Navigator.of(context).push<bool>(
      MaterialPageRoute(builder: (context) => const AjoutEtudiantPage()),
    );
    if (ajoutEffectue == true) {
      chargerListe();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: const Text('Étudiants Firestore'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              chargerListe();
            },
          )
        ],
      ),
      drawer: LeTiroir(onEtudiantAjoute: chargerListe),
      body: ListView(
        children: liste.map(convertirEtudiant).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ouvrirAjoutEtudiant,
        tooltip: 'Ajouter un étudiant',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
