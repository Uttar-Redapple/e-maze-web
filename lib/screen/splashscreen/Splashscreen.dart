


import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginscreen/Loginregistration.dart';
import 'loginscreen/Therapistorpatient.dart';
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
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Loginregistration())));
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () =>Material(
        type: MaterialType.transparency,
          child: new Container(
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
            decoration:  BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: <Color> [
                      Color(0xFF000000),
                      Color(0xFF01002A),
                      Color(0xFF007CB0)



                    ],
                    tileMode: TileMode.repeated
                )
            ),
          )
      ),
    );

     
    }
  }


