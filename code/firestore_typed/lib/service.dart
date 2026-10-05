import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_typed/model/etudiant.dart';

class NomCourtException implements Exception {}

class MatriculeSeptException implements Exception {}

CollectionReference<Etudiant> etudiantsRef() =>
    FirebaseFirestore.instance.collection('etudiants').withConverter(
          fromFirestore: Etudiant.fromFirestore,
          toFirestore: (Etudiant etudiant, options) => etudiant.toFirestore(),
        );

Future<void> ajouterEtudiant(Etudiant etudiant) async {
  // d'abord on valide les données
  if (etudiant.nom.length < 2) {
    throw NomCourtException();
  }
  if (!RegExp(r'^[0-9]{7}$').hasMatch(etudiant.matricule)) {
    throw MatriculeSeptException();
  }
  // si tout est beau on écrit dans la BD / firestore etc
  await etudiantsRef().add(etudiant);
}

Future<List<Etudiant>> obtenirEtudiants() async {
  final requete = await etudiantsRef().get();
  return _convertirRequeteEnListe(requete);
}

Stream<List<Etudiant>> observerEtudiants() {
  return etudiantsRef().snapshots().map(_convertirRequeteEnListe);
}

List<Etudiant> _convertirRequeteEnListe(
  QuerySnapshot<Etudiant> requete,
) {
  return requete.docs.map((document) => document.data()).toList();
}
