import 'package:emaze_brain/screen/gamestartscreen/Gamestartscreen.dart';
import 'package:emaze_brain/screen/loginscreen/Therapistorpatient.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:roundcheckbox/roundcheckbox.dart';


class Loginregistration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginregistrationState();
  }

}
class LoginregistrationState extends State<Loginregistration> with TickerProviderStateMixin{
  late TabController _tabController;
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;

  late String _password;
  late bool _passwordVisible;
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
    _tabController = TabController(length: 2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(40);
    return ScreenUtilInit(
      builder: () => DefaultTabController(
        length: 2,
        child: Scaffold(
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
                children:<Widget> [
                  Container(
                    padding: EdgeInsets.only(top: 16.sp),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:<Widget> [
                            Text(
                                'eMazeBrain',
                                style: TextStyle(
                                  fontSize: 35.sp,

                                  color: Colors.white,
                                )
                            ),
                          ],
                        ),
                        Container(



                          height: 500.sp,
                          width: 1000.sp,
                          child: ContainedTabBarView(
                            tabs: [
                              Text('Login'),
                              Text('Registration'),
                            ],


                            tabBarProperties: TabBarProperties(
                              width: 1000.sp,
                              height: 47.sp,
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
                                  color: Colors.greenAccent
                              ),
                              indicatorColor: Colors.transparent,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey[400],
                            ),
                            views: [
                              Container(


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

                                          height: 140.sp,
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
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => Gamestartscreen()),
                                                );
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

















                              Container(


                                padding: EdgeInsets.all(20.sp),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(


                                    padding: EdgeInsets.all(10.sp),
                                    width: 500.sp,
                                    height: 900.sp,

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
                                             controller: nameController,
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
                                             controller: nameController,

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
                                             controller: nameController,
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

                                             obscureText: !_passwordVisible,
                                             controller: passwordController,
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


                            ],
                            onChange: (index) => print(index),
                          ),


                          ),

                      ],
                    ),

                  ),
                  Center(
                    child: Container(
                      margin:  EdgeInsets.only(left: 500.sp, right: 400.sp),
                      child: Column(
                        children: [
                          Row(
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
                                child: IconButton(
                                  icon: Image.asset('images/google.png'),
                                  onPressed: () {  },
                                )

                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: IconButton(
                                    icon: Image.asset('images/facebook.png'),
                                    onPressed: () {  },
                                  )

                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: IconButton(
                                    icon: Image.asset('images/twitter.png'),
                                    onPressed: () {  },
                                  )

                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

}