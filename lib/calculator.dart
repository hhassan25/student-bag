import 'package:demo_edu_ir/Home_Page.dart';
import 'package:demo_edu_ir/main.dart';
import 'package:flutter/material.dart';

class UISample4 extends StatefulWidget {
  @override
  UISample4State createState() => UISample4State();
}

class UISample4State extends State<UISample4> {
  String Num1 = "";
  String Num2 = "";
  String Operand = "";
  String Result = "0";

  void DotError() {
    AlertDialog dialog = new AlertDialog(
        content: Text("Maximum Dot(.) Reached!",
            style: TextStyle(color: Colors.redAccent)));
    showDialog(context: context, child: dialog);
  }

  buttonPressed(String s) {
    if (s == "CLEAR") {
      setState(() {
        Num1 = "";
        Num2 = "";
        Result = "0";
        Operand = "";
      });
    } else if (s == "+" || s == "-" || s == "x" || s == "/") {
      setState(() {
        if (Num1 != "") {
          Operand = s;
          if (Result != "0") {
            Num1 = Result;
            Num2 = "";
            Result = "0";
          }
        } else {
          AlertDialog dialog = new AlertDialog(
              content: Text(
            "Select A Number First!",
            style: TextStyle(color: Colors.redAccent),
          ));
          showDialog(context: context, child: dialog);
        }
      });
    } else if (s == "=") {
      setState(() {
        if (Operand == "+") {
          Result = (double.parse(Num1) + double.parse(Num2)).toString();
        } else if (Operand == "-") {
          Result = (double.parse(Num1) - double.parse(Num2)).toString();
        } else if (Operand == "/") {
          Result = (double.parse(Num1) / double.parse(Num2)).toString();
        } else if (Operand == "x") {
          Result = (double.parse(Num1) * double.parse(Num2)).toString();
        }
        Operand = "";
      });
    } else {
      setState(() {
        if (Operand == "") {
          if (s == ".") {
            if (Num1.contains('.')) {
              DotError();
            } else {
              Num1 = Num1 + s;
            }
          } else {
            Num1 = Num1 + s;
          }
        } else {
          if (s == ".") {
            if (Num2.contains('.')) {
              DotError();
            } else {
              Num2 = Num2 + s;
            }
          } else {
            Num2 = Num2 + s;
          }
        }
      });
    }
  }

  Widget buildElement(String s) {
    return Expanded(
      child: RaisedButton(
        shape: BeveledRectangleBorder(
            side: BorderSide(
          color: Colors.redAccent,
          width: 1,
        )),
        color: Colors.white,
        child: Text(
          s,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textColor: Colors.redAccent,
        padding: EdgeInsets.all(25.0),
        onPressed: () => buttonPressed(s),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Calculator'),
            backgroundColor: Colors.redAccent,
          ),
          body: SingleChildScrollView(
              child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: Text(Num1,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  height: 30,
                  alignment: Alignment.centerLeft,
                  child: Text(Operand,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: Text(Num2,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Divider(color: Colors.white),
                Container(
                  height: 30,
                  alignment: Alignment.centerRight,
                  child: Text(Result,
                      style: TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    buildElement('7'),
                    buildElement('8'),
                    buildElement('9'),
                    buildElement("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildElement('4'),
                    buildElement('5'),
                    buildElement('6'),
                    buildElement("x"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildElement('1'),
                    buildElement('2'),
                    buildElement('3'),
                    buildElement("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildElement('.'),
                    buildElement('0'),
                    buildElement('00'),
                    buildElement("+"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildElement("CLEAR"),
                    buildElement("="),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
