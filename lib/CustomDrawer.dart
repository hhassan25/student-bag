import 'package:demo_edu_ir/Exam_Folder/Exams.dart';
import 'package:demo_edu_ir/calculator.dart';
import 'package:demo_edu_ir/lessons.dart';
import 'package:demo_edu_ir/main.dart';
import 'package:flutter/material.dart';
import 'package:demo_edu_ir/Home_Page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.redAccent,
      width: mediaQuery.size.width * 0.60,
      height: mediaQuery.size.height,
      child: ListView(
        children: <Widget>[
          Container(
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "assets/logo.jpeg",
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.book,
              color: Colors.white,
            ),
            title: Text(
              "My Lessons",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Lessons()));
            },
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.bookmark,
              color: Colors.white,
            ),
            title: Text(
              "Exams",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new Exams()));
            },
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.calculate_rounded,
              color: Colors.white,
            ),
            title: Text(
              "Calculator",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new UISample4()));
            },
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            title: Text("Badges", style: TextStyle(color: Colors.white)),
          ),
          Divider(
            height: 1,
            color: Colors.white,
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            title: Text("Log Out", style: TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              logOut(context);
            },
          ),
        ],
      ),
    );
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
