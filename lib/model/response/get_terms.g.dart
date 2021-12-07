// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_terms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTerms _$GetTermsFromJson(Map<String, dynamic> json) => GetTerms(
      error: json['error'] as int,
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetTermsToJson(GetTerms instance) => <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      pageId: json['page_id'] as int,
      pageTitle: json['page_title'] as String,
      pageContent: json['page_content'] as String,
      status: json['status'] as int,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'page_id': instance.pageId,
      'page_title': instance.pageTitle,
      'page_content': instance.pageContent,
      'status': instance.status,
    };
