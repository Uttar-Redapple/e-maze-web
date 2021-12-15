import 'dart:convert';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/Getdata.dart';
import 'package:emaze_brain/model/response/getchangepwdresponse.dart';
import 'package:emaze_brain/model/response/getresp.dart';
import 'package:emaze_brain/model/response/updateprofileresponse.dart';
import 'package:emaze_brain/screen/util/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:emaze_brain/screen/data_viz/data_viz.dart';
import 'package:emaze_brain/screen/util/InnerShadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Patientprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientprofileState();
  }

}
class PatientprofileState extends State<Patientprofile>{
  Future<Getresp>? _futureAlbum;
  final _formKey = GlobalKey<FormState>();
  final _changepwdformKey = GlobalKey<FormState>();
  bool status = false;
  bool viewfirstname = false ;
  bool viewlastname = false ;
  bool viewemail = false ;
  bool viewphno = false ;
  bool viewbirth = false ;
  bool viewgender = false ;
  bool viewlanguage = false ;


  bool viewfirstnametext = true ;
  bool viewlastnametext = true ;
  bool viewemailtext = true ;
  bool viewphnotext = true ;
  bool viewbirthtext = true ;
  bool viewgendertext = true ;
  bool viewlanguagetext = true ;
  Color _offcolor = Color(0xFF989898);
  Color _oncolor = Colors.transparent;
  Color _oncolortext=Color(0xFF666666);
  Color _offcolortextcode=Colors.white;
  String ontext="ON";
  String offtext="Off";

  String? token;
  String?userfname,usr_last_name,usr_user_name,usr_email,usr_phone,usr_birth_date,usr_gender,usr_language,usr_profile_image;

  int? p_id;
  late bool _passwordVisible;
  late bool _newpasswordVisible;
  late bool _confirmpasswordVisible;


  bool oldpwdvisible = false ;
  bool newpwdvisible=false;
  bool cnfpwdvisible=false;
  bool passwordcomapre=false;

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

  late DateFormat formatters;
  void showfirstnametextwidget(){
    setState(() {
      viewfirstnametext = true ;

    });
  }

  void hidefirstnametextwidget(){
    setState(() {
      viewfirstnametext = false ;
    });
  }

  void showlastnametextwidget(){
    setState(() {
      viewlastnametext = true ;

    });
  }

  void hidelastnametextwidget(){
    setState(() {
      viewlastnametext = false ;
    });
  }

  void showemailtextwidget(){
    setState(() {
      viewemailtext = true ;

    });
  }

  void hideemailtextwidget(){
    setState(() {
      viewemailtext = false ;
    });
  }


  void showphtextwidget(){
    setState(() {
      viewphnotext = true ;

    });
  }

  void hidephtextwidget(){
    setState(() {
      viewphnotext = false ;
    });
  }

  void showbirthtextwidget(){
    setState(() {
      viewbirthtext = true ;

    });
  }

  void hidebirthtextwidget(){
    setState(() {
      viewbirthtext = false ;
    });
  }

  void showgendertextwidget(){
    setState(() {
      viewgendertext = true ;

    });
  }

  void hidegendertextwidget(){
    setState(() {
      viewgendertext = false ;
    });
  }

  void showlanguagetextwidget(){
    setState(() {
      viewlanguagetext = true ;

    });
  }

  void hidelanguagetextwidget(){
    setState(() {
      viewlanguagetext = false ;
    });
  }

  final  TextEditingController firstnameController = new TextEditingController();
  final TextEditingController lastnameController = new TextEditingController();
  final TextEditingController emailController =new TextEditingController();
  final TextEditingController phnoController = new TextEditingController();
  final TextEditingController genderController =new TextEditingController();
  final  TextEditingController languageController = new TextEditingController();
  final TextEditingController birthController = new TextEditingController();
  final TextEditingController newpwdController = new TextEditingController();
   TextEditingController OldpwdController = new TextEditingController();
   TextEditingController confirmpwdController = new TextEditingController();

  void clearprofiletext(){
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    phnoController.clear();
    genderController.clear();
    languageController.clear();
    birthController.clear();
  }
  late String formatteddatetime;
  void showfirstnamewidget(){
    setState(() {
      viewfirstname = true ;

    });
  }

  void hidefirstnamewidget(){
    setState(() {
      viewfirstname = false ;
    });
  }

  void showlastnamewidget(){
    setState(() {
      viewlastname = true ;

    });
  }

  void hidelastnamewidget(){
    setState(() {
      viewlastname = false ;
    });
  }
  void showemailwidget(){
    setState(() {
      viewemail = true ;

    });
  }

  void hideemailwidget(){
    setState(() {
      viewemail = false ;
    });
  }

  void showphwidget(){
    setState(() {
      viewphno = true ;

    });
  }

  void hidephwidget(){
    setState(() {
      viewphno = false ;
    });
  }

  void showbirthwidget(){
    setState(() {
      viewbirth = true ;

    });
  }

  void hidebirthwidget(){
    setState(() {
      viewbirth = false ;
    });
  }

  void showgenderwidget(){
    setState(() {
      viewgender = true ;

    });
  }

  void hidegenderwidget(){
    setState(() {
      viewgender = false ;
    });
  }

  void showlanguagewidget(){
    setState(() {
      viewlanguage = true ;

    });
  }

  void hidelanguagewidget(){
    setState(() {
      viewlanguage = false ;
    });
  }

  @override
  void initState()  {
    super.initState();
    setState(() {
    //  tokenanduserdetaisl();
      _oncolor=Colors.transparent;
      _offcolor=Color(0xFF989898);
      offtext="ON";
      ontext="Off";
      _offcolortextcode=Colors.white;
      _oncolortext=Color(0xFF666666);
      _passwordVisible = false;
      _confirmpasswordVisible=false;
      _newpasswordVisible=false;
      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd hh:mm:ss');
      String formattedDate = formatter.format(now);
      print(formattedDate); //
      formatteddatetime=formattedDate;
      formatters = new DateFormat('yyyy-MM-dd hh:mm:ss');
      gettoken();
      _futureAlbum= getuserdetails();
    });



   /* gettoken();
    _futureAlbum= getuserdetails();*/
    /*gettoken();
    _futureAlbum=  getuserdetails();*/

   /* gettoken();
    _futureAlbum= getuserdetails();*/


    /*gettoken();
    _futureAlbum= getuserdetails();*/
  }

