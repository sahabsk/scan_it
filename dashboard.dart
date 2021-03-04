import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:scan_it_a/AddFace.dart';
import 'package:scan_it_a/carousel.dart';
import 'login_page.dart';
import 'profile.dart';

class Dashboard extends StatefulWidget {
  final String id;

  const Dashboard({Key key, this.id}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cardWidth = (MediaQuery.of(context).size.width / 2) - 34;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Welcome',
            style: TextStyle(fontSize: 20, color: Colors.black)),
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'User',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                // child: Image.asset('assets/icon/iconP.png'),
                child: Icon(
                  Icons.person,
                  size: 60,
                ),
              ),
              // currentAccountPicture: Icon(
              //   Icons.person,
              //   size: 100,
              // ),
            ),
            Card(
              child: ListTile(
                title: Text('Dashboard',
                    style: TextStyle(
                      fontSize: 20,
                    )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Dashboard()));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (BuildContext context) => AddUser()));
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'About',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()));
                },
              ),
            )
          ],
        ),
      ),
      // body: Center(
      //   child: Text('Welcome to Flutter'),
      // ),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, bottom: 30),
              child: Text(
                'Hello User, Welcome to scan.it',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(carousels[index].image),
                                fit: BoxFit.cover,
                              )),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                          children: map<Widget>(carousels, (index, image) {
                        return Container(
                          alignment: Alignment.centerLeft,
                          height: 8,
                          width: 8,
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  current == index ? Colors.blue : Colors.grey),
                        );
                      })),
                      Text(
                        'More...',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 30),
              child: Text(
                'User Profile',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddFace()));
                          },
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.30,
                            // margin: EdgeInsets.only(right: 8),
                            // padding: EdgeInsets.only(left: 16),
                            height: 54,
                            width: cardWidth,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Image.asset(
                                    'assets/icon/face.png',
                                    // fit: BoxFit.contain,
                                    height: 35,
                                    // color: Colors.blueAccent,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Add Face',
                                        style: TextStyle(
                                            // color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Flexible(
                                        child: Text(
                                          'Face Recognition',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            // margin: EdgeInsets.only(right: 8),
                            // padding: EdgeInsets.only(left: 16),
                            height: 54,
                            width: cardWidth,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Image.asset(
                                    'assets/icon/fingerIcon.png',
                                    // fit: BoxFit.contain,
                                    height: 35,
                                    // color: Colors.blueAccent,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Container(
                                    padding: EdgeInsets.zero,
                                    width: cardWidth - 50,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Add Finger',
                                          style: TextStyle(
                                              // color: Colors.blue,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Flexible(
                                            child: Text(
                                          'Finger Scanning',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 12),
                                        ))
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            // margin: EdgeInsets.only(right: 8),
                            // padding: EdgeInsets.only(left: 16),
                            height: 54,
                            width: cardWidth,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Image.asset(
                                    'assets/icon/iris.png',
                                    // fit: BoxFit.contain,
                                    height: 35,
                                    // color: Colors.blueAccent,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Add Iris',
                                        style: TextStyle(
                                            // color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Flexible(
                                          child: Text(
                                        'Iris Scanning',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) => UserProfile()));
                          },
                          child: Container(
                            // margin: EdgeInsets.only(right: 8),
                            // padding: EdgeInsets.only(left: 16),
                            height: 54,
                            width: cardWidth,
                            decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.black, width: 1),
                            ),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 16),
                                  child: Icon(
                                    Icons.person,
                                    size: 40,
                                    // color: Colors.blueAccent,
                                  ),
                                ),
                                // Image.asset(
                                //   'assets/icon/face.png',
                                //   fit: BoxFit.contain,
                                //   color: Colors.blueAccent,
                                // ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Profile',
                                        style: TextStyle(
                                            // color: Colors.blue,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Flexible(
                                          child: Text(
                                        'View',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 12),
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
