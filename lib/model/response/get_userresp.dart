

import 'package:json_annotation/json_annotation.dart';

import '../get_userresponse.dart';
@JsonSerializable()
class Getuserdetailsresponse{
  Getuserdetailsresponse(
      this.data,
      );
  final Userresponse data;
  factory Getuserdetailsresponse.fromJson(Map<String, dynamic> json) =>
      _$GetuserdetailsresponseFromJson(json);
}