

import 'package:json_annotation/json_annotation.dart';

import '../get_loginresponse.dart';
part 'get_loginresp.g.dart';
@JsonSerializable()
class GetLoginResponse{
  GetLoginResponse(
      this.data,
      );

  final Loginresponse data;
  factory GetLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLoginResponseFromJson(json);
}