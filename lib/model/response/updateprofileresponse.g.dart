// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'updateprofileresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Updateprofileresponse _$UpdateprofileresponseFromJson(
        Map<String, dynamic> json) =>
    Updateprofileresponse(
      error: json['error'] as int,
      message: json['message'] as String,
      data: json['data'] as String,
    );

Map<String, dynamic> _$UpdateprofileresponseToJson(
        Updateprofileresponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };
