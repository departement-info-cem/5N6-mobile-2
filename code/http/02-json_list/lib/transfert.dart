import 'package:json_annotation/json_annotation.dart';

/// Cela permet à la classe `Truc` d'accéder aux membres privés dans
/// le fichier généré. La valeur pour cela est *.g.dart, où
/// l’astérisque représente le nom du fichier source.
part 'transfert.g.dart';

/// Une annotation permettant au générateur de code de savoir que cette classe
/// nécessite la génération de la logique de sérialisation JSON.
@JsonSerializable()
class Truc {
  Truc();

  int a = 0;
  String b = '';
  List<int> c = [];

  factory Truc.fromJson(Map<String, dynamic> json) => _$TrucFromJson(json);

  Map<String, dynamic> toJson() => _$TrucToJson(this);
}
