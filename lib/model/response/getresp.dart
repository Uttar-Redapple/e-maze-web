import 'package:json_annotation/json_annotation.dart'; 

part 'getresp.g.dart'; 

@JsonSerializable(nullable: true, ignoreUnannotated: false)

class Getresp {
  @JsonKey(name: 'error')
  int error;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  Data data;

  Getresp({required this.error, required this.message, required this.data});

  factory Getresp.fromJson(Map<String, dynamic> json) => _$GetrespFromJson(json);

  Map<String, dynamic> toJson() => _$GetrespToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'usr_source_type')
  int usrSourceType;
  @JsonKey(name: 'usr_source_key')
  String usrSourceKey;
  @JsonKey(name: 'usr_first_name')
  String usrFirstName;
  @JsonKey(name: 'usr_last_name')
  String usrLastName;
  @JsonKey(name: 'usr_user_name')
  String usrUserName;
  @JsonKey(name: 'usr_email')
  String usrEmail;
  @JsonKey(name: 'usr_phone')
  String usrPhone;
  @JsonKey(name: 'usr_type')
  int usrType;
  @JsonKey(name: 'usr_status')
  int usrStatus;
  @JsonKey(name: 'usr_birth_date')
  String usr_birth_date;
  @JsonKey(name: 'usr_gender')
  String usr_gender;
  @JsonKey(name: 'usr_language')
  String usr_language;

  @JsonKey(name: 'usr_profile_image')
  String usr_profile_image;







  Data({required this.id, required this.usrSourceType, required this.usrSourceKey, required this.usrFirstName, required this.usrLastName, required this.usrUserName, required this.usrEmail, required this.usrPhone, required this.usrType, required this.usrStatus,required this.usr_birth_date,required this.usr_gender,required this.usr_language,required this.usr_profile_image});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this)..removeWhere(
          (dynamic key, dynamic value) => key == null || value == null);
}

