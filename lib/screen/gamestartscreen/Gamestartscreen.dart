import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "GAME LOGO",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 65.sp,
                       fontWeight:  FontWeight.bold

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
                    height: 50.sp,
                    width: 400.sp,
                    decoration: BoxDecoration(

                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 5.0,
                          percent: 1.0,
                          center: new Text("100%"),
                          progressColor: Colors.green,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          ),
        )
    );

  }
  
}