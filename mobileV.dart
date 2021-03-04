import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scan_it_a/constant.dart';
import 'package:scan_it_a/login_page.dart';
import 'package:scan_it_a/otpV.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class MobileValidation extends StatefulWidget {
  @override
  _MobileValidationState createState() => _MobileValidationState();
}

class _MobileValidationState extends State<MobileValidation> {
  final formKey = GlobalKey<FormState>();

  TextEditingController phoneController = TextEditingController();
  String number = " ";
  String s = " ";
  String countryCode = "+91";
  // String body = ' ';
      // '{"status_code":"200","message":"OTP Sent successfully","otp":{"mobile":"+917003465016","otp":4716,"updated_at":"2021-02-23T11:19:15.000000Z","created_at":"2021-02-23T11:19:15.000000Z","id":23}}';
  //
  Future registerMobile(String phone) async {
    // print("called");
    final url = "http://13.234.232.207/bioSecurity/public/api/registerMobile";
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode({"mobile": phone}),
    );
    print(url);
    print(response.statusCode);
    print(response.body);
    Map<String, dynamic> res1 = json.decode(response.body);
    print(res1["otp"]["otp"]);
    print(res1["otp"]["id"]);
    s = res1["otp"]["id"].toString();
    print(s);
    // if (response.statusCode == 200) {
    //   print(response);
    //   // }
    // }
    // print(response.statusCode);
  }

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> res1 = json.decode(body);
    // print(res1["otp"]["otp"]);
    // print(res1["otp"]["id"]);
    // String s = res1["otp"]["id"].toString();
    // print(s);

    return Scaffold(
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
                      fontSize: 30.0,
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
                          'Phone',
                          style: kLabelStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.centerLeft,
                          decoration: kBoxDecorationStyle,
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                              ),
                              CountryCodePicker(
                                initialSelection:
                                    'IN', //when app start default show
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                favorite: ['+91', 'IN'],
                                enabled: true,
                                hideMainText: false, //only flag show
                                showFlagMain: true, // only code
                                hideSearch: true, // country not searchable
                                onChanged: (value) {
                                  setState(() {
                                    countryCode = value.dialCode;
                                  });
                                },
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                              ),
                              Expanded(
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: phoneController,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  maxLength: 10,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: InputDecoration(
                                    counterText: " ",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.only(top: 50),
                                    // prefixIcon: Padding(
                                    //   padding: EdgeInsets.only(top: 20),
                                    //   child: Icon(
                                    //     Icons.phone,
                                    //     color: Colors.white,
                                    //   ),
                                    // ),
                                    // prefixIcon: Icon(
                                    //   Icons.phone,
                                    //   color: Colors.white,
                                    // ),
                                    // prefixText: "+91 ",
                                    prefixStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                    hintText: 'Enter your Number',
                                    hintStyle: kHintTextStyle,
                                  ),
                                  // onChanged: (text) {
                                  //   setState(() {
                                  //     number = text;
                                  //     print(number);
                                  //   });
                                  // },
                                  validator: (String t) {
                                    if (t.length != 10)
                                      return "Invalid Mobile Number";
                                    else
                                      setState(() {
                                        number = t;
                                      });
                                    return null;
                                  },
                                  // onSaved: (val) => number = val,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 25,
                          ),
                          width: double.infinity,
                          child: RaisedButton(
                            elevation: 5,
                            onPressed: () async {
                              String phone = phoneController.text;
                              phone = countryCode + phone;
                              print(phone);
                              var res = await registerMobile(phone);
                              print(res);
                              print('Welcome');

                              if (formKey.currentState.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => OTPScreen(id: s,
                                              mobileNumber: number,
                                            )));
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
                              'Continue',
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
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '-OR-',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Already have an account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 25,
                        ),
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 5,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
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
                              letterSpacing: 1.5,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
