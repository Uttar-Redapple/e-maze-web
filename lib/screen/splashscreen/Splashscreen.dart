


import 'dart:async';

import 'package:emaze_brain/screen/loginscreen/Loginregistration.dart';
import 'package:emaze_brain/screen/loginscreen/Therapistorpatient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
class Splashscreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Therapistorpatient())));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>Material(
        type: MaterialType.transparency,
          child:  Container(
            constraints: BoxConstraints.expand(),
            child: Center(
              child: Text(
                "eMazeBrain",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.sp
                ),

              ),
            ),
            decoration: BoxDecoration(
              /*image: DecorationImage(
                image: AssetImage("assets/images/whitepoligon.png"),

                fit: BoxFit.cover,
              ),*/
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color> [
                  Color(0xFF000120),
                  Color(0xFF0078ad)




                ],
                  tileMode: TileMode.repeated
              ),

            ),
           /* decoration:  BoxDecoration(

                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color> [
                      Color(0xFF000002),
                      Color(0xFF0079AE)




                    ],
                    tileMode: TileMode.repeated
                )
            ),*/
          )
      ),
    );

     
    }
  }


