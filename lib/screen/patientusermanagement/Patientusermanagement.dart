import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Patientusermanagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientusermanagementState();
  }

}
class PatientusermanagementState extends State<Patientusermanagement>{
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
                        padding: EdgeInsets.only(left: 30.sp,right: 30.sp),
                        height: MediaQuery
                            .of(context)
                            .size
                            .height,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        decoration: BoxDecoration(
                          gradient:
                          LinearGradient(

                              tileMode: TileMode.repeated,
                              colors: [  Color(0xFF3A3A3A),
                                Color(0xFF8B8B8B),
                                Color(0xFFDBDCDE),
                              ]),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 82.sp,

                              decoration: BoxDecoration(
                                  color: Color(0xFFF1F1F1),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25.0),
                                      bottomRight: Radius.circular(25.0)

                                  )
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10.sp),
                                child: Column(
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "eMazeBrain",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFFF2D5E),
                                              fontSize: 35.sp,
                                              fontWeight: FontWeight.bold,
                                            ),

                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Container(
                                            padding: EdgeInsets.all(10.sp),
                                            width: 192.sp,

                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.white.withOpacity(
                                                      1.0), // red as border color
                                                ),
                                                borderRadius: new BorderRadius.only(
                                                    topLeft: const Radius.circular(
                                                        40.0),
                                                    topRight: const Radius.circular(
                                                        40.0),
                                                    bottomRight: const Radius.circular(
                                                        40.0),
                                                    bottomLeft: const Radius.circular(
                                                        40.0)
                                                )
                                            ),
                                            child: Column(
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    Align(
                                                      alignment: Alignment.center,
                                                      child: SizedBox(

                                                        child: IconButton(
                                                          icon: Image.asset(
                                                              'assets/images/notification.png'),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerRight,
                                                      child: SizedBox(

                                                        child: IconButton(
                                                          icon: Image.asset(
                                                              'assets/images/menu.png'),
                                                          onPressed: () {},
                                                        ),
                                                      ),

                                                    ),
                                                    Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: SizedBox(

                                                        child: IconButton(
                                                          icon: Image.asset(
                                                              'assets/images/communate.png'),
                                                          onPressed: () {},
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 49.sp,
                                                width: 49.sp,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: new Border.all(
                                                    color: Colors.white.withOpacity(
                                                        1.0),
                                                    width: 2.5,
                                                  ),

                                                ),
                                                child: SizedBox(

                                                  child: IconButton(
                                                    icon: Image.asset(
                                                        'assets/images/userprofile.png'),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 20.sp,
                                              ),
                                              Text(
                                                "User's Profile",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),

                                              ),

                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 10.sp,
                            ),
                            Container(

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                      children:[
                                        Container(
                                          padding: EdgeInsets.all(10.sp),
                                          height: 296.sp,
                                          width: 252.sp,
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(


                                                  colors: <Color> [
                                                    Color(0xFF3A3A3A),
                                                    Color(0xFF8B8B8B),
                                                    Color(0xFFDBDCDE),




                                                  ],
                                                  tileMode: TileMode.repeated
                                              ),
                                              border: Border.all(

                                                  color: Colors.transparent.withOpacity(1.0)
                                              ),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20.sp),

                                                  topLeft: Radius.circular(20.sp))
                                            // bottomLeft: Radius.circular(40.sp))

                                          ),
                                          child: ContainedTabBarView(
                                            tabs: [
                                              Text(
                                                'Patient',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(

                                                    fontSize: 10.sp
                                                ),
                                              ),
                                              Text(
                                                'You',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(

                                                    fontSize: 10.sp
                                                ),
                                              ),
                                            ],
                                            tabBarProperties: TabBarProperties(
                                              width: 172.sp,
                                              height: 22.sp,
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
                                                  color: Color(0xFFB24761)
                                              ),
                                              indicatorColor: Colors.transparent,
                                              labelColor: Colors.white,
                                              unselectedLabelColor: Colors.grey[400],
                                            ),
                                            views: [
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 10.sp,
                                                    ),
                                                    Container(
                                                      width: 130.sp,
                                                      height: 130.sp,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                "https://i.imgur.com/BoN9kdC.png"
                                                            ),

                                                          )
                                                      ),
                                                      child:
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          IconButton(
                                                            icon: Image.asset('assets/images/offline.png'), onPressed: () {  },
                                                          )
                                                        ],

                                                      ),

                                                    ),
                                                    Container(
                                                      height: 5.sp,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "New User",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20.sp
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "Therapist",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.sp
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "online",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10.sp
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      height: 10.sp,
                                                    ),
                                                    Container(
                                                      width: 130.sp,
                                                      height: 130.sp,
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            fit: BoxFit.fill,
                                                            image: NetworkImage(
                                                                "https://i.imgur.com/BoN9kdC.png"
                                                            ),

                                                          )
                                                      ),
                                                      child:   Column(
                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                        mainAxisSize: MainAxisSize.max,
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          IconButton(
                                                            icon: Image.asset('assets/images/offline.png'), onPressed: () {  },
                                                          )
                                                        ],

                                                      ),
                                                    ),
                                                    Container(
                                                      height: 5.sp,
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "New User",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20.sp
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "Therapist",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.sp
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      child: Text(
                                                        "Online",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 10.sp
                                                        ),
                                                      ),
                                                    ),



                                                  ],
                                                ),

                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 50.sp,
                                          width: 252.sp,
                                          decoration:  BoxDecoration(

                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: <Color> [
                                                    Color(0xFF8D023B),
                                                    Color(0xFFFF2F6D)




                                                  ],
                                                  tileMode: TileMode.repeated
                                              )
                                          ),
                                          child:  Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Add a new patient",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 15.sp,
                                                        fontWeight: FontWeight.bold,
                                                      ),

                                                    ),
                                                  ),
                                                  Align(
                                                      alignment: Alignment.centerLeft,
                                                      child: IconButton(
                                                        icon: Image.asset('assets/images/search.png'), onPressed: () {  },
                                                      )
                                                  ),
                                                ],
                                              )
                                            ],
                                          ) ,
                                        ),
                                        Container(
                                          height: 10.sp,
                                        ),
                                        ButtonTheme(
                                          height: 80.sp,
                                          minWidth: 252.sp,
                                          shape: new RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(40.sp),
                                          ),
                                          child: ButtonBar(

                                            alignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              DecoratedBox(

                                                decoration: BoxDecoration(

                                                    borderRadius: BorderRadius.only(
                                                        topRight: Radius.circular(20.sp),
                                                        bottomRight: Radius.circular(20.sp),
                                                        topLeft: Radius.circular(20.sp),
                                                        bottomLeft: Radius.circular(20.sp)),
                                                    gradient:
                                                    LinearGradient(

                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                        colors: [ Color(0xFFFFE72E),
                                                          Color(0xFFF08800),
                                                        ],
                                                        tileMode: TileMode.repeated)

                                                ),
                                                child: ConstrainedBox(
                                                  constraints: BoxConstraints.tightFor(width: 252.sp, height: 80.sp),
                                                  child: ElevatedButton.icon(
                                                    icon: IconButton(
                                                      icon: Image.asset('assets/images/refresh.png'), onPressed: () {  },
                                                    ),

                                                    onPressed: () {

                                                    },
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                        RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                        ),
                                                      ),

                                                      // fixedSize: Size(426.sp, 149.sp),
                                                      // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                      backgroundColor:
                                                      MaterialStateProperty.all(Colors.transparent),
                                                      // elevation: MaterialStateProperty.all(3),
                                                      shadowColor:
                                                      MaterialStateProperty.all(Colors.transparent),
                                                    ),
                                                    /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                    label: Text("Update Certificate",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.sp

                                                      ),
                                                    ),

                                                  ),
                                                ),
                                              )
                                            ],

                                          ),
                                        ),
                                      ]
                                  ),
                                  Container(
                                    width: 30.sp,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 400.sp,
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(

                                              color: Colors.transparent.withOpacity(1.0)
                                          ),
                                          borderRadius: BorderRadius.all(Radius.circular(20))
                                      ),

                                     child: ContainedTabBarView(
                                       tabs: [
                                         Text(
                                           'User',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20.sp
                                           ),
                                         ),
                                         Text(
                                           'Compilance',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20.sp
                                           ),
                                         ),
                                         Text(
                                           'Performance',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20.sp
                                           ),
                                         ),
                                         Text(
                                           'Trend',
                                           textAlign: TextAlign.center,
                                           style: TextStyle(
                                               fontWeight: FontWeight.bold,
                                               fontSize: 20.sp
                                           ),
                                         ),
                                       ],
                                       tabBarProperties: TabBarProperties(
                                         width: 2500.sp,
                                         height: 22.sp,
                                         background: Container(
                                              color: Colors.transparent,
                                         ),


                                         indicatorColor: Colors.transparent,
                                         labelColor: Colors.black,
                                         unselectedLabelColor: Colors.grey[400],
                                       ),
                                       views: [
                                         Container(
                                           color: Colors.transparent,
                                           child: ListView(
                                             padding:  EdgeInsets.all(10),
                                             children: [
                                               Container(

                                                 height: 100,
                                                 color: Colors.transparent,
                                                 child: Row(
                                                   children: [
                                                     Container(
                                                       width: 60.sp,
                                                     ),
                                                     Container(
                                                       margin: EdgeInsets.all(20),
                                                       width: 80,
                                                       height: 80,
                                                       decoration: BoxDecoration(
                                                           shape: BoxShape.circle,
                                                           image: DecorationImage(
                                                             fit: BoxFit.fill,
                                                             image: NetworkImage(
                                                                 "https://i.imgur.com/BoN9kdC.png"
                                                             ),

                                                           )
                                                       ),

                                                     ),
                                                     Container(
                                                       width: 20.sp,
                                                     ),
                                                     Container(
                                                      child: Text(
                                                        "arkadip ghosal",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20.sp
                                                        ),
                                                      ),
                                                     ),
                                                     Container(
                                                       width: 20.sp,
                                                     ),
                                                     Container(
                                                       width: 40.sp,
                                                       height: 40.sp,
                                                       child:  IconButton(
                                                         icon: Image.asset('assets/images/tick.png'), onPressed: () {  },
                                                       )
                                                     ),
                                                     Container(
                                                       width: 70.sp,
                                                     ),
                                                     Container(
                                                         width: 40.sp,
                                                         height: 40.sp,
                                                         child:  IconButton(
                                                           icon: Image.asset('assets/images/performance.png'), onPressed: () {  },
                                                         )
                                                     ),
                                                     Container(
                                                         width: 40.sp,
                                                         height: 40.sp,
                                                         child:  IconButton(
                                                           icon: Image.asset('assets/images/up.png'), onPressed: () {  },
                                                         )
                                                     ),
                                                     Container(
                                                       width: 20.sp,
                                                     ),
                                                     Container(
                                                       child: Text(
                                                         "+2% 78%",
                                                         textAlign: TextAlign.center,
                                                         style: TextStyle(
                                                             color: Color(0xFF00FF00),
                                                             fontSize: 20.sp
                                                         ),
                                                       ),
                                                     ),
                                                     Container(
                                                       width: 40.sp,
                                                     ),
                                                     Container(
                                                         width: 40.sp,
                                                         height: 40.sp,
                                                         child:  IconButton(
                                                           icon: Image.asset('assets/images/smiley.png'), onPressed: () {  },
                                                         )
                                                     ),
                                                     Container(
                                                       width: 60.sp,
                                                     ),
                                                     ButtonBar(

                                                       alignment: MainAxisAlignment.spaceAround,
                                                       children: [
                                                         DecoratedBox(

                                                           decoration: BoxDecoration(

                                                               borderRadius: BorderRadius.only(
                                                                   topRight: Radius.circular(20.sp),
                                                                   bottomRight: Radius.circular(20.sp),
                                                                   topLeft: Radius.circular(20.sp),
                                                                   bottomLeft: Radius.circular(20.sp)),
                                                               gradient:
                                                               LinearGradient(

                                                                   begin: Alignment.centerLeft,
                                                                   end: Alignment.centerRight,
                                                                   colors: [  Color(0xFF29E166),
                                                                     Color(0xFF11AD4A),
                                                                   ],
                                                                   tileMode: TileMode.repeated)

                                                           ),
                                                           child: ConstrainedBox(
                                                             constraints: BoxConstraints.tightFor(width: 200.sp, height: 46.sp),
                                                             child: ElevatedButton.icon(
                                                               icon: IconButton(
                                                                 icon: Image.asset('assets/images/edit.png'), onPressed: () {  },
                                                                 color: Colors.white,
                                                               ),

                                                               onPressed: () {

                                                               },
                                                               style: ButtonStyle(
                                                                 shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                                                   RoundedRectangleBorder(
                                                                     borderRadius: BorderRadius.circular(20.0),
                                                                   ),
                                                                 ),

                                                                 // fixedSize: Size(426.sp, 149.sp),
                                                                 // minimumSize: MaterialStateProperty.all(Size(width, 50)),
                                                                 backgroundColor:
                                                                 MaterialStateProperty.all(Colors.transparent),
                                                                 // elevation: MaterialStateProperty.all(3),
                                                                 shadowColor:
                                                                 MaterialStateProperty.all(Colors.transparent),
                                                               ),
                                                               /*  style: ElevatedButton.styleFrom(
                                      primary:  Colors.transparent,

                                      fixedSize: Size(426.sp, 149.sp),




                                    ),*/


                                                               label: Text("Edit",
                                                                 style: TextStyle(
                                                                     color: Colors.white,
                                                                     fontSize: 16.sp

                                                                 ),
                                                               ),

                                                             ),
                                                           ),
                                                         )
                                                       ],

                                                     ),

                                                   ],
                                                 ),
                                               ),

                                             ],
                                           ),
                                         ),
                                         Container(
                                           color: Colors.red,
                                         ),
                                         Container(
                                           color: Colors.green,
                                         ),
                                         Container(
                                           color: Colors.yellow,
                                         ),
                                       ],
                                     ),

                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 50.sp,
                            ),
                            Container(
                              height: 95.sp,

                              decoration:  BoxDecoration(

                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: <Color> [
                                        Color(0xFF414141),
                                        Color(0xFFBABABA)




                                      ],
                                      tileMode: TileMode.repeated
                                  )
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset('assets/images/warining.png'), onPressed: () {  },
                                  ),
                                  Container(
                                    width: 10.sp,
                                  ),
                                  Text(
                                    "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp
                                    ),

                                  ),
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