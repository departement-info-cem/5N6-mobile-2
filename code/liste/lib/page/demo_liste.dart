import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liste/model/liste_element.dart';

class DemoListe extends StatefulWidget {
  const DemoListe({super.key, required this.title});

  final String title;

  @override
  State<DemoListe> createState() => _DemoListeState();
}

class _DemoListeState extends State<DemoListe> {
  List<ListeElement> listeEnMemoire = [];

  List<String> tableauSansVirguleALaFin = ["Salut", "Bonjour", "Allo", "Holla"];

  @override
  void initState() {
    super.initState();
    listeEnMemoire = [];
    for (var i = 0; i < 100; i++) {
      ListeElement element = ListeElement(
        "element #${i.toRadixString(16)}",
        (i + 5) * 10 + 3,
        (i % 5 == 0),
      );
      listeEnMemoire.add(element);
    }
  }

  void rafraichir() {
    listeEnMemoire = [];
    Random rand = Random();
    for (var i = 0; i < 20; i++) {
      int age = rand.nextInt(70) + 10;
      ListeElement element = ListeElement(
        "rafraichir #${age.toRadixString(2)}",
        age,
        age % 3 == 0,
      );
      listeEnMemoire.add(element);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DemoListe'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: listeEnMemoire.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text('item #${listeEnMemoire[index].nom}'));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: rafraichir,
        tooltip: 'Increment',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
