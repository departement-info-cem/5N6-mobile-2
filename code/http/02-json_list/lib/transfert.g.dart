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
