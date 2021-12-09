import 'dart:convert';

import 'package:emaze_brain/model/response/getchangepwdresponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Showchangepassword extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ShowchangepasswordState();
  }
  
}
class ShowchangepasswordState extends State<Showchangepassword>{
  bool oldpwdvisible = false ;
  bool newpwdvisible=false;
  bool cnfpwdvisible=false;
  bool passwordcomapre=false;
  late bool _passwordVisible;
  late bool _newpasswordVisible;
  late bool _confirmpasswordVisible;
  final _changepwdformKey = GlobalKey<FormState>();
  final TextEditingController newpwdController = new TextEditingController();
  final TextEditingController OldpwdController = new TextEditingController();
  final TextEditingController confirmpwdController = new TextEditingController();
  String? token;

  int? p_id;
  void showpwdcompare(){
    setState(() {
      passwordcomapre = true ;

    });
  }

  void hidepwdcompare(){
    setState(() {
      passwordcomapre = false ;
    });
  }

  void showoldpassword(){
    setState(() {
      oldpwdvisible = true ;

    });
  }

  void hideoldpassword(){
    setState(() {
      oldpwdvisible = false ;
    });
  }

  void shownewpwd(){
    setState(() {
      newpwdvisible = true ;

    });
  }

  void hidenewpwd(){
    setState(() {
      newpwdvisible = false ;
    });
  }

  void showcnfpwd(){
    setState(() {
      cnfpwdvisible = true ;

    });
  }

