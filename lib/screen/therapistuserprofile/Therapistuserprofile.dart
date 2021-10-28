import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Therapistuserprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TherapistuserprofileState();
  }
  
}
class TherapistuserprofileState extends State<Therapistuserprofile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var radius = Radius.circular(40);
    return ScreenUtilInit(
        builder: () =>
        ResponsiveBuilder(
        builder: (context, sizingInformation) {
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return Scaffold(
           body: Container(
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
                   width: 1202.sp,
                   decoration: BoxDecoration(
                       color: Color(0xFFF1F1F1),
                       borderRadius: BorderRadius.only(
                           bottomLeft: Radius.circular(25.0),
                           bottomRight: Radius.circular(25.0)

                       )
                   ),
                   child: Container(
                     // padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
                         ),



                       ],

                     ),

                   ),


                 ),
                 Container(
                   height: 10.sp,
                 ),
                 Container(
                   padding: EdgeInsets.only(left: 70.sp,right: 70.sp),
                   child: Row(
                     children: [
                       Container(
                         width: 20.sp,
                       ),
                       Container(
                         child: Column(
                           children: [

                             Container(
                               height: 296.sp,
                               width: 252.sp,
                               padding: EdgeInsets.all(10.sp),
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
                                       topRight: Radius.circular(40.sp),
                                        bottomRight: Radius.circular(40.sp),
                                        bottomLeft: Radius.circular(40.sp),
                                       topLeft: Radius.circular(40.sp))
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
                                   width: 172,
                                   height: 22,
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

                           ],
                         ),
                       ),
                       Container(
                         width: 20.sp,
                       ),
                       Container(
                         padding: EdgeInsets.only(left: 20.sp,right: 20.sp),
                         decoration: BoxDecoration(
                             color: Colors.white,
                             border: Border.all(

                                 color: Colors.transparent.withOpacity(1.0)
                             ),
                             borderRadius: BorderRadius.all(Radius.circular(40))
                         ),
                         height: 440.sp,
                         width: 895.sp,
                         child: Column(
                           children: [
                             Container(
                               height: 20.sp,
                             ),

                             Container(
                               height: 20.sp,
                             ),

                             Container(
                               height: 20.sp,
                             ),

                             Container(
                               height: 10.sp,
                             ),


                             Container(
                               height: 10.sp,
                             ),

                             Container(
                               height: 20.sp,
                             ),



                           ],
                         ),

                       )
                     ],
                   ),

                 ),
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