  FutureBuilder<Getresp> buildFutureBuilder() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasData) {
            return
              Text(
                snapshot.data!.data.usrFirstName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),

              );
          } else if (snapshot.hasError) {
            return  Text(
             userfname!,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),

            );
          }
        }


        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderlastname() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasData) {
            return
              Text(
                snapshot.data!.data.usrLastName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),

              );
          } else if (snapshot.hasError) {
            return Text(
                usr_last_name!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                )
            );
          }

        }

        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderemail() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasData) {
            return
              Text(
                snapshot.data!.data.usrEmail,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),

              );
          } else if (snapshot.hasError) {
            return Text(
                usr_email!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                )
            );
          }
        }


        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderph() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasData) {
            return
              Text(
                snapshot.data!.data.usrPhone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),

              );
          } else if (snapshot.hasError) {
            return Text(
                usr_phone!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                )
            );
          }
        }


        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderusername() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasData) {
            return
              Text(
                snapshot.data!.data.usrUserName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),

              );
          } else if (snapshot.hasError) {
            return Text(
                usr_user_name!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                )
            );
          }
        }


        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderuserid() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if( snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: Text('Please wait its loading...'));
        }
        else{
          if (snapshot.hasData) {
            return
              Text(
                "Patient : "+snapshot.data!.data.usrUserName+ "| User ID : "+snapshot.data!.data.id.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),

              );
          } else if (snapshot.hasError) {
            return Text(
                "Patient : "+usr_user_name!+ "| User ID : "+p_id!.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF989898 ),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                )
            );
          }
        }


        return const CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(40);


   /* gettoken();
    _futureAlbum= getuserdetails();*/
    return ScreenUtilInit(
        builder: () =>
            ResponsiveBuilder(
                builder: (context, sizingInformation) {
                  if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
                    return Scaffold(
                      body: Container(
                        padding: EdgeInsets.only(left: 30.sp,right: 30.sp),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/greyback.png"),

                            fit: BoxFit.cover,
                          ),
                         /* gradient:
                          LinearGradient(

                              tileMode: TileMode.repeated,
                              colors: [  Color(0xFF3A3A3A),
                                Color(0xFF8B8B8B),
                                Color(0xFFDBDCDE),
                              ]),*/
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                height: 110.sp,

                                decoration: BoxDecoration(
                                    color: Color(0xFFF1F1F1),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(21.0),
                                        bottomRight: Radius.circular(21.0)

                                    ),
                                  boxShadow: [
                                   
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 25.0, // soften the shadow
                                      spreadRadius: 5.0, //extend the shadow
                                      offset: Offset(
                                        15.0, // Move to right 10  horizontally
                                        15.0, // Move to bottom 10 Vertically
                                      ),
                                    )
                                  ],
                                ),
                                
                                child: Container(

                                  padding: EdgeInsets.all(10.sp),
                                  child: Column(
                                    children: [
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "eMazeBrain",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xFF29AAE1),
                                                fontSize: 35.sp,
                                                fontFamily:  '',
                                                fontWeight: FontWeight.bold,
                                              ),

                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.all(25.sp),
                                              width: 250.sp,

                                              decoration: BoxDecoration(
                                                 /* border: Border.all(
                                                    color: Colors.white.withOpacity(
                                                        1.0), // red as border color
                                                  ),*/
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/assertss.png"),

                                                    fit: BoxFit.cover,
                                                  ),
                                                 /* boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.white.withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: Offset(0, 3), // changes position of shadow
                                                    ),
                                                  ],*/
                                                 /* borderRadius: new BorderRadius.only(
                                                      topLeft: const Radius.circular(
                                                          40.0),
                                                      topRight: const Radius.circular(
                                                          40.0),
                                                      bottomRight: const Radius.circular(
                                                          40.0),
                                                      bottomLeft: const Radius.circular(
                                                          40.0)
                                                  )*/

                                              ),
                                              child: Container(
                                                padding: EdgeInsets.only(left: 20.sp,right:20.sp),
                                                child: Column(
                                                  children: [
                                                    Stack(
                                                      alignment: Alignment.center,
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.center,
                                                          child: SizedBox(

                                                            child: IconButton(
                                                              icon: Image.asset(
                                                                  'assets/images/notification.png'),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment: Alignment.centerRight,
                                                          child: SizedBox(

                                                            child: IconButton(
                                                              icon: Image.asset(
                                                                  'assets/images/menu.png'),
                                                              onPressed: () {
                                                                showPopupMenu();
                                                              },
                                                            ),
                                                          ),

                                                        ),
                                                        Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: SizedBox(

                                                            child: IconButton(
                                                              icon: Image.asset(
                                                                  'assets/images/communate.png'),
                                                              onPressed: () {},
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: 60.sp,
                                                  width: 60.sp,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: AssetImage("assets/images/assets.png"),

                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  child: Container(
                                                    padding:  EdgeInsets.all(12.sp),
                                                    height: 18.sp,
                                                    width: 18.sp,
                                                    child: IconButton(

                                                      icon: Image.asset(
                                                          'assets/images/profile.png'),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 20.sp,
                                                ),
                                                Text(
                                                  "User's Profile",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),

                                                ),

                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 10.sp,
                              ),
                              Container(

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                        children:[
                                          Container(
                                            padding: EdgeInsets.only(top: 30.sp,bottom: 5.sp,left: 10.sp,right: 10.sp),
                                            height: 296.sp,
                                            width: 251.sp,
                                            decoration: BoxDecoration(

                                                gradient: LinearGradient(


                                                    colors: <Color> [
                                                      Color(0xFFD8D8D8).withOpacity(0.7),
                                                      Color(0xFFEBEBEB).withOpacity(0.7),
                                                      Color(0xFFEDEDED).withOpacity(0.7),




                                                    ],
                                                    tileMode: TileMode.repeated
                                                ),
                                                border: Border.all(

                                                    color: Color(0xFF868686)
                                                ),
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(21.sp),
                                                    bottomRight: Radius.circular(21.sp),
                                                    bottomLeft: Radius.circular(21.sp),
                                                    topLeft: Radius.circular(21.sp))
                                              // bottomLeft: Radius.circular(40.sp))

                                            ),
                                            child: ContainedTabBarView(
                                              tabs: [
                                                Container(
                                            decoration: BoxDecoration(
                                             /* boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 15,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3), // changes position of shadow
                                                ),
                                              ],*/
                                            ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      /*boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey.withOpacity(0.5),
                                                          spreadRadius: 15,
                                                          blurRadius: 7,
                                                          offset: Offset(0, 3), // changes position of shadow
                                                        ),
                                                      ],*/
                                                    ),
                                                    child: Text(
                                                      'Therapist',
                                                      textAlign: TextAlign.center,

                                                      style: TextStyle(
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 10.sp
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'You',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 10.sp
                                                  ),
                                                ),
                                              ],
                                              tabBarProperties: TabBarProperties(
                                                width: 174.sp,
                                                height: 20.sp,
                                                background: Container(
                                                  width: 174.sp,
                                                  height: 20.sp,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      image: new DecorationImage(
                                                        image: new AssetImage("assets/images/groupsnew.png"),
                                                        fit: BoxFit.cover,


                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.white,
                                                          spreadRadius: 0.5,
                                                          blurRadius: 2,
                                                          offset: Offset(1, -1),
                                                        ),
                                                      ]

                                                  ),
                                                ),

                                                indicator: ShapeDecoration(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: radius,
                                                        topLeft: radius,bottomLeft: radius,bottomRight: radius)),
                                                  color: Color(0xFF29AAE1),
                                                ),
                                                indicatorColor: Colors.transparent,
                                                labelColor: Colors.white,
                                                unselectedLabelColor: Colors.grey[400],
                                              ),
                                              views: [
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 10.sp,
                                                      ),
                                                      Container(
                                                        height: 150.sp,
                                                        width: 150.sp,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            image: AssetImage("assets/images/shadow.png"),

                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          padding:  EdgeInsets.all(12.sp),
                                                          height: 18.sp,
                                                          width: 18.sp,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                          ),

                                                          child: CircleAvatar

                                                            (
                                                              radius: 20,
                                                              backgroundImage:
                                                              NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                                                              child: Align(
                                                                alignment: Alignment.bottomRight,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Image.asset('assets/images/blueonline.png'), onPressed: () {  },
                                                                    )
                                                                  ],

                                                                ),
                                                              ),

                                                          )
                                                        ),
                                                      ),

                                                      Container(
                                                        height: 5.sp,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "New User",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20.sp
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "Therapist",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.sp
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "online",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10.sp
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        height: 10.sp,
                                                      ),
                                                      Container(
                                                        height: 150.sp,
                                                        width: 150.sp,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            image: AssetImage("assets/images/shadow.png"),

                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        child: Container(
                                                            padding:  EdgeInsets.all(12.sp),
                                                            height: 18.sp,
                                                            width: 18.sp,
                                                            decoration: BoxDecoration(
                                                              shape: BoxShape.circle,
                                                            ),

                                                            child: CircleAvatar

                                                              (
                                                              radius: 20,
                                                              backgroundImage:
                                                              NetworkImage('https://i.imgur.com/BoN9kdC.png'),
                                                              child: Align(
                                                                alignment: Alignment.bottomRight,
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                  mainAxisSize: MainAxisSize.max,
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    IconButton(
                                                                      icon: Image.asset('assets/images/blueonline.png'), onPressed: () {  },
                                                                    )
                                                                  ],

                                                                ),
                                                              ),

                                                            )
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 5.sp,
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "New User",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 20.sp
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "Therapist",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 15.sp
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Text(
                                                          "Online",
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10.sp
                                                          ),
                                                        ),
                                                      ),



                                                    ],
                                                  ),

                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 10.sp,
                                          ),
                                          Container(
                                            //height: 258.sp,
                                            width: 244.sp,
                                            padding: EdgeInsets.all(20.sp),


                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(20.sp),
                                                    bottomRight: Radius.circular(20.sp),
                                                    bottomLeft: Radius.circular(20.sp),
                                                    topLeft: Radius.circular(20.sp))
                                            ),
                                            child: Column(
                                                children: [
                                                  DataViz(),

                                                  Text(
                                                    "Patients' Performance +2%",
                                                    style:
                                                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp,color: Color(0xFF808080),),
                                                  ),
                                                  Container(
                                                      height: 10.sp,
                                                  )
                                                ],
                                            ),
                                          ),
                                        ]
                                    ),
                                    Container(
                                      width: 30.sp,
                                    ),
                                    Expanded(
                                      child: Container(

                                        padding: EdgeInsets.all(10.sp),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFF1F1F1),
                                            boxShadow: [
                                              //background color of box
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                blurRadius: 25.0, // soften the shadow
                                                spreadRadius: 5.0, //extend the shadow
                                                offset: Offset(
                                                  15.0, // Move to right 10  horizontally
                                                  15.0, // Move to bottom 10 Vertically
                                                ),
                                              )
                                            ],
                                            border: Border.all(

                                                color: Colors.white.withOpacity(1.0)
                                            ),
                                            borderRadius: BorderRadius.all(Radius.circular(20))
                                        ),
                                        /*  height: MediaQuery
                                            .of(context)
                                            .size
                                            .height,*/
                                        /* width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,*/
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 10.sp,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: buildFutureBuilderuserid(),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: Text(
                                                  "Last login : "+formatteddatetime,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xFF989898 ),
                                                      fontSize: 15.sp
                                                  ),

                                                ),
                                              ),
                                            ),

                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: GestureDetector(
                                                    onTap: () async{
                                                      setState(() {
                                                        showfirstnametextwidget();
                                                        hidefirstnamewidget();
                                                        showlastnametextwidget();
                                                        hidelastnamewidget();
                                                        showemailtextwidget();
                                                        hideemailwidget();
                                                        showphtextwidget();
                                                        hidephwidget();
                                                        showbirthtextwidget();
                                                        hidebirthwidget();
                                                        showlanguagetextwidget();
                                                        hidelanguagewidget();
                                                        showgendertextwidget();
                                                        hidegenderwidget();
                                                        updatedetails();
                                                        //updatedetails();
                                                        gettoken();
                                                        _futureAlbum= getuserdetails();
                                                        print(firstnameController.text);
                                                      });
                                                    },



                                                      child: Neumorphic(
                                                      //  margin: const EdgeInsets.only(bottom: 20.0),
                                                        style: NeumorphicStyle(
                                                            shape: NeumorphicShape.concave,
                                                          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                                                          depth: -8,
                                                         // lightSource: LightSource.top,
                                                         // depth: 8,
                                                          color:Color(0xFFF1F1F1),

                                                        ),
                                                        //width: 100.sp,
                                                        padding: EdgeInsets.only(top: 20.sp,bottom: 20.sp,left: 30.sp,right: 30.sp),
                                                        /*decoration: BoxDecoration(
                                                         *//* boxShadow: [
                                                            BoxShadow (
                                                              color: Colors.grey.withOpacity(0.8),
                                                              // color: Color(0xFF989898),
                                                              spreadRadius: 2,
                                                              blurRadius: 5,
                                                              offset: Offset(7, 0),
                                                            ),
                                                          ],*//*

                                                          color: Color(0xFFF1F1F1),
                                                          *//*image: new DecorationImage(
                                                            image: new AssetImage("assets/images/rectangle.png"),
                                                            fit: BoxFit.fill,
                                                          ),*//*
                                                         *//* border: new Border.all(
                                                            color: Color(0xFFe2e2e2),
                                                            width: 0,
                                                          ),*//*
                                                          borderRadius: BorderRadius.all(Radius.circular(20)),

                                                        ),*/
                                                        child: Form(
                                                          key: _formKey,
                                                          child: Table(
                                                            columnWidths: {
                                                              0: FixedColumnWidth(75.sp),
                                                              1: FixedColumnWidth(300.sp),
                                                              2: FixedColumnWidth(25.sp),
                                                            },
                                                            border: TableBorder(
                                                                horizontalInside: BorderSide(
                                                                    width: 1,  color: Colors.grey.withOpacity(0.5), style: BorderStyle.solid)),
                                                            children: [
                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "FIRST NAME *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                              visible: viewfirstnametext,
                                                                              child: buildFutureBuilder(),

                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewfirstname,
                                                                            child: Center(

                                                                              child: SizedBox(
                                                                                //  height: 30.sp,
                                                                                //  width: 200.sp,
                                                                                child: TextFormField(
                                                                                  controller: firstnameController,

                                                                                  decoration: InputDecoration(
                                                                                    border: InputBorder.none,

                                                                                    hintText: 'Enter Firstname',
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: GestureDetector(
                                                                        onTap: () {

                                                                          //Navigator.pushNamed(context, "myRoute");
                                                                        },
                                                                        child: Align(
                                                                          alignment: Alignment.centerRight,
                                                                          child: GestureDetector(
                                                                            onTap: () {
                                                                              hidefirstnametextwidget();
                                                                              showfirstnamewidget();
                                                                              //Navigator.pushNamed(context, "myRoute");
                                                                            },
                                                                            child: Text(
                                                                              "EDIT",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF989898 ),
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),

                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                              ),

                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "LAST NAME *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                              visible: viewlastnametext,

                                                                              child: buildFutureBuilderlastname(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewlastname,
                                                                            child: SizedBox(
                                                                              /* height: 30.sp,
                                                                            width: 100.sp,*/
                                                                              child: TextField(
                                                                                controller: lastnameController,

                                                                                decoration: InputDecoration(
                                                                                  border: UnderlineInputBorder(),

                                                                                  hintText: 'Enter Lastname',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            hidelastnametextwidget();
                                                                            showlastnamewidget();
                                                                            //Navigator.pushNamed(context, "myRoute");
                                                                          },
                                                                          child: Text(
                                                                            "EDIT",
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF989898 ),
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                              ),
                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "EMAIL *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                              visible: viewemailtext,
                                                                              child: buildFutureBuilderemail(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewemail,
                                                                            child: SizedBox(
                                                                              /* height: 30.sp,
                                                                            width: 100.sp,*/
                                                                              child: TextField(
                                                                                controller: emailController,

                                                                                decoration: InputDecoration(
                                                                                  border: UnderlineInputBorder(),

                                                                                  hintText: 'Enter Email',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),

                                                                    Visibility(
                                                                      visible: false,
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                        child: Align(
                                                                          alignment: Alignment.centerRight,
                                                                          child: GestureDetector(
                                                                            onTap: () {
                                                                              //  hideemailtextwidget();
                                                                              // showemailwidget();
                                                                              //Navigator.pushNamed(context, "myRoute");
                                                                            },
                                                                            child: Text(
                                                                              "",
                                                                              textAlign: TextAlign.center,
                                                                              style: TextStyle(
                                                                                color: Color(0xFF989898 ),
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.bold,
                                                                              ),

                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]

                                                              ),
                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "PHONE NUMBER *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                              visible: viewphnotext,
                                                                              child: buildFutureBuilderph(),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewphno,
                                                                            child: SizedBox(
                                                                              /*   height: 30.sp,
                                                                             width: 100.sp,*/
                                                                              child: TextField(
                                                                                controller: phnoController,

                                                                                decoration: InputDecoration(
                                                                                  border: UnderlineInputBorder(),

                                                                                  hintText: 'Enter phone number',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            // hidephtextwidget();
                                                                            // showphwidget();
                                                                            //Navigator.pushNamed(context, "myRoute");
                                                                          },
                                                                          child: Text(
                                                                            "",
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF989898 ),
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                              ),
                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "BIRTH *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                                visible: viewbirthtext,
                                                                                child:   FutureBuilder<Getresp>(
                                                                                  future: _futureAlbum,
                                                                                  builder: (context, snapshot) {
                                                                                    if( snapshot.connectionState == ConnectionState.waiting){
                                                                                      return  Center(child: Text('Please wait its loading...'));
                                                                                    }
                                                                                    else{
                                                                                      if (snapshot.hasData) {
                                                                                        return
                                                                                          Text(
                                                                                            snapshot.data!.data.usr_birth_date,
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(
                                                                                              color: Color(0xFF989898 ),
                                                                                              fontSize: 12.sp,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),

                                                                                          );
                                                                                      } else if (snapshot.hasError) {
                                                                                        return Text(
                                                                                          usr_birth_date!,
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF989898 ),
                                                                                            fontSize: 12.sp,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),

                                                                                        );
                                                                                      }
                                                                                    }


                                                                                    // By default, show a loading spinner.
                                                                                    return const CircularProgressIndicator();
                                                                                  },
                                                                                )
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewbirth,
                                                                            child: SizedBox(
                                                                              /* height: 30.sp,
                                                                             width: 100.sp,*/
                                                                              child: TextField(
                                                                                controller: birthController,

                                                                                decoration: InputDecoration(
                                                                                  border: UnderlineInputBorder(),

                                                                                  hintText: 'Enter birth date (YYYY-MM-DD)',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),


                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            hidebirthtextwidget();
                                                                            showbirthwidget();
                                                                            //Navigator.pushNamed(context, "myRoute");
                                                                          },
                                                                          child: Text(
                                                                            "EDIT",
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF989898 ),
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                              ),
                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "GENDER *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                              visible: viewgendertext,
                                                                              child: FutureBuilder<Getresp>(
                                                                                future: _futureAlbum,
                                                                                builder: (context, snapshot) {
                                                                                  if (snapshot.hasData) {
                                                                                    return
                                                                                      Text(
                                                                                        snapshot.data!.data.usr_gender,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF989898 ),
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),

                                                                                      );
                                                                                  } else if (snapshot.hasError) {
                                                                                    return Text(
                                                                                      usr_gender!,
                                                                                      textAlign: TextAlign.left,
                                                                                      style: TextStyle(
                                                                                        color: Color(0xFF989898 ),
                                                                                        fontSize: 12.sp,
                                                                                        fontWeight: FontWeight.bold,
                                                                                      ),

                                                                                    );
                                                                                  }

                                                                                  // By default, show a loading spinner.
                                                                                  return const CircularProgressIndicator();
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewgender,
                                                                            child: SizedBox(
                                                                              /* height: 30.sp,
                                                                             width: 100.sp,*/
                                                                              child: TextField(
                                                                                controller: genderController,

                                                                                decoration: InputDecoration(
                                                                                  border: UnderlineInputBorder(),

                                                                                  hintText: 'Enter gender',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            hidegendertextwidget();
                                                                            showgenderwidget();
                                                                            //Navigator.pushNamed(context, "myRoute");
                                                                          },
                                                                          child: Text(
                                                                            "EDIT",
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF989898 ),
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),

                                                                  ]
                                                              ),
                                                              TableRow(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerLeft,
                                                                        child: Text(
                                                                          "LANGUAGE *",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment: Alignment.centerLeft,
                                                                          child: Padding(
                                                                            padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                            child: Visibility(
                                                                                visible: viewlanguagetext,
                                                                                child: FutureBuilder<Getresp>(
                                                                                  future: _futureAlbum,
                                                                                  builder: (context, snapshot) {
                                                                                    if (snapshot.hasData) {
                                                                                      return
                                                                                        Text(
                                                                                          snapshot.data!.data.usr_language,
                                                                                          textAlign: TextAlign.left,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFF989898 ),
                                                                                            fontSize: 12.sp,
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),

                                                                                        );
                                                                                    } else if (snapshot.hasError) {
                                                                                      return Text(
                                                                                        usr_language!,
                                                                                        textAlign: TextAlign.left,
                                                                                        style: TextStyle(
                                                                                          color: Color(0xFF989898 ),
                                                                                          fontSize: 12.sp,
                                                                                          fontWeight: FontWeight.bold,
                                                                                        ),

                                                                                      );
                                                                                    }

                                                                                    // By default, show a loading spinner.
                                                                                    return const CircularProgressIndicator();
                                                                                  },
                                                                                )
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                          child: Visibility(
                                                                            visible: viewlanguage,
                                                                            child: SizedBox(
                                                                              /* height: 30.sp,
                                                                            width: 100.sp,*/
                                                                              child: TextFormField(
                                                                                controller: languageController,

                                                                                decoration: InputDecoration(
                                                                                  border: UnderlineInputBorder(),

                                                                                  hintText: 'Enter language',
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],

                                                                    ),

                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 5.0),
                                                                      child: Align(
                                                                        alignment: Alignment.centerRight,
                                                                        child: GestureDetector(
                                                                          onTap: () {
                                                                            hidelanguagetextwidget();
                                                                            showlanguagewidget();
                                                                            //Navigator.pushNamed(context, "myRoute");
                                                                          },
                                                                          child: Text(
                                                                            "EDIT",
                                                                            textAlign: TextAlign.center,
                                                                            style: TextStyle(
                                                                              color: Color(0xFF989898 ),
                                                                              fontSize: 12.sp,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),

                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ]
                                                              )
                                                            ],
                                                          ),
                                                        ),

                                                      ),
                                                  ),
                                                ),


                                                   Expanded(
                                                    flex: 3,
                                                    child: Container(

                                                      padding: EdgeInsets.all(20.sp),
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                              height: 10.sp,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 4,
                                                                child: SizedBox(
                                                                  height: 40.sp,
                                                                  width: 40.sp,
                                                                  child: Image(
                                                                    image: AssetImage('assets/images/eye.png'),

                                                                  ),
                                                                ),
                                                              ),


                                                              Expanded(
                                                                  flex: 6,
                                                                child: Container(
                                                                  padding: EdgeInsets.only(left: 5.sp,right: 5.sp,top: 5.sp),
                                                                //   height: 47.sp,
                                                                  // width: 100.sp,
                                                                   decoration: BoxDecoration(
                                                                     /* boxShadow: [
                                                                  BoxShadow (
                                                                    color: Colors.grey.withOpacity(0.8),
                                                                    // color: Color(0xFF989898),
                                                                    spreadRadius: 2,
                                                                    blurRadius: 5,
                                                                    offset: Offset(7, 0),
                                                                  ),
                                                            ],*/

                                                                     color: Colors.transparent,
                                                                     image: new DecorationImage(
                                                                  image: new AssetImage("assets/images/groups.png"),
                                                                  fit: BoxFit.fill,
                                                            ),
                                                                     border: new Border.all(
                                                                       color: Colors.transparent,
                                                                       width: 0,
                                                                     ),
                                                                     borderRadius: BorderRadius.all(Radius.circular(40)),

                                                                   ),
                                                                   child: Row(
                                                                     children: [
                                                                     Expanded(
                                                                         flex: 5,
                                                                         child: GestureDetector(
                                                                           onTap: (){
                                                                             setState(() {
                                                                               _oncolor=Colors.transparent;
                                                                               _offcolor=Color(0xFF989898);
                                                                               offtext="ON";
                                                                               ontext="Off";
                                                                               _offcolortextcode=Colors.white;
                                                                               _oncolortext=Color(0xFF666666);



                                                                             });


                                                                           },
                                                                           child: Container(
                                                                             height: 45.sp,
                                                                             //width: 70.sp,

                                                                             decoration: BoxDecoration(
                                                                                 color: _offcolor,
                                                                                 borderRadius: BorderRadius.only(
                                                                                   bottomLeft: Radius.circular(40.0),
                                                                                   bottomRight: Radius.circular(40.0),
                                                                                   topLeft: Radius.circular(40.0),
                                                                                   topRight: Radius.circular(40.0),


                                                                                 ),

                                                                             ),
                                                                             child: GestureDetector(
                                                                               onTap: (){
                                                                                 setState(() {
                                                                                   _oncolor=Colors.transparent;
                                                                                   _offcolor=Color(0xFF989898);
                                                                                   offtext="ON";
                                                                                   ontext="Off";
                                                                                   _offcolortextcode=Colors.white;
                                                                                   _oncolortext=Color(0xFF666666);



                                                                                 });


                                                                               },
                                                                               child: Center(
                                                                                 child: Text(
                                                                                     offtext,
                                                                                     textAlign: TextAlign.center,
                                                                                     style:  TextStyle(
                                                                                       color: _offcolortextcode,
                                                                                       fontSize: 14.sp,
                                                                                       fontWeight: FontWeight.bold,


                                                                                     )
                                                                                 ),
                                                                               ),
                                                                             ),
                                                                           ),
                                                                         ),
                                                                     ),
                                                                       Expanded(
                                                                         flex: 5,
                                                                         child: GestureDetector(
                                                                           onTap: (){
                                                                             setState(() {
                                                                               _oncolor=Color(0xFF989898);
                                                                               _offcolor=Colors.transparent;
                                                                               offtext="Off";
                                                                               ontext="ON";
                                                                               _offcolortextcode=Color(0xFF666666);
                                                                               _oncolortext=Colors.white;
                                                                             });


                                                                           },
                                                                           child: Container(
                                                                             height: 45.sp,
                                                                           //  width: 70.sp,
                                                                             decoration: BoxDecoration(
                                                                                 color: _oncolor,
                                                                                 borderRadius: BorderRadius.only(
                                                                                   bottomLeft: Radius.circular(40.0),
                                                                                   bottomRight: Radius.circular(40.0),
                                                                                   topLeft: Radius.circular(40.0),
                                                                                   topRight: Radius.circular(40.0),


                                                                                 )
                                                                             ),
                                                                             child: GestureDetector(
                                                                                 onTap: (){
                                                                                 setState(() {
                                                                                    _oncolor=Color(0xFF989898);
                                                                                    _offcolor=Colors.transparent;
                                                                                    offtext="Off";
                                                                                    ontext="ON";
                                                                                    _offcolortextcode=Color(0xFF666666);
                                                                                    _oncolortext=Colors.white;
                                                                                 });


                                                                               },
                                                                               child: Center(
                                                                                 child: Text(
                                                                                     ontext,
                                                                                     textAlign: TextAlign.center,
                                                                                     style:  TextStyle(
                                                                                       color: _oncolortext,
                                                                                       fontSize: 14.sp,
                                                                                       fontWeight: FontWeight.bold,


                                                                                     )
                                                                                 ),
                                                                               ),
                                                                             ),
                                                                           ),
                                                                         ),
                                                                       ),
                                                                     ],
                                                                   ),
                                                                 ),
                                                              ),

                                                            ],
                                                          ),
                                                          Container(
                                                            height: 10.sp,
                                                          ),
                                                          Text(
                                                            "Do you have color blindness",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color(0xFF808080),
                                                                fontSize: 12.sp
                                                            ),
                                                          ),
                                                          Text(
                                                            "Activate this option.Learn",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color(0xFF808080),
                                                                fontSize: 12.sp
                                                            ),
                                                          ),
                                                          Text(
                                                            "more here",
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color(0xFF808080),
                                                                fontSize: 12.sp
                                                            ),
                                                          ),
                                                          Container(
                                                            height: 120.sp,
                                                          ),
                                                          SizedBox(
                                                            height: 40.sp,
                                                            width: 40.sp,
                                                            child: IconButton(
                                                              icon: Image.asset('assets/images/key.png'), onPressed: () {  },
                                                            ),
                                                          ),
                                                          DecoratedBox(
                                                            decoration: BoxDecoration(

                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(40.sp),
                                                                  bottomRight: Radius.circular(40.sp),
                                                                  topLeft: Radius.circular(40.sp),
                                                                  bottomLeft: Radius.circular(40.sp)),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.white,
                                                                  blurRadius: 2,
                                                                  spreadRadius: 1,
                                                                  offset: Offset(0, -3),
                                                                ),
                                                                BoxShadow(
                                                                  color: Colors.grey.shade400,
                                                                  blurRadius: 2.0,
                                                                  spreadRadius: 0.0,
                                                                  offset: Offset(2.0, 2.0), // changes position of shadow
                                                                ),
                                                              ],
                                                            ),
                                                              child: Container(
                                                                  height: 50.sp,
                                                                  width:190.sp,
                                                                  child: ElevatedButton(

                                                                        style: ButtonStyle(
                                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                        RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.circular(40.0),
                                                                        ),
                                                                      ),

                                                                      // fixedSize: Size(426.sp, 149.sp),
                                                                      // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                      backgroundColor:
                                                                      MaterialStateProperty.all(Color(0xFF29AAE1),),
                                                                      // elevation: MaterialStateProperty.all(3),
                                                                      shadowColor:
                                                                      MaterialStateProperty.all( Color(0xFF29AAE1),),
                                                                    ),
                                                                    onPressed: () async  {
                                                                      showDialog(
                                                                          barrierDismissible: true,
                                                                          context: context,

                                                                          builder: (context){
                                                                            return StatefulBuilder(
                                                                                builder: (BuildContext context, setState){
                                                                                  return Dialog(

                                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                    elevation: 16,

                                                                                    child: Form(
                                                                                      key: _changepwdformKey,
                                                                                      child: Container(
                                                                                        // padding: EdgeInsets.all(5.sp),
                                                                                        width: 400.sp,
                                                                                        height: 400.sp,
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
                                                                                                    obscureText: true,
                                                                                                    keyboardType: TextInputType.visiblePassword,
                                                                                                    validator: (oldpwd) {
                                                                                                      if (oldpwd == null || oldpwd.isEmpty || oldpwd.length < 6) {

                                                                                                       /* Fluttertoast.showToast(
                                                                                                            msg: "Old Password Required or Old Password should be 6 charecter",
                                                                                                            toastLength: Toast.LENGTH_SHORT,
                                                                                                            gravity: ToastGravity.CENTER,
                                                                                                            timeInSecForIosWeb: 2,
                                                                                                            backgroundColor: Colors.red,
                                                                                                            textColor: Colors.white,
                                                                                                            fontSize: 16.0,
                                                                                                            webPosition: "center"
                                                                                                        );*/

                                                                                                    //    showoldpassword();
                                                                                                      }
                                                                                                      else{
                                                                                                     //   hideoldpassword();
                                                                                                      }

                                                                                                      //    hidevalidusername();
                                                                                                    },
                                                                                                    controller: OldpwdController,
                                                                                                  //  obscureText: !_passwordVisible,


                                                                                                    decoration: InputDecoration(
                                                                                                        border: InputBorder.none,
                                                                                                        //  filled: true,
                                                                                                        fillColor: Colors.white70,

                                                                                                        hintText: 'Old Password',
                                                                                                      /*  suffixIcon: GestureDetector(
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
                                                                                                        )*/

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
                                                                                                    "Old Password Required.",
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
                                                                                                    obscureText: true,
                                                                                                    keyboardType: TextInputType.visiblePassword,
                                                                                                    validator: (newpwd) {
                                                                                                      if (newpwd == null || newpwd.isEmpty || newpwd.length < 6) {
                                                                                                     /*   Fluttertoast.showToast(
                                                                                                            msg: "New Password Required or New Password should 6 charecter",
                                                                                                            toastLength: Toast.LENGTH_SHORT,
                                                                                                            gravity: ToastGravity.CENTER,
                                                                                                            timeInSecForIosWeb: 2,
                                                                                                            backgroundColor: Colors.red,
                                                                                                            textColor: Colors.white,
                                                                                                            fontSize: 16.0,
                                                                                                            webPosition: "center"
                                                                                                        );*/

                                                                                                        //shownewpwd();
                                                                                                      }
                                                                                                      else{
                                                                                                       // hidenewpwd();
                                                                                                      }

                                                                                                      //    hidevalidusername();
                                                                                                    },
                                                                                                    controller: newpwdController,



                                                                                                    decoration: InputDecoration(
                                                                                                        border: InputBorder.none,
                                                                                                        //  filled: true,
                                                                                                        fillColor: Colors.white70,

                                                                                                        hintText: 'New Password',
                                                                                                       /* suffixIcon: GestureDetector(
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
                                                                                                        )*/

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
                                                                                                    "New Password Required",
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
                                                                                                    keyboardType: TextInputType.visiblePassword,
                                                                                                    // enabled:regemail,
                                                                                                    obscureText: true,
                                                                                                    validator: (cnfpwd) {
                                                                                                      if (cnfpwd == null || cnfpwd.isEmpty || cnfpwd.length < 6) {
                                                                                                       /* Fluttertoast.showToast(
                                                                                                            msg: "Confirm Password Required or Confirm Password should be minimum 6 charecter",
                                                                                                            toastLength: Toast.LENGTH_SHORT,
                                                                                                            gravity: ToastGravity.CENTER,
                                                                                                            timeInSecForIosWeb: 2,
                                                                                                            backgroundColor: Colors.red,
                                                                                                            textColor: Colors.white,
                                                                                                            fontSize: 16.0,
                                                                                                            webPosition: "center"
                                                                                                        );*/

                                                                                                        //showcnfpwd();
                                                                                                      }

                                                                                                      else{
                                                                                                     //   hidecnfpwd();
                                                                                                      }

                                                                                                      //    hidevalidusername();
                                                                                                    },
                                                                                                    controller: confirmpwdController,




                                                                                                    decoration: InputDecoration(
                                                                                                        border: InputBorder.none,
                                                                                                        //  filled: true,
                                                                                                        fillColor: Colors.white70,

                                                                                                        hintText: 'Confirm Password',
                                                                                                        /*suffixIcon: GestureDetector(
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
                                                                                                        )*/

                                                                                                    ),

                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                height: 10.sp,
                                                                                              ),
                                                                                              Visibility(
                                                                                                visible: false,
                                                                                                child: Container(
                                                                                                  child: Text(
                                                                                                    "Confirm Password Required.",
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
                                                                                                     if (!_changepwdformKey.currentState!.validate()) {


                                                                                                          }
                                                                                                    else if (OldpwdController.text == null || OldpwdController.text.isEmpty || OldpwdController.text.length < 6) {

                                                                                                       Fluttertoast.showToast(
                                                                                                           msg: "Old Password Required or Old Password should be 6 charecter",
                                                                                                           toastLength: Toast.LENGTH_SHORT,
                                                                                                           gravity: ToastGravity.CENTER,
                                                                                                           timeInSecForIosWeb: 5,
                                                                                                           backgroundColor: Colors.red,
                                                                                                           textColor: Colors.white,
                                                                                                           fontSize: 16.0,
                                                                                                           webPosition: "center"
                                                                                                       );

                                                                                                       //    showoldpassword();
                                                                                                     }
                                                                                                     else if (newpwdController.text == null || newpwdController.text.isEmpty || newpwdController.text.length < 6) {

                                                                                                       Fluttertoast.showToast(
                                                                                                           msg: "New Password Required or New Password should 6 charecter",
                                                                                                           toastLength: Toast.LENGTH_SHORT,
                                                                                                           gravity: ToastGravity.CENTER,
                                                                                                           timeInSecForIosWeb: 5,
                                                                                                           backgroundColor: Colors.red,
                                                                                                           textColor: Colors.white,
                                                                                                           fontSize: 16.0,
                                                                                                           webPosition: "center"
                                                                                                       );

                                                                                                       //    showoldpassword();
                                                                                                     }
                                                                                                     else if (confirmpwdController.text == null || confirmpwdController.text.isEmpty || confirmpwdController.text.length < 6) {

                                                                                                       Fluttertoast.showToast(
                                                                                                           msg: "Confirm Password Required or Confirm Password should be minimum 6 charecter",
                                                                                                           toastLength: Toast.LENGTH_SHORT,
                                                                                                           gravity: ToastGravity.CENTER,
                                                                                                           timeInSecForIosWeb: 5,
                                                                                                           backgroundColor: Colors.red,
                                                                                                           textColor: Colors.white,
                                                                                                           fontSize: 16.0,
                                                                                                           webPosition: "center"
                                                                                                       );

                                                                                                       //    showoldpassword();
                                                                                                     }

                                                                                                     else{
                                                                                                       if(newpwdController.text==confirmpwdController.text){
                                                                                                         changepwd();
                                                                                                         // hidecnfpwd();
                                                                                                       }
                                                                                                       else{
                                                                                                         Fluttertoast.showToast(
                                                                                                             msg: "Confirm password and new password should match",
                                                                                                             toastLength: Toast.LENGTH_SHORT,
                                                                                                             gravity: ToastGravity.CENTER,
                                                                                                             timeInSecForIosWeb: 5,
                                                                                                             backgroundColor: Colors.red,
                                                                                                             textColor: Colors.white,
                                                                                                             fontSize: 16.0,
                                                                                                             webPosition: "center"
                                                                                                         );
                                                                                                       }
                                                                                                       //   hideoldpassword();
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

                                                                                  ) ;
                                                                                }
                                                                            );

                                                                          }
                                                                      ).then((val) {
                                                                        confirmpwdController.clear();
                                                                        OldpwdController.clear();
                                                                        newpwdController.clear();
                                                                      });;
                                                                     },
                                                                     child: Text("Change Password >",
                                                                       style: TextStyle(
                                                                         color: Colors.white,


                                                                       ),
                                                                     ),
                                                                ),
                                                              ),
                                                          )
                                                        ],
                                                      ),

                                                    ),
                                                  )


                                              ],
                                            )
                                          ],
                                        ),

                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
                    return Container(
                      color:Colors.red,
                      child: Text(
                        "Tablet",
                      ),
                    );
                  }
                  if (sizingInformation.deviceScreenType == DeviceScreenType.watch) {
                    return Container(
                      color:Colors.yellow,
                      child: Text(
                        "Watch",
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

  void showPopupMenu() {
    showMenu<String>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 30.sp,
                    width: 30.sp,
                    /*child: IconButton(
                      icon: Image.asset('assets/images/profile.png'), onPressed: () {

                    },

                    ),*/
                  ),
                  Text(
                    "SETTING",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),
                  SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    /*child: IconButton(
                      icon: Image.asset('assets/images/profile.png'), onPressed: () {

                    },

                    ),*/
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40.sp,
                      width: 40.sp,
                      child: IconButton(
                        icon: Image.asset('assets/images/profile.png'), onPressed: () {

                      },

                      ),
                    ),

                  ),

                ],
              ),
            )
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
            child:   Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/username.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'patient/profile');
                    },
                    child: Container(
                      
                      child: Text(
                        "PROFILE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,


                        ),

                      ),
                    ),
                  ),

                ],
              ),
            )
        ),
        /*PopupMenuItem<String>(
            child:   Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/key.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                      builder: (context){
                        return Dialog(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          elevation: 16,

                                child: Container(
                                  // padding: EdgeInsets.all(5.sp),
                                  width: 400.sp,
                                  height: 400.sp,
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
                                      *//*  Container(
                                          height: 10.sp,
                                        ),*//*
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
                                             // controller: forgotemailController,
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
                                          visible: false,
                                          child: Container(
                                            child: Text(
                                              "Email required or please enter valid email.",
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
                                              // controller: forgotemailController,
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
                                              textInputAction: TextInputAction.done,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 10.sp,
                                        ),
                                        Visibility(
                                          visible: false,
                                          child: Container(
                                            child: Text(
                                              "Email required or please enter valid email.",
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
                                              // controller: forgotemailController,
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
                                              textInputAction: TextInputAction.done,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 10.sp,
                                        ),
                                        Visibility(
                                          visible: false,
                                          child: Container(
                                            child: Text(
                                              "Email required or please enter valid email.",
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

                        );
                      }
                      );
                    //  Navigator.pushNamed(context, 'patient/profile');
                    },
                    child: Text(
                      "CHANGE PASSWORD",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,


                      ),

                    ),
                  ),

                ],
              ),
            )
        ),*/
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/reminder.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "REMINDERS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/payment.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "PAYMENT METHOD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/username.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "REPORTS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/share.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "SHARE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/generalperef.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'patient/generalpreference');
                    },
                    child: Text(
                      "GENERAL PREFERENCE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,


                      ),

                    ),
                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/logous.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () async{
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.remove("p_id");
                      prefs.remove("userfname");
                      prefs.remove("usr_last_name");
                      prefs.remove("usr_user_name");
                      prefs.remove("usr_email");
                      prefs.remove("usr_phone");
                      prefs.remove("usr_birth_date");
                      prefs.remove("usr_gender");
                      prefs.remove("usr_language");
                      prefs.remove("usr_profile_image");
                      prefs.remove("authtoken");
                      await DefaultCacheManager().emptyCache();
                      
                      Navigator.pushNamed(context, '/');
                    },
                    child: Container(
                      child: Text(
                        "LOGOUT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,


                        ),

                      ),
                    ),
                  ),

                ],
              ),
            )
        ),


      ],
      elevation: 8.0,

    );



  }

  void gettoken()  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.reload();
    setState(() {
      token=prefs.getString("authtoken");
      p_id=prefs.getInt("p_id");
      userfname=prefs.getString("userfname");
      usr_last_name=prefs.getString("usr_last_name");
      usr_user_name=prefs.getString("usr_user_name");
      usr_email=prefs.getString("usr_email");
      usr_phone=prefs.getString("usr_phone");
      usr_birth_date=prefs.getString("usr_birth_date");
      usr_gender=prefs.getString("usr_gender");

      usr_language=prefs.getString("usr_language");
      usr_profile_image=prefs.getString("usr_profile_image");

      debugPrint("patrinttoken: ${token}");
      debugPrint("patriid: ${p_id}");
      debugPrint("userfname: ${userfname}");
      debugPrint("usr_last_name: ${usr_last_name}");
      debugPrint("usr_user_name: ${usr_user_name}");
      debugPrint("usr_phone: ${usr_phone}");

      debugPrint("usr_gender: ${usr_gender}");
      debugPrint("usr_email: ${usr_email}");
      debugPrint("usr_birth_date: ${usr_birth_date}");
      debugPrint("usr_language: ${usr_language}");
      debugPrint("usr_profile_image: ${usr_profile_image}");


      print(p_id);
    });

  }
  /*Future<http.Response> Getdata(int p_id) async {
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqd3RpZCI6IlB4S01fMGFweSIsImlhdCI6MTYzODQyNjI2MSwiZXhwIjoxNjM4NDMzNDYxLCJzdWIiOiJ0b2tlbiIsImlzcyI6InBsYXRmb3JtIiwiZGF0YSI6eyJ1c2VyX2lkIjozLCJmaXJzdF9uYW1lIjoiYXJrYWRpcCIsImxhc3RfbmFtZSI6Imdob3NhbCIsImVtYWlsIjoiYXJrYWRpcGdob3NhbEBnbWFpbC5jb20iLCJwaG9uZSI6Ijg2OTc4MjI0OTMiLCJ1c2VybmFtZSI6IiIsInVzZXJfdHlwZSI6MX19.bR7CMztnTblPMNXZozK2P2wAch2Jk-mfaaim7bWmmHo',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('https://us-central1-emazebrain-5cf9b.cloudfunctions.net/app/user/details'));
    request.body = json.encode({
      "user_id": "1"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }*/



  Future<Getresp> getuserdetails() async {
    final response = await http.post(
      Uri.parse(Constants.baseurl+'user/details'),
      headers: <String, String>{
      // "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer '+token!,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, int>{
        'user_id': p_id!,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      Map<String, dynamic> data = json.decode(response.body);
      print(data["data"]["usr_first_name"]);
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userfname=data["data"]["usr_first_name"];
      pref.setString('userfname', userfname);
      String usr_last_name=data["data"]["usr_last_name"];
      pref.setString('usr_last_name', usr_last_name);
      String usr_user_name=data["data"]["usr_user_name"];
      pref.setString('usr_user_name', usr_user_name);
      String usr_email=data["data"]["usr_email"];
      pref.setString('usr_email', usr_email);
      String usr_phone=data["data"]["usr_phone"];
      pref.setString('usr_phone', usr_phone);
      String usr_birth_date=data["data"]["usr_birth_date"];
      pref.setString('usr_birth_date', usr_birth_date);
      String usr_gender=data["data"]["usr_gender"];
      pref.setString('usr_gender', usr_gender);
      String usr_language=data["data"]["usr_language"];
      pref.setString('usr_language', usr_language);
      String usr_profile_image=data["data"]["usr_profile_image"];
      pref.setString('usr_profile_image', usr_profile_image);
      gettoken();
     ///  userfname=data["data"]["usr_first_name"];
      return Getresp.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }


  Future<Updateprofileresponse>  updatedetails() async {
     //print(fname);
    showLoaderDialog(context);
    final response = await http.post(
      Uri.parse(Constants.baseurl+'user/update'),
      headers: <String, String>{
      //  "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer '+token!,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'usr_first_name': firstnameController.text,
        'usr_last_name': lastnameController.text,
        'usr_birth_date': birthController.text,
        'usr_gender': genderController.text,
        'usr_language': languageController.text

      }
      ),

    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      Navigator.pop(context);
      print(jsonDecode(response.body));
      gettoken();
      _futureAlbum= getuserdetails();
      return Updateprofileresponse.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(
          msg:"Something wrong from server.Please try again later",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );
      Navigator.pop(context);
      throw Exception('Failed to update user.');
    }
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
      OldpwdController.clear();
      confirmpwdController.clear();
      newpwdController.clear();
      Navigator.pop(context);
      Fluttertoast.showToast(
          msg: data["message"],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );
      return Getchangepwdresponse.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(
          msg: "Old Password Not Matching",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );
      throw Exception();
    }
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  void tokenanduserdetaisl() async{

  }

}