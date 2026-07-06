import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_list/transfert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste JSON',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int reponse = -1;

  Truc truc = Truc();

  List<Truc> trucs = [];

  void getHttp() async {
    try {
      var response = await Dio().get(
        'https://fourn6-mobile-prof.onrender.com/exos/long/double/99',
      );
      print(response);
      reponse = response.data;
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Erreur reseau')));
    }
  }

  void getHttpComplex(String nom) async {
    try {
      var response = await Dio().get(
        'https://fourn6-mobile-prof.onrender.com/exos/truc/complexe?name=$nom',
      );
      print(response);
      truc = Truc.fromJson(response.data);
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Erreur reseau')));
    }
  }

  void getHttpListComplex() async {
    try {
      var response = await Dio().get(
        'https://fourn6-mobile-prof.onrender.com/exos/truc/list',
      );
      print(response);
      var listeJSON = response.data as List;
      var listeTruc = listeJSON.map((elementJSON) {
        return Truc.fromJson(elementJSON);
      }).toList();
      trucs = listeTruc;
      setState(() {});
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Erreur reseau')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste JSON')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text('le nombre est ${truc.b}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          int a = 0;
          int b = a + a;
          getHttp();
          getHttpComplex('joris');
          getHttpListComplex();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
