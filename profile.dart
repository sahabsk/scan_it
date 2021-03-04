import 'package:flutter/material.dart';
import 'package:scan_it_a/AddFace.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("User Profile"),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Colors.blue,
                          Colors.blue.withOpacity(0.7)
                        ])),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Face',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )),
                  // Expanded(
                  //   child: Container(
                  //       height: 70,
                  //       width: 100,
                  //       margin: EdgeInsets.only(left: 10),
                  //       decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //             image: AssetImage('assets/image/face1.png'),
                  //             fit: BoxFit.fill,
                  //           ),
                  //           shape: BoxShape.rectangle,
                  //           borderRadius: BorderRadius.circular(10),
                  //           gradient: LinearGradient(colors: [
                  //             Colors.black12,
                  //             Colors.black12.withOpacity(0.7)
                  //           ]))),
                  // ),
                  // Expanded(
                  //   child: Container(
                  //     child: Row(
                  //       children: <Widget>[
                  //         Theme(
                  //           data: ThemeData(unselectedWidgetColor: Colors.white),
                  //           child: Checkbox(
                  //             value: check,
                  //             checkColor: Colors.white,
                  //             activeColor: Colors.green,
                  //             onChanged: (value) {
                  //               setState(() {
                  //                 check = value;
                  //               });
                  //             },
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Colors.blue,
                          Colors.blue.withOpacity(0.7)
                        ])),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Finger',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                    width: 100,
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(colors: [
                          Colors.blue,
                          Colors.blue.withOpacity(0.7)
                        ])),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Iris',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  )),
                ],
              ),
            ],
          ),
        )));
  }
}
