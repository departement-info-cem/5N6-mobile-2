import 'package:cloud_firestore/cloud_firestore.dart';

class Etudiant {
  const Etudiant({
    this.id = '',
    this.dateCreation,
    required this.nom,
    required this.matricule,
  });

  final String id;
  final Timestamp? dateCreation;
  final String nom;
  final String matricule;

  Map<String, dynamic> toFirestore() {
    return {
      'nom': nom,
      'matricule': matricule,
      'dateCreation': FieldValue.serverTimestamp(),
    };
  }

  factory Etudiant.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Etudiant(
      id: snapshot.id,
      dateCreation: data['dateCreation'] as Timestamp?,
      nom: data['nom'] as String,
      matricule: data['matricule'] as String,
    );
  }
}
