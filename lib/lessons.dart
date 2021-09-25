import 'package:demo_edu_ir/Home_Page.dart';
import 'package:demo_edu_ir/main.dart';
import 'package:demo_edu_ir/pdf_view.dart';
import 'package:demo_edu_ir/videos.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
          context, MaterialPageRoute(builder: (context) => HomePage()));
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
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new Videos(
                      videoPlayerController: VideoPlayerController.network(
                        'https://hadi.yallaproductionz.com/demo_edu_ira/git.mp4',
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
                      "read thid pdf file",
                      style: TextStyle(color: Colors.blue, fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new OutlineButton(
                      child: Text("click here to view pdf file"),
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
                  title: new Text('Step 3'),
                  content: new Text('This is the third step.'),
                  isActive: _currentStep >= 0,
                  state: _currentStep >= 2
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
}
