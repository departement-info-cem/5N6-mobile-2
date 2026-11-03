import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';

class HelloWorldPage extends StatefulWidget {
  const HelloWorldPage({super.key});

  @override
  State<HelloWorldPage> createState() => _HelloWorldPageState();
}

class _HelloWorldPageState extends State<HelloWorldPage> {
  final TextEditingController _nomController = TextEditingController();
  String _message = 'Appuyez sur un bouton pour appeler une fonction.';
  bool _enCours = false;

  @override
  void dispose() {
    _nomController.dispose();
    super.dispose();
  }

  Future<void> _appelerHelloWorld() async {
    await _appeler(() async {
      final resultat = await FirebaseFunctions.instance
          .httpsCallable('helloWorld')
          .call<String>();
      return resultat.data;
    });
  }

  Future<void> _appelerDireBonjour() async {
    await _appeler(() async {
      final resultat = await FirebaseFunctions.instance
          .httpsCallable('direBonjour')
          .call<Map<String, dynamic>>({'nom': _nomController.text});
      return '${resultat.data['message']}\n'
          'Heure du serveur : ${resultat.data['heureServeur']}';
    });
  }

  // Gère l'indicateur de chargement et les erreurs communes aux deux appels
  Future<void> _appeler(Future<String> Function() appel) async {
    setState(() => _enCours = true);
    try {
      final message = await appel();
      setState(() => _message = message);
    } on FirebaseFunctionsException catch (e) {
      if (e.code == 'unavailable') {
        setState(
          () => _message =
              'Le serveur de fonction n\'est pas disponible. Avez-vous allumé votre émulateur?',
        );
      } else {
        setState(() => _message = 'Erreur (${e.code}) : ${e.message}');
      }
    } finally {
      setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hello World')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _enCours ? null : _appelerHelloWorld,
              child: const Text('Appeler helloWorld'),
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _nomController,
              decoration: const InputDecoration(
                labelText: 'Nom',
                helperText: 'Laissez vide pour obtenir une erreur',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: _enCours ? null : _appelerDireBonjour,
              child: const Text('Appeler direBonjour'),
            ),
            const SizedBox(height: 32),
            if (_enCours)
              const Center(child: CircularProgressIndicator())
            else
              Text(_message, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
