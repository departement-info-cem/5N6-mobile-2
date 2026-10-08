import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firestore/config/app_config.dart';
import 'package:demo_firestore/config/config_factory.dart';
import 'package:demo_firestore/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final AppConfig config = ConfigFactory.create();
  if (config.isDev) {
    FirebaseFirestore.instance.useFirestoreEmulator(config.emulatorIp, 8080);
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mode hors ligne',
      theme: ThemeData(colorSchemeSeed: Colors.blue, useMaterial3: true),
      home: const OfflineLabPage(),
    );
  }
}

class OfflineLabPage extends StatefulWidget {
  const OfflineLabPage({super.key});

  @override
  State<OfflineLabPage> createState() => _OfflineLabPageState();
}

class _OfflineLabPageState extends State<OfflineLabPage> {
  final CollectionReference<Map<String, dynamic>> _documents = FirebaseFirestore
      .instance
      .collection('offline_lab');

  Future<void> _addDocument() async {
    final now = DateTime.now();

    try {
      await _documents.add({
        'message': 'Ajout du ${now.toLocal()}',
        'createdAt': FieldValue.serverTimestamp(),
      });
    } on FirebaseException catch (error) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible d’ajouter le document : ${error.message}'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mode hors ligne Firestore')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addDocument,
        icon: const Icon(Icons.add),
        label: const Text('Ajouter un document'),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _documents.snapshots(includeMetadataChanges: true),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Erreur Firestore : ${snapshot.error}'));
          }

          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = snapshot.data!.docs;
          final metadata = snapshot.data!.metadata;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Flux : ${metadata.isFromCache ? 'cache local' : 'serveur'}\n'
                      'Écritures en attente : '
                      '${metadata.hasPendingWrites ? 'oui' : 'non'}',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    final document = documents[index];
                    final data = document.data();
                    final message =
                        data['message'] as String? ?? 'Sans message';
                    final documentMetadata = document.metadata;

                    return ListTile(
                      title: Text(message),
                      subtitle: Text(
                        'Source : '
                        '${documentMetadata.isFromCache ? 'cache local' : 'serveur'}\n'
                        'Écriture en attente : '
                        '${documentMetadata.hasPendingWrites ? 'oui' : 'non'}',
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
