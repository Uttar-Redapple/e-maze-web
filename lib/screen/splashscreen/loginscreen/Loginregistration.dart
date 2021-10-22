import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Loginregistration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginregistrationState();
  }

}
class LoginregistrationState extends State<Loginregistration> with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
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

                decoration: BoxDecoration(

                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(40))

                   /* border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(40))*/
                ),
                height: 47.sp,
                width: 1000.sp,
                child: Row(

                   children: [

                     Expanded(
                       flex: 2,
                       child: TabBar(
                         controller: _tabController,
                         tabs:  [
                           Tab(
                               child: Text(
                                   'Login',
                           style: TextStyle(
                           color: Colors.white,
                           fontSize: 35.sp
                       ),
                               )
                           ),
                           Tab(
                               child: Text(
                                   'Register')
                           ),

                         ],
                           indicator: ShapeDecoration(
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: radius,
                                   topLeft: radius,bottomLeft: radius,bottomRight: radius)),
                               color: Colors.greenAccent
                           ),
                       ),
                     ),

                   ],
                ),

              )
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