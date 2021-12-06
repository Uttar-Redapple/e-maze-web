// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reguser.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Reguser _$ReguserFromJson(Map<String, dynamic> json) => Reguser(
      json['username'] as String,
      json['first_name'] as String,
      json['last_name'] as String,
      json['email'] as String,
      json['phone'] as String,
      json['password'] as String,
      json['user_type'] as String,
    );

Map<String, dynamic> _$ReguserToJson(Reguser instance) => <String, dynamic>{
      'username': instance.username,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'user_type': instance.user_type,
    };
