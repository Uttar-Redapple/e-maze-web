

import 'package:json_annotation/json_annotation.dart';

import '../get_regresp.dart';
part 'get_regresponse.g.dart';
@JsonSerializable()
class Getreguserresponse{
  Getreguserresponse(
      this.data,
      );
  final Reguserresponse data;

  factory Getreguserresponse.fromJson(Map<String, dynamic> json) =>
      _$GetreguserresponseFromJson(json);
}