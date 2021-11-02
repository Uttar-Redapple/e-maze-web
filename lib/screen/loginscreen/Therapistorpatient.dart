import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Therapistorpatient extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TherapistorpatientState();
  }

}
class TherapistorpatientState extends State<Therapistorpatient>{
  @override
  Widget build(BuildContext context) {
    bool _visible = true;
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
                  Color(0xFF000002),
                  Color(0xFF0079AE)



                ],
                tileMode: TileMode.repeated
            ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: AnimatedOpacity(
              opacity: _visible ? 0 : 1,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 1000),
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.sp),
                  side: BorderSide(
                    color: Color(0xFFF1F1F1),
                    width: 1.sp,
                  ),
                ),
                child: Container(
                  height: 276.sp,
                  width: 1062.sp,
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
                                    constraints: BoxConstraints.tightFor(width: 426, height: 149),
                                    child: ElevatedButton(


                                      onPressed: () {  },
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


                                      child: Text("I would like to optimize"
                                          " my brain function",
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
                                    constraints: BoxConstraints.tightFor(width: 426, height: 149),
                                    child: ElevatedButton(

                                      onPressed: () {  },

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


                                      child: Text("I am certified therapist",
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
                      ]



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