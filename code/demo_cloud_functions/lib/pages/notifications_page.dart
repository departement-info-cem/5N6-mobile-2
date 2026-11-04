import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // FCM n'a pas d'émulateur : avec la fausse configuration du projet démo,
  // impossible de s'enregistrer auprès de FCM
  final bool _projetDemo = Firebase.app().options.projectId.startsWith('demo-');

  String? _fid;
  String _message = 'Préparation...';
  bool _enCours = false;
  final List<StreamSubscription<Object>> _abonnements = [];

  @override
  void initState() {
    super.initState();
    if (_projetDemo) {
      _message =
          'Cette démo a besoin d\'un vrai projet Firebase, parce que '
          'Cloud Messaging n\'a pas d\'émulateur. Suivez la recette '
          'Notifications pour configurer le projet.';
    } else {
      _preparer();
    }
  }

  Future<void> _preparer() async {
    // Sur Android 13 et plus, l'utilisateur doit accepter les notifications
    final reglages = await FirebaseMessaging.instance.requestPermission();
    if (!mounted) return;
    if (reglages.authorizationStatus == AuthorizationStatus.denied) {
      setState(() => _message = 'Les notifications ont été refusées.');
      return;
    }

    // FCM fournit le FID de cette installation une fois l'enregistrement
    // terminé. C'est à ce FID que le serveur enverra les notifications.
    _abonnements.add(
      FirebaseMessaging.instance.onRegistered.listen((fid) {
        // Affiché dans la console de débogage, pour l'envoi en ligne de commande
        debugPrint('FID : $fid');
        setState(() {
          _fid = fid;
          _message = 'Prêt à recevoir des notifications.';
        });
      }),
    );
    await FirebaseMessaging.instance.register();

    // Application au premier plan : Android n'affiche pas la notification,
    // c'est à l'application de la montrer
    _abonnements.add(
      FirebaseMessaging.onMessage.listen((message) {
        setState(
          () => _message =
              'Reçue au premier plan :\n'
              '${message.notification?.title}\n'
              '${message.notification?.body}',
        );
      }),
    );
    // Application en arrière-plan : Android affiche la notification, et ce
    // flux reçoit le message quand l'utilisateur appuie dessus
    _abonnements.add(
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        setState(
          () => _message =
              'Ouverte depuis la notification :\n'
              '${message.notification?.title}',
        );
      }),
    );
  }

  Future<void> _envoyer() async {
    setState(() => _enCours = true);
    try {
      await FirebaseFunctions.instance
          .httpsCallable('envoyerNotification')
          .call<String>({'fid': _fid});
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
  void dispose() {
    for (final abonnement in _abonnements) {
      abonnement.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: _fid == null || _enCours ? null : _envoyer,
              child: const Text('M\'envoyer une notification'),
            ),
            const SizedBox(height: 32),
            if (_enCours)
              const Center(child: CircularProgressIndicator())
            else
              Text(_message, textAlign: TextAlign.center),
            if (_fid != null) ...[
              const SizedBox(height: 32),
              const Text('FID de cette installation :'),
              SelectableText(_fid!),
            ],
          ],
        ),
      ),
    );
  }
}
