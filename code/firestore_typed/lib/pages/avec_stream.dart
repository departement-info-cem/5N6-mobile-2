import 'package:firestore_typed/model/etudiant.dart';
import 'package:firestore_typed/nav/tiroir_nav.dart';
import 'package:firestore_typed/pages/utils.dart';
import 'package:firestore_typed/service.dart';
import 'package:flutter/material.dart';

// Les différences, il faut wrap le widget final avec un StreamBuilder
// Par contre pas besoin de initState
class MaisonStreamPage extends StatefulWidget {
  const MaisonStreamPage({super.key});

  @override
  State<MaisonStreamPage> createState() => _MaisonPageState();
}

class _MaisonPageState extends State<MaisonStreamPage> {
  final Stream<List<Etudiant>> monStream = observerEtudiants();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: const Text('Étudiants Firestore (flux)'),
      ),
      drawer: const LeTiroir(),
      body: StreamBuilder<List<Etudiant>>(
        stream: monStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<Etudiant>> snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur de chargement : ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            children: snapshot.data!.map(convertirEtudiant).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ajouterEtudiant(
            const Etudiant(nom: 'Grace Hopper', matricule: '2345678'),
          );
        },
        tooltip: 'Ajouter un étudiant valide',
        child: const Icon(Icons.person_add),
      ),
    );
  }
}
