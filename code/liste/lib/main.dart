import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liste/model/liste_element.dart' show ListeElement;
import 'package:liste/page/demo_liste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoListe(title: 'liste'),
    );
  }
}
