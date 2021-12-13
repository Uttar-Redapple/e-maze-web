import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:email_validator/email_validator.dart';
import 'package:emaze_brain/model/get_login.dart';
import 'package:emaze_brain/model/get_reguser.dart';
import 'package:emaze_brain/model/response/get_loginresp.dart';
import 'package:emaze_brain/model/response/get_regresponse.dart';
import 'package:emaze_brain/model/response/get_terms.dart';
import 'package:emaze_brain/model/response/getchangepwdresponse.dart';
import 'package:emaze_brain/model/response/getresp.dart';
import 'package:emaze_brain/provider/api_client_provider.dart';
import 'package:emaze_brain/screen/gamestartscreen/Gamestartscreen.dart';
import 'package:emaze_brain/screen/loginscreen/Therapistorpatient.dart';
import 'package:emaze_brain/screen/util/InnerShadow.dart';
import 'package:emaze_brain/screen/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

Future<GetTerms> fetchterms() async {
  final response = await http
      .get(Uri.parse(Constants.baseurl+"page/1"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GetTerms.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
Future<GetTerms> fetchprivacypolicy() async {
  final response = await http
      .get(Uri.parse(Constants.baseurl+"page/2"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return GetTerms.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
void main() {
  runApp(ProviderScope(child: MyApp()));
}
class Patientloginregistration extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PatientloginregistrationState();
  }

}
class PatientloginregistrationState extends State<Patientloginregistration> with TickerProviderStateMixin{
  late Future<GetTerms> futureAlbum;
  late Future<GetTerms> privacypolicy;
  final _formKey = GlobalKey<FormState>();
  final _regformKey = GlobalKey<FormState>();
  final _forgotformKey = GlobalKey<FormState>();
  late FocusNode _loginusernamefocusnode;
  late FocusNode _loginpwdfocusnode;
  late FocusNode _regusernamefocusnode;
  late  FocusNode _regemailfocusnode;
  late  FocusNode _regphfocusnode;
  late FocusNode _regpwdfocusnode;

  bool _hasBeenPressedlogin = false;
  bool _hasBeenPressedregister = false;
  double _width = 600.sp;
  double _height = 450.sp;
  bool roundcheckboxselection=false;
  bool viewVisible = false ;
  bool viewerrormsgvisible=false;
  bool viewregsucess=false;
  bool viewreg=false;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(40.sp);
  bool regusername=false;
  bool regpwd=false;
  bool regph=false;
  bool regemail=false;

  bool username=true;
  bool pwd=true;

  Color _logincolor = Colors.green;
  Color _regcolor = Colors.white;
  Color _logintextcolor=Colors.white;
  Color _regtextcolor=Colors.black;
  double _regwidth = 570.sp;
  double _regheight = 370.sp;

  BorderRadiusGeometry _regborderRadius = BorderRadius.circular(20.sp);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController regnameController = TextEditingController();
  TextEditingController regpasswordController = TextEditingController();
  TextEditingController regemailController = TextEditingController();
  TextEditingController regphnoController = TextEditingController();
  TextEditingController forgotemailController = TextEditingController();
  bool _obscureText = true;
  late bool _isButtonDisabled;
  late String _password;
  late bool _passwordVisible;
  late bool _regpasswordVisible;
  bool value = false;
  bool isChecked = false;
  bool isEnabled = true;
  final focus = FocusNode();
  bool selectedbox=false;

  String checkvalue="Please";
  String valuetext="Wrong username/password";

  var messageresponse;
  String message="";

  void clearregtext(){
    regnameController.clear();
    regpasswordController.clear();
    regemailController.clear();
    regphnoController.clear();
  }
  void clearlogintext(){
    nameController.clear();
    passwordController.clear();

  }

  void showregsucesswidget(){
    setState(() {
      viewregsucess = true ;

    });
  }

  void hideregsucesswidget(){
    setState(() {
      viewregsucess = false ;
    });
  }
  void showidget(){
    setState(() {
      viewreg = true ;

    });
  }

  void hidewidget(){
    setState(() {
      viewreg = false ;
    });
  }

  void showerrorWidget(){
    setState(() {
      viewerrormsgvisible = true ;

    });
  }

  void hideerrorWidget(){
    setState(() {
      viewerrormsgvisible = false ;
    });
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  enableElevatedButton() {
    setState(() {
      isEnabled = true;
    });
  }
  void showWidget(){
    setState(() {
      viewVisible = true ;
    });
  }

  void hideWidget(){
    setState(() {
      viewVisible = false ;
    });
  }
  diablebutton() {
    setState(() {
      isEnabled = false;
    });
  }
  late bool loginabsrobpointer;
  late bool regabsorbpointer;
  late bool loginbutton;
  late bool regbutton;
  @override
  void initState() {
    super.initState();
    loginbutton=true;
    regbutton=false;
    _passwordVisible = false;
    _regpasswordVisible = false;

    _loginusernamefocusnode = FocusNode();
    _loginpwdfocusnode = FocusNode();
    _regusernamefocusnode=FocusNode();
    _regusernamefocusnode.addListener(_onFocusChange);
    _regpwdfocusnode=FocusNode();
    _regpwdfocusnode.addListener(_onFocusChange);
    _regemailfocusnode=FocusNode();
    _regemailfocusnode.addListener(_onFocusChange);
    _regphfocusnode=FocusNode();
    _regphfocusnode.addListener(_onFocusChange);
    futureAlbum = fetchterms();
    privacypolicy=fetchprivacypolicy();
    _isButtonDisabled = false;
    loginabsrobpointer=false;
    regabsorbpointer=true;

  }
  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    _loginusernamefocusnode.dispose();
    _loginpwdfocusnode.dispose();
    _regusernamefocusnode.removeListener(_onFocusChange);
    _regusernamefocusnode.dispose();
    _regpwdfocusnode.removeListener(_onFocusChange);
    _regpwdfocusnode.dispose();
    _regphfocusnode.removeListener(_onFocusChange);
    _regphfocusnode.dispose();
    _regemailfocusnode.removeListener(_onFocusChange);
    _regemailfocusnode.dispose();
    super.dispose();
  }
  void enableloginbutton(){
    setState(() {
      loginbutton=true;
    });
  }
  void disableloginbutton(){
    setState(() {
      loginbutton=false;
    });
  }

  void enableregbutton(){
    setState(() {
      regbutton=true;
    });
  }
  void disableregbutton(){
    setState(() {
      regbutton=false;
    });
  }

  void enablelogin(){
    setState(() {
      loginabsrobpointer=false;
    });


  }
  void disablelogin(){
    setState(() {
      loginabsrobpointer=true;
    });


  }
  void enablereg(){
    setState(() {
      regabsorbpointer=false;
    });


  }
  void disablereg(){
    setState(() {
      regabsorbpointer=true;
    });


  }

  void _onFocusChange(){

    debugPrint("Focusregusername: ${_regusernamefocusnode.hasFocus.toString()}");
    debugPrint("Focusregemail: ${_regemailfocusnode.hasFocus.toString()}");
    debugPrint("Focusregph: ${_regphfocusnode.hasFocus.toString()}");
  }
  bool viewvalidusername = false ;
  bool validemail = false ;
  bool validph = false ;
  bool validpwd = false ;

  void showvalidusername(){
    setState(() {
      viewvalidusername = true ;

    });
  }

  void hidevalidusername(){
    setState(() {
      viewvalidusername = false ;
    });
  }


  void showvalidemail(){
    setState(() {
      validemail = true ;

    });
  }

  void hidevalidemail(){
    setState(() {
      validemail = false ;
    });
  }


  void showvalidph(){
    setState(() {
      validph = true ;

    });
  }

  void hidevalidph(){
    setState(() {
      validph = false ;
    });
  }
  void showvalidpwd(){
    setState(() {
      validpwd = true ;

    });
  }

  void hidevalidpwd(){
    setState(() {
      validpwd = false ;
    });
  }



  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(40);
    document.addEventListener('keydown', (dynamic event) {
      if (event.code == 'Tab') {
        event.preventDefault();
      }
    });
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
                            image: AssetImage("assets/images/fondos.png"),

                            fit: BoxFit.cover,
                          ),
                          /* gradient:
                          LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              tileMode: TileMode.repeated,
                              colors: [ Color(0xFF000120),
                                Color(0xFF0078ad),
                              ]),*/
                        ),
                        child: SingleChildScrollView(
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
                                height: 5.sp,
                              ),
                              InnerShadow(
                                blur: 5,
                                color: Colors.grey,
                                child: Container(

                                  padding: EdgeInsets.all(5.sp),

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
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _regcolor = Colors.white;
                                              _logincolor=Colors.green;
                                              _logintextcolor=Colors.white;
                                              _regtextcolor=Colors.black;
                                              // Generate a random width and height.
                                              _width = 600.sp;
                                              _height = 450.sp;
                                              _regwidth = 570.sp;
                                              _regheight = 370.sp;
                                              regpwd=false;
                                              regph=false;
                                              regemail=false;
                                              regusername=false;
                                              username=true;
                                              hidewidget();
                                              hideWidget();
                                              clearregtext();
                                              hideregsucesswidget();
                                              hidevalidpwd();
                                              hidevalidph();
                                              hidevalidemail();
                                              hidevalidusername();
                                              /*enablelogin();
                                              disablereg();*/
                                              pwd=true;
                                              _regborderRadius =
                                                  BorderRadius.circular(40.sp);
                                              _borderRadius =
                                                  BorderRadius.circular(40.sp);
                                              _hasBeenPressedregister = !_hasBeenPressedregister;
                                            });
                                          },
                                          child: Container(
                                            height: 40.sp,
                                            decoration: BoxDecoration(
                                                color: _logincolor,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(40.0),
                                                  bottomRight: Radius.circular(40.0),
                                                  topLeft: Radius.circular(40.0),
                                                  topRight: Radius.circular(40.0),


                                                )
                                            ),


                                            child:GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _regcolor = Colors.white;
                                                  _logincolor=Colors.green;
                                                  _logintextcolor=Colors.white;
                                                  _regtextcolor=Colors.black;
                                                  // Generate a random width and height.
                                                  _width = 600.sp;
                                                  _height = 450.sp;
                                                  _regwidth = 570.sp;
                                                  _regheight = 370.sp;
                                                  regpwd=false;
                                                  regph=false;
                                                  regemail=false;
                                                  regusername=false;
                                                  username=true;
                                                  hidewidget();
                                                  hideWidget();
                                                  clearregtext();
                                                  hideregsucesswidget();
                                                  hidevalidpwd();
                                                  hidevalidph();
                                                  hidevalidemail();
                                                  hidevalidusername();
                                                  /*enablelogin();
                                                  disablereg();*/
                                                  pwd=true;
                                                  _regborderRadius =
                                                      BorderRadius.circular(40.sp);
                                                  _borderRadius =
                                                      BorderRadius.circular(40.sp);
                                                  _hasBeenPressedregister = !_hasBeenPressedregister;
                                                });
                                              },
                                              child: Center(
                                                child: Text(
                                                    'LOGIN',
                                                    textAlign: TextAlign.center,
                                                    style:  TextStyle(
                                                      color: _logintextcolor,
                                                      fontWeight: FontWeight.bold,


                                                    )
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              regpwd=true;
                                              regph=true;
                                              regemail=true;
                                              regusername=true;
                                              username=false;
                                              pwd=false;
                                              _logincolor = Colors.white;
                                              _regcolor= Colors.green;
                                              _logintextcolor=Colors.black;
                                              _regtextcolor=Colors.white;
                                              _width = 500.sp;
                                              _height = 350.sp;
                                              _borderRadius =
                                                  BorderRadius.circular(40.sp);

                                              _regwidth = 650.sp;
                                              _regheight = 450.sp;
                                              _regborderRadius =
                                                  BorderRadius.circular(40.sp);
                                              hideerrorWidget();
                                              clearlogintext();
                                             /* disablelogin();
                                              enablereg();*/

                                              _hasBeenPressedlogin = !_hasBeenPressedlogin;
                                            });
                                          },
                                          child: Container(
                                            height: 40.sp,
                                            decoration: BoxDecoration(
                                                color: _regcolor,
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(40.0),
                                                  bottomRight: Radius.circular(40.0),
                                                  topLeft: Radius.circular(40.0),
                                                  topRight: Radius.circular(40.0),


                                                )
                                            ),


                                            child:GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  regpwd=true;
                                                  regph=true;
                                                  regemail=true;
                                                  regusername=true;
                                                  username=false;
                                                  pwd=false;
                                                  _logincolor = Colors.white;
                                                  _regcolor= Colors.green;
                                                  _logintextcolor=Colors.black;
                                                  _regtextcolor=Colors.white;
                                                  _width = 500.sp;
                                                  _height = 350.sp;
                                                  _borderRadius =
                                                      BorderRadius.circular(40.sp);

                                                  _regwidth = 650.sp;
                                                  _regheight = 450.sp;
                                                  _regborderRadius =
                                                      BorderRadius.circular(40.sp);
                                                  hideerrorWidget();
                                                  clearlogintext();
                                              /*    disablelogin();
                                                  enablereg();*/
                                                  _hasBeenPressedlogin = !_hasBeenPressedlogin;
                                                });
                                              },
                                              child: Center(
                                                child: Text(
                                                    'REGISTER',
                                                    textAlign: TextAlign.center,
                                                    style:  TextStyle(
                                                      color: _regtextcolor,
                                                      fontWeight: FontWeight.bold,


                                                    )
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              _regcolor = Colors.white;
                                              _logincolor=Colors.green;
                                              _logintextcolor=Colors.white;
                                              _regtextcolor=Colors.black;
                                              // Generate a random width and height.
                                              _width = 600.sp;
                                              _height = 450.sp;
                                              _regwidth = 570.sp;
                                              _regheight = 370.sp;
                                              regpwd=false;
                                              regph=false;
                                              regemail=false;
                                              regusername=false;
                                              username=true;
                                              hidewidget();
                                              hideWidget();
                                              clearregtext();
                                              hideregsucesswidget();
                                              hidevalidpwd();
                                              hidevalidph();
                                              hidevalidemail();
                                              hidevalidusername();
                                              /*enablelogin();
                                              disablereg();*/
                                              pwd=true;
                                              _regborderRadius =
                                                  BorderRadius.circular(40.sp);
                                              _borderRadius =
                                                  BorderRadius.circular(40.sp);
                                              _hasBeenPressedregister = !_hasBeenPressedregister;
                                            });
                                          },
                                          child: Container(


                                            padding: EdgeInsets.all(40.sp),
                                            child: Align(

                                              child: AnimatedContainer(


                                                padding: EdgeInsets.all(10.sp),
                                                width: _width,
                                                height: _height,

                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/images/login.png"),

                                                    fit: BoxFit.cover,
                                                  ),
                                                  /* gradient: LinearGradient(
                                                      begin: Alignment.centerLeft,
                                                      end: Alignment.centerRight,
                                                      colors: <Color> [
                                                        Color(0xFF282842),
                                                        Color(0xFF1C3973)




                                                      ],
                                                      tileMode: TileMode.repeated
                                                  ),*/
                                                  border: Border.all(

                                                      color: Color(0xFF55708b)
                                                  ),
                                                  borderRadius: _borderRadius,

                                                ),
                                                duration:  Duration(seconds: 1),
                                                child: SingleChildScrollView(
                                                  child: Form(
                                                    key: _formKey,
                                                    child: Column(

                                                      children:<Widget>[

                                                        Container(
                                                          margin: new EdgeInsets.symmetric(horizontal: 20.sp),
                                                          padding: EdgeInsets.symmetric(vertical: 10.sp,),
                                                          child: Row(

                                                            children: [
                                                              Text(
                                                                "USER / EMAIL / ID / PHONE",
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
                                                            borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Color(0xFF243B40),
                                                                blurRadius: 2.0,
                                                                spreadRadius: 0.0,
                                                                offset: Offset(2.0, 2.0), // changes position of shadow
                                                              ),
                                                            ],

                                                          ),
                                                          child: Column(
                                                            children: [

                                                                TextFormField(
                                                                  enabled: username,
                                                                  controller: nameController,
                                                                  decoration: InputDecoration(
                                                                      border: UnderlineInputBorder(),
                                                                      labelText: 'User Name',
                                                                      hintText: "name@example.com"

                                                                  ),





                                                                  validator: (value) {
                                                                    if (value == null || value.isEmpty) {
                                                                      return 'Username required';
                                                                    }
                                                                    return null;
                                                                  },
                                                                  textInputAction: TextInputAction.next,
                                                                  onFieldSubmitted: (v){
                                                                    _loginusernamefocusnode.unfocus();
                                                                    _loginpwdfocusnode.requestFocus();
                                                                  },

                                                                  //   onEditingComplete: () => _loginpwdfocusnode.requestFocus(),
                                                                ),


                                                               TextFormField(
                                                                  enabled: pwd,
                                                                  // focusNode: _loginpwdfocusnode,
                                                                  obscureText: !_passwordVisible,
                                                                  controller: passwordController,
                                                                  //  focusNode: _loginpwdfocusnode,

                                                                  validator: (pwdvalue) {
                                                                    if (pwdvalue!.isEmpty) {
                                                                      return "Password Required";
                                                                    }
                                                                  },


                                                                  decoration: InputDecoration(
                                                                      border: InputBorder.none,
                                                                      //  border: UnderlineInputBorder(),
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
                                                                  onFieldSubmitted: (value) async {
                                                                    if (_formKey.currentState!.validate()) {
                                                                      try {
                                                                        GetLoginResponse resp=
                                                                        await context.read(apiClientProvider).login(
                                                                            Loginuser( nameController.text, passwordController.text
                                                                            )
                                                                        );




                                                                        if(resp.data.user_type==1){
                                                                          print("usertype: ${resp.data.user_type}");

                                                                          SharedPreferences pref = await SharedPreferences.getInstance();
                                                                          pref.setString('authtoken', resp.data.token);
                                                                          getuserdetails(resp.data.token,resp.data.user_id);
                                                                          pref.setInt('p_id', resp.data.user_id);

                                                                        }
                                                                        else{
                                                                          showerrorWidget();
                                                                        }
                                                                        //print("Regions: ${resp.data.toJson()}");

                                                                        clearlogintext();
                                                                        // hideerrorWidget();

                                                                      } catch (e) {
                                                                        print(e);
                                                                        if (e is DioError) {
                                                                          showerrorWidget();
                                                                          clearlogintext();
                                                                          /* ScaffoldMessenger.of(context).showSnackBar(
                                                                        SnackBar(content: Text('Wrong username or password')),
                                                                      );*/

                                                                          //handle DioError here by error type or by error code

                                                                        } else {

                                                                        }

                                                                      }
                                                                      // If the form is valid, display a snackbar. In the real world,
                                                                      // you'd often call a server or save the information in a database.


                                                                    }
                                                                  },
                                                                  textInputAction: TextInputAction.done,
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
                                                                width: 4.sp,
                                                                height: 2.sp,
                                                              ),

                                                              /* FutureBuilder<Album>(
                                                                  future: futureAlbum,
                                                                  builder: (context, snapshot) {
                                                                    if (snapshot.hasData) {
                                                                      return Text(
                                                                          snapshot.data!.title,
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                            color: Colors.white,
                                                                            fontSize: 15.sp
                                                                        ),
                                                                      );
                                                                    } else if (snapshot.hasError) {
                                                                      return Text('${snapshot.error}');
                                                                    }
                                                                    return const CircularProgressIndicator();
                                                                  }
                                                              ),*/

                                                              Text(
                                                                "Remember me",
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                  color: Colors.white,
                                                                  // fontSize: 15.sp
                                                                ),

                                                              ),
                                                              Spacer(),
                                                              GestureDetector(
                                                                onTap: (){
                                                                  showDialog(
                                                                      context: context,
                                                                      builder: (context){
                                                                        return Dialog(
                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                          elevation: 16,
                                                                          child: SingleChildScrollView(
                                                                            child: Form(
                                                                              key: _forgotformKey,
                                                                              child: Container(
                                                                                width: 400.sp,
                                                                                height: 400.sp,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                  gradient: LinearGradient(
                                                                                      begin: Alignment.topLeft,
                                                                                      end: Alignment.bottomRight,
                                                                                      colors: <Color> [
                                                                                        Color(0xFF2b2b49),
                                                                                        Color(0xFF0d2561),
                                                                                        Color(0xFF005890),
                                                                                        Color(0xFF0071a6),





                                                                                      ],
                                                                                      tileMode: TileMode.repeated
                                                                                  ),
                                                                                ),
                                                                                child: Column(
                                                                                  children: [
                                                                                    Center(
                                                                                      child: SizedBox(
                                                                                        height: 100.sp,
                                                                                        width: 200.sp,
                                                                                        child: Image(image: AssetImage(
                                                                                            'assets/images/emazelogofirst.png'
                                                                                        ),

                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      height: 10.sp,
                                                                                    ),
                                                                                    Container(
                                                                                      height: 54.sp,
                                                                                      width: 500.sp,
                                                                                      decoration: BoxDecoration(
                                                                                        // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                        gradient: LinearGradient(
                                                                                            begin: Alignment.centerLeft,
                                                                                            end: Alignment.centerRight,
                                                                                            colors: <Color> [
                                                                                              Color(0xFF005088),
                                                                                              Color(0xFF29AAE1),






                                                                                            ],
                                                                                            tileMode: TileMode.repeated
                                                                                        ),
                                                                                      ),
                                                                                      child: Center(
                                                                                        child: Text(
                                                                                          "FORGOT PASSWORD",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            color: Color(0xFFffffff),
                                                                                            //  fontSize: 35.sp,
                                                                                            fontFamily:  '',
                                                                                            fontWeight: FontWeight.bold,
                                                                                          ),

                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      height: 30.sp,
                                                                                    ),
                                                                                    Neumorphic(
                                                                                      margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                                                                                      style: NeumorphicStyle(
                                                                                          depth: NeumorphicTheme.embossDepth(context),
                                                                                          boxShape: NeumorphicBoxShape.stadium(),
                                                                                          color: Colors.white
                                                                                      ),
                                                                                      //  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                                                                      child: Container(
                                                                                        height: 45.sp,
                                                                                        padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                                                                                        child: TextFormField(
                                                                                          // enabled:regemail,
                                                                                          controller: forgotemailController,

                                                                                          validator: (regemailvalue) {
                                                                                            final bool isValid = EmailValidator.validate(regemailvalue!);

                                                                                            if (!isValid) {
                                                                                              showvalidemailtoast();

                                                                                              // showvalidemail();
                                                                                              // return "Email address invalid";
                                                                                            }
                                                                                            else{
                                                                                              //hidevalidemail();
                                                                                            }
                                                                                          },

                                                                                          decoration: InputDecoration(
                                                                                            border: InputBorder.none,
                                                                                            //  filled: true,
                                                                                            fillColor: Colors.white70,

                                                                                            hintText: 'Email',

                                                                                          ),
                                                                                          textInputAction: TextInputAction.done,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      height: 30.sp,
                                                                                    ),
                                                                                    Visibility(
                                                                                      visible: validemail,
                                                                                      child: Container(
                                                                                        child: Text(
                                                                                          "Email required or please enter valid email.",
                                                                                          style: TextStyle(
                                                                                            color: Colors.red,

                                                                                          ),

                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      child: ButtonTheme(
                                                                                        minWidth: 182.sp,
                                                                                        height: 63.sp,
                                                                                        shape: new RoundedRectangleBorder(
                                                                                          borderRadius: new BorderRadius.circular(40.sp),
                                                                                        ),
                                                                                        child: RaisedButton(

                                                                                          onPressed: () async {
                                                                                            if (_forgotformKey.currentState!.validate()) {
                                                                                              frgtpwd();
                                                                                            }

                                                                                          },

                                                                                          color: Color(0xFF29AAE1),
                                                                                          child: Text("Submit",
                                                                                            style: TextStyle(
                                                                                              color: Colors.white,

                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),

                                                                                    Text(
                                                                                      "",
                                                                                      style: TextStyle(
                                                                                        color: Colors.red,

                                                                                      ),

                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                  ).then((val) {
                                                                    forgotemailController.clear();
                                                                  });;
                                                                },
                                                                child: Text(
                                                                  "Forgot password?",
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    color: Colors.white,
                                                                    // fontSize: 15.sp
                                                                  ),

                                                                ),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 63.sp,

                                                        ),
                                                        Container(
                                                          height: 60,
                                                          decoration: BoxDecoration(
                                                            /* gradient: LinearGradient(
                                                                colors: [
                                                                  Color.fromRGBO(255, 143, 158, 1),
                                                                  Color.fromRGBO(255, 188, 143, 1),
                                                                ],
                                                                begin: Alignment.centerLeft,
                                                                end: Alignment.centerRight,
                                                              ),*/
                                                              borderRadius: const BorderRadius.all(
                                                                Radius.circular(25.0),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.pink.withOpacity(0.2),
                                                                  spreadRadius: 4,
                                                                  blurRadius: 10,
                                                                  offset: Offset(0, 3),
                                                                )
                                                              ]
                                                          ),
                                                          /*decoration: BoxDecoration(


                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.grey.withOpacity(0.5),

                                                                  blurRadius: 6,
                                                                  offset: Offset(5, 5),
                                                                )
                                                              ]
                                                          ),*/
                                                          child: ButtonTheme(
                                                            minWidth: 182.sp,
                                                            height: 63.sp,
                                                            shape: new RoundedRectangleBorder(
                                                              borderRadius: new BorderRadius.circular(40.sp),

                                                            ),
                                                            child: RaisedButton(
                                                              onPressed: () async {
                                                                if (_formKey.currentState!.validate()) {
                                                                  try {
                                                                    GetLoginResponse resp=
                                                                    await context.read(apiClientProvider).login(
                                                                        Loginuser( nameController.text, passwordController.text
                                                                        )
                                                                    );


                                                                    /* print( User(
                                                                        "abc@gmail.com",
                                                                        "123456"
                                                                    ));*/

                                                                    if(resp.data.user_type==1){
                                                                      print("usertype: ${resp.data.user_type}");

                                                                      SharedPreferences pref = await SharedPreferences.getInstance();
                                                                      pref.setString('authtoken', resp.data.token);
                                                                      getuserdetails(resp.data.token,resp.data.user_id);
                                                                      pref.setInt('p_id', resp.data.user_id);
                                                                    }
                                                                    else{
                                                                      showerrorWidget();
                                                                    }
                                                                    // print("Regions: ${resp.data.toJson()}");

                                                                    clearlogintext();
                                                                    // hideerrorWidget();

                                                                  } catch (e) {
                                                                    print(e);
                                                                    if (e is DioError) {
                                                                      showerrorWidget();
                                                                      clearlogintext();
                                                                      /* ScaffoldMessenger.of(context).showSnackBar(
                                                                        SnackBar(content: Text('Wrong username or password')),
                                                                      );*/

                                                                      //handle DioError here by error type or by error code

                                                                    } else {

                                                                    }

                                                                  }
                                                                  // If the form is valid, display a snackbar. In the real world,
                                                                  // you'd often call a server or save the information in a database.


                                                                }

                                                              },

                                                              color: Color(0xFF29AAE1),
                                                              child: Text("Sign In",
                                                                style: TextStyle(
                                                                  color: Colors.white,

                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                        ),
                                                        Container(
                                                          height: 10.sp,
                                                        ),
                                                        Visibility(
                                                          visible: viewerrormsgvisible,
                                                          child: Text(valuetext,
                                                            style: TextStyle(
                                                              color: Color(0xFFFF4500),

                                                            ),
                                                          ),
                                                        ),

                                                      ],

                                                    ),
                                                  ),
                                                ),

                                              ),
                                            ),




                                          ),
                                        ),
                                      ),


                                      Expanded(
                                        flex: 5,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              regpwd=true;
                                              regph=true;
                                              regemail=true;
                                              regusername=true;
                                              username=false;
                                              pwd=false;
                                              _logincolor = Colors.white;
                                              _regcolor= Colors.green;
                                              _logintextcolor=Colors.black;
                                              _regtextcolor=Colors.white;
                                              _width = 500.sp;
                                              _height = 350.sp;
                                              _borderRadius =
                                                  BorderRadius.circular(40.sp);

                                              _regwidth = 650.sp;
                                              _regheight = 450.sp;
                                              _regborderRadius =
                                                  BorderRadius.circular(40.sp);
                                              hideerrorWidget();
                                              clearlogintext();
                                             /* enablereg();
                                              disablelogin()*/
                                              _hasBeenPressedlogin = !_hasBeenPressedlogin;
                                            });
                                          },
                                          child: Container(
                                            //  height: 600.sp,

                                            padding: EdgeInsets.all(20.sp),
                                            child: Align(

                                              child: AnimatedContainer(


                                                padding: EdgeInsets.all(10.sp),
                                                width: _regwidth,
                                                height: _regheight,

                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    image: DecorationImage(
                                                      image: AssetImage("assets/images/regagain.png"),

                                                      fit: BoxFit.cover,
                                                    ),
                                                    /* gradient: LinearGradient(
                                                        begin: Alignment.centerLeft,
                                                        end: Alignment.centerRight,
                                                        colors: <Color> [
                                                          Color(0xFF263E7A),

                                                          Color(0xFF0070A8)



                                                        ],
                                                        tileMode: TileMode.repeated
                                                    ),*/
                                                    border: Border.all(

                                                        color: Color(0xFF55708b)
                                                    ),
                                                    borderRadius: _regborderRadius

                                                ),
                                                duration:  Duration(seconds: 1),
                                                curve: Curves.fastOutSlowIn,
                                                child: SingleChildScrollView(
                                                  child: Form(
                                                    key: _regformKey,
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
                                                              borderRadius: BorderRadius.all(Radius.circular(21)),


                                                            ),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Container(
                                                                          height: 25.sp,
                                                                          width: 25.sp,
                                                                          child: Image(
                                                                            image: AssetImage('assets/images/username-gray.png'),
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Expanded(
                                                                      flex: 9,

                                                                      child: Neumorphic(
                                                                        margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                                                                        style: NeumorphicStyle(
                                                                            depth: NeumorphicTheme.embossDepth(context),
                                                                            boxShape: NeumorphicBoxShape.stadium(),
                                                                            color: Colors.white
                                                                        ),
                                                                        child: Container(
                                                                          height: 45.sp,
                                                                          padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),




                                                                            child: TextFormField(
                                                                              enabled:regusername,
                                                                              controller: regnameController,
                                                                              validator: (regvalue) {
                                                                                if (regvalue == null || regvalue.isEmpty) {

                                                                                  showvalidusername();
                                                                                }
                                                                                else{
                                                                                  hidevalidusername();
                                                                                }

                                                                                //    hidevalidusername();
                                                                              },

                                                                              decoration: InputDecoration(
                                                                                border: InputBorder.none,
                                                                                //  filled: true,
                                                                                fillColor: Colors.white70,

                                                                                hintText: 'Full Name',

                                                                              ),
                                                                              // maxLines: 1,
                                                                             /* onFieldSubmitted: (value){
                                                                                _regusernamefocusnode.unfocus();
                                                                                _regemailfocusnode.requestFocus();
                                                                              },*/
                                                                              textInputAction: TextInputAction.next,
                                                                            ),

                                                                        ),
                                                                      ),

                                                                    ),


                                                                  ],

                                                                ),
                                                                Container(
                                                                  height: 10.sp,
                                                                ),
                                                                Visibility(
                                                                  visible: viewvalidusername,
                                                                  child: Container(
                                                                    child: Text(
                                                                      "Full name required.",
                                                                      style: TextStyle(
                                                                        color: Colors.red,

                                                                      ),

                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Container(
                                                                          height: 25.sp,
                                                                          width: 25.sp,
                                                                          child: Image(
                                                                            image: AssetImage('assets/images/message-gray.png'),
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Expanded(
                                                                      flex: 9,


                                                                      child: Neumorphic(
                                                                        margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                                                                        style: NeumorphicStyle(
                                                                            depth: NeumorphicTheme.embossDepth(context),
                                                                            boxShape: NeumorphicBoxShape.stadium(),
                                                                            color: Colors.white
                                                                        ),
                                                                        //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                                        child: Container(
                                                                          padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                                                                          height: 50.sp,


                                                                            child: TextFormField(
                                                                              enabled:regemail,

                                                                              controller: regemailController,

                                                                              validator: (regemailvalue) {
                                                                                final bool isValid = EmailValidator.validate(regemailvalue!);
                                                                                if (regemailvalue.isEmpty) {
                                                                                  showvalidemail();
                                                                                }
                                                                                if (!isValid) {
                                                                                  showvalidemail();
                                                                                  // return "Email address invalid";
                                                                                }
                                                                                else{
                                                                                  hidevalidemail();
                                                                                }
                                                                              },

                                                                              decoration: InputDecoration(
                                                                                border: InputBorder.none,
                                                                                //  filled: true,
                                                                                fillColor: Colors.white70,

                                                                                hintText: 'Email',


                                                                              ),
                                                                              textInputAction: TextInputAction.next,

                                                                            ),

                                                                        ),
                                                                      ),

                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10.sp,
                                                                ),
                                                                Visibility(
                                                                  visible: validemail,
                                                                  child: Container(
                                                                    child: Text(
                                                                      "Email required or please enter valid email.",
                                                                      style: TextStyle(
                                                                        color: Colors.red,

                                                                      ),

                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,

                                                                        child: Container(
                                                                          height: 25.sp,
                                                                          width: 25.sp,
                                                                          child: Image(
                                                                            image: AssetImage('assets/images/contact-gray.png'),
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Expanded(
                                                                      flex: 9,
                                                                      child: Neumorphic(
                                                                        margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                                                                        style: NeumorphicStyle(
                                                                            depth: NeumorphicTheme.embossDepth(context),
                                                                            boxShape: NeumorphicBoxShape.stadium(),
                                                                            color: Colors.white
                                                                        ),
                                                                        //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                                                        child: Container(
                                                                          padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                                                                          height: 50.sp,


                                                                            child: TextFormField(
                                                                              enabled:regph,
                                                                              keyboardType: TextInputType.number,
                                                                              inputFormatters: <TextInputFormatter>[
                                                                                FilteringTextInputFormatter.digitsOnly],
                                                                              controller: regphnoController,

                                                                              validator: (regphvalue) {

                                                                                if (regphvalue!.length< 10 || regphvalue.length> 13 ){
                                                                                  showvalidph();
                                                                                }
                                                                                else{
                                                                                  hidevalidph();
                                                                                }

                                                                              },


                                                                              decoration: InputDecoration(
                                                                                border: InputBorder.none,
                                                                                //  filled: true,
                                                                                fillColor: Colors.white70,

                                                                                hintText: 'Phone number',

                                                                              ),
                                                                              textInputAction: TextInputAction.next,
                                                                            ),

                                                                        ),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                Container(
                                                                  height: 10.sp,
                                                                ),
                                                                Visibility(
                                                                  visible: validph,
                                                                  child: Container(
                                                                    child: Text(
                                                                      "Phone number required or enter valid phone number.",
                                                                      style: TextStyle(
                                                                        color: Colors.red,

                                                                      ),

                                                                    ),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                        flex: 1,
                                                                        child: Container(
                                                                          height: 25.sp,
                                                                          width: 25.sp,
                                                                          child: Image(
                                                                            image: AssetImage('assets/images/lock-gray.png'),
                                                                          ),
                                                                        )
                                                                    ),
                                                                    Expanded(
                                                                      flex: 9,



                                                                        child: Neumorphic(
                                                                          margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
                                                                          style: NeumorphicStyle(
                                                                              depth: NeumorphicTheme.embossDepth(context),
                                                                              boxShape: NeumorphicBoxShape.stadium(),
                                                                              color: Colors.white
                                                                          ),
                                                                          //  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                                                          child: Container(
                                                                            height: 45.sp,
                                                                            padding: EdgeInsets.only(left: 10.sp,right: 10.sp,top: 1.sp,bottom: 1.sp),
                                                                            child: TextFormField(
                                                                              enabled:regpwd,
                                                                              obscureText: !_regpasswordVisible,
                                                                              controller: regpasswordController,
                                                                              validator: (regpwdvalue) {
                                                                                if (regpwdvalue!.isEmpty) {
                                                                                  showvalidpwd();
                                                                                }
                                                                                else if (regpwdvalue.length < 6 ){
                                                                                  showvalidpwd();
                                                                                }
                                                                                else{
                                                                                  hidevalidpwd();
                                                                                }
                                                                              },
                                                                              decoration: InputDecoration(

                                                                                  border: InputBorder.none,
                                                                                  hintText: 'Password',

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
                                                                              onFieldSubmitted: (value) async {
                                                                                if (_regformKey.currentState!.validate()) {

                                                                                  if(selectedbox==true){
                                                                                    hideWidget();

                                                                                    try {
                                                                                      String name = regnameController.text.toString();
                                                                                      String lastnames=regnameController.text.toString().trim();
                                                                                      if(name.contains(" ")){
                                                                                        final dateList = name.split(" ");
                                                                                        print( dateList[1]);
                                                                                        String firstname=dateList[0];
                                                                                        String lastname=lastnames.substring(lastnames.lastIndexOf(" ")+1);
                                                                                        print(firstname);
                                                                                        print(lastname);
                                                                                        var rng = new Random();
                                                                                        var randomno = rng.nextInt(9000) + 1000;
                                                                                        Getreguserresponse resp=
                                                                                        await context.read(apiClientProvider).createUser(
                                                                                            Reguser(
                                                                                                firstname+randomno.toString(), firstname,lastname,regemailController.text,regphnoController.text,regpasswordController.text,"1"
                                                                                            )
                                                                                        );
                                                                                        //    print("Regions: ${resp.data.toJson()}");
                                                                                        showregsucesswidget();
                                                                                        /*ScaffoldMessenger.of(context).showSnackBar(
                                                                        SnackBar(content: Text("Your registration is successfull.Please login with your credentials")),
                                                                      );*/
                                                                                        clearregtext();
                                                                                        hideerrorWidget();
                                                                                        hidewidget();
                                                                                      }
                                                                                      else{
                                                                                        var rng = new Random();
                                                                                        var randomno = rng.nextInt(9000) + 1000;
                                                                                        String firstname=name;
                                                                                        print(firstname);

                                                                                        Getreguserresponse resp=
                                                                                        await context.read(apiClientProvider).createUser(
                                                                                            Reguser(
                                                                                                firstname+randomno.toString(), firstname,"",regemailController.text,regphnoController.text,regpasswordController.text,"1"
                                                                                            )
                                                                                        );
                                                                                        //  print("Regions: ${resp.data.toJson()}");
                                                                                        showregsucesswidget();

                                                                                        clearregtext();
                                                                                        hideerrorWidget();
                                                                                        hidewidget();
                                                                                        //print( date);
                                                                                      }





                                                                                    } catch (e) {
                                                                                      print(e);
                                                                                      if (e is DioError) {

                                                                                        showidget();
                                                                                        clearregtext();
                                                                                        hideregsucesswidget();
                                                                                        /*ScaffoldMessenger.of(context).showSnackBar(
                                                                          SnackBar(content: Text('Email/Phone is already exists')),
                                                                        );*/

                                                                                        //handle DioError here by error type or by error code

                                                                                      } else {

                                                                                      }

                                                                                    }
                                                                                  }
                                                                                  else if(selectedbox==false){
                                                                                    print(selectedbox);
                                                                                    showWidget();
                                                                                    checkvalue="Please check I am agree with privacy policy,terms and conditions.";

                                                                                  }

                                                                                  // If the form is valid, display a snackbar. In the real world,
                                                                                  // you'd often call a server or save the information in a database.



                                                                                }
                                                                              },
                                                                              textInputAction: TextInputAction.done,
                                                                            ),
                                                                          ),
                                                                        ),

                                                                    )
                                                                  ],
                                                                ),
                                                                Visibility(
                                                                  visible: validpwd,
                                                                  child: Container(
                                                                    child: Text(
                                                                      "Password required or enter minimum 6 character.",
                                                                      style: TextStyle(
                                                                        color: Colors.red,

                                                                      ),

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
                                                                  onTap: (selected) {
                                                                    print(selected);
                                                                    selectedbox=selected! ;
                                                                    //hideWidget();
                                                                  },

                                                                  // isChecked: roundcheckboxselection,
                                                                  animationDuration: Duration(
                                                                    milliseconds: 50,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 2.sp,

                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  showDialog(
                                                                      context: context,
                                                                      builder: (context){
                                                                        return Dialog(

                                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                                          elevation: 16,
                                                                          child: SingleChildScrollView(
                                                                            child: Container(
                                                                              width: 500.sp,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                                                                gradient: LinearGradient(
                                                                                    begin: Alignment.topLeft,
                                                                                    end: Alignment.bottomRight,
                                                                                    colors: <Color> [
                                                                                      Color(0xFF2b2b49),
                                                                                      Color(0xFF0d2561),
                                                                                      Color(0xFF005890),
                                                                                      Color(0xFF0071a6),





                                                                                    ],
                                                                                    tileMode: TileMode.repeated
                                                                                ),
                                                                              ),

                                                                              child: Column(
                                                                                children: [
                                                                                  Container(

                                                                                    padding: EdgeInsets.all(20.sp),
                                                                                    height: 500.sp,
                                                                                    width: 500.sp,
                                                                                    child: ContainedTabBarView(
                                                                                      tabs: [
                                                                                        Container(
                                                                                          decoration: BoxDecoration(

                                                                                          ),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(

                                                                                            ),
                                                                                            child: Text(
                                                                                              ' Privacy Policy ',
                                                                                              textAlign: TextAlign.center,

                                                                                              style: TextStyle(
                                                                                                fontWeight: FontWeight.bold,
                                                                                                // fontSize: 10.sp
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          ' Terms and Conditions ',
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            //  fontSize: 10.sp
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                      tabBarProperties: TabBarProperties(
                                                                                        width: 300.sp,
                                                                                        height: 40.sp,
                                                                                        background: Container(
                                                                                          width: 300.sp,
                                                                                          height: 40.sp,
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
                                                                                          color: Color(0xFF29AAE1),
                                                                                        ),
                                                                                        indicatorColor: Colors.transparent,
                                                                                        labelColor: Colors.white,
                                                                                        unselectedLabelColor: Colors.grey[400],
                                                                                      ),
                                                                                      views: [
                                                                                        Container(
                                                                                          padding: EdgeInsets.all(10.sp),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              children: [
                                                                                                FutureBuilder<GetTerms>(
                                                                                                  future: privacypolicy,
                                                                                                  builder: (context, snapshot) {
                                                                                                    if (snapshot.hasData) {
                                                                                                      return Html(
                                                                                                        data: snapshot.data!.data.pageContent,



                                                                                                      );
                                                                                                    } else if (snapshot.hasError) {
                                                                                                      return Text('${snapshot.error}');
                                                                                                    }

                                                                                                    // By default, show a loading spinner.
                                                                                                    return const CircularProgressIndicator();
                                                                                                  },
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Container(
                                                                                          padding: EdgeInsets.all(10.sp),
                                                                                          child: SingleChildScrollView(
                                                                                            child: Column(
                                                                                              children: [
                                                                                                FutureBuilder<GetTerms>(
                                                                                                  future: futureAlbum,
                                                                                                  builder: (context, snapshot) {
                                                                                                    if (snapshot.hasData) {
                                                                                                      return Html(
                                                                                                        data: snapshot.data!.data.pageContent,



                                                                                                      );
                                                                                                    } else if (snapshot.hasError) {
                                                                                                      return Text('${snapshot.error}');
                                                                                                    }

                                                                                                    // By default, show a loading spinner.
                                                                                                    return const CircularProgressIndicator();
                                                                                                  },
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      ],

                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    padding: EdgeInsets.all(10.sp),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      //crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          "Got it",
                                                                                          textAlign: TextAlign.center,
                                                                                          style: TextStyle(
                                                                                              color: Color(0xFFFFFFFF),
                                                                                              fontSize: 20.sp


                                                                                          ),

                                                                                        ),
                                                                                        Container(
                                                                                          width: 20.sp,
                                                                                        ),
                                                                                        GestureDetector(
                                                                                          onTap: (){
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Container(
                                                                                              width: 40,
                                                                                              height: 40,

                                                                                              decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                  boxShadow: [
                                                                                                    BoxShadow(
                                                                                                      color: Colors.white,
                                                                                                      blurRadius: 2,
                                                                                                      spreadRadius: 1,
                                                                                                      offset: Offset(-1, 0),
                                                                                                    ),
                                                                                                    BoxShadow(
                                                                                                      color: Colors.grey.shade400,
                                                                                                      blurRadius: 2.0,
                                                                                                      spreadRadius: 0.0,
                                                                                                      offset: Offset(2.0, 0.0), // changes position of shadow
                                                                                                    ),
                                                                                                  ],
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
                                                                                              child:Center(
                                                                                                child: SizedBox(
                                                                                                  width: 20,
                                                                                                  height: 20,
                                                                                                  child: Image(image: AssetImage(
                                                                                                      'assets/images/ticknew.png'
                                                                                                  ),
                                                                                                  ),
                                                                                                ),
                                                                                              )

                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                    ),
                                                                                  )
                                                                                ],

                                                                              ),

                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                  );
                                                                },
                                                                child: Text.rich(
                                                                  TextSpan(
                                                                    text: "I'm agree with ",

                                                                    style: TextStyle(
                                                                      color: Colors.white,
                                                                      //   fontSize: 15.sp
                                                                    ),
                                                                    children: <TextSpan>[
                                                                      TextSpan(
                                                                          text: 'Privacy policy ',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            decoration: TextDecoration.underline,
                                                                            decorationColor: Colors.white,
                                                                            decorationThickness: 2,
                                                                          )),
                                                                      TextSpan(
                                                                          text: 'terms and conditions',
                                                                          style: TextStyle(
                                                                            color: Colors.white,
                                                                            decoration: TextDecoration.underline,
                                                                            decorationColor: Colors.white,
                                                                            decorationThickness: 2,
                                                                          )),
                                                                      // can add more TextSpans here...
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),


                                                            ],
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: viewVisible,
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                checkvalue,
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    color:  Color(0xFFFF4500),
                                                                    fontSize: 14.sp
                                                                ),

                                                              ),
                                                            ],

                                                          ),
                                                        ),
                                                        Container(
                                                          height: 10.sp,

                                                        ),
                                                        Container(
                                                          child: ButtonTheme(
                                                            minWidth: 182.sp,
                                                            height: 63.sp,
                                                            shape: new RoundedRectangleBorder(
                                                              borderRadius: new BorderRadius.circular(40.sp),
                                                            ),
                                                            child: RaisedButton(

                                                              onPressed: () async {

                                                                if (_regformKey.currentState!.validate()) {

                                                                  if(selectedbox==true){
                                                                    hideWidget();

                                                                    try {
                                                                      String name = regnameController.text.toString();
                                                                      String lastnames=regnameController.text.toString().trim();
                                                                      if(name.contains(" ")){
                                                                        final dateList = name.split(" ");
                                                                        print( dateList[1]);
                                                                        String firstname=dateList[0];
                                                                        String lastname=lastnames.substring(lastnames.lastIndexOf(" ")+1);
                                                                        print(firstname);
                                                                        print(lastname);
                                                                        var rng = new Random();
                                                                        var randomno = rng.nextInt(9000) + 1000;
                                                                        Getreguserresponse resp=
                                                                        await context.read(apiClientProvider).createUser(
                                                                            Reguser(
                                                                                firstname+randomno.toString(), firstname,lastname,regemailController.text,regphnoController.text,regpasswordController.text,"1"
                                                                            )
                                                                        );
                                                                        //    print("Regions: ${resp.data.toJson()}");
                                                                        showregsucesswidget();
                                                                        /*ScaffoldMessenger.of(context).showSnackBar(
                                                                        SnackBar(content: Text("Your registration is successfull.Please login with your credentials")),
                                                                      );*/
                                                                        clearregtext();
                                                                        hideerrorWidget();
                                                                        hidewidget();
                                                                      }
                                                                      else{
                                                                        var rng = new Random();
                                                                        var randomno = rng.nextInt(9000) + 1000;
                                                                        String firstname=name;
                                                                        print(firstname);

                                                                        Getreguserresponse resp=
                                                                        await context.read(apiClientProvider).createUser(
                                                                            Reguser(
                                                                                firstname+randomno.toString(), firstname,"",regemailController.text,regphnoController.text,regpasswordController.text,"1"
                                                                            )
                                                                        );
                                                                        //  print("Regions: ${resp.data.toJson()}");
                                                                        showregsucesswidget();

                                                                        clearregtext();
                                                                        hideerrorWidget();
                                                                        hidewidget();
                                                                        //print( date);
                                                                      }





                                                                    } catch (e) {
                                                                      print(e);
                                                                      if (e is DioError) {

                                                                        showidget();
                                                                        clearregtext();
                                                                        hideregsucesswidget();
                                                                        /*ScaffoldMessenger.of(context).showSnackBar(
                                                                          SnackBar(content: Text('Email/Phone is already exists')),
                                                                        );*/

                                                                        //handle DioError here by error type or by error code

                                                                      } else {

                                                                      }

                                                                    }
                                                                  }
                                                                  else if(selectedbox==false){
                                                                    print(selectedbox);
                                                                    showWidget();
                                                                    checkvalue="Please check I am agree with privacy policy,terms and conditions.";

                                                                  }

                                                                  // If the form is valid, display a snackbar. In the real world,
                                                                  // you'd often call a server or save the information in a database.



                                                                }
                                                              },

                                                              color: Color(0xFF29AAE1),
                                                              child: Text("Sign Up",
                                                                style: TextStyle(
                                                                  color: Colors.white,

                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 10.sp,
                                                        ),
                                                        Visibility(
                                                          visible: viewreg,
                                                          child: Text("Email/Phone/Username is already exists",
                                                            style: TextStyle(
                                                              color:  Color(0xFFFF4500),

                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: viewregsucess,
                                                          child: Text("Your registration is successfull.Please login with your creadentials.",
                                                            style: TextStyle(
                                                              color: Colors.white,

                                                            ),
                                                          ),
                                                        ),


                                                      ],

                                                    ),
                                                  ),
                                                ),

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

 /* void validateMobile(String? regphvalue) {
    if (regphvalue!.length< 10 || regphvalue!.length> 13 ){
      showvalidph();
    }
    else{
      hidevalidph();
    }
    *//* if(regphvalue.le5 && regphvalue! < 100) {
      showvalidph();
    }
    else{
      hidevalidph();
    }*//*

  }*/
  Future<Getchangepwdresponse>  frgtpwd() async {
    //print(fname);
    final response = await http.post(
      Uri.parse('https://us-central1-emazebrain-5cf9b.cloudfunctions.net/app/user/forgot-password'),
      headers: <String, String>{
        //  "Access-Control-Allow-Origin": "*",
        // 'Authorization': 'Bearer '+token!,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, String>{
        'email': forgotemailController.text,
        'type': "1",

      }
      ),

    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      Map<String, dynamic> data = json.decode(response.body);
      print(data["message"]);
      message=data["message"];
      forgotemailController.clear();
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 2,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );
      return Getchangepwdresponse.fromJson(jsonDecode(response.body));


    } else {
      Fluttertoast.showToast(
          msg: "User id not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception();
    }
  }

  void validatepwd(String? regpwdvalue) {
    if (regpwdvalue!.length < 6 ){
      Fluttertoast.showToast(
          msg: "Password should be 6 charecters",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 10,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
          webPosition: "center"
      );

    }
    else{

    }
  }

  void showvalidemailtoast() {
    Fluttertoast.showToast(
        msg: "Email required or please enter valid email address",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
        webPosition: "center"
    );
  }

  Future<Getresp> getuserdetails(String token, int user_id) async {
    final response = await http.post(
      Uri.parse(Constants.baseurl+'user/details'),
      headers: <String, String>{
        // "Access-Control-Allow-Origin": "*",
        'Authorization': 'Bearer '+token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(<String, int>{
        'user_id': user_id,
      }),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      Map<String, dynamic> data = json.decode(response.body);
      print(data["data"]["usr_first_name"]);
      SharedPreferences pref = await SharedPreferences.getInstance();
      String userfname=data["data"]["usr_first_name"];
      pref.setString('userfname', userfname);
      String usr_last_name=data["data"]["usr_last_name"];
      pref.setString('usr_last_name', usr_last_name);
      String usr_user_name=data["data"]["usr_user_name"];
      pref.setString('usr_user_name', usr_user_name);
      String usr_email=data["data"]["usr_email"];
      pref.setString('usr_email', usr_email);
      String usr_phone=data["data"]["usr_phone"];
      pref.setString('usr_phone', usr_phone);
      String usr_birth_date=data["data"]["usr_birth_date"];
      pref.setString('usr_birth_date', usr_birth_date);
      String usr_gender=data["data"]["usr_gender"];
      pref.setString('usr_gender', usr_gender);
      String usr_language=data["data"]["usr_language"];
      pref.setString('usr_language', usr_language);
      String usr_profile_image=data["data"]["usr_profile_image"];
      pref.setString('usr_profile_image', usr_profile_image);
      Navigator.pushNamed(context, 'patient/profile');

      return Getresp.fromJson(jsonDecode(response.body));
      // Navigator.pushNamed(context, 'patient/profile');

    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }



}