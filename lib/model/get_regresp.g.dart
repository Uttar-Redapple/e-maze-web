// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_regresp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reguserresponse _$ReguserresponseFromJson(Map<String, dynamic> json) =>
    Reguserresponse(
      json['first_name'] as String,
      json['last_name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$ReguserresponseToJson(Reguserresponse instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'type': instance.type,
    };
