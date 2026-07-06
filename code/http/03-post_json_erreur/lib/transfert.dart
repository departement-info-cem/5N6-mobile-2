import 'package:json_annotation/json_annotation.dart';

part 'transfert.g.dart';

@JsonSerializable()
class Truc {
  Truc();

  int a = 0;
  String b = '';
  List<int> c = [];

  factory Truc.fromJson(Map<String, dynamic> json) => _$TrucFromJson(json);

  Map<String, dynamic> toJson() => _$TrucToJson(this);
}

@JsonSerializable()
class SignupRequest {
  SignupRequest();

  String nom = '';
  String motDePasse = '';
  String confirmationMotDePasse = '';

  factory SignupRequest.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable()
class SignupResponse {
  SignupResponse();

  String nomUtilisateur = '';

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
