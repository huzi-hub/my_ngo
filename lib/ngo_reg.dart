// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, unnecessary_string_interpolations, sized_box_for_whitespace, camel_case_types

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'Login.dart';
import 'signup.dart';

class NGO_Reg extends StatefulWidget {
  @override
  State<NGO_Reg> createState() => _NGO_RegState();
}

class _NGO_RegState extends State<NGO_Reg> {
  String? value;
  final items = ['Karachi', 'Lahore', 'Islamabad', 'Quetta'];
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController cell = TextEditingController();
  final TextEditingController storage = TextEditingController();
  late String city;
  // final listitem = [
  //   'Karchi', 'Lahore', 'Islamabad', 'Quetta', 'Peshawar'
  // ],

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                height: 200,
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'NGOs Registration',
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        height: 130,
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
                  height: 370,
                  width: 300,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildTextFormField('NGOs Name', name),
                        SizedBox(height: 10),
                        buildTextFormField('Email', email),
                        SizedBox(height: 10),
                        buildTextFormField('password', password),
                        SizedBox(height: 10),
                        buildTextFormField('Address', address),
                        SizedBox(height: 10),
                        buildTextFormField('Cell', cell),
                        SizedBox(height: 10),
                        buildTextFormField('storage', storage),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          width: 150,
                          decoration: BoxDecoration(
                              color: Color(0xff8CA1A5),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Container(
                                child: DropdownButton<String>(
                                  hint: Text(
                                    'Select City',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  dropdownColor: Color(0xff8CA1A5),
                                  value: value,
                                  items: items.map(buildMenuItem).toList(),
                                  onChanged: (value) => setState(() {
                                    this.value = value;
                                    city = value.toString();
                                    print(city);
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 06,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.blueGrey,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    register();
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already Have Acccount?'),
                  InkWell(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Color(0xff8CA1A5),
                        fontSize: 15,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField(
      hintname, TextEditingController textController) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
          fillColor: Color(0xff8CA1A5),
          filled: true,
          hintText: hintname,
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          )),
    );
  }

  Future register() async {
    String url = 'https://edonations.000webhostapp.com/api-ngo-reg.php';
    var data = {
      'ngo_name': name.text,
      'email': email.text,
      'password': password.text,
      'address': address.text,
      'contact': cell.text,
      'storage': int.parse(storage.text),
      'city': city
    };
    var result = await http.post(Uri.parse(url), body: jsonEncode(data));
    var msg = jsonDecode(result.body);
    if (msg == 'registered successfully') {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Login()));
    } else {
      SnackBar(content: Text('Not Registered!'));
    }
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
