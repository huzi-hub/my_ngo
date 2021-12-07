// ignore_for_file: file_names,prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_ngo/Services/donorServices.dart';
import 'package:my_ngo/models/donorModel.dart';
import 'Home1.dart';
import 'main1.dart';

void main() {
  runApp(ProfilePic());
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingUI(),
    );
  }
}

class SettingUI extends StatefulWidget {
  const SettingUI({Key? key}) : super(key: key);

  @override
  State<SettingUI> createState() => _SettingUIState();
}

class _SettingUIState extends State<SettingUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EditProfile(),
    );
  }
}

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  List<Donor>? _donors;
  Future<void> getDonor() async {
    DonorData donorsData = DonorData('abc@gmail.com', '12345678');
    await donorsData.getDonors().then((donors) => _donors = donors);
  }

  @override
  void initState() {
    super.initState();
    getDonor();
  }

  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyApp1()));
          },
        ),
        elevation: 2,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 45,
              ),
              buildTextField("Full Name", _donors![0].username, false),
              SizedBox(
                height: 25,
              ),
              buildTextField("Email", _donors![0].email, false),
              SizedBox(
                height: 25,
              ),
              buildTextField("Password", _donors![0].password, true),
              SizedBox(
                height: 40,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return TextField(
      obscureText: isPasswordTextField ? showPassword : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.green,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }
}
