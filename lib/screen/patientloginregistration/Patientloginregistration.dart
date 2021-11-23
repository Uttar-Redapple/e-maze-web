import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:emaze_brain/model/get_login.dart';
import 'package:emaze_brain/model/get_reguser.dart';
import 'package:emaze_brain/model/response/get_loginresp.dart';
import 'package:emaze_brain/model/response/get_regresponse.dart';
import 'package:emaze_brain/provider/api_client_provider.dart';
import 'package:emaze_brain/screen/gamestartscreen/Gamestartscreen.dart';
import 'package:emaze_brain/screen/loginscreen/Therapistorpatient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';
void main() {
  runApp(ProviderScope(child: MyApp()));
}
class Patientloginregistration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientloginregistrationState();
  }
  
}
class PatientloginregistrationState extends State<Patientloginregistration> with TickerProviderStateMixin{
  final _formKey = GlobalKey<FormState>();
  final _regformKey = GlobalKey<FormState>();
  bool _hasBeenPressedlogin = false;
  bool _hasBeenPressedregister = false;
  double _width = 600.sp;
  double _height = 450.sp;
   bool roundcheckboxselection=false;
  bool viewVisible = false ;
  bool viewerrormsgvisible=false;
  bool viewregsucess=false;
  bool viewreg=false;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(40.sp);
   bool regusername=false;
   bool regpwd=false;
   bool regph=false;
   bool regemail=false;

  bool username=true;
  bool pwd=true;

  Color _logincolor = Colors.green;
  Color _regcolor = Colors.white;
  Color _logintextcolor=Colors.white;
  Color _regtextcolor=Colors.black;
  double _regwidth = 570.sp;
  double _regheight = 370.sp;

  BorderRadiusGeometry _regborderRadius = BorderRadius.circular(40.sp);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regnameController = TextEditingController();
  TextEditingController regpasswordController = TextEditingController();
  TextEditingController regemailController = TextEditingController();
  TextEditingController regphnoController = TextEditingController();
  bool _obscureText = true;

  late String _password;
  late bool _passwordVisible;
  late bool _regpasswordVisible;
  bool value = false;
  bool isChecked = false;
  bool isEnabled = true;

   bool selectedbox=false;

  String checkvalue="Please";
  String valuetext="Wrong username/password";

  void clearregtext(){
    regnameController.clear();
    regpasswordController.clear();
    regemailController.clear();
    regphnoController.clear();
  }
  void clearlogintext(){
    nameController.clear();
    passwordController.clear();

  }

  void showregsucesswidget(){
    setState(() {
      viewregsucess = true ;

    });
  }

  void hideregsucesswidget(){
    setState(() {
      viewregsucess = false ;
    });
  }
  void showidget(){
    setState(() {
      viewreg = true ;

    });
  }

  void hidewidget(){
    setState(() {
      viewreg = false ;
    });
  }

  void showerrorWidget(){
    setState(() {
      viewerrormsgvisible = true ;

    });
  }

