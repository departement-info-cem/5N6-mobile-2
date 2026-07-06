// l'idée est de regrouper tous les accès aux données au même endroit
// validation avant d'écrire
// tri, post-traitement etc après lecture

// Doc de référence : https://firebase.google.com/docs/firestore/quickstart?hl=fr


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firestore_typed/model/pipo.dart';

final collectionRef = FirebaseFirestore
    .instance
    .collection("pipo")
    .withConverter(
  fromFirestore: Pipo.fromFirestore,
  toFirestore: (Pipo pipo, options) => pipo.toFirestore(),
);


Future<void> ajoutPipo(Pipo pipo) async {
  await collectionRef.add(pipo);
  return;
}

Future<List<Pipo>> piposSous50() async {
  QuerySnapshot<Pipo> requete = await collectionRef
      .where("popi", isLessThanOrEqualTo: 50)
      .get();
  return _convertirRequeteEnListe(requete);
}

Future<List<Pipo>> piposCommeUneListe() async {
  QuerySnapshot<Pipo> requete = await collectionRef.get();
  return _convertirRequeteEnListe(requete);
}

Stream<List<Pipo>> piposCommeUnStream() {
  Stream<List<Pipo>> flot = collectionRef.snapshots().map(
          (QuerySnapshot<Pipo> snappy) => _convertirRequeteEnListe(snappy));
  return flot;
}

// methode privée pour convertir de snapshot en bon vieux objets
List<Pipo> _convertirRequeteEnListe(QuerySnapshot<Pipo> requete) {
  List<Pipo> resultat = [];
  for (QueryDocumentSnapshot<Pipo> element in requete.docs) {
    resultat.add(element.data());
  }
  return resultat;
}