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
      apiKey: 'demo-api-key',
      appId: '1:1234567890:$platform:0000000000000000',
      messagingSenderId: '1234567890',
      projectId: 'demo-firestore',
    );
  }
}
