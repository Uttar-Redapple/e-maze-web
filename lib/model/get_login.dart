

import 'package:json_annotation/json_annotation.dart';
part 'get_login.g.dart';
@JsonSerializable()
class Loginuser {
  Loginuser(
      this.email_phone,
      this.password,

      );

  final String email_phone;
  final String password;


  factory Loginuser.fromJson(Map<String, dynamic> json) => _$LoginuserFromJson(json);
  Map<String, dynamic> toJson() => _$LoginuserToJson(this);
}