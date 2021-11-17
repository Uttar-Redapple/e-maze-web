import 'package:emaze_brain/screen/gamestartscreen/Gamestartscreen.dart';
import 'package:emaze_brain/screen/loginscreen/Therapistorpatient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roundcheckbox/roundcheckbox.dart';


class Loginregistration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginregistrationState();
  }

}
class LoginregistrationState extends State<Loginregistration> with TickerProviderStateMixin{
  bool _hasBeenPressedlogin = false;
  bool _hasBeenPressedregister = false;
  double _width = 600.sp;
  double _height = 450.sp;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(40.sp);

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
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
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
                              height: 47.sp,
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
                                      height: 47.sp,

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
                                            _regborderRadius =
                                                BorderRadius.circular(50.sp);
                                            _borderRadius =
                                                BorderRadius.circular(50.sp);
                                            _hasBeenPressedregister = !_hasBeenPressedregister;
                                          });
                                        },
                                        child: Text(
                                            'LOGIN',
                                            style:  TextStyle(fontWeight: FontWeight.bold)
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: 47.sp,

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
                                            _hasBeenPressedlogin = !_hasBeenPressedlogin;
                                          });
                                        },
                                        child: Text(
                                            'REGISTER',
                                            style:  TextStyle(fontWeight: FontWeight.bold)
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
                                                      controller: nameController,
                                                      decoration: InputDecoration(
                                                        border: UnderlineInputBorder(),
                                                        labelText: 'User Name',
                                                      ),
                                                    ),
                                                    TextFormField(

                                                      obscureText: !_passwordVisible,
                                                      controller: passwordController,
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
                                                    onPressed: () {
                                                      Navigator.pushNamed(context, 'therapist/verifycertificates');
                                                    },

                                                    color: Color(0xFF29AAE1),
                                                    child: Text("Sign In",
                                                      style: TextStyle(
                                                        color: Colors.white,

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
                                                        height: 40.sp,
                                                        width: 500.sp,
                                                        child: TextFormField(
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
                                                        height: 40.sp,
                                                        width: 500.sp,
                                                        child: TextFormField(
                                                          controller: regemailController,

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
                                                        height: 40.sp,
                                                        width: 500.sp,
                                                        child: TextFormField(
                                                          controller: regphnoController,
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
                                                        height: 40.sp,
                                                        width: 500.sp,
                                                        child: TextFormField(

                                                          obscureText: !_regpasswordVisible,
                                                          controller: regpasswordController,
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
                                                        onTap: (selected) {},

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
                                                      "I am agree with privacu policy,terms and conditions.",
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
                                                child: ButtonTheme(
                                                  minWidth: 158.sp,
                                                  height: 56.sp,
                                                  shape: new RoundedRectangleBorder(
                                                    borderRadius: new BorderRadius.circular(40.sp),
                                                  ),
                                                  child: RaisedButton(
                                                    onPressed: () {  },

                                                    color: Color(0xFF29AAE1),
                                                    child: Text("Sign Up",
                                                      style: TextStyle(
                                                        color: Colors.white,

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