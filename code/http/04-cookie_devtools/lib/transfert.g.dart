// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Truc _$TrucFromJson(Map<String, dynamic> json) => Truc()
  ..a = (json['a'] as num).toInt()
  ..b = json['b'] as String
  ..c = (json['c'] as List<dynamic>).map((e) => (e as num).toInt()).toList();

Map<String, dynamic> _$TrucToJson(Truc instance) => <String, dynamic>{
  'a': instance.a,
  'b': instance.b,
  'c': instance.c,
};

SignupRequest _$SignupRequestFromJson(Map<String, dynamic> json) =>
    SignupRequest()
      ..nom = json['nom'] as String
      ..motDePasse = json['motDePasse'] as String
      ..confirmationMotDePasse = json['confirmationMotDePasse'] as String;

Map<String, dynamic> _$SignupRequestToJson(SignupRequest instance) =>
    <String, dynamic>{
      'nom': instance.nom,
      'motDePasse': instance.motDePasse,
      'confirmationMotDePasse': instance.confirmationMotDePasse,
    };

SignupResponse _$SignupResponseFromJson(Map<String, dynamic> json) =>
    SignupResponse()..nomUtilisateur = json['nomUtilisateur'] as String;

Map<String, dynamic> _$SignupResponseToJson(SignupResponse instance) =>
    <String, dynamic>{'nomUtilisateur': instance.nomUtilisateur};
