
class GetDetails{
  final int id;
  final int usr_source_type;
  final String usr_source_key;
  final  String usr_first_name;
  final  String usr_last_name;
  final  String usr_user_name;
  final String usr_email;
  final String usr_phone;
  final int usr_type;
  final int usr_status;

  GetDetails({required this.id, required this.usr_source_type,
    required this.usr_source_key,required this.usr_first_name,
    required this.usr_last_name,required this.usr_user_name,
    required this.usr_email, required this.usr_phone,required this.usr_type,
    required this.usr_status
  });



   factory GetDetails.fromJson(Map<String, dynamic> json) {
     return GetDetails(
       id: json['id'],
       usr_source_type: json['usr_source_type'],
       usr_source_key: json['usr_source_key'],
       usr_first_name: json['usr_first_name'],
       usr_last_name: json['usr_last_name'],
       usr_user_name: json['usr_user_name'],
       usr_email: json['usr_email'],
       usr_phone: json['usr_phone'],
       usr_type: json['usr_type'],
       usr_status: json['usr_status']

     );
   }
}