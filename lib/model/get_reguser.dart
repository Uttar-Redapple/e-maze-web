
import 'package:json_annotation/json_annotation.dart';
part 'get_reguser.g.dart';
@JsonSerializable()
class Reguser{
  Reguser(
      this.username,
      this.first_name,
      this.last_name,
      this.email,
      this.phone,
      this.password,
      this.user_type,

      );
  final String username;
  final String first_name;
  final String last_name;
  final String email;
  final String phone;
  final String password;
  final String user_type;

  factory Reguser.fromJson(Map<String, dynamic> json) => _$ReguserFromJson(json);
  Map<String, dynamic> toJson() => _$ReguserToJson(this);

}