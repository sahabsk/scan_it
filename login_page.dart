import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:scan_it_a/constant.dart';
import 'package:scan_it_a/dashboard.dart';
import 'package:scan_it_a/forgotPassword.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  final String id;

  const LoginScreen({Key key, this.id}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool rememberMe = false;

  String uemail = " ";
  String upassword = " ";

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();



  Future login(String email, password) async {
    final String url = "http://13.234.232.207/bioSecurity/public/api/login";
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    print(url);
    print(response.statusCode);
    // print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      Map<String, dynamic> res = json.decode(response.body);
      if (res["status_code"] == "200") {
        print(res["id"]);
        String r = res["id"].toString();
        return r;
      } else
        return null;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 120,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Email',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          height: 60,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              hintText: 'Enter your Email',
                              hintStyle: kHintTextStyle,
                            ),
                            onChanged: (text) {
                              setState(() {
                                uemail = text;
                              });
                              print(uemail);
                            },
                            validator: (String email) {
                              Pattern pattern =
                                  r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
                              RegExp regex = RegExp(pattern);

                              if (!regex.hasMatch(email))
                                return "Invalid Email";
                              else
                                return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              decoration: kBoxDecorationStyle,
                              height: 60,
                              child: TextFormField(
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                controller: passController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your Password',
                                  hintStyle: kHintTextStyle,
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    upassword = text;
                                  });
                                },
                                validator: (String pass) {
                                  Pattern pattern =
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                  RegExp regex = RegExp(pattern);

                                  if (!regex.hasMatch(pass))
                                    return "Must contain uppercase, lowercase, number and special character";
                                  else
                                    return null;
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgotPassword()));
                      },
                      padding: EdgeInsets.only(right: 0.0),
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: rememberMe,
                            checkColor: Colors.green,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Remember me',
                          style: kLabelStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    width: double.infinity,

                    child: RaisedButton(
                      elevation: 5,
                      onPressed: () async {
                        print(emailController.text);
                        print(passController.text);
                        var res = await login(uemail, upassword);
                        print(res);
                        if (res != null) {
                          final snackBar = SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.thumb_up),
                                Expanded(
                                  child: Text('Congrats!  You are logged In..'),
                                )
                                // Text('Congrats!  You are logged In..'),
                              ],
                            ),
                            duration: Duration(seconds: 10),
                            // action: SnackBarAction(
                            //   label: 'Undo',
                            //   onPressed: () {},
                            // ),
                          );
                          scaffoldKey.currentState.showSnackBar(snackBar);
                          print("Logged In");

                          if (formKey.currentState.validate()) {

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                          }
                        }
                        else {
                          final snackBar = SnackBar(
                            content: Text(
                                'Please enter correct e-mail and password..'),
                            duration: Duration(seconds: 3),
                            // action: SnackBarAction(
                            // label: 'Undo',
                            // onPressed: () {},
                            // ),
                          );
                          scaffoldKey.currentState.showSnackBar(snackBar);

                          print("Not Allowed");
                        }
                        // if (formKey.currentState.validate()) {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => Dashboard()));
                        // }
                      },
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      color: Colors.white,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFF527DAA),
                          fontSize: 20,
                          fontFamily: 'OpenSans',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
