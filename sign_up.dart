import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './constant.dart';
import 'package:scan_it_a/login_page.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  final String id;

  const SignUp({Key key, this.id}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();

  DateTime date = DateTime.now();
  // DateFormat("dd-MM-yyyy").format(DateTime.now());
  String log = " ";


  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  var uName;
  var uUsername;
  var uEmail;
  var uPassword;
  var uAddress;
  var uDateOfBirth;





  Future registerUser(String uName, uUsername,uEmail, uPassword, uAddress, uDateOfBirth) async {
    final url = "http://13.234.232.207/bioSecurity/public/api/registerUser/${widget.id}";
    final response = await http.post(url, headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: json.encode({
      'name': uName,
      'username': uUsername,
      'email':uEmail,
      'password': uPassword,
      'address': uAddress,
      'dateOfBirth': uDateOfBirth

    }),);
    print(url);
    print(response.statusCode);
    print(response.body);
    Map<String, dynamic> res = json.decode(response.body);
    print(res["user"]["id"]);
    log = res["user"]["id"].toString();
    // if (response.statusCode == 200) {
    //   print(response);
    //   // }
    // }
  }



  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1990),
        lastDate: DateTime(2025));
    if (picked != null && picked != date)
      setState(() {
        date = picked;
        dateController.text = date.toString();
        print(date.toString());
      });
    // var format = "${date.day}-${date.month}-${date.year}";
    // print(format);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Name',
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
                            keyboardType: TextInputType.name,
                            controller: nameController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: 'Enter your Name',
                              hintStyle: kHintTextStyle,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Username Required";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Username',
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
                            keyboardType: TextInputType.text,
                            controller: userController,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(top: 14),
                              prefixIcon: Icon(
                                Icons.account_circle,
                                color: Colors.white,
                              ),
                              hintText: 'Enter your Username',
                              hintStyle: kHintTextStyle,
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Pleas Enter username";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Email',
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
                          height: 20,
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
                                // onChanged: (text) {
                                //   setState(() {
                                //     password = text;
                                //   });
                                // },
                                validator: (String pass) {
                                  Pattern pattern =
                                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                                  RegExp regex = RegExp(pattern);

                                  if (!regex.hasMatch(pass))
                                    return "Must contain uppercase, lowercase, number and special character";
                                  else
                                    return null;
                                },
                                // onSaved: (String value){
                                //   password = value;
                                // },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Address',
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
                                keyboardType: TextInputType.streetAddress,
                                controller: addressController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.add_location,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter your Address',
                                  hintStyle: kHintTextStyle,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Enter Address";
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Date of Birth',
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
                                keyboardType: TextInputType.datetime,
                                controller: dateController,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: IconButton(
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                    ),
                                    onPressed: (){
                                      _selectDate(context);
                                    },
                                  ),
                                  hintText: 'Enter your Date of Birth',
                                  hintStyle: kHintTextStyle,
                                ),
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return "Date of Birth Required";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: <Widget>[
                        //     Text(
                        //       'Confirm Password',
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontSize: 15,
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 10,
                        //     ),
                        //     Container(
                        //       alignment: Alignment.centerLeft,
                        //       decoration: BoxDecoration(
                        //           gradient: LinearGradient(
                        //             colors: [
                        //               Color(0xFF73AEF5),
                        //               Color(0xFF61A4F1),
                        //               Color(0xFF478DE0),
                        //               Color(0xFF39BAE5),
                        //             ],
                        //             stops: [0.3, 1.6, 0.7, 2.0],
                        //           ),
                        //           borderRadius: BorderRadius.all(
                        //             Radius.circular(10),
                        //           ),
                        //           boxShadow: [
                        //             BoxShadow(
                        //               offset: Offset(0.1, 0.1),
                        //             )
                        //           ]),
                        //       height: 60,
                        //       child: TextFormField(
                        //         obscureText: true,
                        //         keyboardType: TextInputType.visiblePassword,
                        //         controller: conf_passController,
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 20,
                        //         ),
                        //         decoration: InputDecoration(
                        //           border: InputBorder.none,
                        //           contentPadding: EdgeInsets.only(top: 14),
                        //           prefixIcon: Icon(
                        //             Icons.lock,
                        //             color: Colors.white,
                        //           ),
                        //           hintText: 'Confirm your Password',
                        //         ),
                        //         // onChanged: (text) {
                        //         //   setState(() {
                        //         //     password = text;
                        //         //   });
                        //         // },
                        //         validator: (String value) {
                        //           if (value.isEmpty) {
                        //             return "Please re-enter Password";
                        //           } else if (password == confirm_password) {
                        //             return null;
                        //           }
                        //           return "Password does not match";
                        //         },
                        //         // onChanged: (String value){
                        //         //   confirm_password = value;
                        //         // },
                        //       ),
                        //     ),
                        //     SizedBox(
                        //       height: 40,
                        //     ),
                        //   ],
                        // ),
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
                        uName = nameController.text;
                        print(uName);
                        uUsername = userController.text;
                        print(uUsername);
                        uEmail = emailController.text;
                        print(uEmail);
                        uPassword = passController.text;
                        print(uPassword);
                        uAddress = addressController.text;
                        print(uAddress);
                        uDateOfBirth = dateController.text;
                        print(uDateOfBirth);
                        var res = await registerUser(uName,uUsername,uEmail,uPassword,uAddress,uDateOfBirth);
                        print(res);
                        print('Welcome');
                        if (formKey.currentState.validate()) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        }
                      },
                      padding: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      color: Colors.white,
                      child: Text(
                        'Create',
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