  void hideerrorWidget(){
    setState(() {
      viewerrormsgvisible = false ;
    });
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  enableElevatedButton() {
    setState(() {
      isEnabled = true;
    });
  }
  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;
    });
  }
  diablebutton() {
    setState(() {
      isEnabled = false;
    });
  }
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
    _regpasswordVisible = false;


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
                        padding: EdgeInsets.all(20.sp),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/fondos.png"),

                            fit: BoxFit.cover,
                          ),
                          gradient:
                          LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              tileMode: TileMode.repeated,
                              colors: [ Color(0xFF000120),
                                Color(0xFF0078ad),
                              ]),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child:  Text(
                                    'eMazeBrain',
                                    style: TextStyle(
                                      fontSize: 35.sp,

                                      color: Colors.white,
                                    )
                                ),
                              ),
                              Container(
                                height: 5.sp,
                              ),
                              Container(

                                padding: EdgeInsets.all(5.sp),

                                decoration: BoxDecoration(
                                    color: Colors.white,

                                    borderRadius: BorderRadius.all(Radius.circular(40.sp)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: Offset(1, -1),
                                      ),
                                    ]

                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(



                                        child: RaisedButton(
                                          //     disabledColor: Colors.red,
                                          // disabledTextColor: Colors.black,
                                          padding:  EdgeInsets.all(20),
                                          textColor: _logintextcolor,
                                          //  color: Colors.green,
                                          color: _logincolor,
                                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.sp)),

                                          onPressed: () {
                                            setState(() {
                                              // final random = Random();
                                              _regcolor = Colors.white;
                                              _logincolor=Colors.green;
                                              _logintextcolor=Colors.white;
                                              _regtextcolor=Colors.black;
                                              // Generate a random width and height.
                                              _width = 600.sp;
                                              _height = 450.sp;
                                              _regwidth = 570.sp;
                                              _regheight = 370.sp;
                                              regpwd=false;
                                              regph=false;
                                              regemail=false;
                                              regusername=false;
                                              username=true;
                                              hidewidget();
                                              hideWidget();
                                              clearregtext();
                                              hideregsucesswidget();
                                              pwd=true;
                                              _regborderRadius =
                                                  BorderRadius.circular(50.sp);
                                              _borderRadius =
                                                  BorderRadius.circular(50.sp);
                                              _hasBeenPressedregister = !_hasBeenPressedregister;
                                            });
                                          },
                                          child: Text(
                                              'LOGIN',
                                              style:  TextStyle(
                                                  fontWeight: FontWeight.bold,

                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 5,
                                      child: Container(


                                        child: RaisedButton(
                                          //     disabledColor: Colors.red,
                                          // disabledTextColor: Colors.black,
                                          padding:  EdgeInsets.all(20),
                                          textColor: _regtextcolor,

                                          // color: Colors.white,
                                          color: _regcolor,
                                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.sp)),
                                          onPressed: () {
                                            setState(() {
                                              regpwd=true;
                                              regph=true;
                                              regemail=true;
                                              regusername=true;
                                              username=false;
                                              pwd=false;
                                              _logincolor = Colors.white;
                                              _regcolor= Colors.green;
                                              _logintextcolor=Colors.black;
                                              _regtextcolor=Colors.white;
                                              _width = 500.sp;
                                              _height = 350.sp;
                                              _borderRadius =
                                                  BorderRadius.circular(50.sp);

                                              _regwidth = 650.sp;
                                              _regheight = 450.sp;
                                              _regborderRadius =
                                                  BorderRadius.circular(50.sp);
                                              hideerrorWidget();
                                              clearlogintext();
                                              _hasBeenPressedlogin = !_hasBeenPressedlogin;
                                            });
                                          },
                                          child: Text(
                                              'REGISTER',
                                              style:  TextStyle(
                                                  fontWeight: FontWeight.bold,

                                              )
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 20.sp,
                              ),
                              Container(
                                height: 500.sp,
                                child: Row(

                                  children: [
                                    Expanded(
                                      flex: 5,
                                      child: Container(


                                        padding: EdgeInsets.all(40.sp),
                                        child: Align(

                                          child: AnimatedContainer(


                                            padding: EdgeInsets.all(10.sp),
                                            width: _width,
                                            height: _height,

                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/login.png"),

                                                fit: BoxFit.cover,
                                              ),
                                              /* gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: <Color> [
                                                    Color(0xFF282842),
                                                    Color(0xFF1C3973)




                                                  ],
                                                  tileMode: TileMode.repeated
                                              ),*/
                                              border: Border.all(

                                                  color: Color(0xFF55708b)
                                              ),
                                              borderRadius: _borderRadius,

                                            ),
                                            duration:  Duration(seconds: 1),
                                            child: SingleChildScrollView(
                                              child: Form(
                                                key: _formKey,
                                                child: Column(

                                                  children:<Widget>[

                                                    Container(
                                                      margin: new EdgeInsets.symmetric(horizontal: 20.sp),
                                                      padding: EdgeInsets.symmetric(vertical: 10.sp,),
                                                      child: Row(

                                                        children: [
                                                          Text(
                                                            "USER/EMAIL/ID/PHONE",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 15.sp
                                                            ),

                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 10.sp,

                                                    ),
                                                    Container(

                                                      //  height: 140.sp,
                                                      width: 700.sp,
                                                      margin: new EdgeInsets.symmetric(horizontal: 20.sp),
                                                      padding: EdgeInsets.all(20.sp),
                                                      decoration: BoxDecoration(

                                                          color: Colors.white,
                                                          border: Border.all(color: Colors.white),
                                                          borderRadius: BorderRadius.all(Radius.circular(25.sp))
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          TextFormField(
                                                            enabled: username,
                                                            controller: nameController,
                                                            decoration: InputDecoration(
                                                              border: UnderlineInputBorder(),
                                                              labelText: 'User Name',
                                                            ),
                                                            validator: (value) {
                                                              if (value == null || value.isEmpty) {
                                                                return 'Username required';
                                                              }
                                                              return null;
                                                            },
                                                          ),
                                                          TextFormField(
                                                            enabled: pwd,
                                                            obscureText: !_passwordVisible,
                                                            controller: passwordController,
                                                            validator: (pwdvalue) {
                                                              if (pwdvalue!.isEmpty) {
                                                                return "Password Required";
                                                              }
                                                            },

                                                            decoration: InputDecoration(

                                                                border: UnderlineInputBorder(),
                                                                labelText: 'Password',
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
                                                          ),

                                                        ],
                                                      ),

                                                    ),
                                                    Container(
                                                      height: 10.sp,

                                                    ),
                                                    Container(
                                                      margin:  EdgeInsets.only(left: 15.sp, right: 15.sp),

                                                      child: Row(

                                                        children: [
                                                          Container(
                                                            height: 25.sp,
                                                            width: 25.sp,
                                                            child: RoundCheckBox(
                                                              onTap: (selected) {},

                                                              animationDuration: Duration(
                                                                milliseconds: 50,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 2.sp,
                                                            height: 2.sp,
                                                          ),

                                                          /* FutureBuilder<Album>(
                                                              future: futureAlbum,
                                                              builder: (context, snapshot) {
                                                                if (snapshot.hasData) {
                                                                  return Text(
                                                                      snapshot.data!.title,
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 15.sp
                                                                    ),
                                                                  );
                                                                } else if (snapshot.hasError) {
                                                                  return Text('${snapshot.error}');
                                                                }
                                                                return const CircularProgressIndicator();
                                                              }
                                                          ),*/

                                                          Text(
                                                            "Remember me",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 15.sp
                                                            ),

                                                          ),
                                                          Spacer(),
                                                          Text(
                                                            "Forgot password?",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 15.sp
                                                            ),

                                                          ),

                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 40.sp,

                                                    ),
                                                    Container(
                                                      child: ButtonTheme(
                                                        minWidth: 158.sp,
                                                        height: 56.sp,
                                                        shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(40.sp),
                                                        ),
                                                        child: RaisedButton(
                                                          onPressed: () async {
                                                            if (_formKey.currentState!.validate()) {
                                                              try {
                                                                GetLoginResponse resp=
                                                                await context.read(apiClientProvider).login(
                                                                    Loginuser( nameController.text, passwordController.text
                                                                    )
                                                                );


                                                                /* print( User(
                                                                    "abc@gmail.com",
                                                                    "123456"
                                                                ));*/

                                                                if(resp.data.user_type==1){
                                                                  print("usertype: ${resp.data.user_type}");
                                                                  Navigator.pushNamed(context, 'patient/profile');
                                                                }
                                                                else{
                                                                  showerrorWidget();
                                                                }
                                                                print("Regions: ${resp.data.toJson()}");

                                                                clearlogintext();
                                                               // hideerrorWidget();

                                                              } catch (e) {
                                                                print(e);
                                                                if (e is DioError) {
                                                                  showerrorWidget();
                                                                  clearlogintext();
                                                                  /* ScaffoldMessenger.of(context).showSnackBar(
                                                                    SnackBar(content: Text('Wrong username or password')),
                                                                  );*/

                                                                  //handle DioError here by error type or by error code

                                                                } else {

                                                                }

                                                              }
                                                              // If the form is valid, display a snackbar. In the real world,
                                                              // you'd often call a server or save the information in a database.


                                                            }

                                                          },

                                                          color: Color(0xFF29AAE1),
                                                          child: Text("Sign In",
                                                            style: TextStyle(
                                                              color: Colors.white,

                                                            ),
                                                          ),
                                                        ),
                                                      ),

                                                    ),
                                                    Container(
                                                      height: 10.sp,
                                                    ),
                                                    Visibility(
                                                      visible: viewerrormsgvisible,
                                                      child: Text(valuetext,
                                                        style: TextStyle(
                                                          color: Color(0xFFFF4500),

                                                        ),
                                                      ),
                                                    ),

                                                  ],

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
                                        //  height: 600.sp,

                                        padding: EdgeInsets.all(20.sp),
                                        child: Align(

                                          child: AnimatedContainer(


                                            padding: EdgeInsets.all(10.sp),
                                            width: _regwidth,
                                            height: _regheight,

                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/login.png"),

                                                  fit: BoxFit.cover,
                                                ),
                                                /* gradient: LinearGradient(
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                    colors: <Color> [
                                                      Color(0xFF263E7A),

                                                      Color(0xFF0070A8)



                                                    ],
                                                    tileMode: TileMode.repeated
                                                ),*/
                                                border: Border.all(

                                                    color: Color(0xFF55708b)
                                                ),
                                                borderRadius: _regborderRadius

                                            ),
                                            duration:  Duration(seconds: 1),
                                            curve: Curves.fastOutSlowIn,
                                            child: SingleChildScrollView(
                                              child: Form(
                                                key: _regformKey,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 20.sp,
                                                    ),
                                                    Container(
                                                        margin: new EdgeInsets.symmetric(horizontal: 20.sp),
                                                        padding: EdgeInsets.all(20.sp),
                                                        decoration: BoxDecoration(

                                                            color: Colors.white,
                                                            border: Border.all(color: Colors.white),
                                                            borderRadius: BorderRadius.all(Radius.circular(25))
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              // height: 40.sp,
                                                              width: 500.sp,
                                                              child: TextFormField(
                                                                validator: (regvalue) {
                                                                  if (regvalue == null || regvalue.isEmpty) {
                                                                    return 'Username required';
                                                                  }
                                                                  return null;
                                                                },
                                                                enabled:regusername,
                                                                controller: regnameController,
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20.sp),
                                                                    ),
                                                                    filled: true,
                                                                    fillColor: Colors.white70,
                                                                    labelText: 'User Name',
                                                                    icon: IconButton(
                                                                      icon: Image.asset('assets/images/username-gray.png'), onPressed: () {  },
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 10.sp,
                                                            ),
                                                            SizedBox(
                                                              // height: 40.sp,
                                                              width: 500.sp,
                                                              child: TextFormField(
                                                                enabled:regemail,
                                                                controller: regemailController,
                                                                validator: (regemailvalue) {
                                                                  final bool isValid = EmailValidator.validate(regemailvalue!);
                                                                  if (regemailvalue.isEmpty) {
                                                                    return "Email required";
                                                                  }
                                                                  if (!isValid) {
                                                                    return "Email address invalid";
                                                                  }
                                                                },

                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(

                                                                      borderRadius: BorderRadius.circular(20.sp),
                                                                    ),
                                                                    filled: true,
                                                                    fillColor: Colors.white70,

                                                                    labelText: 'Email',
                                                                    icon: IconButton(
                                                                      icon: Image.asset('assets/images/message-gray.png'), onPressed: () {  },
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 10.sp,
                                                            ),
                                                            SizedBox(
                                                              // height: 40.sp,
                                                              width: 500.sp,
                                                              child: TextFormField(
                                                                enabled:regph,
                                                                controller: regphnoController,
                                                                validator: (regphvalue) {
                                                                  if (regphvalue!.isEmpty) {
                                                                    return "Phone number Required";
                                                                  }
                                                                },
                                                                decoration: InputDecoration(
                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20.sp),

                                                                    ),
                                                                    filled: true,
                                                                    fillColor: Colors.white70,
                                                                    labelText: 'Phone number',
                                                                    icon: IconButton(
                                                                      icon: Image.asset('assets/images/contact-gray.png'), onPressed: () {  },
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              height: 10.sp,
                                                            ),
                                                            SizedBox(
                                                              // height: 40.sp,
                                                              width: 500.sp,
                                                              child: TextFormField(
                                                                enabled:regpwd,
                                                                obscureText: !_regpasswordVisible,
                                                                controller: regpasswordController,
                                                                validator: (regpwdvalue) {
                                                                  if (regpwdvalue!.isEmpty) {
                                                                    return "Password Required";
                                                                  }
                                                                },
                                                                decoration: InputDecoration(

                                                                    border: OutlineInputBorder(
                                                                      borderRadius: BorderRadius.circular(20.sp),
                                                                    ),
                                                                    labelText: 'Password',
                                                                    icon: IconButton(
                                                                      icon: Image.asset('assets/images/lock-gray.png'), onPressed: () {  },
                                                                    ),
                                                                    suffixIcon: GestureDetector(
                                                                      onLongPress: () {
                                                                        setState(() {
                                                                          _regpasswordVisible = true;
                                                                        });
                                                                      },
                                                                      onLongPressUp: () {
                                                                        setState(() {
                                                                          _regpasswordVisible = false;
                                                                        });
                                                                      },
                                                                      child: Icon(
                                                                          _regpasswordVisible ? Icons.visibility : Icons.visibility_off
                                                                      ),
                                                                    )
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                    ),
                                                    Container(
                                                      height: 10.sp,
                                                    ),
                                                    Container(
                                                      margin:  EdgeInsets.only(left: 20.sp, right: 20.sp),

                                                      child: Row(

                                                        children: [
                                                          Container(
                                                            height: 25.sp,
                                                            width: 25.sp,
                                                            child: RoundCheckBox(
                                                              onTap: (selected) {
                                                                print(selected);
                                                                selectedbox=selected! ;
                                                                //hideWidget();
                                                              },

                                                              // isChecked: roundcheckboxselection,
                                                              animationDuration: Duration(
                                                                milliseconds: 50,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 10.sp,
                                                            height: 10.sp,
                                                          ),
                                                          Text(
                                                            "I am agree with privacy policy,terms and conditions.",
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 15.sp
                                                            ),

                                                          ),


                                                        ],
                                                      ),
                                                    ),
                                                    Visibility(
                                                      visible: viewVisible,
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            checkvalue,
                                                            textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color:  Color(0xFFFF4500),
                                                                fontSize: 14.sp
                                                            ),

                                                          ),
                                                        ],

                                                      ),
                                                    ),
                                                    Container(
                                                      height: 10.sp,

                                                    ),
                                                    Container(
                                                      child: ButtonTheme(
                                                        minWidth: 158.sp,
                                                        height: 56.sp,
                                                        shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(40.sp),
                                                        ),
                                                        child: RaisedButton(

                                                          onPressed: () async {
                                                            if (_regformKey.currentState!.validate()) {

                                                              if(selectedbox==true){
                                                                hideWidget();
                                                                try {
                                                                  Getreguserresponse resp=
                                                                  await context.read(apiClientProvider).createUser(
                                                                      Reguser(
                                                                          regnameController.text, "","",regemailController.text,regphnoController.text,regpasswordController.text,"1"
                                                                      )
                                                                  );


                                                                  /* print( User(
                                                                    "abc@gmail.com",
                                                                    "123456"
                                                                ));*/
                                                                  print("Regions: ${resp.data.toJson()}");
                                                                  showregsucesswidget();
                                                                  /*ScaffoldMessenger.of(context).showSnackBar(
                                                                    SnackBar(content: Text("Your registration is successfull.Please login with your credentials")),
                                                                  );*/
                                                                  clearregtext();
                                                                  hideerrorWidget();
                                                                  hidewidget();
                                                                } catch (e) {
                                                                  print(e);
                                                                  if (e is DioError) {

                                                                    showidget();
                                                                    clearregtext();
                                                                    hideregsucesswidget();
                                                                    /*ScaffoldMessenger.of(context).showSnackBar(
                                                                      SnackBar(content: Text('Email/Phone is already exists')),
                                                                    );*/

                                                                    //handle DioError here by error type or by error code

                                                                  } else {

                                                                  }

                                                                }
                                                              }
                                                              else if(selectedbox==false){
                                                                print(selectedbox);
                                                                showWidget();
                                                                checkvalue="Please check I am agree with privacy policy,terms and conditions.";

                                                              }

                                                              // If the form is valid, display a snackbar. In the real world,
                                                              // you'd often call a server or save the information in a database.



                                                            }
                                                          },

                                                          color: Color(0xFF29AAE1),
                                                          child: Text("Sign Up",
                                                            style: TextStyle(
                                                              color: Colors.white,

                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 10.sp,
                                                    ),
                                                    Visibility(
                                                      visible: viewreg,
                                                      child: Text("Email/Phone/Username is already exists",
                                                        style: TextStyle(
                                                          color:  Color(0xFFFF4500),

                                                        ),
                                                      ),
                                                    ),
                                                     Visibility(
                                                      visible: viewregsucess,
                                                      child: Text("Your registration is successfull.Please login with your creadentials.",
                                                        style: TextStyle(
                                                          color: Colors.white,

                                                        ),
                                                      ),
                                                    ),


                                                  ],

                                                ),
                                              ),
                                            ),

                                          ),
                                        ),




                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "Dont have an account?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xFF28ABE3),
                                                fontSize: 15.sp
                                            ),
                                          ),

                                        ),
                                        Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(
                                            "Sign up or login using other account",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xFFE6EAED),
                                                fontSize: 15.sp
                                            ),
                                          ),

                                        ),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(

                                              child: IconButton(
                                                icon: Image.asset('images/google.png'),
                                                onPressed: () {  },
                                              ),
                                            )

                                        ),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(

                                              child: IconButton(
                                                icon: Image.asset('images/facebook.png'),
                                                onPressed: () {  },
                                              ),
                                            )

                                        ),
                                        Align(
                                            alignment: Alignment.bottomCenter,
                                            child: SizedBox(

                                              child: IconButton(
                                                icon: Image.asset('images/twitter.png'),
                                                onPressed: () {  },
                                              ),
                                            )

                                        ),
                                      ],
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

}