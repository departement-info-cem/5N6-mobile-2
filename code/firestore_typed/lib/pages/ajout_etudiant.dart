import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_typed/model/etudiant.dart';
import 'package:firestore_typed/service.dart';
import 'package:flutter/material.dart';

class AjoutEtudiantPage extends StatefulWidget {
  const AjoutEtudiantPage({super.key});

  @override
  State<AjoutEtudiantPage> createState() => _AjoutEtudiantPageState();
}

class _AjoutEtudiantPageState extends State<AjoutEtudiantPage> {
  final _nomController = TextEditingController();
  final _matriculeController = TextEditingController();
  String? _erreurNom;
  String? _erreurMatricule;
  bool _enregistrementEnCours = false;

  @override
  void dispose() {
    _nomController.dispose();
    _matriculeController.dispose();
    super.dispose();
  }

  Future<void> _ajouterEtudiant() async {
    setState(() {
      _erreurNom = null;
      _erreurMatricule = null;
      _enregistrementEnCours = true;
    });

    try {
      await ajouterEtudiant(
        Etudiant(
          nom: _nomController.text,
          matricule: _matriculeController.text,
        ),
      );
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Étudiant enregistré.')),
      );
      Navigator.of(context).pop(true);
    } on NomCourtException {
      setState(() {
        _erreurNom = 'Le nom doit contenir au moins deux caractères.';
      });
    } on MatriculeSeptException {
      setState(() {
        _erreurMatricule =
            'Le matricule doit contenir exactement sept chiffres.';
      });
    } on FirebaseException catch (erreur) {
      if (!mounted) {
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur Firestore : ${erreur.message}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _enregistrementEnCours = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajouter un étudiant')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nomController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: _erreurNom,
                labelText: 'Nom',
                hintText: 'Ada Lovelace',
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _matriculeController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                errorText: _erreurMatricule,
                labelText: 'Matricule',
                hintText: '1234567',
              ),
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  _enregistrementEnCours ? null : _ajouterEtudiant(),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: _enregistrementEnCours ? null : _ajouterEtudiant,
              icon: _enregistrementEnCours
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save),
              label: const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}
