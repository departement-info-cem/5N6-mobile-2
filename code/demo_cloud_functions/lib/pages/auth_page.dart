import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // Les comptes de test n'existent que dans l'émulateur Auth
  static const String _motDePasse = 'motdepasse';

  String _message = 'Appelez monProfil sans être connecté, puis connecté.';
  bool _enCours = false;

  Future<void> _seConnecter(String courriel) async {
    await _executer(() async {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: courriel,
          password: _motDePasse,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code != 'user-not-found' && e.code != 'invalid-credential') {
          rethrow;
        }
        // Le compte n'existe pas encore dans l'émulateur : on le crée, ce qui
        // connecte aussi l'utilisateur
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: courriel,
          password: _motDePasse,
        );
      }
      return 'Connecté en tant que $courriel.';
    });
  }

  Future<void> _seDeconnecter() async {
    await _executer(() async {
      await FirebaseAuth.instance.signOut();
      return 'Déconnecté.';
    });
  }

  Future<void> _appelerMonProfil() async {
    await _executer(() async {
      // Rien à ajouter pour l'authentification : le SDK envoie lui-même le
      // jeton de l'utilisateur connecté
      final resultat = await FirebaseFunctions.instance
          .httpsCallable('monProfil')
          .call<Map<String, dynamic>>();
      return 'Réponse du serveur :\n'
          'uid : ${resultat.data['uid']}\n'
          'courriel : ${resultat.data['courriel']}';
    });
  }

  // Gère l'indicateur de chargement et les erreurs communes à tous les appels
  Future<void> _executer(Future<String> Function() action) async {
    setState(() => _enCours = true);
    try {
      final message = await action();
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
    } on FirebaseAuthException catch (e) {
      setState(
        () =>
            _message = 'Erreur d\'authentification (${e.code}) : ${e.message}',
      );
    } finally {
      setState(() => _enCours = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Requête authentifiée')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                final utilisateur = snapshot.data;
                return Text(
                  utilisateur == null
                      ? 'Personne n\'est connecté.'
                      : 'Utilisateur connecté : ${utilisateur.email}',
                  textAlign: TextAlign.center,
                );
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _enCours
                  ? null
                  : () => _seConnecter('alice@exemple.com'),
              child: const Text('Se connecter en tant qu\'Alice'),
            ),
            ElevatedButton(
              onPressed: _enCours
                  ? null
                  : () => _seConnecter('bob@exemple.com'),
              child: const Text('Se connecter en tant que Bob'),
            ),
            ElevatedButton(
              onPressed: _enCours ? null : _seDeconnecter,
              child: const Text('Se déconnecter'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _enCours ? null : _appelerMonProfil,
              child: const Text('Appeler monProfil'),
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
