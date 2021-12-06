

import 'dart:io';

import 'package:emaze_brain/model/get_login.dart';
import 'package:emaze_brain/model/get_reguser.dart';
import 'package:emaze_brain/model/get_userdetails.dart';
import 'package:emaze_brain/model/response/get_loginresp.dart';
import 'package:emaze_brain/model/response/get_regresponse.dart';
import 'package:emaze_brain/model/response/get_userresp.dart';
import 'package:emaze_brain/screen/util/TOken.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/http.dart' as http;
part 'client.g.dart';

//@RestApi(baseUrl: "https://us-central1-emazebrain-5cf9b.cloudfunctions.net/app/")
@RestApi(baseUrl: "http://192.168.1.230:3000/emazebrain-5cf9b/us-central1/app/")
abstract class APIClient{
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  @FormUrlEncoded()
  @POST("user/login")
  @http.Headers(<String, dynamic>{
    "Content-Type" : "application/json"
  })

  Future<GetLoginResponse> login(@Body() Loginuser loginuser);


  @POST("user/signup")
  @http.Headers(<String, dynamic>{
    "Content-Type" : "application/json"
  })

  Future<Getreguserresponse> createUser(@Body() Reguser reguser);

/*

  @POST("user/details")
  @http.Headers(<String, dynamic>{
    HttpHeaders.authorizationHeader: key,
  })
  Future<Getuserdetailsresponse> getUser(@Body() Getuser getuser);
*/

}