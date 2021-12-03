// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'getresp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Getresp _$GetrespFromJson(Map<String, dynamic> json) => Getresp(
      error: json['error'] as int,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetrespToJson(Getresp instance) => <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['id'] as int,
      usrSourceType: json['usr_source_type'] as int,
      usrSourceKey: json['usr_source_key'] as String,
      usrFirstName: json['usr_first_name'] as String,
      usrLastName: json['usr_last_name'] as String,
      usrUserName: json['usr_user_name'] as String,
      usrEmail: json['usr_email'] as String,
      usrPhone: json['usr_phone'] as String,
      usrType: json['usr_type'] as int,
      usrStatus: json['usr_status'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'usr_source_type': instance.usrSourceType,
      'usr_source_key': instance.usrSourceKey,
      'usr_first_name': instance.usrFirstName,
      'usr_last_name': instance.usrLastName,
      'usr_user_name': instance.usrUserName,
      'usr_email': instance.usrEmail,
      'usr_phone': instance.usrPhone,
      'usr_type': instance.usrType,
      'usr_status': instance.usrStatus,
    };
