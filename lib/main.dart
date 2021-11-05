import 'package:emaze_brain/screen/addnewpatientscreen/Addnewpatient.dart';
import 'package:emaze_brain/screen/loginnew/Loginregnew.dart';
import 'package:emaze_brain/screen/loginscreen/Loginregistration.dart';
import 'package:emaze_brain/screen/loginscreen/Therapistorpatient.dart';
import 'package:emaze_brain/screen/patientgeneralpreferance/Patientgeneralpreference.dart';
import 'package:emaze_brain/screen/patientloginregistration/Patientloginregistration.dart';
import 'package:emaze_brain/screen/patientprofile/Patientprofile.dart';
import 'package:emaze_brain/screen/patientusermanagement/Patientusermanagement.dart';
import 'package:emaze_brain/screen/splashscreen/Splashscreen.dart';
import 'package:emaze_brain/screen/therapistgeneralpreference/Therapistgeneralpreference.dart';
import 'package:emaze_brain/screen/therapistprofile/Therapistprofile.dart';
import 'package:emaze_brain/screen/therapistuserprofile/Therapistuserprofile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eMazeBrain',
     // debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) =>  Splashscreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.

        'patient/loginregistration': (context) =>  Patientloginregistration(),
        'therapist/loginregistration': (context) =>  Loginregistration(),
        'therapist/verifycertificates': (context) =>  Therapistprofile(),
        'therapist/addnewpatient': (context) =>  Addnewpatient(),
        'therapist/profile': (context) =>  Therapistuserprofile(),
        'therapist/usermanagement': (context) =>  Patientusermanagement(),
        'patient/generalpreference': (context) =>  Patientgeneralpreference(),
        'therapist/generalpreference': (context) =>  Therapistgeneralpreference(),
        'patient/profile': (context) =>  Patientprofile(),
        'patient/loginnew': (context) =>  Loginregnew(),

      },
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
    //  home:  Splashscreen(),
    );
  }
}



