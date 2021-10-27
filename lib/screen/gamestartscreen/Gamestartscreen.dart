import 'dart:async';
import 'dart:collection';

import 'package:emaze_brain/screen/therapistprofile/Therapistprofile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Gamestartscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GamestartscreenState();
  }

}
class GamestartscreenState extends State<Gamestartscreen>{
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Therapistprofile())));
  }
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        builder: () =>ResponsiveBuilder(
        builder: (context, sizingInformation) {
          if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
             return Scaffold(
               body: Container(
                 height: MediaQuery.of(context).size.height,
                 width: MediaQuery.of(context).size.width,
                 decoration: BoxDecoration(
                   gradient:
                   LinearGradient(
                       begin: Alignment.centerLeft,
                       end: Alignment.centerRight,
                       tileMode: TileMode.repeated,
                       colors: [ Color(0xFF000002),
                         Color(0xFF0079AE),
                       ]),
                 ),
                 child: Column(
                   children: [
                     Container(
                       height: 82.sp,
                       width: 1202.sp,
                       decoration: BoxDecoration(
                           color: Color(0xFFF1F1F1),
                           borderRadius: BorderRadius.only(
                               bottomLeft: Radius.circular(25.0),
                               bottomRight: Radius.circular(25.0)

                           )
                       ),
                       child: Container(
                         // padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                         padding: EdgeInsets.all(10.sp),
                         child: Column(
                           children: [
                             Stack(
                               alignment: Alignment.center,
                               children: [
                                 Align(
                                   alignment: Alignment.center,
                                   child:   Text(
                                     "eMazeBrain",
                                     textAlign: TextAlign.center,
                                     style: TextStyle(
                                       color: Color(0xFF28ABDF),
                                       fontSize: 35.sp,
                                       fontWeight:  FontWeight.bold,
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
                                           color: Colors.white.withOpacity(1.0),  // red as border color
                                         ),
                                         borderRadius: new BorderRadius.only(
                                             topLeft: const Radius.circular(40.0),
                                             topRight: const Radius.circular(40.0),
                                             bottomRight: const Radius.circular(40.0),
                                             bottomLeft: const Radius.circular(40.0)
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
                                                   icon: Image.asset('assets/images/notification.png'), onPressed: () {  },
                                                 ),
                                               ),
                                             ),
                                             Align(
                                               alignment: Alignment.centerRight,
                                               child: SizedBox(

                                                 child: IconButton(
                                                   icon: Image.asset('assets/images/menu.png'), onPressed: () {  },
                                                 ),
                                               ),

                                             ),
                                             Align(
                                               alignment: Alignment.centerLeft,
                                               child: SizedBox(

                                                 child: IconButton(
                                                   icon: Image.asset('assets/images/communate.png'), onPressed: () {  },
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
                                         width:49.sp ,
                                         decoration: BoxDecoration(
                                           shape: BoxShape.circle,
                                           border: new Border.all(
                                             color: Colors.white.withOpacity(1.0),
                                             width: 2.5,
                                           ),

                                         ),
                                         child:SizedBox(

                                           child: IconButton(
                                             icon: Image.asset('assets/images/play.png'), onPressed: () {  },
                                           ),
                                         ) ,
                                       ),
                                       Container(
                                         width: 40.sp,
                                       ),
                                       Text(
                                         "Playing game",
                                         textAlign: TextAlign.center,
                                         style: TextStyle(
                                           color: Colors.black,
                                           fontSize: 15.sp,
                                           fontWeight:  FontWeight.bold,
                                         ),

                                       ),
                                     ],
                                   ),
                                 )
                               ],
                             ),


                           ],

                         ),

                       ),


                     ),
                     Container(
                       height: 100.sp,
                     ),
                     Container(

                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             "GAME LOGO",
                             textAlign: TextAlign.center,
                             style: TextStyle(

                                 fontSize: 65.sp,
                                 fontWeight:  FontWeight.bold,
                                 color: Colors.white,
                                 shadows: outlinedText(
                                     strokeColor: Color(0xFFEAD315)
                                 )

                             ),

                           ),
                           Text(
                             "Loading...",
                             textAlign: TextAlign.start,
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 25.sp,
                                 fontWeight:  FontWeight.bold

                             ),

                           ),
                           Container(
                             height: 10.sp,
                           ),
                           Container(
                             padding: EdgeInsets.all(15.0),
                             height: 80.sp,
                             width: 400.sp,
                             decoration: BoxDecoration(

                                 color: Colors.white,
                                 border: Border.all(color: Colors.white),
                                 borderRadius: BorderRadius.all(Radius.circular(10))
                             ),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.center,

                               children: [

                                 LinearPercentIndicator(
                                   width: 350.sp,
                                   animation: true,
                                   animationDuration: 1000,
                                   lineHeight: 20.0,
                                   backgroundColor:Color(0xFFEFEFEF),
                                   percent: 0.2,
                                   center: Text("20.0%"),
                                   linearStrokeCap: LinearStrokeCap.butt,

                                   progressColor: Color(0xFFFD6900),

                                 ),

                                 Text(
                                   "30Mb/60Mb",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: Colors.black,
                                       fontSize: 20.sp
                                   ),

                                 ),
                               ],
                             ),
                           ),
                           Container(
                             height: 20.sp,
                           ),
                           Container(
                             child: Column(
                               children: [
                                 Text(
                                   "Lorem ipusm Lorem ipusm Lorem ipusm Lorem ipusm Lorem ipusm Lorem ipusm Lorem ipusm Lorem ipusm",
                                   textAlign: TextAlign.center,
                                   style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 20.sp
                                   ),

                                 ),
                               ],
                             ),
                           ),

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
              color:Colors.red,
              child: Text(
                "Watch",
              ),
            );
          }

          return Container(
            color:Colors.red,
            child: Text(
              "Mobile",
            ),
          );
        }
        )
    );

  }
  static List<Shadow> outlinedText({double strokeWidth = 2, Color strokeColor = Colors.black, int precision = 5}) {
    Set<Shadow> result = HashSet();
    for (int x = 1; x < strokeWidth + precision; x++) {
      for(int y = 1; y < strokeWidth + precision; y++) {
        double offsetX = x.toDouble();
        double offsetY = y.toDouble();
        result.add(Shadow(offset: Offset(-strokeWidth / offsetX, -strokeWidth / offsetY), color: strokeColor));
        result.add(Shadow(offset: Offset(-strokeWidth / offsetX, strokeWidth / offsetY), color: strokeColor));
        result.add(Shadow(offset: Offset(strokeWidth / offsetX, -strokeWidth / offsetY), color: strokeColor));
        result.add(Shadow(offset: Offset(strokeWidth / offsetX, strokeWidth / offsetY), color: strokeColor));
      }
    }
    return result.toList();
  }
}