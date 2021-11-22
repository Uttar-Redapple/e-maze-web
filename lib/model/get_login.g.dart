// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Loginuser _$LoginuserFromJson(Map<String, dynamic> json) => Loginuser(
      json['email_phone'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$LoginuserToJson(Loginuser instance) => <String, dynamic>{
      'email_phone': instance.email_phone,
      'password': instance.password,
    };
