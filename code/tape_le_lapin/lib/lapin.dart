import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _random = Random();
  Timer? _minuterie;

  int _positionLapin = 0;
  int _scoreBonk = 0;
  int _scoreZloop = 0;

  @override
  void initState() {
    super.initState();
    _nouvellePosition();
  }

  @override
  void dispose() {
    _minuterie?.cancel();
    super.dispose();
  }

  void _nouvellePosition() {
    // Arrêter la minuterie si elle est déjà démarrée
    // highlight-next-line
    _minuterie?.cancel();

    setState(() {
      _positionLapin = _random.nextInt(4);
    });

    // La fonction anonyme est appelée à toutes les secondes
    // highlight-start
    _minuterie = Timer(const Duration(seconds: 1), () {
      _nouvellePosition();
    });
    // highlight-end
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Tape le 🐇', style: TextStyle(fontSize: 40)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Bonk : $_scoreBonk",
                  style: TextStyle(color: Colors.green, fontSize: 30),
                ),
                Text(
                  "Zloop : $_scoreZloop",
                  style: TextStyle(color: Colors.red, fontSize: 30),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true, // Dimensionner selon le contenu
              physics: NeverScrollableScrollPhysics(), // Empêcher de scroller
              crossAxisCount: 2, // Nombre de colonnes
              mainAxisSpacing: 20, // Espacement vertical
              crossAxisSpacing: 20, // Espacement horizontal
              padding: EdgeInsets.all(20), // Espacement autour
              children: List.generate(4, (index) {
                String emoji = _positionLapin == index ? "🐇" : "🐹";
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (index == _positionLapin) {
                        _scoreBonk++;
                      } else {
                        _scoreZloop++;
                      }
                    });
                    _nouvellePosition();
                  },
                  child: Text(emoji, style: TextStyle(fontSize: 100)),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
