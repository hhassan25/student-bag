import 'dart:convert';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:demo_edu_ir/Exam_Folder/home.dart';
import 'package:demo_edu_ir/test.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';

import 'Home_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var username = preferences.getString('username');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: username == null ? LoginPage() : homepage(),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash Screen Tutorial",
      home: Scaffold(
        body: SplashScreen(
          seconds: 2,
          navigateAfterSeconds: homepage(),
          title: Text(
            "Splash Screen Tutorial",
          ),
          image: Image.asset("assets/logo.jpeg"),
          photoSize: 175,
          backgroundColor: Colors.white,
          loaderColor: Colors.red,
          loadingText: Text("Getting Page Ready!"),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    var url = "https://hadi.yallaproductionz.com/demo_edu_ira/login.php";
    var response = await http.post(url, body: {
      "username": username.text,
      "password": password.text,
    });

    var data = json.decode(response.body);
    if (data == "error") {
      Dialog dialog2 = new Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "check your username and password",
                    maxLines: 6,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "OK",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: '',
          transitionDuration: Duration(seconds: 1),
          transitionBuilder: (BuildContext context, Animation<double> a1,
                  Animation<double> a2, Widget child) =>
              SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(a1),
                  child: dialog2),
          pageBuilder: (context, anim1, anim2) {
            return Transform.rotate(
              angle: anim1.value,
            );
          });
    } else if (data == "filldata") {
      Dialog dialog4 = new Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.redAccent,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.error,
                      size: 50,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "you have to enter your username and password",
                    maxLines: 6,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  RaisedButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "OK",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
      showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: '',
          transitionDuration: Duration(seconds: 1),
          transitionBuilder: (BuildContext context, Animation<double> a1,
                  Animation<double> a2, Widget child) =>
              SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(a1),
                  child: dialog4),
          pageBuilder: (context, anim1, anim2) {
            return Transform.rotate(
              angle: anim1.value,
            );
          });
    } else {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('username', username.text);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    str: username.text,
                  )));
    }
  }

  static const double padding = 20.0;

  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Center(
          child: Container(
            padding: EdgeInsets.zero,
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.redAccent,
                            Colors.redAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(90))),
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.person_pin,
                              size: 70,
                              color: Colors.white,
                            ),
                            Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Raleway",
                                fontSize: 20,
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 32, right: 32),
                          ),
                        ),
                      ],
                    )),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 59,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.redAccent, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        controller: username,
                        style: TextStyle(color: Colors.redAccent),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.person,
                            color: Colors.redAccent,
                          ),
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 59,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(color: Colors.redAccent, blurRadius: 5)
                          ]),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.redAccent),
                        controller: password,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(
                            Icons.security,
                            color: Colors.redAccent,
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    RaisedButton(
                        color: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Container(
                          width: 100,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              Icon(Icons.login_rounded, color: Colors.white),
                            ],
                          ),
                        ),
                        onPressed: () {
                          login();
                        }),
                    SizedBox(height: 60),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: TyperAnimatedTextKit(
                          onTap: () {
                            print("Tap Event");
                          },
                          text: [
                            "Welcome",
                            "Our Dear Student",
                            "Let's login",
                            "To Start",
                          ],
                          textStyle: TextStyle(
                              fontSize: 30.0,
                              fontFamily: "Bobbers",
                              color: Colors.redAccent),
                          textAlign: TextAlign.center,
                          alignment: AlignmentDirectional.center),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
