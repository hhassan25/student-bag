import 'package:demo_edu_ir/CustomDrawer.dart';
import 'package:demo_edu_ir/Users.dart';
import 'package:demo_edu_ir/customDialog.dart';
import 'package:demo_edu_ir/main.dart';
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final String str;

  HomePage({Key key, this.str}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";

  Future getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username');
    });
  }

  String finalDate = '';
  String finalTime = '';

  getCurrentDate() {
    var date = new DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    var formattedDateTime = "${dateParse.hour}:${dateParse.minute}";

    setState(() {
      finalDate = formattedDate.toString();
      finalTime = formattedDateTime.toString();
    });
  }

  Future<List<Users>> fetchUsers() async {
    String url =
        "https://hadi.yallaproductionz.com/demo_edu_ira/select_user.php?username=" +
            '${widget.str}';
    final response = await http.get(url);
    return usersFromJson(response.body);
  }

  FSBStatus drawerStatus;
  Icon MenuIcon = Icon(
    Icons.menu,
    color: Colors.redAccent,
  );
  Color MenuColor = Colors.teal;

  @override
  void initState() {
    getUser();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getCurrentDate();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FoldableSidebarBuilder(
          //drawerBackgroundColor: Colors.teal,
          drawer: CustomDrawer(
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                color: Colors.redAccent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: 10,
                    ),
                    FloatingActionButton(
                        backgroundColor: Colors.white,
                        child: MenuIcon,
                        onPressed: () {
                          setState(() {
                            if (drawerStatus == FSBStatus.FSB_OPEN) {
                              drawerStatus = FSBStatus.FSB_CLOSE;
                              MenuIcon = Icon(
                                Icons.menu,
                                color: Colors.redAccent,
                              );
                              MenuColor = Colors.redAccent;
                            } else {
                              drawerStatus = FSBStatus.FSB_OPEN;
                              MenuIcon = Icon(
                                Icons.close,
                                color: Colors.redAccent,
                              );
                              MenuColor = Colors.red;
                            }
                          });
                        }),
                    Text(
                      "  Welcome",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 30,
                height: 150,
                margin: EdgeInsets.all(20),
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(color: Colors.redAccent, blurRadius: 10)
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Date:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Quando",
                            fontWeight: FontWeight.bold)),
                    Text("$finalDate",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Quando",
                            fontWeight: FontWeight.bold)),
                    Text("Hour:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Quando",
                            fontWeight: FontWeight.bold)),
                    Text("$finalTime",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Quando",
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              FadeAnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  duration: Duration(seconds: 1),
                  onTap: () {
                    print("Tap Event");
                  },
                  text: ["Some of our", "Schools in out", "nice country"],
                  textStyle: TextStyle(
                      fontSize: 30.0,
                      fontFamily: "Satisfy",
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                  textAlign: TextAlign.center,
                  alignment: AlignmentDirectional.center),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                margin: EdgeInsets.all(10),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset(
                      "assets/image1.jpg",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/image2.jpg",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/image3.jpg",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/image4.jpg",
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/image5.jpg",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                  color: Colors.redAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Contact us",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "For more informations",
                        description: "Contact us via:",
                        primaryButtonText: "Email",
                        // primaryButtonRoute: "/Page",
                        secondaryButtonText: "Moblie", primaryButtonRoute: '',
                      ),
                    );
                  }),

              /*Center(
                child: FutureBuilder(
                  future: fetchUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            Users users = snapshot.data[index];
                            return Column(
                              children: [Text('${users.grade}')],
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),*/
            ],
          ),
          status: drawerStatus,
        ),
      ),
    );
  }
}
