
import 'GetDetails.dart';

class Getdata{
  final int error;

  final String message;
  final GetDetails data;

  Getdata({required this.error, required this.message, required this.data});
  factory Getdata.fromJson(Map<String, dynamic> json) {
    return Getdata(
        error: json['error'],
        message: json['message'],
        data: json['data']


    );
  }

}