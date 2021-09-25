import 'package:flutter/material.dart';

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Image Fit ScaleDown",
      home: new Scaffold(
          appBar: AppBar(
            title: Text("Image Fit ScaleDown"),
          ),
          body: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Original Image:",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Image.asset(
                      "assets/image1.jpg",
                    ),
                    Divider(),
                    Text(
                      "Fit Image:",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(border: Border.all()),
                      height: 400,
                      width: 300,
                      child: Image.asset(
                        "assets/image2.jpg",
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
