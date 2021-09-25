import 'package:demo_edu_ir/Exam_Folder/splash.dart';
import 'package:demo_edu_ir/Home_Page.dart';
import 'package:flutter/material.dart';

class Exams extends StatefulWidget {
  const Exams({Key key}) : super(key: key);

  @override
  _ExamsState createState() => _ExamsState();
}

class _ExamsState extends State<Exams> {
  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Exam",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: splashscreen(),
      ),
    );
  }
}
