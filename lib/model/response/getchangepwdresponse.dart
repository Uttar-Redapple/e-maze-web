import 'package:json_annotation/json_annotation.dart'; 

part 'getchangepwdresponse.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Getchangepwdresponse {
  @JsonKey(name: 'error')
  int error;
  @JsonKey(name: 'message')
  String message;

  Getchangepwdresponse({required this.error, required this.message});

  factory Getchangepwdresponse.fromJson(Map<String, dynamic> json) => _$GetchangepwdresponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetchangepwdresponseToJson(this);
}

