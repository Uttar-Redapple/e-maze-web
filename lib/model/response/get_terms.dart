import 'package:json_annotation/json_annotation.dart'; 

part 'get_terms.g.dart'; 

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class GetTerms {
  @JsonKey(name: 'error')
  int error;
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'data')
  Data data;

  GetTerms({required this.error, required this.message, required this.data});

  factory GetTerms.fromJson(Map<String, dynamic> json) => _$GetTermsFromJson(json);

  Map<String, dynamic> toJson() => _$GetTermsToJson(this);
}

@JsonSerializable(nullable: false, ignoreUnannotated: false)
class Data {
  @JsonKey(name: 'page_id')
  int pageId;
  @JsonKey(name: 'page_title')
  String pageTitle;
  @JsonKey(name: 'page_content')
  String pageContent;
  @JsonKey(name: 'status')
  int status;
  @JsonKey(name: 'created_at')


  Data({required this.pageId, required this.pageTitle, required this.pageContent, required this.status});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

