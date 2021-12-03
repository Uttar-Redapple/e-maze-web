import 'package:json_annotation/json_annotation.dart'; 

part 'updateprofileresponse.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Updateprofileresponse {
  @JsonKey(name: 'error')
  int error;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  String data;

  Updateprofileresponse({required this.error, required this.message, required this.data});

  factory Updateprofileresponse.fromJson(Map<String, dynamic> json) => _$UpdateprofileresponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateprofileresponseToJson(this);
}

