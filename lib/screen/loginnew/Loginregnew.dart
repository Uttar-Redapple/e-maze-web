import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

class Loginregnew extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginregnewState();
  }
  
}
class LoginregnewState extends State<Loginregnew>{
  bool _hasBeenPressedlogin = false;
  bool _hasBeenPressedregister = false;
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
    // TODO: implement build
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
                 image: AssetImage("assets/images/whitepoligon.png"),

                 fit: BoxFit.cover,
               ),
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
                   height: 47.sp,

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
                             textColor: Colors.white,
                           //  color: Colors.green,
                             color: _hasBeenPressedregister ? Colors.white : Colors.green,
                             shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.sp)),
                             onPressed: () {
                               setState(() {
                                 _hasBeenPressedregister = !_hasBeenPressedregister;
                               });
                             },
                             child: Text('Login'),
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
                             textColor: Colors.black,
                            // color: Colors.white,
                             color: _hasBeenPressedregister ? Colors.green : Colors.white,
                            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(40.sp)),
                             onPressed: () {
                               setState(() {
                                 _hasBeenPressedlogin = !_hasBeenPressedlogin;
                               });
                             },
                             child: Text('Registration'),
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
                             alignment: Alignment.topLeft,
                             child: Container(


                               padding: EdgeInsets.all(10.sp),
                               width: 500.sp,
                               height: 350.sp,

                               decoration: BoxDecoration(
                                   gradient: LinearGradient(
                                       begin: Alignment.centerLeft,
                                       end: Alignment.centerRight,
                                       colors: <Color> [
                                         Color(0xFF282842),
                                         Color(0xFF1C3973)




                                       ],
                                       tileMode: TileMode.repeated
                                   ),
                                   border: Border.all(

                                       color: Colors.transparent.withOpacity(1.0)
                                   ),
                                   borderRadius: BorderRadius.all(Radius.circular(40.sp))

                               ),
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
                                           width: 10.sp,
                                           height: 10.sp,
                                         ),
                                         Text(
                                           "Remember me",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               color: Colors.white,
                                               fontSize: 15.sp
                                           ),

                                         ),
                                         Container(
                                           width: 10.sp,
                                           height: 10.sp,
                                           margin:  EdgeInsets.only(left: 80.sp, right: 80.sp),
                                         ),
                                         Text(
                                           "Forgot password",
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

                             child: Container(


                               padding: EdgeInsets.all(10.sp),
                               width: 600.sp,
                               height: 400.sp,

                               decoration: BoxDecoration(
                                   gradient: LinearGradient(
                                       begin: Alignment.centerLeft,
                                       end: Alignment.centerRight,
                                       colors: <Color> [
                                         Color(0xFF263E7A),

                                         Color(0xFF0070A8)



                                       ],
                                       tileMode: TileMode.repeated
                                   ),
                                   /* border: Border.all(

                                            color: Colors.transparent
                                        ),*/
                                   borderRadius: BorderRadius.all(Radius.circular(40.sp))

                               ),
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
                                                     icon: Image.asset('assets/images/username.png'), onPressed: () {  },
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
                                                     icon: Image.asset('assets/images/message.png'), onPressed: () {  },
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
                                                     icon: Image.asset('assets/images/contact.png'), onPressed: () {  },
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
                                                     icon: Image.asset('assets/images/lock.png'), onPressed: () {  },
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