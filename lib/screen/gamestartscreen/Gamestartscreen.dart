import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter/foundation.dart';
class Gamestartscreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GamestartscreenState();
  }

}
class GamestartscreenState extends State<Gamestartscreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenUtilInit(
        builder: () =>Scaffold(
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
            ),

          ),
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