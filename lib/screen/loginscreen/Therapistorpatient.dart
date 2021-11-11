import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Therapistorpatient extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TherapistorpatientState();
  }

}
class TherapistorpatientState extends State<Therapistorpatient> with TickerProviderStateMixin{
  bool _visible = false;
  late AnimationController animation;
  late Animation<double> _fadeInFadeOut;
  double widget1Opacity = 0.0;
  final _controller = FadeInController();
  @override
  void initState() {
    super.initState();
    _controller.fadeIn();

    //when this route starts, it will execute this code
    Future.delayed(const Duration(seconds: 3), () { //asynchronous delay
      if (this.mounted) { //checks if widget is still active and not disposed
        setState(() {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            setState(() {
              _visible=true;
              widget1Opacity = 1.0;

            });
          });//tells the widget builder to rebuild again because ui has updated

       //   widget1Opacity = 1;//update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }
  /*@override
  void initState() {
    super.initState();
    animation = AnimationController(vsync: this, duration: Duration(seconds: 10),);
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 0.5).animate(animation);

    animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        animation.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        animation.forward();
      }
    });
    animation.forward();
  }*/
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      builder: () => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/whitepoligon.png"),

            fit: BoxFit.cover,
          ),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color> [
                  Color(0xFF000120),
                  Color(0xFF0078ad)



                ],
                tileMode: TileMode.repeated
            ),
        ),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(100),

              child: AnimatedOpacity(
                opacity:widget1Opacity,
                duration:  Duration(milliseconds: 500),
                child: Visibility(
                  /*opacity: _visible ? 1.0 : 0.0,
                  duration:  Duration(milliseconds: 500),*/
                    //curve: Curves.easeInOut,

                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,

                  child: Card(

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.sp),
                      side: BorderSide(
                        color: Color(0xFFF1F1F1),
                        width: 1.sp,
                      ),
                    ),
                    child: Container(
                      height: 200.sp,
                      width: 600.sp,
                      child: Row(

                          children: <Widget>[
                            Expanded(
                              child: ButtonTheme(

                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40.sp),
                                ),
                                child: ButtonBar(

                                  alignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    DecoratedBox(

                                      decoration: BoxDecoration(

                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40.sp),
                                              bottomRight: Radius.circular(40.sp),
                                              topLeft: Radius.circular(40.sp),
                                              bottomLeft: Radius.circular(40.sp)),
                                          gradient:
                                          LinearGradient(

                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: <Color> [
                                                Color(0xFF29E166),
                                                Color(0xFF11AD4A)


                                              ],
                                              tileMode: TileMode.repeated)

                                      ),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints.tightFor( width: 230, height: 100),
                                        child: ElevatedButton(


                                          onPressed: () {
                                            Navigator.pushNamed(context, 'patient/loginregistration');
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


                                          child: Text("Patient",
                                            style: TextStyle(
                                                color: Colors.white,
                                              fontSize: 20.sp

                                            ),
                                          ),

                                        ),
                                      ),
                                    )
                                  ],

                                ),
                              ),
                            ),
                            Expanded(
                              child: ButtonTheme(
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(40.sp),
                                ),
                                height: 149.sp,
                                minWidth: 426.sp,
                                child: ButtonBar(
                                  alignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    DecoratedBox(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(40.sp),
                                              bottomRight: Radius.circular(40.sp),
                                              topLeft: Radius.circular(40.sp),
                                              bottomLeft: Radius.circular(40.sp)),
                                          gradient:
                                          LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,

                                              colors: <Color> [
                                                Color(0xFFFFE72E),
                                                Color(0xFFF08800)


                                              ],
                                              tileMode: TileMode.repeated)
                                      ),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints.tightFor( width: 230, height: 100),
                                        child: ElevatedButton(

                                          onPressed: () {
                                            Navigator.pushNamed(context, 'therapist/loginregistration');
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


                                          child: Text("Therapist",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20.sp

                                            ),
                                          ),

                                        ),
                                      ),
                                    )
                                  ],

                                ),
                              ),
                            ),
                          ]



                      ),
                    ),
                  ),
                ),
              ),
          ),
        ),
      ),

    );
  }



}