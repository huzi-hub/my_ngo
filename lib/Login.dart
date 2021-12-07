// ignore_for_file: unused_import, avoid_unnecessary_containers, sized_box_for_whitespace, deprecated_member_use, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, file_names

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_ngo/main1.dart';
import 'package:my_ngo/ngo_reg.dart';
import 'signup.dart';
import 'nearbyNGOs1.dart';
import 'Home2.dart';
import 'Home1.dart';
import 'Home.dart';
import 'NGOs_appbar.dart';
import 'package:my_ngo/Adminappbar.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                height: 300,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 25,
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: 200,
                        width: 230,
                        child: Image(
                          image: AssetImage(
                            'assets/1.png',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 250,
                  width: 300,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                            fillColor: Colors.blue[800],
                            filled: true,
                            hintText: ('Email'),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      ),
                      SizedBox(height: 40),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            fillColor: Colors.blue[800],
                            filled: true,
                            hintText: ('Password'),
                            hintStyle: TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 60,
                width: 300,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blue[800],
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    LoginUser();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dont Have Acccount?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      child: Text('SignUp')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future LoginUser() async {
    String url = 'https://edonations.000webhostapp.com/api-login.php';
    var data = {
      'email': emailController.text,
      'password': passwordController.text
    };
    var result = await http.post(Uri.parse(url), body: jsonEncode(data));
    var msg = jsonDecode(result.body);
    if (result.statusCode == 200) {
      if (msg[0] != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MyApp1()));
      }
    } else {
      SnackBar(content: Text('Invalid Username or Password!'));
    }
  }
}
