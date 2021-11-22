
import 'package:json_annotation/json_annotation.dart';

part 'get_loginresponse.g.dart';
@JsonSerializable()
class Loginresponse{
  Loginresponse(

      this.user_id,
      this.first_name,
      this.last_name,
      this.email,
      this.phone,
      this.username,
      this.user_type,
      this.token,

      );

  final int user_id;
  final String first_name;
  final String last_name;
  final String email;
  final String phone;
  final String username;
  final int user_type;
  final String token;

  factory Loginresponse.fromJson(Map<String, dynamic> json) => _$LoginresponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginresponseToJson(this);

}