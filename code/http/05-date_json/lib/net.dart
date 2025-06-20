import 'package:date_json/dto.dart';
import 'package:dio/dio.dart';

var baseUrl = "https://fourn6-mobile-prof.onrender.com/";
//var base_url = "http://10.0.2.2:8080/";

Future<TrucAvecUneDate> envoiLeDonc(TrucAvecUneDate truc) async {
  Dio dio = Dio();
  Response response = await dio.post("${baseUrl}exos/date",
      data: truc.toJson() // TODO ca va automatiquement appeler toJson
  );
  if (response.statusCode == 200 || response.statusCode == 201) {
    return TrucAvecUneDate.fromJson(response.data);
  } else {
    throw Exception("bimTypedPost");
  }
}