  void hidecnfpwd(){
    setState(() {
      cnfpwdvisible = false ;
    });
  }
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _confirmpasswordVisible=false;
    _newpasswordVisible=false;
    gettoken();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
      builder: () =>
      ResponsiveBuilder(
        builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return Scaffold(
          body: Container(
            child: Form(
              key: _changepwdformKey,
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color> [
                        Color(0xFF3A3A3A),
                        Color(0xFF8B8B8B),
                        Color(0xFFDBDCDE),





                      ],
                      tileMode: TileMode.repeated
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: SizedBox(
                          height: 65.sp,
                          width: 200.sp,
                          child: Image(image: AssetImage(
                              'assets/images/emazelogofirst.png'
                          ),

                          ),
                        ),
                      ),
                      /*  Container(
                                          height: 10.sp,
                                        ),*/
                      Container(
                        height: 54.sp,
                        width: 500.sp,
                        decoration: BoxDecoration(
                          //  color: Colors.transparent
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color> [
                                Color(0xFFB2BEB5),
                                Color(0xFFE5E4E2),






                              ],
                              tileMode: TileMode.repeated
                          ),
                        ),
                        child: Center(
                          child: Text(
                            "CHANGE PASSWORD",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFffffff),
                              //  fontSize: 35.sp,
                              fontFamily:  '',
                              fontWeight: FontWeight.bold,
                            ),

                          ),
                        ),
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Neumorphic(
                        margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                        style: NeumorphicStyle(
                            depth: NeumorphicTheme.embossDepth(context),
                            boxShape: NeumorphicBoxShape.stadium(),
                            color: Colors.white
                        ),
                        //  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Container(
                          height: 45.sp,
                          padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                          child: TextFormField(
                            // enabled:regemail,
                            validator: (oldpwd) {
                              if (oldpwd == null || oldpwd.isEmpty) {

                                showoldpassword();
                              }
                              else{
                                hideoldpassword();
                              }

                              //    hidevalidusername();
                            },
                            controller: OldpwdController,
                            obscureText: !_passwordVisible,


                            decoration: InputDecoration(
                                border: InputBorder.none,
                                //  filled: true,
                                fillColor: Colors.white70,

                                hintText: 'Old password',
                                suffixIcon: GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      _passwordVisible = true;
                                    });
                                  },
                                  onLongPressUp: () {
                                    setState(() {
                                      _passwordVisible = false;
                                    });
                                  },
                                  child: Icon(
                                      _passwordVisible ? Icons.visibility : Icons.visibility_off
                                  ),
                                )

                            ),
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Visibility(
                        visible: oldpwdvisible,
                        child: Container(
                          child: Text(
                            "Old password required.",
                            style: TextStyle(
                              color: Colors.red,

                            ),

                          ),
                        ),
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Neumorphic(
                        margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                        style: NeumorphicStyle(
                            depth: NeumorphicTheme.embossDepth(context),
                            boxShape: NeumorphicBoxShape.stadium(),
                            color: Colors.white
                        ),
                        //  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Container(
                          height: 45.sp,
                          padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                          child: TextFormField(
                            // enabled:regemail,
                            validator: (newpwd) {
                              if (newpwd == null || newpwd.isEmpty) {

                                shownewpwd();
                              }
                              else{
                                hidenewpwd();
                              }

                              //    hidevalidusername();
                            },
                            controller: newpwdController,
                            obscureText: !_newpasswordVisible,


                            decoration: InputDecoration(
                                border: InputBorder.none,
                                //  filled: true,
                                fillColor: Colors.white70,

                                hintText: 'New password',
                                suffixIcon: GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      _newpasswordVisible = true;
                                    });
                                  },
                                  onLongPressUp: () {
                                    setState(() {
                                      _newpasswordVisible = false;
                                    });
                                  },
                                  child: Icon(
                                      _newpasswordVisible ? Icons.visibility : Icons.visibility_off
                                  ),
                                )

                            ),

                          ),
                        ),
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Visibility(
                        visible: newpwdvisible,
                        child: Container(
                          child: Text(
                            "New password required",
                            style: TextStyle(
                              color: Colors.red,

                            ),

                          ),
                        ),
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Neumorphic(
                        margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                        style: NeumorphicStyle(
                            depth: NeumorphicTheme.embossDepth(context),
                            boxShape: NeumorphicBoxShape.stadium(),
                            color: Colors.white
                        ),
                        //  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: Container(
                          height: 45.sp,
                          padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                          child: TextFormField(
                            // enabled:regemail,
                            validator: (cnfpwd) {
                              if (cnfpwd == null || cnfpwd.isEmpty) {

                                showcnfpwd();
                              }
                              else{
                                hidecnfpwd();
                              }

                              //    hidevalidusername();
                            },
                            controller: confirmpwdController,

                            obscureText: !_confirmpasswordVisible,


                            decoration: InputDecoration(
                                border: InputBorder.none,
                                //  filled: true,
                                fillColor: Colors.white70,

                                hintText: 'Confirm password',
                                suffixIcon: GestureDetector(
                                  onLongPress: () {
                                    setState(() {
                                      _confirmpasswordVisible = true;
                                    });
                                  },
                                  onLongPressUp: () {
                                    setState(() {
                                      _confirmpasswordVisible = false;
                                    });
                                  },
                                  child: Icon(
                                      _confirmpasswordVisible ? Icons.visibility : Icons.visibility_off
                                  ),
                                )

                            ),

                          ),
                        ),
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Visibility(
                        visible: cnfpwdvisible,
                        child: Container(
                          child: Text(
                            "Confirm password required.",
                            style: TextStyle(
                              color: Colors.red,

                            ),

                          ),
                        ),
                      ),
                      Visibility(
                        visible: passwordcomapre,
                        child: Container(
                          child: Text(
                            "Confirm password and new password should match.",
                            style: TextStyle(
                              color: Colors.red,

                            ),

                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        child: ButtonTheme(
                          minWidth: 182.sp,
                          height: 55.sp,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(40.sp),
                          ),
                          child: RaisedButton(

                            onPressed: () async {
                              if(newpwdController.text.toString()==confirmpwdController.text.toString()){
                                changepwd();
                                hidecnfpwd();
                              }
                              else{
                                showcnfpwd();

                              }

                            },

                            color: Color(0xFF29AAE1),
                            child: Text("Submit",
                              style: TextStyle(
                                color: Colors.white,

                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


              ),
            ),
          ),
        );
      }
          return Container(
            color:Colors.purple,
            child: Text(
              "Mobile",
            ),
          );
        }
      )

    );
  }

  Future<Getchangepwdresponse>  changepwd() async {
    //print(fname);
    final response = await http.post(
      Uri.parse('https://us-central1-emazebrain-5cf9b.cloudfunctions.net/app/user/change-password'),
      headers: <String, String>{
        //  "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer '+token!,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'old_password': OldpwdController.text,
        'new_password': confirmpwdController.text,

      }
      ),

    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      Map<String, dynamic> data = json.decode(response.body);
      print(data["message"]);
      return Getchangepwdresponse.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception();
    }
  }

  void gettoken()  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token=prefs.getString("authtoken");
    p_id=prefs.getInt("p_id");
    debugPrint("patrinttoken: ${token}");
    debugPrint("patriid: ${p_id}");
    print(p_id);
  }
  
}