import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:emaze_brain/screen/therapistgeneralpreference/Therapistgeneralpreference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Patientgeneralpreference extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientgeneralpreferenceState();
  }
  
}
class PatientgeneralpreferenceState extends State<Patientgeneralpreference>{
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
                   height: 82.sp,

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
                                   color: Color(0xFF29AAE1),
                                   fontSize: 35.sp,
                                   fontWeight: FontWeight.bold,
                                 ),

                               ),
                             ),
                             Align(
                               alignment: Alignment.centerRight,
                               child: Container(
                                 padding: EdgeInsets.all(10.sp),
                                 width: 192.sp,

                                 decoration: BoxDecoration(
                                     border: Border.all(
                                       color: Colors.white.withOpacity(
                                           1.0), // red as border color
                                     ),
                                     borderRadius: new BorderRadius.only(
                                         topLeft: const Radius.circular(
                                             40.0),
                                         topRight: const Radius.circular(
                                             40.0),
                                         bottomRight: const Radius.circular(
                                             40.0),
                                         bottomLeft: const Radius.circular(
                                             40.0)
                                     )
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
                                               onPressed: () {},
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
                                       border: new Border.all(
                                         color: Colors.white.withOpacity(
                                             1.0),
                                         width: 2.5,
                                       ),

                                     ),
                                     child: SizedBox(

                                       child: IconButton(
                                         icon: Image.asset(
                                             'assets/images/setting.png'),
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

                                       color: Colors.transparent.withOpacity(1.0)
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
                                   height: 22.sp,
                                   background: Container(
                                     decoration: BoxDecoration(
                                         color: Colors.white,
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
                                       color: Color(0xFF29AAE1)
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
                             Container(
                               height: 10.sp,
                             ),
                             Container(
                               height: 258.sp,
                               width: 244.sp,

                               decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.only(
                                       topRight: Radius.circular(20.sp),
                                       bottomRight: Radius.circular(20.sp),
                                       bottomLeft: Radius.circular(20.sp),
                                       topLeft: Radius.circular(20.sp))
                               ),
                               child: CircularPercentIndicator(
                                 radius: 180.sp,
                                 animation: true,
                                 animationDuration: 1200,
                                 lineWidth: 15.0,
                                 percent: 0.4,
                                 center: Container(
                                   height: 90.sp,
                                   width: 90.sp,
                                   decoration:  BoxDecoration(
                                     shape: BoxShape.circle,
                                     color: Colors.blue, // inner circle color
                                   ),
                                   child: Center(
                                     child: Text(
                                       "40%",
                                       textAlign: TextAlign.center,
                                       style:
                                       new TextStyle(
                                           fontWeight: FontWeight.bold,
                                           color: Colors.white,

                                           fontSize: 20.0),
                                     ),
                                   ),
                                 ),
                                 circularStrokeCap: CircularStrokeCap.butt,
                                 backgroundColor: Color(0xFFD4D4D4),
                                 footer: Text(
                                   "Patient's performance+2%",
                                   style:
                                   new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                 ),
                                 progressColor: Color(0xFF29AAE1),
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
                                 color: Colors.white,
                                 border: Border.all(

                                     color: Colors.transparent.withOpacity(1.0)
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
                                             flex: 5,
                                             child: Container(
                                                child: Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                    child:  Text(
                                                      "eMazeBrain",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 35.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),

                                                    ),
                                                  ),
                                                ),
                                             )
                                         ),
                                       Expanded(
                                           flex: 5,
                                           child: Align(
                                             alignment: Alignment.centerRight,
                                             child: Container(
                                               padding: EdgeInsets.all(8.sp),
                                               child: Row(
                                                // crossAxisAlignment: CrossAxisAlignment.end,
                                                // mainAxisAlignment: MainAxisAlignment.end,
                                                 children: [

                                                   ButtonBar(

                                                     alignment: MainAxisAlignment.spaceAround,
                                                     children: [
                                                       DecoratedBox(

                                                         decoration: BoxDecoration(

                                                             borderRadius: BorderRadius.only(
                                                                 topRight: Radius.circular(40.sp),
                                                                 bottomRight: Radius.circular(40.sp),
                                                                 topLeft: Radius.circular(40.sp),
                                                                 bottomLeft: Radius.circular(40.sp)),
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
                                                               Navigator.push(
                                                                 context,
                                                                 MaterialPageRoute(builder: (context) => Therapistgeneralpreference()),
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
                                                               MaterialStateProperty.all(Colors.transparent),
                                                               // elevation: MaterialStateProperty.all(3),
                                                               shadowColor:
                                                               MaterialStateProperty.all(Colors.transparent),
                                                             ),
                                                             /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                             label: Text("Default       ",
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
                                                   IconButton(
                                                     icon: Image.asset(
                                                         'assets/images/profile.png'),
                                                     onPressed: () {},
                                                   ),
                                                   RichText(
                                                     text: TextSpan(
                                                       text: 'Patient Carlos moron\n',
                                                       children: [
                                                         TextSpan(
                                                           text: 'Userid :8882222',
                                                         ),
                                                       ],
                                                     ),
                                                   ),
                                                 ],
                                               ),
                                             ),
                                           )
                                       ),
                                      ]
                                   ),
                                   Align(
                                     alignment: Alignment.centerRight,
                                     child: Container(
                                       padding: EdgeInsets.all(10.sp),
                                       child: Text(
                                         "Emaze brain 2021-Developed and registered by emazebrain",
                                         style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 14.sp,

                                         ),
                                       ),
                                     ),
                                   ),
                                   Row(
                                     mainAxisAlignment: MainAxisAlignment.end,
                                     children: [
                                       Expanded(
                                           flex: 4,
                                           child: Container(
                                             child: Column(

                                               children: [

                                                 Container(
                                                   child: Align(
                                                     alignment: Alignment.topLeft,
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
                                                                    ]
                                                           ),
                                                           child: ConstrainedBox(
                                                             constraints: BoxConstraints.tightFor(width: 300, height: 46),
                                                             child: ElevatedButton.icon(
                                                               icon: IconButton(
                                                                 icon: Image.asset('assets/images/headphone.png'), onPressed: () {  },
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
                                                                 MaterialStateProperty.all(Colors.white),
                                                                 // elevation: MaterialStateProperty.all(3),
                                                                 shadowColor:
                                                                 MaterialStateProperty.all(Colors.white),
                                                               ),
                                                               /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                               label: Text("Sound preference",
                                                                 style: TextStyle(
                                                                     color: Colors.black,
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
                                                   child: Align(
                                                     alignment: Alignment.topLeft,
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
                                                               ]
                                                           ),
                                                           child: ConstrainedBox(
                                                             constraints: BoxConstraints.tightFor(width: 300, height: 46),
                                                             child: ElevatedButton.icon(
                                                               icon: IconButton(
                                                                 icon: Image.asset('assets/images/sett.png'), onPressed: () {  },
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
                                                                 MaterialStateProperty.all(Colors.white),
                                                                 // elevation: MaterialStateProperty.all(3),
                                                                 shadowColor:
                                                                 MaterialStateProperty.all(Colors.white),
                                                               ),
                                                               /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                               label: Text("Visual adjustments",
                                                                 style: TextStyle(
                                                                     color: Colors.black,
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
                                                   child: Align(
                                                     alignment: Alignment.topLeft,
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
                                                               ]
                                                           ),
                                                           child: ConstrainedBox(
                                                             constraints: BoxConstraints.tightFor(width: 300, height: 46),
                                                             child: ElevatedButton.icon(
                                                               icon: IconButton(
                                                                 icon: Image.asset('assets/images/language.png'), onPressed: () {  },
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
                                                                 MaterialStateProperty.all(Colors.white),
                                                                 // elevation: MaterialStateProperty.all(3),
                                                                 shadowColor:
                                                                 MaterialStateProperty.all(Colors.white),
                                                               ),
                                                               /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                               label: Text("Language                 ",
                                                                 style: TextStyle(
                                                                     color: Colors.black,
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

                                               ],
                                             ),

                                           )
                                       ),

                                       Expanded(
                                           flex: 6,
                                           child: Container(
                                             child: Column(
                                               children: [
                                                 Row(
                                                   children: [
                                                     Expanded(
                                                       flex: 5,
                                                       child: Container(
                                                         child: Align(
                                                           alignment: Alignment.topLeft,
                                                           child: ButtonBar(

                                                             alignment: MainAxisAlignment.spaceAround,
                                                             children: [
                                                               DecoratedBox(

                                                                 decoration: BoxDecoration(

                                                                     borderRadius: BorderRadius.only(
                                                                         topRight: Radius.circular(20.sp),
                                                                         bottomRight: Radius.circular(20.sp),
                                                                         topLeft: Radius.circular(20.sp),
                                                                         bottomLeft: Radius.circular(20.sp)),

                                                                     boxShadow: [
                                                                       BoxShadow(
                                                                         color: Colors.grey.withOpacity(0.5),
                                                                         spreadRadius: 5,
                                                                         blurRadius: 7,
                                                                         offset: Offset(0, 3), // changes position of shadow
                                                                       ),
                                                                     ]
                                                                 ),
                                                                 child: ConstrainedBox(
                                                                   constraints: BoxConstraints.tightFor(width: 240, height: 74),
                                                                   child: ElevatedButton.icon(
                                                                     icon: IconButton(
                                                                       icon: Image.asset('assets/images/messages.png'), onPressed: () {  },
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
                                                                       MaterialStateProperty.all(Colors.white),
                                                                       // elevation: MaterialStateProperty.all(3),
                                                                       shadowColor:
                                                                       MaterialStateProperty.all(Colors.white),
                                                                     ),
                                                                     /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                                     label: Text("Erase account",
                                                                       style: TextStyle(
                                                                           color: Colors.black,
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
                                                     ),
                                                     Expanded(
                                                       flex: 5,
                                                       child: Container(
                                                         child: Align(
                                                           alignment: Alignment.topLeft,
                                                           child: ButtonBar(

                                                             alignment: MainAxisAlignment.spaceAround,
                                                             children: [
                                                               DecoratedBox(

                                                                 decoration: BoxDecoration(

                                                                     borderRadius: BorderRadius.only(
                                                                         topRight: Radius.circular(20.sp),
                                                                         bottomRight: Radius.circular(20.sp),
                                                                         topLeft: Radius.circular(20.sp),
                                                                         bottomLeft: Radius.circular(20.sp)),

                                                                     boxShadow: [
                                                                       BoxShadow(
                                                                         color: Colors.grey.withOpacity(0.5),
                                                                         spreadRadius: 5,
                                                                         blurRadius: 7,
                                                                         offset: Offset(0, 3), // changes position of shadow
                                                                       ),
                                                                     ]
                                                                 ),
                                                                 child: ConstrainedBox(
                                                                   constraints: BoxConstraints.tightFor(width: 240, height: 74),
                                                                   child: ElevatedButton.icon(
                                                                     icon: IconButton(
                                                                       icon: Image.asset('assets/images/delete.png'), onPressed: () {  },
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
                                                                       MaterialStateProperty.all(Colors.white),
                                                                       // elevation: MaterialStateProperty.all(3),
                                                                       shadowColor:
                                                                       MaterialStateProperty.all(Colors.white),
                                                                     ),
                                                                     /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                                     label: Text("Erase cache",
                                                                       style: TextStyle(
                                                                           color: Colors.black,
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
                                                     ),
                                                   ],
                                                 ),
                                                 Row(
                                                   children: [
                                                     Expanded(
                                                       flex: 5,
                                                       child: Container(
                                                         child: Align(
                                                           alignment: Alignment.topLeft,
                                                           child: ButtonBar(

                                                             alignment: MainAxisAlignment.spaceAround,
                                                             children: [
                                                               DecoratedBox(

                                                                 decoration: BoxDecoration(

                                                                     borderRadius: BorderRadius.only(
                                                                         topRight: Radius.circular(20.sp),
                                                                         bottomRight: Radius.circular(20.sp),
                                                                         topLeft: Radius.circular(20.sp),
                                                                         bottomLeft: Radius.circular(20.sp)),

                                                                     boxShadow: [
                                                                       BoxShadow(
                                                                         color: Colors.grey.withOpacity(0.5),
                                                                         spreadRadius: 5,
                                                                         blurRadius: 7,
                                                                         offset: Offset(0, 3), // changes position of shadow
                                                                       ),
                                                                     ]
                                                                 ),
                                                                 child: ConstrainedBox(
                                                                   constraints: BoxConstraints.tightFor(width: 240, height: 74),
                                                                   child: ElevatedButton.icon(
                                                                     icon: IconButton(
                                                                       icon: Image.asset('assets/images/verify.png'), onPressed: () {  },
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
                                                                       MaterialStateProperty.all(Colors.white),
                                                                       // elevation: MaterialStateProperty.all(3),
                                                                       shadowColor:
                                                                       MaterialStateProperty.all(Colors.white),
                                                                     ),
                                                                     /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                                     label: Text("Privacy policy",
                                                                       style: TextStyle(
                                                                           color: Colors.black,
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
                                                     ),
                                                     Expanded(
                                                       flex: 5,
                                                       child: Container(
                                                         child: Align(
                                                           alignment: Alignment.topLeft,
                                                           child: ButtonBar(

                                                             alignment: MainAxisAlignment.spaceAround,
                                                             children: [
                                                               DecoratedBox(

                                                                 decoration: BoxDecoration(

                                                                     borderRadius: BorderRadius.only(
                                                                         topRight: Radius.circular(20.sp),
                                                                         bottomRight: Radius.circular(20.sp),
                                                                         topLeft: Radius.circular(20.sp),
                                                                         bottomLeft: Radius.circular(20.sp)),

                                                                     boxShadow: [
                                                                       BoxShadow(
                                                                         color: Colors.grey.withOpacity(0.5),
                                                                         spreadRadius: 5,
                                                                         blurRadius: 7,
                                                                         offset: Offset(0, 3), // changes position of shadow
                                                                       ),
                                                                     ]
                                                                 ),
                                                                 child: ConstrainedBox(
                                                                   constraints: BoxConstraints.tightFor(width: 240, height: 74),
                                                                   child: ElevatedButton(


                                                                     onPressed: () {  },
                                                                     style: ButtonStyle(
                                                                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                         RoundedRectangleBorder(
                                                                           borderRadius: BorderRadius.circular(20.0),
                                                                         ),
                                                                       ),

                                                                       // fixedSize: Size(426.sp, 149.sp),
                                                                       // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                       backgroundColor:
                                                                       MaterialStateProperty.all(Colors.white),
                                                                       // elevation: MaterialStateProperty.all(3),
                                                                       shadowColor:
                                                                       MaterialStateProperty.all(Colors.white),
                                                                     ),
                                                                     /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                                     child: Text("Terms and conditions",
                                                                       style: TextStyle(
                                                                           color: Colors.black,
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
                                           colors: [ Color(0xFFFFE72E),
                                             Color(0xFFF08800),
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
  
}