import 'package:demo_edu_ir/Exam_Folder/home.dart';
import 'package:flutter/material.dart';

class resultpage extends StatefulWidget {
  int marks;
  resultpage({Key key, @required this.marks}) : super(key: key);

  @override
  _resultpageState createState() => _resultpageState(marks);
}

class _resultpageState extends State<resultpage> {
  List<String> images = [
    "images/success.png",
    "images/good.png",
    "images/bad.png",
  ];

  String message;
  String image;

  @override
  void initState() {
    if (marks < 20) {
      image = images[2];
      message = "You should try hard..\n" + "you scored $marks";
    } else if (marks < 35) {
      image = images[1];
      message = "You can do better..\n" + "you scored $marks";
    } else {
      image = images[0];
      message = "You did very well..\n" + "you scored $marks";
    }
    super.initState();
  }

  int marks;
  _resultpageState(this.marks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Material(
              elevation: 10.0,
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      child: Container(
                        width: 300.0,
                        height: 300.0,
                        child: ClipRRect(
                          child: Image(
                            image: AssetImage(image),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                      child: Center(
                        child: Text(
                          message,
                          style:
                              TextStyle(fontFamily: "Quando", fontSize: 20.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => homepage()));
                  },
                  child: Text(
                    "continue",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  borderSide: BorderSide(width: 5.0, color: Colors.indigo),
                  splashColor: Colors.indigoAccent,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
