import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_switch/flutter_switch.dart';
class Patientprofile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientprofileState();
  }

}
class PatientprofileState extends State<Patientprofile>{
  bool status = false;
  bool viewfirstname = false ;
  bool viewlastname = false ;
  bool viewemail = false ;
  bool viewphno = false ;
  bool viewbirth = false ;
  bool viewgender = false ;
  bool viewlanguage = false ;


  bool viewfirstnametext = true ;
  bool viewlastnametext = true ;
  bool viewemailtext = true ;
  bool viewphnotext = true ;
  bool viewbirthtext = true ;
  bool viewgendertext = true ;
  bool viewlanguagetext = true ;


  void showfirstnametextwidget(){
    setState(() {
      viewfirstnametext = true ;

    });
  }

  void hidefirstnametextwidget(){
    setState(() {
      viewfirstnametext = false ;
    });
  }

  void showlastnametextwidget(){
    setState(() {
      viewlastnametext = true ;

    });
  }

  void hidelastnametextwidget(){
    setState(() {
      viewlastnametext = false ;
    });
  }

  void showemailtextwidget(){
    setState(() {
      viewemailtext = true ;

    });
  }

  void hideemailtextwidget(){
    setState(() {
      viewemailtext = false ;
    });
  }


  void showphtextwidget(){
    setState(() {
      viewphnotext = true ;

    });
  }

  void hidephtextwidget(){
    setState(() {
      viewphnotext = false ;
    });
  }

  void showbirthtextwidget(){
    setState(() {
      viewbirthtext = true ;

    });
  }

  void hidebirthtextwidget(){
    setState(() {
      viewbirthtext = false ;
    });
  }

  void showgendertextwidget(){
    setState(() {
      viewgendertext = true ;

    });
  }

  void hidegendertextwidget(){
    setState(() {
      viewgendertext = false ;
    });
  }

  void showlanguagetextwidget(){
    setState(() {
      viewlanguagetext = true ;

    });
  }

  void hidelanguagetextwidget(){
    setState(() {
      viewlanguagetext = false ;
    });
  }

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phnoController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController languageController = TextEditingController();
  TextEditingController birthController = TextEditingController();

  void clearprofiletext(){
    firstnameController.clear();
    lastnameController.clear();
    emailController.clear();
    phnoController.clear();
    genderController.clear();
    languageController.clear();
    birthController.clear();
  }
  void showfirstnamewidget(){
    setState(() {
      viewfirstname = true ;

    });
  }

  void hidefirstnamewidget(){
    setState(() {
      viewfirstname = false ;
    });
  }

  void showlastnamewidget(){
    setState(() {
      viewlastname = true ;

    });
  }

  void hidelastnamewidget(){
    setState(() {
      viewlastname = false ;
    });
  }
  void showemailwidget(){
    setState(() {
      viewemail = true ;

    });
  }

  void hideemailwidget(){
    setState(() {
      viewemail = false ;
    });
  }

  void showphwidget(){
    setState(() {
      viewphno = true ;

    });
  }

  void hidephwidget(){
    setState(() {
      viewphno = false ;
    });
  }

  void showbirthwidget(){
    setState(() {
      viewbirth = true ;

    });
  }

  void hidebirthwidget(){
    setState(() {
      viewbirth = false ;
    });
  }

  void showgenderwidget(){
    setState(() {
      viewgender = true ;

    });
  }

  void hidegenderwidget(){
    setState(() {
      viewgender = false ;
    });
  }

  void showlanguagewidget(){
    setState(() {
      viewlanguage = true ;

    });
  }

