import 'package:flutter/material.dart';

import '../model/mascotte.dart';
import '../widgets/separateur.dart';
import '../widgets/tuile.dart';

class AccueilPage extends StatefulWidget {
  const AccueilPage({super.key});

  @override
  State<AccueilPage> createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Démonstration Hero'),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Separateur(),
        itemCount: mascottes.length,
        itemBuilder: (context, index) => Tuile(mascotte: mascottes[index]),
      ),
    );
  }
}
