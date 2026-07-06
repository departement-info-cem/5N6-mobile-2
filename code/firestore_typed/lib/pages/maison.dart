import 'dart:math';

import 'package:firestore_typed/model/pipo.dart';
import 'package:firestore_typed/nav/tiroir_nav.dart';
import 'package:firestore_typed/pages/utils.dart';
import 'package:firestore_typed/service.dart';
import 'package:flutter/material.dart';

class MaisonPage extends StatefulWidget {
  const MaisonPage({super.key});

  @override
  State<MaisonPage> createState() => _MaisonPageState();
}

class _MaisonPageState extends State<MaisonPage> {

  List<Pipo> liste = [];

  @override
  void initState() {
    super.initState();
    chargerListe();
  }

  void chargerListe() async {
    this.liste = await piposCommeUneListe();
    setState(() {});
  }

  void chargerListeSous50() async {
    this.liste = await piposSous50();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[500],
        title: const Text("Firestore Mama!!"),
        actions: <Widget>[
          TextButton(
            child: Text(
              "<50",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              chargerListeSous50();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              chargerListe();
            },
          )
        ],
      ),
      drawer: LeTiroir(),
      body: ListView(
        children: this.liste.map(
            convertisseurDePipo
        ).toList() ,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Pipo pipo = Pipo();
          pipo.pipi = "coucou";
          pipo.popo = DateTime.now();
          pipo.popi = Random().nextInt(100);
          await ajoutPipo(pipo);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

}
