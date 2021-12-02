
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Userresponse{
  Userresponse(

      this.id,
      this.usr_source_type,
      this.usr_source_key,
      this.usr_first_name,
      this.usr_last_name,
      this.usr_user_name,
      this.usr_email,
      this.usr_phone,
      this.usr_type,
      this.usr_status,

      );

  final int id;
  final int usr_source_type;
  final String usr_source_key;
  final String usr_first_name;
  final String usr_last_name;
  final String usr_user_name;
  final String usr_email;
  final String usr_phone;
  final int usr_type;
  final int usr_status;

  factory Userresponse.fromJson(Map<String, dynamic> json) => _$UserresponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserresponseToJson(this);

}