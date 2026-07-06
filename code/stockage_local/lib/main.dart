import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stockage local',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Stockage local'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late SharedPreferences _prefs;
  String texteSauvegarde = '';
  final _myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // TODO 1 Obtenir les préférences partagées
    // Attention, on obtient les préférence qu'une seule fois.
    // Si elles sont mises à jour par la suite, il faudra les obtenir à nouveau.
    SharedPreferences.getInstance().then((onValue) {
      _prefs = onValue;
      _obtenirPrefs();
    });
  }

  // TODO 2 Définir les préférences
  _definirPrefs() {
    _prefs.setString('texteSauvegarde', _myController.text);
    setState(() {
      texteSauvegarde = _myController.text;
    });
  }

  // TODO 3 Obtenir les préférences
  _obtenirPrefs() {
    setState(() {
      texteSauvegarde = _prefs.getString('texteSauvegarde') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('Texte sauvegardé : $texteSauvegarde'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _textField(),
                _btnSauvegarder(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton _btnSauvegarder() {
    return ElevatedButton(
      onPressed: () => _definirPrefs(),
      child: const Text('Sauvegarder'),
    );
  }

  Expanded _textField() {
    return Expanded(
      child: TextField(
        controller: _myController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Entrez le texte à sauvegarder ',
        ),
      ),
    );
  }
}
