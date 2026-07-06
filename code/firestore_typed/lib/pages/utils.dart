import 'package:firestore_typed/model/pipo.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget convertisseurDePipo(Pipo pipo) {
  DateFormat df = DateFormat("y/MM/dd @ HH:mm");
  DateTime creationCommeDateTime =
    DateTime.fromMicrosecondsSinceEpoch(
        pipo.creationtime.microsecondsSinceEpoch
  );
  return Card(
    color: Colors.indigoAccent,
    child: ListTile(
      trailing: Text(pipo.id.substring(6)),
      leading: Text(pipo.popi.toString()),
      title: Text(pipo.pipi),
      subtitle: Text(
            "creation " +
              df.format(creationCommeDateTime) +
            "\npopo " +
                df.format(pipo.popo)
      ),
    ),
  );
}