import 'dart:async';

import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:emaze_brain/screen/addnewpatientscreen/Addnewpatient.dart';
import 'package:emaze_brain/screen/patientprofile/Patientprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Therapistprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TherapistprofileState();
  }

}
class TherapistprofileState extends State<Therapistprofile>{
  /*@override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Patientprofile())));
  }*/
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController currentpositioncontroller = TextEditingController();
  TextEditingController spetializationcontroller = TextEditingController();
  TextEditingController claddresscontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var radius = Radius.circular(40);
    return ScreenUtilInit(
        builder: () =>
        ResponsiveBuilder(
        builder: (context, sizingInformation) {
      // Check the sizing information here and return your UI
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
                image: AssetImage("assets/images/whitepoligon.png"),

                fit: BoxFit.cover,
              ),
              gradient:
              LinearGradient(

                  tileMode: TileMode.repeated,
                  colors: [  Color(0xFF3A3A3A),
                    Color(0xFF8B8B8B),
                    Color(0xFFDBDCDE),
                  ]),
            ),
            child: Column(
              children: [
                Container(
                  height: 110.sp,

                  decoration: BoxDecoration(
                      color: Color(0xFFF1F1F1),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25.0),
                          bottomRight: Radius.circular(25.0)

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
                                  color: Color(0xFFFF2D5E),
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
                                   /* border: new Border.all(
                                      color: Colors.white.withOpacity(
                                          1.0),
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3), // changes position of shadow
                                      ),
                                    ],*/
                                    /*borderRadius: new BorderRadius.only(
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
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Container(

                                    height: 49.sp,
                                    width: 49.sp,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: AssetImage("assets/images/assets.png"),

                                        fit: BoxFit.cover,
                                      ),
                                      border: new Border.all(
                                        color: Colors.white.withOpacity(
                                            1.0),
                                        width: 1,
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.white.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: SizedBox(

                                      child: IconButton(
                                        icon: Image.asset(
                                            'assets/images/verify.png'),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 20.sp,
                                  ),
                                  Text(
                                    "VERIFY CERTIFICATES AND LICENCE",
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
                      Opacity(
                        opacity: 1.0,
                        child: Container(
                          padding: EdgeInsets.all(10.sp),
                          height: 296.sp,
                          width: 252.sp,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(


                                  colors: <Color> [
                                    Color(0xFF3A3A3A),
                                    Color(0xFF8B8B8B),
                                    Color(0xFFDBDCDE),




                                  ],
                                  tileMode: TileMode.repeated
                              ),
                              border: Border.all(

                                  color: Color(0xFF3A3A3A)
                              ),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.sp),
                                  bottomRight: Radius.circular(20.sp),
                                  bottomLeft: Radius.circular(20.sp),
                                  topLeft: Radius.circular(20.sp))
                            // bottomLeft: Radius.circular(40.sp))

                          ),
                          child: ContainedTabBarView(
                            tabs: [
                              Text(
                                'Patient',
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                    fontSize: 10.sp
                                ),
                              ),
                              Text(
                                'You',
                                textAlign: TextAlign.center,
                                style: TextStyle(

                                    fontSize: 10.sp
                                ),
                              ),
                            ],
                            tabBarProperties: TabBarProperties(
                              width: 172.sp,
                              height: 15.sp,
                              background: Container(
                                width: 172.sp,
                                height: 30.sp,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 2.5,
                                        blurRadius: 2,
                                        offset: Offset(1, -1),
                                      ),
                                    ]

                                ),
                              ),

                              indicator: ShapeDecoration(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: radius,
                                      topLeft: radius,bottomLeft: radius,bottomRight: radius)),
                                  color: Color(0xFFB24761)
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
                                      width: 130.sp,
                                      height: 130.sp,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://i.imgur.com/BoN9kdC.png"
                                            ),

                                          )
                                      ),
                                      child:
                                      Column(
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
                                      width: 130.sp,
                                      height: 130.sp,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: NetworkImage(
                                                "https://i.imgur.com/BoN9kdC.png"
                                            ),

                                          )
                                      ),
                                      child:   Column(
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
                      ),
                      Container(
                        height: 10.sp,
                      ),
                      Container(
                        width: 30.sp,
                      ),
                      Expanded(
                        child: Container(

                          padding: EdgeInsets.all(10.sp),
                          decoration: BoxDecoration(
                              color: Color(0xFFF1F1F1),
                              border: Border.all(

                                  color: Colors.transparent.withOpacity(1.0)
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
                          child:Column(
                            children: [
                              Container(
                                height: 20.sp,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 250.sp,
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            labelText: 'User Name',
                                            icon: IconButton(


                                              icon: Image.asset('assets/images/username.png'), onPressed: () {  },
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 250.sp,
                                      child: TextFormField(
                                        controller: phonenumbercontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            labelText: 'Phone number',
                                            icon: IconButton(
                                              icon: Image.asset('assets/images/contact.png'), onPressed: () {  },
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20.sp,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 250.sp,
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            labelText: 'Email',
                                            icon: IconButton(
                                              icon: Image.asset('assets/images/message.png'), onPressed: () {  },
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 250.sp,
                                      child: TextFormField(
                                        controller: phonenumbercontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            labelText: 'Specialiazation',
                                            icon: IconButton(
                                              icon: Image.asset('assets/images/spec.png'), onPressed: () {  },
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 20.sp,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 250.sp,
                                      child: TextFormField(
                                        controller: nameController,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            labelText: 'Current position"optional',
                                            icon: IconButton(
                                              icon: Image.asset('assets/images/bag.png'), onPressed: () {  },
                                            )
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: SizedBox(
                                      height: 40.sp,
                                      width: 250.sp,
                                      child: TextFormField(
                                        controller: phonenumbercontroller,
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.white70,
                                            labelText: 'Clinic address',
                                            icon: IconButton(
                                              icon: Image.asset('assets/images/home.png'), onPressed: () {  },
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                height: 30.sp,
                              ),
                              Container(
                                child: ButtonTheme(
                                  minWidth: 300.sp,
                                  height: 40.sp,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(20.sp),
                                  ),
                                  child: RaisedButton(
                                    onPressed: () {

                                    },

                                    color: Color(0xFFFFFFFF),
                                    child: Text("Select files",
                                      style: TextStyle(
                                        color: Colors.black,

                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(10.sp),
                                child: Text(
                                  "You can send pdf jpg files to verify your data,you can upload as many as you need to verify that you are telling the truth about yourself as an proffesional false information will be immidate banned",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.sp
                                  ),
                                ),
                              ),
                              Container(
                                height: 10.sp,
                              ),
                              Container(
                                child: ButtonTheme(

                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(40.sp),
                                  ),
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
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
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
                                          constraints: BoxConstraints.tightFor(width: 200, height: 46),
                                          child: ElevatedButton.icon(
                                            icon: IconButton(
                                              icon: Image.asset('assets/images/refresh.png'), onPressed: () {  },
                                            ),

                                            onPressed: () {
                                              Navigator.pushNamed(context, 'therapist/usermanagement');
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


                                            label: Text("UPLOAD       ",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.sp

                                              ),
                                            ),

                                          ),
                                        ),
                                      )
                                    ],

                                  ),
                                ),
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
                                      colors: [ Color(0xFFf15e26),
                                        Color(0xFFf89f37),
                                      ]),
                                ),
                                child: Text(
                                  "You can send pdf jpg files to verify your data,you can upload as many as you need to verify that you are telling the truth about yourself as an proffesional false information will be immidate banned",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 35.sp,
                ),
                Container(
                  height: 70.sp,

                  decoration:  BoxDecoration(

                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: <Color> [
                            Color(0xFF414141),
                            Color(0xFFBABABA)




                          ],
                          tileMode: TileMode.repeated
                      )
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/warining.png'), onPressed: () {  },
                      ),
                      Container(
                        width: 10.sp,
                      ),
                      Text(
                        "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp
                        ),

                      ),
                    ],
                  ),
                )
              ],
            ),
          )
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
    },

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
}