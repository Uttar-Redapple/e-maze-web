import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:emaze_brain/model/response/getresp.dart';
import 'package:emaze_brain/model/response/updateprofileresponse.dart';
import 'package:emaze_brain/screen/data_viz/data_viz.dart';
import 'package:emaze_brain/screen/patientprofile/Patientprofile.dart';
import 'package:emaze_brain/screen/patientusermanagement/Patientusermanagement.dart';
import 'package:emaze_brain/screen/util/InnerShadow.dart';
import 'package:emaze_brain/screen/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Therapistuserprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TherapistuserprofileState();
  }

}
class TherapistuserprofileState extends State<Therapistuserprofile>{
  /*@override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 10),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Patientprofile())));
  }*/
  bool status = false;
  Future<Getresp>? _futureAlbum;
  final _formKey = GlobalKey<FormState>();
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

  int? p_id;
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

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phnoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  void clearprofiletext(){
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    phnoController.clear();
    genderController.clear();
    languageController.clear();
    birthController.clear();
  }
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
  Widget build(BuildContext context) {
    // TODO: implement build
    var radius = Radius.circular(40);
    gettoken();
    _futureAlbum= getuserdetails();
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
                                                color: Color(0xFFFF2D5E),
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
                                                      'Patient',
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
                                                  color: Color(0xFFFF2D5E),
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
                                                                      icon: Image.asset('assets/images/offline.png'), onPressed: () {  },
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
                                                  "Patient's performance+2%",
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
                                                child: Text(
                                                  "Therapist user lauren harsh.User id 123456.",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xFF989898 ),
                                                      fontSize: 15.sp

                                                  ),

                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Container(
                                                child: Text(
                                                  "Last login today Mon 10:35:21 a.m.29/10/2021",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xFF989898 ),
                                                      fontSize: 15.sp
                                                  ),

                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 10.sp,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  flex: 7,
                                                  child: GestureDetector(
                                                    onTap: () {
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
                                                        print(firstnameController.text);
                                                      });
                                                    },



                                                    child: Neumorphic(
                                                      //  margin: const EdgeInsets.only(bottom: 20.0),
                                                      style: NeumorphicStyle(
                                                        shape: NeumorphicShape.concave,
                                                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                                                      //  depth: NeumorphicTheme.embossDepth(context),

                                                        depth: -8,
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
                                                          border: TableBorder(
                                                              horizontalInside: BorderSide(
                                                                  width: 1,  color: Colors.grey.withOpacity(0.5), style: BorderStyle.solid)),
                                                          children: [
                                                            TableRow(
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "FIRST NAME *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          //fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewfirstnametext,
                                                                        child: buildFutureBuilder(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                                                              // fontSize: 15.sp,
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
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "LAST NAME *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          //  fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewlastnametext,

                                                                        child: buildFutureBuilderlastname(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Visibility(
                                                                      visible: viewlastname,
                                                                      child: SizedBox(
                                                                        height: 30.sp,
                                                                        width: 100.sp,
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
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                                                            //  fontSize: 15.sp,
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
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "EMAIL *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          //  fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewemailtext,
                                                                        child: buildFutureBuilderemail(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Visibility(
                                                                      visible: viewemail,
                                                                      child: SizedBox(
                                                                        height: 30.sp,
                                                                        width: 100.sp,
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
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerRight,
                                                                      child: GestureDetector(
                                                                        onTap: () {
                                                                          //  hideemailtextwidget();
                                                                          // showemailwidget();
                                                                          //Navigator.pushNamed(context, "myRoute");
                                                                        },
                                                                        child: Text(
                                                                          "EDIT",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            //  fontSize: 15.sp,
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
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "PHONE NUMBER *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          // fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewphnotext,
                                                                        child: buildFutureBuilderph(),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Visibility(
                                                                      visible: viewphno,
                                                                      child: SizedBox(
                                                                        height: 30.sp,
                                                                        width: 100.sp,
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
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerRight,
                                                                      child: GestureDetector(
                                                                        onTap: () {
                                                                          // hidephtextwidget();
                                                                          // showphwidget();
                                                                          //Navigator.pushNamed(context, "myRoute");
                                                                        },
                                                                        child: Text(
                                                                          "EDIT",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            //  fontSize: 15.sp,
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
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "BIRTH *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          //  fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewbirthtext,
                                                                        child: Text(
                                                                          "03/01/1991",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            // fontSize: 15.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Visibility(
                                                                      visible: viewbirth,
                                                                      child: SizedBox(
                                                                        height: 30.sp,
                                                                        width: 100.sp,
                                                                        child: TextField(
                                                                          controller: birthController,

                                                                          decoration: InputDecoration(
                                                                            border: UnderlineInputBorder(),

                                                                            hintText: 'Enter birth date',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),

                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                                                            //  fontSize: 15.sp,
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
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "GENDER *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          // fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewgendertext,
                                                                        child: Text(
                                                                          "Male",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            // fontSize: 15.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Visibility(
                                                                      visible: viewgender,
                                                                      child: SizedBox(
                                                                        height: 30.sp,
                                                                        width: 100.sp,
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
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                                                            //  fontSize: 15.sp,
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
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child: Text(
                                                                        "LANGUAGE *",
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          color: Color(0xFF989898 ),
                                                                          // fontSize: 15.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),

                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment: Alignment.centerLeft,
                                                                    child: Padding(
                                                                      padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                      child: Visibility(
                                                                        visible: viewlanguagetext,
                                                                        child: Text(
                                                                          "English",
                                                                          textAlign: TextAlign.center,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF989898 ),
                                                                            // fontSize: 15.sp,
                                                                            fontWeight: FontWeight.bold,
                                                                          ),

                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
                                                                    child: Visibility(
                                                                      visible: viewlanguage,
                                                                      child: SizedBox(
                                                                        height: 30.sp,
                                                                        width: 100.sp,
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
                                                                  Padding(
                                                                    padding: EdgeInsets.symmetric(vertical: 10.0),
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
                                                                            //  fontSize: 15.sp,
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

                                                // scrollDirection: Axis.horizontal,
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(

                                                    padding: EdgeInsets.all(20.sp),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 3,
                                                              child: SizedBox(
                                                                height: 40.sp,
                                                                width: 40.sp,
                                                                child: IconButton(
                                                                  icon: Image.asset('assets/images/eye.png'),
                                                                  onPressed: () {

                                                                  },
                                                                ),
                                                              ),
                                                            ),


                                                            Expanded(
                                                              flex: 7,
                                                              child: Container(
                                                                padding: EdgeInsets.only(left: 5.sp,right: 5.sp,top: 5.sp),
                                                                height: 47.sp,
                                                                width: 100.sp,
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
                                                                            /*  boxShadow: [
                                                                                 BoxShadow(
                                                                                   color: Colors.grey.withOpacity(0.2),
                                                                                   blurRadius: 2.0,
                                                                                   spreadRadius: 0.0,
                                                                                   offset: Offset(2.0, 2.0), // changes position of shadow
                                                                                 ),
                                                                               ],*/
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
                                                                MaterialStateProperty.all(Color(0xFFFF2D5E),),
                                                                // elevation: MaterialStateProperty.all(3),
                                                                shadowColor:
                                                                MaterialStateProperty.all( Color(0xFFFF2D5E),),
                                                              ),
                                                              onPressed: () {

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
                      Navigator.pushNamed(context, 'therapist/profile');
                    },
                    child: Text(
                      "PROFILE",
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
                      Navigator.pushNamed(context, 'therapist/generalpreference');
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
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      "LOG OUT",
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


      ],
      elevation: 8.0,

    );



  }

  void gettoken()  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token=prefs.getString("doctorauthtoken");
    p_id=prefs.getInt("doc_id");
    print(token);
  }
  Future<Getresp> getuserdetails() async {
    final response = await http.post(
      Uri.parse(Constants.baseurl+'user/details'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
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

      return Getresp.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
  FutureBuilder<Getresp> buildFutureBuilder() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Text(
              snapshot.data!.data.usrFirstName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),

            );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderlastname() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Text(
              snapshot.data!.data.usrLastName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),

            );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderemail() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Text(
              snapshot.data!.data.usrEmail,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),

            );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderph() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Text(
              snapshot.data!.data.usrPhone,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),

            );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderusername() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Text(
              snapshot.data!.data.usrUserName,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),

            );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
  FutureBuilder<Getresp> buildFutureBuilderuserid() {
    return FutureBuilder<Getresp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return
            Text(
              "Patient"+snapshot.data!.data.usrUserName+ " User id "+snapshot.data!.data.id.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF989898 ),
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),

            );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error.toString()}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  Future<Updateprofileresponse>  updatedetails() async {
    //print(fname);
    final response = await http.post(
      Uri.parse(Constants.baseurl+'user/update'),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer '+token!,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'usr_first_name': firstnameController.text,
        'usr_last_name': lastnameController.text,
        'usr_birth_date': "09/01/1991",
        'usr_gender': genderController.text,
        'usr_language': languageController.text
      }
      ),

    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));

      return Updateprofileresponse.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to update user.');
    }
  }

}