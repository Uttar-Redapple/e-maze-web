
import 'package:json_annotation/json_annotation.dart';
part 'get_regresp.g.dart';
@JsonSerializable()
class Reguserresponse{
  Reguserresponse(


      this.first_name,
      this.last_name,
      this.email,
      this.phone,

      this.type,


      );


  final String first_name;
  final String last_name;
  final String email;
  final String phone;

  final String type;


  factory Reguserresponse.fromJson(Map<String, dynamic> json) => _$ReguserresponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReguserresponseToJson(this);

}