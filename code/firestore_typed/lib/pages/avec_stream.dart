import 'dart:math';

import 'package:firestore_typed/model/pipo.dart';
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

  Stream<List<Pipo>> monStream = piposCommeUnStream();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: const Text("Firestore Mama Stream!!"),
      ),
      drawer: LeTiroir(),
      // TODO cette fois ci on utilise un StreamBuilder. Il va se mettre à jour tout seul
      // qund le stream produit une nouvelle valeur (nouvelle liste suite à ajout / suppression / modif)
      body: StreamBuilder<List<Pipo>>(
        stream: monStream,
        builder: (BuildContext context, AsyncSnapshot<List<Pipo>> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error.toString());
            return const Text('Reloading');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          return ListView(
            children: snapshot.data!
                .map( convertisseurDePipo )
                .toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Pipo pipo = Pipo();
          pipo.pipi = "Depuis le stream";
          pipo.popo = DateTime.now();
          pipo.popi = Random().nextInt(100);
          await ajoutPipo(pipo);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

}
