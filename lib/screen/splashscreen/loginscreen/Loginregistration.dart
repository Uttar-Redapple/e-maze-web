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
                  colors: [ Color(0xFF000000),
                    Color(0xFF01002A),
                    Color(0xFF007CB0)]),
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
                              width: 1000,
                              height: 47,
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


                                padding: EdgeInsets.all(20.0),
                               child: Center(
                                 child: Container(


                                   padding: EdgeInsets.all(10.0),
                                   width: 500.sp,
                                   height: 500.sp,

                                   decoration: BoxDecoration(
                                     border: Border.all(
                                       color: Colors.transparent
                                     ),
                                       borderRadius: BorderRadius.all(Radius.circular(40))

                                   ),
                                   child: Column(
                                      children:<Widget>[
                                        Row(

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
                                        Container(
                                          height: 10.sp,

                                        ),
                                        Container(
                                           height: 140.sp,
                                          width: 800.sp,
                                          padding: EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(

                                              color: Colors.white,
                                              border: Border.all(color: Colors.white),
                                              borderRadius: BorderRadius.all(Radius.circular(10))
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
                                          margin: const EdgeInsets.only(left: 5.0, right: 5.0),

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
                                                margin: const EdgeInsets.only(left: 110.0, right: 110.0),
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
                                          child: ElevatedButton(
                                            onPressed: () {  },

                                            style: ElevatedButton.styleFrom(
                                              primary:  Color(0xFF29AAE1),
                                              fixedSize: Size(158.sp, 56.sp),


                                            ),
                                            child: Text("Sign In",
                                              style: TextStyle(
                                                color: Colors.white,

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


                                padding: EdgeInsets.all(20.0),
                                child: Center(
                                  child: Container(

                                    padding: EdgeInsets.all(10.0),
                                    width: 800.sp,
                                    height: 500.sp,
                                    decoration: BoxDecoration(

                                        color: Color(0xFF007CB0),
                                        border: Border.all(color: Color(0xFF007CB0)),
                                        borderRadius: BorderRadius.all(Radius.circular(20))

                                      /* border: Border.all(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(40))*/
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
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
                                ),




                              ),


                            ],
                            onChange: (index) => print(index),
                          ),


                          ),

                      ],
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