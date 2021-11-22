// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_loginresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginresponse _$LoginresponseFromJson(Map<String, dynamic> json) =>
    Loginresponse(

      json['user_id'] as int,
      json['first_name'] as String,
      json['last_name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['username'] as String,
      json['user_type'] as int,
      json['token'] as String,
    );

Map<String, dynamic> _$LoginresponseToJson(Loginresponse instance) =>
    <String, dynamic>{

      'user_id': instance.user_id,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'username': instance.username,
      'user_type': instance.user_type,
      'token': instance.token,
    };
