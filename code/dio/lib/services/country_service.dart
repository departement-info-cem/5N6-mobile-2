import 'package:dio/dio.dart';
import 'package:dio_demo/network/api_client.dart';
import 'package:dio_demo/network/dto/country_details_response.dart';

class CountryService {
  final CountryApiClient _countryApiClient;

  // CountryService a besoin d'un CountryApiClient pour effectuer ses requêtes.
  CountryService(this._countryApiClient);

  // Notez le mot clé Future. C'est l'équivalent de Task en C#
  // Ça indique que l'exécution de la fonction peut être retardée
  // Encore une fois comme en C#, le mot clé async indique que la fonction est asynchrone
  // Elle ne s'exécutera donc pas séquentiellement
  Future<List<CountryDetailsResponse>> getCountryDetails(String country) async {
    Response<dynamic> response = await _countryApiClient.dio.get(
      '/countries/v5?q=$country',
    );
    dynamic jsonRawContent = response.data!;
    // Regardez le résultat de cette requête dans Bruno pour mieux comprendre ce qui est fait ici
    return jsonRawContent.data.objects
        .map((json) => CountryDetailsResponse.fromJson(json))
        .toList();
    ;
  }
}
