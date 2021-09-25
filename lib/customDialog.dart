import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDialog extends StatelessWidget {
  final primaryColor = const Color(0xFF75A2EA);
  final grayColor = const Color(0xFF939393);

  final String title,
      description,
      primaryButtonText,
      primaryButtonRoute,
      secondaryButtonText,
      secondaryButtonRoute;

  CustomDialog(
      {@required this.title,
      @required this.description,
      @required this.primaryButtonText,
      @required this.primaryButtonRoute,
      this.secondaryButtonText,
      this.secondaryButtonRoute});

  static const double padding = 20.0;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: [
                  BoxShadow(
                    color: Colors.redAccent,
                    blurRadius: 30.0,
                    offset: const Offset(0.0, 10.0),
                  ),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 24.0),
                Text(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 20.0,
                  ),
                ),
                SizedBox(height: 24.0),
                Text(
                  description,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 17.0,
                  ),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          primaryButtonText,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w200,
                              color: Colors.white),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.email, color: Colors.white),
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchUrlEmail();
                  },
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          secondaryButtonText,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w200,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.phone, color: Colors.white)
                      ],
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _launchUrlCall();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchUrlCall() async {
    const Tel = "tel:";

    if (await canLaunch(Tel)) {
      await launch(Tel);
    } else {
      throw 'could not call';
    }
  }

  _launchUrlEmail() async {
    const Email = "mailto:edapps.contact@gmail.com";

    if (await canLaunch(Email)) {
      await launch(Email);
    } else {
      _launchUrlCall();
    }
  }
}
