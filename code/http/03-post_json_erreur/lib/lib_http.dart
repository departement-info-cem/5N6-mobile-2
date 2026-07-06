import 'package:dio/dio.dart';
import 'package:post_json_erreur/transfert.dart';

Future<SignupResponse> signup(SignupRequest req) async {
  try {
    var response = await Dio().post(
      'https://kickmyb-server.onrender.com/id/inscription',
      data: req.toJson(),
      options: Options(headers: {'content-type': 'application/json'}),
    );
    print(response);
    return SignupResponse.fromJson(response.data);
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<Truc> httpComplex(String nom) async {
  try {
    var response = await Dio().get(
      'https://fourn6-mobile-prof.onrender.com/exos/truc/complexe?name=$nom',
    );
    print(response);
    return Truc.fromJson(response.data);
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<List<Truc>> httpListComplex() async {
  try {
    var response = await Dio().get(
      'https://fourn6-mobile-prof.onrender.com/exos/truc/list',
    );
    print(response);
    var listeJSON = response.data as List;
    var listeTruc = listeJSON.map((elementJSON) {
      return Truc.fromJson(elementJSON);
    }).toList();
    return listeTruc;
  } catch (e) {
    print(e);
    throw (e);
  }
}
