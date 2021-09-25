import 'package:demo_edu_ir/Exam_Folder/quizpage.dart';
import 'package:demo_edu_ir/Home_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class homepage extends StatefulWidget {
  const homepage({Key key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> images = [
    "images/python.png",
    "images/java.png",
    "images/javascript.png",
    "images/c++.png",
    "images/linux.png",
  ];

  Widget customCard(String langname, String image) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => getjson(),
          ));
        },
        child: Material(
          color: Colors.redAccent,
          elevation: 10.0,
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        child: ClipOval(
                          child: Image(
                            fit: BoxFit.contain,
                            image: AssetImage(image),
                          ),
                        ),
                      )),
                ),
                Center(
                  child: Text(
                    langname,
                    style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontFamily: "Alike",
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Random description",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontFamily: "Alike"),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new Scaffold(
        appBar: AppBar(
          title: Text(
            "Exam",
            style: TextStyle(fontFamily: "Quando"),
          ),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView(
          children: <Widget>[
            customCard("Python", images[0]),
            customCard("java", images[1]),
            customCard("javascript", images[2]),
            customCard("C++", images[3]),
            customCard("Linux", images[4]),
          ],
        ),
      ),
    );
  }
}
