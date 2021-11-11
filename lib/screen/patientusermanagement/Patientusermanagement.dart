import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:emaze_brain/screen/patientgeneralpreferance/Patientgeneralpreference.dart';
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
                          image: DecorationImage(
                            image: AssetImage("assets/images/whitepoligon.png"),

                            fit: BoxFit.cover,
                          ),
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
                              height: 110.sp,

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
                                            padding: EdgeInsets.all(25.sp),
                                            width: 250.sp,

                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage("assets/images/assertss.png"),

                                                fit: BoxFit.cover,
                                              ),
                                               /* border: Border.all(
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
                                                )*/
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
                                                          onPressed: () {
                                                            showPopupMenu();
                                                          },
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
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/assets.png"),

                                                    fit: BoxFit.cover,
                                                  ),
                                                 /* border: new Border.all(
                                                    color: Colors.white.withOpacity(
                                                        1.0),
                                                    width: 2.5,
                                                  ),*/

                                                ),
                                                child: SizedBox(

                                                  child: IconButton(
                                                    icon: Image.asset(
                                                        'assets/images/Group111.png'),
                                                    onPressed: () {},
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 20.sp,
                                              ),
                                              Text(
                                                "PATIENTS USER MANAGEMENT",
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
                                          padding: EdgeInsets.only(top: 10.sp,bottom: 10.sp),
                                          height: 320.sp,
                                          width: 252.sp,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                             /* gradient: LinearGradient(


                                                  colors: <Color> [
                                                    Color(0xFF3A3A3A),
                                                    Color(0xFF8B8B8B),
                                                    Color(0xFFDBDCDE),




                                                  ],
                                                  tileMode: TileMode.repeated
                                              ),*/
                                              border: Border.all(

                                                  color: Color(0xFF868686)
                                              ),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20.sp),
                                                   bottomLeft: Radius.circular(20.sp),
                                                  bottomRight: Radius.circular(20.sp),
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
                                              height: 15.sp,
                                              background: Container(
                                                width: 172.sp,
                                                height: 30.sp,
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
                                                    Container(
                                                      height: 10.sp,
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
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.pushNamed(context, "therapist/addnewpatient");
                                                                  },
                                                                  child: Text(
                                                                    "+ Add a new patient",
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 15.sp,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),

                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: IconButton(
                                                                    icon: Image.asset('assets/images/addpersonwhite.png'), onPressed: () {  },
                                                                  )
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ) ,
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
                                                    Container(
                                                      height: 10.sp,
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
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    Navigator.pushNamed(context, "therapist/addnewpatient");
                                                                  },
                                                                  child: Text(
                                                                    "+ Add a new patient",
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      fontSize: 15.sp,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),

                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                  alignment: Alignment.centerLeft,
                                                                  child: IconButton(
                                                                    icon: Image.asset('assets/images/addpersonwhite.png'), onPressed: () {  },
                                                                  )
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ) ,
                                                    ),

                                                  ],
                                                ),

                                              )
                                            ],
                                          ),
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
                                                        colors: [ Color(0xFFf15e26),
                                                          Color(0xFFf89f37),
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
                                        color: Color(0xFFF1F1F1),
                                          boxShadow: [
                                            //background color of box
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 25.0, // soften the shadow
                                              spreadRadius: 5.0, //extend the shadow
                                              offset: Offset(
                                                15.0, // Move to right 10  horizontally
                                                15.0, // Move to bottom 10 Vertically
                                              ),
                                            )
                                          ],
                                          border: Border.all(

                                              color: Colors.white.withOpacity(1.0)
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
                                         height: 30.sp,
                                         background: Container(
                                              color: Colors.transparent,
                                         ),


                                         indicatorColor: Colors.black,
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
                                                               boxShadow: [
                                                                 BoxShadow(
                                                                   color: Colors.grey.withOpacity(0.5),
                                                                   spreadRadius: 5,
                                                                   blurRadius: 7,
                                                                   offset: Offset(0, 3), // changes position of shadow
                                                                 ),
                                                               ],

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
                                                             constraints: BoxConstraints.tightFor(width: 160.sp, height: 46.sp),
                                                             child: ElevatedButton.icon(
                                                               icon: IconButton(
                                                                 icon: Image.asset('assets/images/edit.png'), onPressed: () {  },
                                                                 color: Colors.white,
                                                               ),

                                                               onPressed: () {
                                                                // Navigator.pushNamed(context, 'patient/generalpreference');

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
                                    icon: Image.asset('assets/images/tip.png'), onPressed: () {  },
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

  void showPopupMenu() {
    showMenu<String>(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0))
      ),
      position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),  //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 30.sp,
                    width: 30.sp,
                    /*child: IconButton(
                       icon: Image.asset('assets/images/profile.png'), onPressed: () {

                     },

                     ),*/
                  ),
                  Text(
                    "SETTING",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),
                  SizedBox(
                    height: 20.sp,
                    width: 20.sp,
                    /*child: IconButton(
                      icon: Image.asset('assets/images/profile.png'), onPressed: () {

                    },

                    ),*/
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40.sp,
                      width: 40.sp,
                      child: IconButton(
                        icon: Image.asset('assets/images/profile.png'), onPressed: () {

                      },

                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
        const PopupMenuDivider(),
        PopupMenuItem<String>(
            child:   Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/username.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'therapist/profile');
                    },
                    child: Text(
                      "PROFILE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,


                      ),

                    ),
                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/reminder.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "REMINDERS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/payment.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "PAYMENT METHOD",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/username.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "REPORTS",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/share.png'), onPressed: () {

                    },

                    ),
                  ),
                  Text(
                    "SHARE",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,


                    ),

                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/generalperef.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'therapist/generalpreference');
                    },
                    child: Text(
                      "GENERAL PREFERENCE",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,


                      ),

                    ),
                  ),

                ],
              ),
            )
        ),
        PopupMenuItem<String>(
            child:  Container(
              child: Row(
                children: [
                  SizedBox(
                    height: 40.sp,
                    width: 40.sp,
                    child: IconButton(
                      icon: Image.asset('assets/images/logous.png'), onPressed: () {

                    },

                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      "LOG OUT",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,


                      ),

                    ),
                  ),

                ],
              ),
            )
        ),


      ],
      elevation: 8.0,

    );



  }

}