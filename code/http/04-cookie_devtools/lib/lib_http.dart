import 'package:cookie_devtools/transfert.dart';
import 'package:dio/dio.dart';

import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';

class SingletonDio {
  static var cookieManager = CookieManager(CookieJar());

  static Dio getDio() {
    Dio dio = Dio();
    dio.interceptors.add(cookieManager);
    return dio;
  }
}

Future<String> cookieDemo() async {
  var response = await SingletonDio.getDio()
      .get('https://fourn6-mobile-prof.onrender.com/exos/cookie/echo');
  print(response);
  return response.data;
}

Future<SignupResponse> signup(SignupRequest req) async {
  try {
    var response = await SingletonDio.getDio()
        .post('https://kickmyb-server.onrender.com/id/inscription', data: req);
    print(response);
    return SignupResponse.fromJson(response.data);
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<Truc> httpComplex(String nom) async {
  try {
    var response = await SingletonDio.getDio()
        .get('https://fourn6-mobile-prof.onrender.com/exos/truc/complexe?name=$nom');
    print(response);
    return Truc.fromJson(response.data);
  } catch (e) {
    print(e);
    rethrow;
  }
}

Future<List<Truc>> httpListComplex() async {
  try {
    var response = await SingletonDio.getDio()
        .get('https://fourn6-mobile-prof.onrender.com/exos/truc/list');
    print(response);
    var listeJSON = response.data as List;
    var listeTruc = listeJSON.map((elementJSON) {
      return Truc.fromJson(elementJSON);
    }).toList();
    return listeTruc;
  } catch (e) {
    print(e);
    rethrow;
  }
}
