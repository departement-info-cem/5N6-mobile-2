import 'package:cloud_firestore/cloud_firestore.dart';

class Pipo {

  Pipo();

  // Attention dans Firestore l'ID n'est pas dans le "data()" mais à part dans le snapshot
  String id = "";

  String pipi = "";
  DateTime popo = DateTime.now();
  int popi = 99;

  // Type à utiliser pour pouvoir récupérer le temps serveur au temps de la creation.
  Timestamp creationtime = Timestamp.now();


  // La méthode pour convertir un Pipo en JSON qui s'en va dans le Firestore
  // TODO Tout cela pourrait être généré par JsonSerializable Huh?
  Map<String, dynamic> toFirestore() {
    return {
      "pipi": pipi,
      "popo": popo,
      "popi": popi,
      // permet de récupérer le temps serveur indépendant du client
      "creationtime": FieldValue.serverTimestamp(),
    };
  }

  // La méthode pour récupérer un Pipo depuis le JSON de firestore
  factory Pipo.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    Pipo resultat = Pipo();
    resultat.id = snapshot.id;                          // l'id n'est pas dans les données
    resultat.popi = data?["popi"];                      // les autres champs sont dans data
    resultat.pipi = data?["pipi"];                      // les autres champs sont dans data
    resultat.popo = data?["popo"].toDate();             // Timestamp dans le firestore, convertir
    resultat.creationtime = data?["creationtime"];
    return resultat;
  }

}
