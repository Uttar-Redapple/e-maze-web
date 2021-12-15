import 'dart:convert';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:emaze_brain/model/response/get_terms.dart';
import 'package:emaze_brain/model/response/getchangepwdresponse.dart';
import 'package:emaze_brain/model/response/getresp.dart';
import 'package:emaze_brain/screen/data_viz/data_viz.dart';
import 'package:emaze_brain/screen/therapistgeneralpreference/Therapistgeneralpreference.dart';
import 'package:emaze_brain/screen/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Patientgeneralpreference extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientgeneralpreferenceState();
  }
  
}
class PatientgeneralpreferenceState extends State<Patientgeneralpreference>{
  late Future<GetTerms> futureAlbum;
  late Future<GetTerms> privacypolicy;
  Future<Getresp>? _therapistprofile;
  String? token;
  String?userfname,usr_last_name,usr_user_name,usr_email,usr_phone,usr_birth_date,usr_gender,usr_language,usr_profile_image;
  int? p_id;
  @override
  void initState() {
    futureAlbum = fetchterms();
    privacypolicy=fetchprivacypolicy();
    gettoken();
    _therapistprofile= getuserdetails();
  }
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(40);
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

                                    )
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
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/assertss.png"),

                                                  fit: BoxFit.cover,
                                                ),
                                                 /* border: Border.all(
                                                    color: Colors.white.withOpacity(
                                                        1.0), // red as border color
                                                  ),*/
                                                /*  borderRadius: new BorderRadius.only(
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
                                                          'assets/images/gp.png'),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 20.sp,
                                                ),
                                                Text(
                                                  "General Preference",
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
                                            width: 252.sp,
                                            decoration: BoxDecoration(
                                              //  color: Colors.transparent,
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
                                        child:Container(
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
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [


                                                 Row(
                                                    children: [
                                                      Expanded(
                                                          flex: 6,
                                                          child: Container(
                                                            padding: EdgeInsets.only(left: 20.sp,right: 20.sp),
                                                            child: Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Container(
                                                                child:  Container(
                                                                //  height: 200.sp,
                                                                  width: 200.sp,
                                                                  child: Image(image: AssetImage(
                                                                      'assets/images/emazelogofirst.png'
                                                                  ),

                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                      ),


                                                         Expanded(
                                                            flex: 4,
                                                            child: Align(
                                                              alignment: Alignment.centerRight,
                                                              child: Container(
                                                                padding: EdgeInsets.all(8.sp),
                                                                child: Row(
                                                                  // crossAxisAlignment: CrossAxisAlignment.end,
                                                                  // mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [

                                                                    Expanded(
                                                                      flex: 5,
                                                                      child: ButtonBar(

                                                                        alignment: MainAxisAlignment.spaceAround,
                                                                        children: [
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
                                                                                gradient:
                                                                                LinearGradient(

                                                                                    begin: Alignment.centerLeft,
                                                                                    end: Alignment.centerRight,
                                                                                    colors: <Color> [
                                                                                      Color(0xFF29E166),
                                                                                      Color(0xFF11AD4A)


                                                                                    ],
                                                                                    tileMode: TileMode.repeated)

                                                                            ),
                                                                            child: ConstrainedBox(
                                                                              constraints: BoxConstraints.tightFor(width: 190, height: 47),
                                                                              child: ElevatedButton.icon(
                                                                                icon: IconButton(
                                                                                  icon: Image.asset('assets/images/reload.png'), onPressed: () {  },
                                                                                ),

                                                                                onPressed: () {

                                                                                },
                                                                                style: ButtonStyle(
                                                                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                    RoundedRectangleBorder(
                                                                                      borderRadius: BorderRadius.circular(20.0),
                                                                                    ),
                                                                                  ),

                                                                                  // fixedSize: Size(426.sp, 149.sp),
                                                                                  // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                                  backgroundColor:
                                                                                  MaterialStateProperty.all(Colors.transparent),
                                                                                  // elevation: MaterialStateProperty.all(3),
                                                                                  shadowColor:
                                                                                  MaterialStateProperty.all(Colors.transparent),
                                                                                ),
                                                                                /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                                label: Text("DEFAULT       ",
                                                                                  style: TextStyle(
                                                                                      color: Colors.white,
                                                                                     // fontSize: 16.sp

                                                                                  ),
                                                                                ),

                                                                              ),
                                                                            ),
                                                                          )
                                                                        ],

                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child: IconButton(
                                                                        icon: Image.asset(
                                                                            'assets/images/profile.png'),
                                                                        onPressed: () {},
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 4,
                                                                      child: FutureBuilder<Getresp>(
                                                                        future: _therapistprofile,
                                                                        builder: (context, snapshot) {
                                                                          if( snapshot.connectionState == ConnectionState.waiting){
                                                                            return  Center(child: Text('Please wait its loading...'));
                                                                          }
                                                                          else{
                                                                            if (snapshot.hasData) {
                                                                              return
                                                                                RichText(
                                                                               //   "Patient "+snapshot.data!.data.usrFirstName+" "+snapshot.data!.data.usrLastName,
                                                                                  textAlign: TextAlign.center,
                                                                                  text: TextSpan(
                                                                                    text: "Patient :"+snapshot.data!.data.usrFirstName+" "+snapshot.data!.data.usrLastName,
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: '| Userid : '+snapshot.data!.data.id.toString(),
                                                                                      ),
                                                                                    ]
                                                                                  ),


                                                                                );
                                                                            } else if (snapshot.hasError) {
                                                                              return  RichText(
                                                                                //   "Patient "+snapshot.data!.data.usrFirstName+" "+snapshot.data!.data.usrLastName,
                                                                                textAlign: TextAlign.center,
                                                                                text: TextSpan(
                                                                                    text: "Patient "+userfname!+" "+usr_last_name!,
                                                                                    children: [
                                                                                      TextSpan(
                                                                                        text: '| Userid :'+p_id.toString(),
                                                                                      ),
                                                                                    ]
                                                                                ),


                                                                              );
                                                                            }
                                                                          }


                                                                          // By default, show a loading spinner.
                                                                          return const CircularProgressIndicator();
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                        )

                                                    ]
                                                ),

                                              Align(
                                                alignment: Alignment.centerRight,
                                                child: Container(
                                                  padding: EdgeInsets.all(10.sp),
                                                  child: Text(
                                                    "eMazeBrain 2021-Developed and registered by emazebrain",
                                                    style: TextStyle(
                                                      color: Color(0xFF808080),
                                                      fontSize: 14.sp,

                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                      flex: 2,
                                                      child: Container(
                                                        child: Column(

                                                          children: [

                                                            Container(
                                                              //width: 272,
                                                              height: 40,
                                                              //  padding: EdgeInsets.only(top: 5.sp,left: 5.sp),
                                                              decoration: BoxDecoration(
                                                                color:Color(0xFFF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors.white,
                                                                    width: 0.sp
                                                                ),
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(23.sp),
                                                                    bottomRight: Radius.circular(23.sp),
                                                                    topLeft: Radius.circular(23.sp),
                                                                    bottomLeft: Radius.circular(23.sp)),


                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.white,
                                                                    blurRadius: 2,
                                                                    spreadRadius: 2,
                                                                    offset: Offset(0, -3),
                                                                  ),
                                                                  BoxShadow(
                                                                    color: Colors.grey.shade400,
                                                                    blurRadius: 3.0,
                                                                    spreadRadius: 2.0,
                                                                    offset: Offset(2.0, 2.0), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child:  ConstrainedBox(
                                                                constraints: BoxConstraints.tightFor(width: 272, height: 40),
                                                                child: ElevatedButton.icon(
                                                                  icon: IconButton(
                                                                    icon: Image.asset('assets/images/headphone.png'), onPressed: () {  },
                                                                  ),

                                                                  onPressed: () {

                                                                  },
                                                                  style: ButtonStyle(
                                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(23.0),
                                                                      ),
                                                                    ),

                                                                    // fixedSize: Size(426.sp, 149.sp),
                                                                    // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                    backgroundColor:
                                                                    MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                    // elevation: MaterialStateProperty.all(3),
                                                                    shadowColor:
                                                                    MaterialStateProperty.all(Colors.white),
                                                                  ),
                                                                  /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                  label: Text("SOUND PREFERENCE    ",
                                                                    style: TextStyle(
                                                                      color: Color(0xFF989898),
                                                                      // fontSize: 16.sp

                                                                    ),
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                                height: 20.sp,
                                                            ),

                                                            Container(
                                                              //width: 272,
                                                              height: 40,
                                                              //  padding: EdgeInsets.only(top: 5.sp,left: 5.sp),
                                                              decoration: BoxDecoration(
                                                                color:Color(0xFFF5F5F5),
                                                                border: Border.all(
                                                                    color: Colors.white,
                                                                    width: 0.sp
                                                                ),
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(23.sp),
                                                                    bottomRight: Radius.circular(23.sp),
                                                                    topLeft: Radius.circular(23.sp),
                                                                    bottomLeft: Radius.circular(23.sp)),


                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.white,
                                                                    blurRadius: 2,
                                                                    spreadRadius: 2,
                                                                    offset: Offset(0, -3),
                                                                  ),
                                                                  BoxShadow(
                                                                    color: Colors.grey.shade400,
                                                                    blurRadius: 3.0,
                                                                    spreadRadius: 2.0,
                                                                    offset: Offset(2.0, 2.0), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child:  ConstrainedBox(
                                                                constraints: BoxConstraints.tightFor(width: 272, height: 40),
                                                                child: ElevatedButton.icon(
                                                                  icon: IconButton(
                                                                    icon: Image.asset('assets/images/sett.png'), onPressed: () {  },
                                                                  ),

                                                                  onPressed: () {

                                                                  },
                                                                  style: ButtonStyle(
                                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(23.0),
                                                                      ),
                                                                    ),

                                                                    // fixedSize: Size(426.sp, 149.sp),
                                                                    // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                    backgroundColor:
                                                                    MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                    // elevation: MaterialStateProperty.all(3),
                                                                    shadowColor:
                                                                    MaterialStateProperty.all(Colors.white),
                                                                  ),
                                                                  /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                  label: Text("VISUAL ADJUSTMENT   ",
                                                                    style: TextStyle(
                                                                      color: Color(0xFF989898),
                                                                      // fontSize: 16.sp

                                                                    ),
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 20.sp,
                                                            ),
                                                            Container(
                                                              //width: 272,
                                                              height: 40,
                                                            //  padding: EdgeInsets.only(top: 5.sp,left: 5.sp),
                                                              decoration: BoxDecoration(
                                                                color:Color(0xFFF5F5F5),
                                                                border: Border.all(
                                                                  color: Colors.white,
                                                                  width: 0.sp
                                                                ),
                                                                borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(23.sp),
                                                                    bottomRight: Radius.circular(23.sp),
                                                                    topLeft: Radius.circular(23.sp),
                                                                    bottomLeft: Radius.circular(23.sp)),


                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.white,
                                                                    blurRadius: 2,
                                                                    spreadRadius: 2,
                                                                    offset: Offset(0, -3),
                                                                  ),
                                                                  BoxShadow(
                                                                    color: Colors.grey.shade400,
                                                                    blurRadius: 3.0,
                                                                    spreadRadius: 2.0,
                                                                    offset: Offset(2.0, 2.0), // changes position of shadow
                                                                  ),
                                                                ],
                                                              ),
                                                              child:  ConstrainedBox(
                                                                constraints: BoxConstraints.tightFor(width: 272, height: 40),
                                                                child: ElevatedButton.icon(
                                                                  icon: IconButton(
                                                                    icon: Image.asset('assets/images/language.png'), onPressed: () {  },
                                                                  ),

                                                                  onPressed: () {

                                                                  },
                                                                  style: ButtonStyle(
                                                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                      RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(23.0),
                                                                      ),
                                                                    ),

                                                                    // fixedSize: Size(426.sp, 149.sp),
                                                                    // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                    backgroundColor:
                                                                    MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                    // elevation: MaterialStateProperty.all(3),
                                                                    shadowColor:
                                                                    MaterialStateProperty.all(Colors.white),
                                                                  ),
                                                                  /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                  label: Text("LANGUAGE                         ",
                                                                    style: TextStyle(
                                                                        color: Color(0xFF989898),
                                                                       // fontSize: 16.sp

                                                                    ),
                                                                  ),

                                                                ),
                                                              ),
                                                            ),

                                                          ],
                                                        ),

                                                      )
                                                  ),

                                                  Expanded(
                                                      flex: 7,
                                                      child: Container(
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                             // crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                Expanded(
                                                                  flex: 5,
                                                                  child: Container(

                                                                    child: Align(
                                                                      alignment: Alignment.centerRight,
                                                                      child: Container(
                                                                        width: 238.sp,
                                                                        height: 65.sp,


                                                                        decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(20.sp),
                                                                              bottomRight: Radius.circular(20.sp),
                                                                              bottomLeft: Radius.circular(20.sp),
                                                                              topLeft: Radius.circular(20.sp)),
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
                                                                         padding: EdgeInsets.all(3.sp),
                                                                          child: ConstrainedBox(
                                                                            constraints: BoxConstraints.tightFor(width: 238.sp, height: 80.sp),
                                                                            child: ElevatedButton.icon(
                                                                              icon: IconButton(
                                                                                icon: Image.asset('assets/images/messages.png'), onPressed: () {  },
                                                                              ),

                                                                              onPressed: () async{

                                                                                 showDialog(
                                                                                   context: context,
                                                                                   builder: (context){
                                                                                     return Dialog(
                                                                                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                       elevation: 16,
                                                                                       child: Container(
                                                                                         padding: EdgeInsets.all(20.sp),
                                                                                         height: 200.sp,
                                                                                           width: 300.sp,
                                                                                         decoration: BoxDecoration(
                                                                                           borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                           gradient: LinearGradient(
                                                                                               begin: Alignment.topCenter,
                                                                                               end: Alignment.bottomCenter,
                                                                                               colors: <Color> [
                                                                                                 Color(0xFF808080),
                                                                                                 Color(0xFF535454),





                                                                                               ],
                                                                                               tileMode: TileMode.repeated
                                                                                           ),
                                                                                         ),
                                                                                           child: Column(
                                                                                             children: [
                                                                                               Text(
                                                                                                 "Are you sure you want to delete your account?",
                                                                                                 textAlign: TextAlign.center,
                                                                                                 style: TextStyle(
                                                                                                   color: Colors.white,
                                                                                                    fontSize: 20.sp
                                                                                                 ),

                                                                                               ),
                                                                                               Container(
                                                                                                 height: 40.sp,
                                                                                               ),
                                                                                               Row(
                                                                                                 children: [
                                                                                                   Expanded(
                                                                                                       flex: 5,
                                                                                                       child:  GestureDetector(
                                                                                                         onTap: () async{
                                                                                                           deleteaccount();
                                                                                                           Navigator.pop(context);
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
                                                                                                           height: 30.sp,
                                                                                                           decoration: BoxDecoration(
                                                                                                             color: Colors.white,
                                                                                                             borderRadius: BorderRadius.only(
                                                                                                               bottomLeft: Radius.circular(40.0),
                                                                                                               bottomRight: Radius.circular(40.0),
                                                                                                               topLeft: Radius.circular(40.0),
                                                                                                               topRight: Radius.circular(40.0),


                                                                                                             ),

                                                                                                           ),
                                                                                                           child: Center(
                                                                                                             child: Text(
                                                                                                               "Yes",
                                                                                                               textAlign: TextAlign.center,
                                                                                                               style: TextStyle(
                                                                                                                   color: Colors.black,
                                                                                                                   fontSize: 15.sp
                                                                                                               ),

                                                                                                             ),
                                                                                                           ),
                                                                                                         ),
                                                                                                       ),
                                                                                                   ),
                                                                                                   Container(
                                                                                                     width: 5.sp,
                                                                                                   ),
                                                                                                   Expanded(
                                                                                                       flex: 5,
                                                                                                       child:  GestureDetector(
                                                                                                          onTap: (){
                                                                                                            Navigator.pop(context);
                                                                                                          },
                                                                                                         child: Container(
                                                                                                           height: 30.sp,
                                                                                                           decoration: BoxDecoration(
                                                                                                             color: Colors.white,
                                                                                                             borderRadius: BorderRadius.only(
                                                                                                               bottomLeft: Radius.circular(40.0),
                                                                                                               bottomRight: Radius.circular(40.0),
                                                                                                               topLeft: Radius.circular(40.0),
                                                                                                               topRight: Radius.circular(40.0),


                                                                                                             ),

                                                                                                           ),
                                                                                                           child: Center(
                                                                                                             child: Text(
                                                                                                               "No",
                                                                                                               textAlign: TextAlign.center,
                                                                                                               style: TextStyle(
                                                                                                                   color: Colors.black,
                                                                                                                   fontSize: 15.sp
                                                                                                               ),

                                                                                                             ),
                                                                                                           ),
                                                                                                         ),
                                                                                                       ),
                                                                                                   )
                                                                                                 ],
                                                                                               )

                                                                                             ],
                                                                                           ),
                                                                                       ),
                                                                                     );
                                                                                   }

                                                                                 );
                                                                              },
                                                                              style: ButtonStyle(
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                  RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                ),

                                                                                // fixedSize: Size(426.sp, 149.sp),
                                                                                // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                                backgroundColor:
                                                                                MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                                // elevation: MaterialStateProperty.all(3),
                                                                                shadowColor:
                                                                                MaterialStateProperty.all(Colors.white),
                                                                              ),
                                                                              /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                              label: Text("ERASE ACCOUNT     ",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF989898),
                                                                                  // fontSize: 16.sp

                                                                                ),
                                                                              ),

                                                                            ),
                                                                          ),
                                                                       ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 5,
                                                                  child: Container(

                                                                    child: Align(
                                                                      alignment: Alignment.centerRight,
                                                                      child: Container(
                                                                        width: 238.sp,
                                                                        height: 65.sp,


                                                                        decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(20.sp),
                                                                              bottomRight: Radius.circular(20.sp),
                                                                              bottomLeft: Radius.circular(20.sp),
                                                                              topLeft: Radius.circular(20.sp)),
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
                                                                          padding: EdgeInsets.all(3.sp),
                                                                          child: ConstrainedBox(
                                                                            constraints: BoxConstraints.tightFor(width: 238.sp, height: 80.sp),
                                                                            child: ElevatedButton.icon(
                                                                              icon: IconButton(
                                                                                icon: Image.asset('assets/images/delete.png'), onPressed: () {  },
                                                                              ),

                                                                              onPressed: () async {

                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context){
                                                                                      return Dialog(
                                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                        elevation: 16,
                                                                                        child: Container(
                                                                                          padding: EdgeInsets.all(20.sp),
                                                                                          height: 200.sp,
                                                                                          width: 300.sp,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                            gradient: LinearGradient(
                                                                                                begin: Alignment.topCenter,
                                                                                                end: Alignment.bottomCenter,
                                                                                                colors: <Color> [
                                                                                                  Color(0xFF808080),
                                                                                                  Color(0xFF535454),





                                                                                                ],
                                                                                                tileMode: TileMode.repeated
                                                                                            ),
                                                                                          ),
                                                                                          child: Column(
                                                                                            children: [
                                                                                              Text(
                                                                                                "You are about to erase all the caches",
                                                                                                textAlign: TextAlign.center,
                                                                                                style: TextStyle(
                                                                                                    color: Colors.white,
                                                                                                    fontSize: 20.sp
                                                                                                ),

                                                                                              ),
                                                                                              Container(
                                                                                                height: 40.sp,
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
                                                                                                Navigator.pop(context);

                                                                                                Navigator.pushNamed(context, '/');
                                                                                                 },
                                                                                                child: Container(
                                                                                                  height: 30.sp,
                                                                                                  width: 100.sp,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: Colors.white,
                                                                                                    borderRadius: BorderRadius.only(
                                                                                                      bottomLeft: Radius.circular(40.0),
                                                                                                      bottomRight: Radius.circular(40.0),
                                                                                                      topLeft: Radius.circular(40.0),
                                                                                                      topRight: Radius.circular(40.0),


                                                                                                    ),

                                                                                                  ),
                                                                                                  child: Center(
                                                                                                    child: Text(
                                                                                                      "OK",
                                                                                                      textAlign: TextAlign.center,
                                                                                                      style: TextStyle(
                                                                                                          color: Colors.black,
                                                                                                          fontSize: 15.sp
                                                                                                      ),

                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),

                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }

                                                                                );

                                                                              },
                                                                              style: ButtonStyle(
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                  RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                ),

                                                                                // fixedSize: Size(426.sp, 149.sp),
                                                                                // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                                backgroundColor:
                                                                                MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                                // elevation: MaterialStateProperty.all(3),
                                                                                shadowColor:
                                                                                MaterialStateProperty.all(Colors.white),
                                                                              ),
                                                                              /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                              label: Text("ERASE CACHE",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF989898),
                                                                                  // fontSize: 16.sp

                                                                                ),
                                                                              ),

                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Container(
                                                                height: 15.sp,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                  flex: 5,
                                                                  child: Container(

                                                                    child: Align(
                                                                      alignment: Alignment.centerRight,
                                                                      child: Container(
                                                                        width: 238.sp,
                                                                        height: 65.sp,


                                                                        decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(20.sp),
                                                                              bottomRight: Radius.circular(20.sp),
                                                                              bottomLeft: Radius.circular(20.sp),
                                                                              topLeft: Radius.circular(20.sp)),
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
                                                                          padding: EdgeInsets.all(3.sp),
                                                                          child: ConstrainedBox(
                                                                            constraints: BoxConstraints.tightFor(width: 238.sp, height: 80.sp),
                                                                            child: ElevatedButton.icon(
                                                                              icon: IconButton(
                                                                                icon: Image.asset('assets/images/verify.png'), onPressed: () {  },
                                                                              ),

                                                                              onPressed: () {
                                                                                showDialog(
                                                                                    context: context,
                                                                                    builder: (context){
                                                                                      return Dialog(
                                                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                        elevation: 16,

                                                                                        child: Container(
                                                                                          padding: EdgeInsets.all(10.sp),
                                                                                          height: 500.sp,
                                                                                          width: 500.sp,
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                            gradient: LinearGradient(
                                                                                                begin: Alignment.topCenter,
                                                                                                end: Alignment.bottomCenter,
                                                                                                colors: <Color> [
                                                                                                  Color(0xFF808080),
                                                                                                  Color(0xFF535454),





                                                                                                ],
                                                                                                tileMode: TileMode.repeated
                                                                                            ),
                                                                                          ),
                                                                                          child:  SingleChildScrollView(
                                                                                            child: Column(
                                                                                              children: [
                                                                                                FutureBuilder<GetTerms>(
                                                                                                  future: privacypolicy,
                                                                                                  builder: (context, snapshot) {
                                                                                                    if (snapshot.hasData) {
                                                                                                      return Html(
                                                                                                        data: snapshot.data!.data.pageContent,



                                                                                                      );
                                                                                                    } else if (snapshot.hasError) {
                                                                                                      return Text('${snapshot.error}');
                                                                                                    }

                                                                                                    // By default, show a loading spinner.
                                                                                                    return const CircularProgressIndicator();
                                                                                                  },
                                                                                                ),
                                                                                                Container(
                                                                                                  padding: EdgeInsets.all(10.sp),
                                                                                                  child: Row(
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    //crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        "Got it",
                                                                                                        textAlign: TextAlign.center,
                                                                                                        style: TextStyle(
                                                                                                            color: Color(0xFFFFFFFF),
                                                                                                            fontSize: 20.sp


                                                                                                        ),

                                                                                                      ),
                                                                                                      Container(
                                                                                                        width: 20.sp,
                                                                                                      ),
                                                                                                      GestureDetector(
                                                                                                        onTap: (){
                                                                                                          Navigator.pop(context);
                                                                                                        },
                                                                                                        child: Container(
                                                                                                            width: 40,
                                                                                                            height: 40,

                                                                                                            decoration: BoxDecoration(
                                                                                                                shape: BoxShape.circle,
                                                                                                                boxShadow: [
                                                                                                                  BoxShadow(
                                                                                                                    color: Colors.white,
                                                                                                                    blurRadius: 2,
                                                                                                                    spreadRadius: 1,
                                                                                                                    offset: Offset(-1, 0),
                                                                                                                  ),
                                                                                                                  BoxShadow(
                                                                                                                    color: Colors.grey.shade400,
                                                                                                                    blurRadius: 2.0,
                                                                                                                    spreadRadius: 0.0,
                                                                                                                    offset: Offset(2.0, 0.0), // changes position of shadow
                                                                                                                  ),
                                                                                                                ],
                                                                                                                gradient:
                                                                                                                LinearGradient(

                                                                                                                    begin: Alignment.centerLeft,
                                                                                                                    end: Alignment.centerRight,
                                                                                                                    colors: <Color> [
                                                                                                                      Color(0xFF29E166),
                                                                                                                      Color(0xFF11AD4A)


                                                                                                                    ],
                                                                                                                    tileMode: TileMode.repeated)

                                                                                                            ),
                                                                                                            child:Center(
                                                                                                              child: SizedBox(
                                                                                                                width: 20,
                                                                                                                height: 20,
                                                                                                                child: Image(image: AssetImage(
                                                                                                                    'assets/images/ticknew.png'
                                                                                                                ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            )

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
                                                                                );
                                                                              },
                                                                              style: ButtonStyle(
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                  RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                ),

                                                                                // fixedSize: Size(426.sp, 149.sp),
                                                                                // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                                backgroundColor:
                                                                                MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                                // elevation: MaterialStateProperty.all(3),
                                                                                shadowColor:
                                                                                MaterialStateProperty.all(Colors.white),
                                                                              ),
                                                                              /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                              label: Text("PRIVACY POLICY",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF989898),
                                                                                  // fontSize: 16.sp

                                                                                ),
                                                                              ),

                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  flex: 5,
                                                                  child: Container(

                                                                    child: Align(
                                                                      alignment: Alignment.centerRight,
                                                                      child: Container(
                                                                        width: 238.sp,
                                                                        height: 65.sp,


                                                                        decoration: BoxDecoration(
                                                                          color: Colors.white,
                                                                          borderRadius: BorderRadius.only(
                                                                              topRight: Radius.circular(20.sp),
                                                                              bottomRight: Radius.circular(20.sp),
                                                                              bottomLeft: Radius.circular(20.sp),
                                                                              topLeft: Radius.circular(20.sp)),
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
                                                                          padding: EdgeInsets.all(3.sp),
                                                                          child: ConstrainedBox(
                                                                            constraints: BoxConstraints.tightFor(width: 238, height: 74),
                                                                            child: ElevatedButton(


                                                                              onPressed: () {
                                                                                  showDialog(
                                                                                      context: context,
                                                                                  builder: (context){
                                                                                        return Dialog(
                                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                                          elevation: 16,
                                                                                           
                                                                                              child: Container(
                                                                                                padding: EdgeInsets.all(10.sp),
                                                                                                height: 500.sp,
                                                                                                width: 500.sp,
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                                  gradient: LinearGradient(
                                                                                                      begin: Alignment.topCenter,
                                                                                                      end: Alignment.bottomCenter,
                                                                                                      colors: <Color> [
                                                                                                        Color(0xFF808080),
                                                                                                        Color(0xFF535454),





                                                                                                      ],
                                                                                                      tileMode: TileMode.repeated
                                                                                                  ),
                                                                                                ),
                                                                                                child:  SingleChildScrollView(
                                                                                                  child: Column(
                                                                                                    children: [
                                                                                                      FutureBuilder<GetTerms>(
                                                                                                        future: futureAlbum,
                                                                                                        builder: (context, snapshot) {
                                                                                                          if (snapshot.hasData) {
                                                                                                            return Html(
                                                                                                              data: snapshot.data!.data.pageContent,



                                                                                                            );
                                                                                                          } else if (snapshot.hasError) {
                                                                                                            return Text('${snapshot.error}');
                                                                                                          }

                                                                                                          // By default, show a loading spinner.
                                                                                                          return const CircularProgressIndicator();
                                                                                                        },
                                                                                                      ),
                                                                                                      Container(
                                                                                                        padding: EdgeInsets.all(10.sp),
                                                                                                        child: Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                          //crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              "Got it",
                                                                                                              textAlign: TextAlign.center,
                                                                                                              style: TextStyle(
                                                                                                                  color: Color(0xFFFFFFFF),
                                                                                                                  fontSize: 20.sp


                                                                                                              ),

                                                                                                            ),
                                                                                                            Container(
                                                                                                              width: 20.sp,
                                                                                                            ),
                                                                                                            GestureDetector(
                                                                                                              onTap: (){
                                                                                                                Navigator.pop(context);
                                                                                                              },
                                                                                                              child: Container(
                                                                                                                  width: 40,
                                                                                                                  height: 40,

                                                                                                                  decoration: BoxDecoration(
                                                                                                                      shape: BoxShape.circle,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          color: Colors.white,
                                                                                                                          blurRadius: 2,
                                                                                                                          spreadRadius: 1,
                                                                                                                          offset: Offset(-1, 0),
                                                                                                                        ),
                                                                                                                        BoxShadow(
                                                                                                                          color: Colors.grey.shade400,
                                                                                                                          blurRadius: 2.0,
                                                                                                                          spreadRadius: 0.0,
                                                                                                                          offset: Offset(2.0, 0.0), // changes position of shadow
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                      gradient:
                                                                                                                      LinearGradient(

                                                                                                                          begin: Alignment.centerLeft,
                                                                                                                          end: Alignment.centerRight,
                                                                                                                          colors: <Color> [
                                                                                                                            Color(0xFF29E166),
                                                                                                                            Color(0xFF11AD4A)


                                                                                                                          ],
                                                                                                                          tileMode: TileMode.repeated)

                                                                                                                  ),
                                                                                                                  child:Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 20,
                                                                                                                      height: 20,
                                                                                                                      child: Image(image: AssetImage(
                                                                                                                          'assets/images/ticknew.png'
                                                                                                                      ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  )

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
                                                                                  );
                                                                              },
                                                                              style: ButtonStyle(
                                                                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                                  RoundedRectangleBorder(
                                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                                  ),
                                                                                ),

                                                                                // fixedSize: Size(426.sp, 149.sp),
                                                                                // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                                backgroundColor:
                                                                                MaterialStateProperty.all(Color(0xFFf1f1f1)),
                                                                                // elevation: MaterialStateProperty.all(3),

                                                                              ),
                                                                              /*  style: ElevatedButton.styleFrom(
                                        primary:  Colors.transparent,

                                        fixedSize: Size(426.sp, 149.sp),




                                      ),*/


                                                                              child: Text("TERMS AND CONDITIONS",
                                                                                style: TextStyle(
                                                                                  color: Color(0xFF989898),
                                                                                  // fontSize: 16.sp

                                                                                ),
                                                                              ),

                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 20.sp,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(20.0),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      topRight: Radius.circular(10.sp),
                                                      bottomRight: Radius.circular(10.sp),
                                                      topLeft: Radius.circular(10.sp),
                                                      bottomLeft: Radius.circular(10.sp)),
                                                  gradient:
                                                  LinearGradient(
                                                      begin: Alignment.centerLeft,
                                                      end: Alignment.centerRight,
                                                      tileMode: TileMode.repeated,
                                                      colors: [ Color(0xFFf15e26 ),
                                                        Color(0xFFf89f37),
                                                      ]),
                                                ),
                                                child: Text(
                                                  "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15.sp
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        )
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
            onTap: () {
              Navigator.pushNamed(context, 'patient/profile');
            },
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
                   /* onTap: () {
                      Navigator.pushNamed(context, 'patient/profile');
                    },*/
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
            onTap: () {
              Navigator.pushNamed(context, 'patient/generalpreference');
            },
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

  Future<GetTerms> fetchterms() async {
    final response = await http
        .get(Uri.parse(Constants.baseurl+"page/1"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return GetTerms.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
  Future<GetTerms> fetchprivacypolicy() async {
    final response = await http
        .get(Uri.parse(Constants.baseurl+"page/2"));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return GetTerms.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void gettoken()  async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
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
      print(token);

    });

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
      Map<String, dynamic> data = json.decode(response.body);
      print(data["data"]["usr_first_name"]);
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userfname=data["data"]["usr_first_name"];
      pref.setString('docuserfname', userfname);
      String usr_last_name=data["data"]["usr_last_name"];
      pref.setString('docusr_last_name', usr_last_name);
      String usr_user_name=data["data"]["usr_user_name"];
      pref.setString('docusr_user_name', usr_user_name);
      String usr_email=data["data"]["usr_email"];
      pref.setString('docusr_email', usr_email);
      String usr_phone=data["data"]["usr_phone"];
      pref.setString('docusr_phone', usr_phone);
      String usr_birth_date=data["data"]["usr_birth_date"];
      pref.setString('docusr_birth_date', usr_birth_date);
      String usr_gender=data["data"]["usr_gender"];
      pref.setString('docusr_gender', usr_gender);
      String usr_language=data["data"]["usr_language"];
      pref.setString('docusr_language', usr_language);
      String usr_profile_image=data["data"]["usr_profile_image"];
      pref.setString('docusr_profile_image', usr_profile_image);

      return Getresp.fromJson(jsonDecode(response.body));


    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  Future<Getchangepwdresponse>  deleteaccount() async {
    final response = await http.post(
      Uri.parse(Constants.baseurl+'user/deactivated'),
      headers: <String, String>{
        //  "Access-Control-Allow-Origin": "*",
         'Authorization': 'Bearer '+token!,

      },
      body: jsonEncode(<String, String>{



      }
      ),

    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      Map<String, dynamic> data = json.decode(response.body);
      print(data["message"]);
      Fluttertoast.showToast(
          msg: "Your account is successfully deleted.Thank you for visiting us",
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
      Fluttertoast.showToast(
          msg: "Your account is already deactivated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 5,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception();
    }
  }
  
}