  void hidelanguagewidget(){
    setState(() {
      viewlanguage = false ;
    });
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
                            image: AssetImage("assets/images/pfondo.png"),

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
                                              color: Color(0xFF29AAE1),
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
                                               /* border: Border.all(
                                                  color: Colors.white.withOpacity(
                                                      1.0), // red as border color
                                                ),*/
                                                image: DecorationImage(
                                                  image: AssetImage("assets/images/assertss.png"),

                                                  fit: BoxFit.cover,
                                                ),
                                               /* boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.white.withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0, 3), // changes position of shadow
                                                  ),
                                                ],*/
                                               /* borderRadius: new BorderRadius.only(
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
                                            child: Container(
                                              padding: EdgeInsets.only(left: 20.sp,right:20.sp),
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
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 60.sp,
                                                width: 60.sp,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/assets.png"),

                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Container(
                                                  padding:  EdgeInsets.all(12.sp),
                                                  height: 18.sp,
                                                  width: 18.sp,
                                                  child: IconButton(

                                                    icon: Image.asset(
                                                        'assets/images/profile.png'),
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
                                              color: Colors.transparent,
                                              /*gradient: LinearGradient(


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
                                                  bottomRight: Radius.circular(20.sp),
                                                  bottomLeft: Radius.circular(20.sp),
                                                  topLeft: Radius.circular(20.sp))
                                            // bottomLeft: Radius.circular(40.sp))

                                          ),
                                          child: ContainedTabBarView(
                                            tabs: [
                                              Container(
                                          decoration: BoxDecoration(
                                           /* boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: 15,
                                                blurRadius: 7,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],*/
                                          ),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    /*boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: 15,
                                                        blurRadius: 7,
                                                        offset: Offset(0, 3), // changes position of shadow
                                                      ),
                                                    ],*/
                                                  ),
                                                  child: Text(
                                                    'Patient',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(

                                                        fontSize: 10.sp
                                                    ),
                                                  ),
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
                                                    /*image: new DecorationImage(
                                                      image: new AssetImage("assets/images/tabicon.png"),
                                                      fit: BoxFit.cover,


                                                    ),*/
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
                                                color: Color(0xFF29AAE1),
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
                                                      height: 130.sp,
                                                      width: 130.sp,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: AssetImage("assets/images/shadow.png"),

                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        padding:  EdgeInsets.all(12.sp),
                                                        height: 18.sp,
                                                        width: 18.sp,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                        ),

                                                        child: CircleAvatar

                                                          (
                                                            radius: 20,
                                                            backgroundImage:
                                                            NetworkImage('https://i.imgur.com/BoN9kdC.png')
                                                        )
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
                                                      height: 130.sp,
                                                      width: 130.sp,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: AssetImage("assets/images/shadow.png"),

                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      child: Container(
                                                          padding:  EdgeInsets.all(12.sp),
                                                          height: 18.sp,
                                                          width: 18.sp,
                                                          decoration: BoxDecoration(
                                                            shape: BoxShape.circle,
                                                          ),

                                                          child: CircleAvatar

                                                            (
                                                              radius: 20,
                                                              backgroundImage:
                                                              NetworkImage('https://i.imgur.com/BoN9kdC.png')
                                                          )
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
                                          height: 10.sp,
                                        ),
                                        Container(
                                          height: 258.sp,
                                          width: 244.sp,

                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(20.sp),
                                                  bottomRight: Radius.circular(20.sp),
                                                  bottomLeft: Radius.circular(20.sp),
                                                  topLeft: Radius.circular(20.sp))
                                          ),
                                          child: CircularPercentIndicator(
                                            radius: 180.sp,
                                            animation: true,
                                            animationDuration: 1200,
                                            lineWidth: 15.0,
                                            percent: 0.4,
                                            center: Container(
                                              height: 90.sp,
                                              width: 90.sp,
                                              decoration:  BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue, // inner circle color
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "40%",
                                                  textAlign: TextAlign.center,
                                                  style:
                                                  new TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white,

                                                      fontSize: 20.0),
                                                ),
                                              ),
                                            ),
                                            circularStrokeCap: CircularStrokeCap.butt,
                                            backgroundColor: Color(0xFFD4D4D4),
                                            footer: Text(
                                              "Patient's performance+2%",
                                              style:
                                              new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                            ),
                                            progressColor: Color(0xFF29AAE1),
                                          ),
                                        ),
                                      ]
                                  ),
                                  Container(
                                    width: 30.sp,
                                  ),
                                  Expanded(
                                    child: Container(

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
                                      /*  height: MediaQuery
                                          .of(context)
                                          .size
                                          .height,*/
                                      /* width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,*/
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 10.sp,
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Text(
                                                "Therapist user lauren harsh.User id 123456.",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp

                                                ),

                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Container(
                                              child: Text(
                                                "Last login today Mon 10:35:21 a.m.29/10/2021",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15.sp
                                                ),

                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 10.sp,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 8,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      /*showfirstnametextwidget();
                                                      hidefirstnamewidget();
                                                      showlanguagetextwidget();
                                                      hidelastnamewidget();
                                                      showemailtextwidget();
                                                      hideemailwidget();
                                                      showphtextwidget();
                                                      hidephwidget();
                                                      showbirthtextwidget();
                                                      hidebirthwidget();
                                                      showlanguagetextwidget();
                                                      hidelanguagewidget();*/
                                                    });
                                                  },
                                                  child: Container(

                                                    width: 100.sp,
                                                    padding: EdgeInsets.all(20.sp),
                                                    decoration: BoxDecoration(
                                                      boxShadow: [
                                                        BoxShadow (
                                                          color: Colors.grey.withOpacity(0.8),
                                                          // color: Color(0xFF989898),
                                                          spreadRadius: 2,
                                                          blurRadius: 5,
                                                          offset: Offset(7, 0),
                                                        ),
                                                      ],

                                                      color: Color(0xFFF1F1F1),
                                                      /*image: new DecorationImage(
                                                        image: new AssetImage("assets/images/rectangle.png"),
                                                        fit: BoxFit.fill,
                                                      ),*/
                                                      border: new Border.all(
                                                        color: Color(0xFFe2e2e2),
                                                        width: 0,
                                                      ),
                                                      borderRadius: BorderRadius.all(Radius.circular(20)),

                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "FIRST NAME *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 80.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child: Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewfirstnametext,
                                                                    child: Text(
                                                                      "Lauren",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewfirstname,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: firstnameController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),

                                                                          hintText: 'Enter Firstname',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 480.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  hidefirstnametextwidget();
                                                                  showfirstnamewidget();
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: GestureDetector(
                                                                  onTap: () {
                                                                    //Navigator.pushNamed(context, "myRoute");
                                                                  },
                                                                  child: Text(
                                                                    "EDIT",
                                                                    textAlign: TextAlign.center,
                                                                    style: TextStyle(
                                                                      color: Color(0xFF989898 ),
                                                                      fontSize: 15.sp,
                                                                      fontWeight: FontWeight.bold,
                                                                    ),

                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          height: 2.sp,
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "LAST NAME *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 80.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child: Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewlastnametext,
                                                                    child: Text(
                                                                      "Harish",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewlastname,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: lastnameController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),
                                                                          labelText: 'Password',
                                                                          hintText: 'Enter Password',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 480.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: Text(
                                                                  "EDIT",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF989898 ),
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          height: 2.sp,
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "EMAIL *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 140.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child:  Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewemailtext,
                                                                    child: Text(
                                                                      "harish@gmail.com",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewemail,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: emailController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),
                                                                          labelText: 'Password',
                                                                          hintText: 'Enter Password',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 420.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: Text(
                                                                  "EDIT",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF989898 ),
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          height: 2.sp,
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "PHONE NUMBER *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 72.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child: Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewphnotext,
                                                                    child: Text(
                                                                      "1234567890",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewphno,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: phnoController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),

                                                                          hintText: 'Enter Password',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 480.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: Text(
                                                                  "EDIT",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF989898 ),
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          height: 2.sp,
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "BIRTH *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 120.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child: Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewbirthtext,
                                                                    child: Text(
                                                                      "03/01/1991",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewbirth,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: birthController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),

                                                                          hintText: 'Enter Password',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 440.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: Text(
                                                                  "EDIT",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF989898 ),
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          height: 2.sp,
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "GENDER *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 50.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child:  Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewgendertext,
                                                                    child: Text(
                                                                      "Male",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewgender,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: genderController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),

                                                                          hintText: 'Enter Password',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 430.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: Text(
                                                                  "EDIT",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF989898 ),
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          height: 2.sp,
                                                          color: Colors.grey.withOpacity(0.5),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [

                                                            Align(
                                                              alignment: Alignment.centerLeft,
                                                              child: Text(
                                                                "LANGUAGE *",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Color(0xFF989898 ),
                                                                  fontSize: 15.sp,
                                                                  fontWeight: FontWeight.bold,
                                                                ),

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 90.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.center,
                                                              child: Stack(
                                                                children: [
                                                                  Visibility(
                                                                    visible: viewlanguagetext,
                                                                    child: Text(
                                                                      "English",
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        color: Color(0xFF989898 ),
                                                                        fontSize: 15.sp,
                                                                        fontWeight: FontWeight.bold,
                                                                      ),

                                                                    ),
                                                                  ),
                                                                  Visibility(
                                                                    visible: viewlanguage,
                                                                    child: SizedBox(
                                                                      height: 30.sp,
                                                                      width: 100.sp,
                                                                      child: TextField(
                                                                        controller: languageController,
                                                                        obscureText: true,
                                                                        decoration: InputDecoration(
                                                                          border: UnderlineInputBorder(),

                                                                          hintText: 'Enter Password',
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],

                                                              ),
                                                            ),
                                                            Container(
                                                              width: 470.sp,
                                                            ),
                                                            Align(
                                                              alignment: Alignment.centerRight,
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  //Navigator.pushNamed(context, "myRoute");
                                                                },
                                                                child: Text(
                                                                  "EDIT",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Color(0xFF989898 ),
                                                                    fontSize: 15.sp,
                                                                    fontWeight: FontWeight.bold,
                                                                  ),

                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),

                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(

                                                  padding: EdgeInsets.all(20.sp),
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 40.sp,
                                                            width: 40.sp,
                                                            child: IconButton(
                                                              icon: Image.asset('assets/images/eye.png'),
                                                              onPressed: () {

                                                              },
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration: BoxDecoration(

                                                              image: DecorationImage(
                                                                image: AssetImage("assets/images/switchbox.png"),

                                                                fit: BoxFit.cover,
                                                              ),

                                                            ),
                                                            child: FlutterSwitch(
                                                              width: 120.sp,
                                                              height: 40.sp,
                                                              //valueFontSize: 15.sp,
                                                              // toggleSize: 40.sp,
                                                              value: status,
                                                           /*   activeColor: Colors.transparent,
                                                              inactiveColor: Colors.transparent,
                                                              activeText: "On",
                                                              inactiveText: "Off",
                                                              inactiveTextColor: Colors.white,
                                                              activeTextColor: Colors.black,
                                                              activeToggleColor: Colors.grey,
                                                              inactiveToggleColor: Colors.transparent,
                                                              activeToggleBorder:Border.all(
                                                                color: Colors.transparent,
                                                                width: 6.0,
                                                              ),
                                                              inactiveToggleBorder: Border.all(
                                                                color: Color(0xFF3C1E70),
                                                                width: 6.0,
                                                              ),*/
                                                              borderRadius: 30.sp,
                                                              padding: 8.sp,
                                                              showOnOff: true,
                                                              onToggle: (val) {
                                                                setState(() {
                                                                  status = val;
                                                                });
                                                              },
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 10.sp,
                                                      ),
                                                      Text(
                                                        "Do you have color blindness",
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp
                                                        ),
                                                      ),
                                                      Text(
                                                        "Activate this option.Learn",
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp
                                                        ),
                                                      ),
                                                      Text(
                                                        "more here",
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12.sp
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 120.sp,
                                                      ),
                                                      SizedBox(
                                                        height: 40.sp,
                                                        width: 40.sp,
                                                        child: IconButton(
                                                          icon: Image.asset('assets/images/key.png'), onPressed: () {  },
                                                        ),
                                                      ),
                                                      ButtonTheme(
                                                        minWidth: 170.sp,
                                                        height: 56.sp,
                                                        shape: new RoundedRectangleBorder(
                                                          borderRadius: new BorderRadius.circular(40.sp),
                                                        ),
                                                        child: Container(
                                                          decoration:  BoxDecoration(
                                                            boxShadow: [
                                                               //background color of box
                                                              BoxShadow(
                                                                color: Colors.grey.withOpacity(0.5),
                                                                blurRadius: 55.0, // soften the shadow
                                                                spreadRadius: 5.0, //extend the shadow
                                                                offset: Offset(
                                                                  15.0, // Move to right 10  horizontally
                                                                  15.0, // Move to bottom 10 Vertically
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                          child: RaisedButton(
                                                            onPressed: () {
                                                             // Navigator.pushNamed(context, 'patient/usermanagement');

                                                            },

                                                            color: Color(0xFF29AAE1),
                                                            child: Text("Change password >",
                                                              style: TextStyle(
                                                                  color: Colors.white,
                                                                  fontSize: 15.sp

                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                ),
                                              )

                                            ],
                                          )
                                        ],
                                      ),

                                    ),
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
                      Navigator.pushNamed(context, 'patient/profile');
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
                      Navigator.pushNamed(context, 'patient/generalpreference');
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
                      "LOGOUT",
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