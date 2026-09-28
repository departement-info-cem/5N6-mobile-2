import 'package:json_annotation/json_annotation.dart';

// Inclure le fichier généré qui facilite les transformations
// json -> objet dart et objet dart -> json
// Restera rouge tant que cette commande n'aura pas été exécutée :
// dart run build_runner build
// N'ayez pas peur de jeter un coup d'oeil à ce qui est dans ce fichier généré.
// C'est moins complexe qu'il n'y parait.
part 'country_details_response.g.dart';

@JsonSerializable()
class CountryDetailsResponse {
  final String description;
  final String emoji;

  CountryDetailsResponse({required this.description, required this.emoji});

  // Drôle de code! Permet de passer de json à CountryDetailsResponse.
  // Ça utilise une fonction généré dans country_details_response.g.dart
  factory CountryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailsResponseFromJson(json);

  // Autre drôle de code! Permet de passer de CountryDetailsResponse à json.
  // Ça utilise aussi une fonction généré dans country_details_response.g.dart
  Map<String, dynamic> toJson() => _$CountryDetailsResponseToJson(this);
}
