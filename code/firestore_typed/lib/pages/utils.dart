import 'package:firestore_typed/model/etudiant.dart';
import 'package:flutter/material.dart';

Widget convertirEtudiant(Etudiant etudiant) {
  return Card(
    color: Colors.indigoAccent,
    child: ListTile(
      leading: const Icon(Icons.person, color: Colors.white),
      title: Text(etudiant.nom),
      subtitle: Text('Matricule : ${etudiant.matricule}'),
    ),
  );
}
