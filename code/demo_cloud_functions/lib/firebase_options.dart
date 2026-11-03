// Fausse configuration, comme dans la section « Firebase kaputt » de la recette
// des émulateurs. Avec un vrai projet, ce fichier est généré par
// `flutterfire configure`.
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    final String platform = kIsWeb
        ? 'web'
        : switch (defaultTargetPlatform) {
            TargetPlatform.iOS || TargetPlatform.macOS => 'ios',
            _ => 'android',
          };
    return FirebaseOptions(
      // Fausse clé, mais au bon format (39 caractères, commence par « A ») :
      // certains SDK natifs refusent une clé mal formée.
      apiKey: 'ADemoProjectApiKey000000000000000000000',
      appId: '1:1234567890:$platform:0000000000000000',
      messagingSenderId: '1234567890',
      projectId: 'demo-cloud-functions', // Le même que dans .firebaserc
      storageBucket: 'demo-cloud-functions.appspot.com',
    );
  }
}
