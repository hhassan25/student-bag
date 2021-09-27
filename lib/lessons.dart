import 'package:demo_edu_ir/Home_Page.dart';
import 'package:demo_edu_ir/all-lessons-page.dart';
import 'package:demo_edu_ir/main.dart';
import 'package:demo_edu_ir/pdf_view.dart';
import 'package:demo_edu_ir/videos.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Lessons extends StatefulWidget {
  const Lessons({Key key}) : super(key: key);

  @override
  _LessonsState createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  int _currentStep = 0;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => allLessons()));
    }

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Horizontal Stepper',
        home: new Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.redAccent,
              title: new Text(
                'Complete your lessons',
                style: TextStyle(color: Colors.white),
              )),
          body: Theme(
            data: ThemeData(
                backgroundColor: Colors.grey,
                primaryColor: Colors.redAccent,
                colorScheme: ColorScheme.light(primary: Colors.redAccent)),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: _currentStep,
              onStepTapped: (int step) => setState(() => _currentStep = step),
              onStepContinue: _currentStep < 2
                  ? () => setState(() => _currentStep += 1)
                  : null,
              onStepCancel: _currentStep > 0
                  ? () => setState(() => _currentStep -= 1)
                  : null,
              steps: <Step>[
                Step(
                  title: Text('Video'),
                  content: Column(children: [
                    new Text(
                      "you have to watch this video",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "Quando"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Videos(
                      videoPlayerController: VideoPlayerController.network(
                        'https://hadi.yallaproductionz.com/demo_edu_ira/python.mp4',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 0
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('pdf file'),
                  content: Column(children: [
                    new Text(
                      "read this pdf file",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "Quando"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new OutlineButton(
                      child: Text(
                        "click here to view pdf file",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontFamily: "Quando"),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.red,
                      borderSide: BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new pdfView()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
                Step(
                  title: new Text('More About Python'),
                  content: Column(children: [
                    new Text(
                      "Here is a nice link to an app available on both playstore and app store to know more about python",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontFamily: "Quando"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new OutlineButton(
                      child: Text("Get app"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.red,
                      borderSide: BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      onPressed: () {
                        _launchUrl();
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Or you can click the below button to visit in the browser",
                      style: TextStyle(
                          fontFamily: "Quando",
                          color: Colors.blue,
                          fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new OutlineButton(
                      child: Text("Visit site"),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      color: Colors.red,
                      borderSide: BorderSide(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new GooglePage()));
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 1
                      ? StepState.complete
                      : StepState.disabled,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _launchUrl() async {
    const url =
        "https://play.google.com/store/apps/details?id=com.W3school.offline";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }
}

class GooglePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("W3school"),
      ),
      body: WebviewScaffold(
        url: "https://www.w3schools.com/python/default.asp",
        withZoom: false,
        withLocalStorage: true,
        hidden: true,
        initialChild: Center(
            child: Column(
          children: <Widget>[
            SizedBox(
              height: 250,
            ),
            CircularProgressIndicator(),
            SizedBox(
              height: 5,
            ),
            Text("Loading..."),
          ],
        )),
      ),
    );
  }
}
